#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# PARAMS
CSV_FILE="games.csv"
CSV_DELIM=","

# QUERY TEMPLATES
INSERT_TEAMS="insert into teams (name) values"

TEAM_VALUES=$(awk -v FS="$CSV_DELIM" '
  BEGIN {
    idx = 0
  }
  NR == 1 {
    next
  }
  {
    # Parse Winners column ($3)
    if (!($3 in uniques)) {
      uniques[$3] = 1
      team_arr[++idx] = "(\x27"$3"\x27)"
    }
    # Parse Opponents column ($4)
    if (!($4 in uniques)) {
      uniques[$4] = 1
      team_arr[++idx] =  "(\x27"$4"\x27)"
    }
  }
  END {
    # Print collated uniques
    for (i = 1; i <= idx; i++) {
      printf "%s%s", team_arr[i], (i == idx ? "" : ", ")
    }
  }
' "$CSV_FILE")

INSERT_TEAMS_COMMAND="$INSERT_TEAMS $TEAM_VALUES"

SQL_COMMAND_EXEC="$($PSQL "$INSERT_TEAMS_COMMAND;")"
if [[ $SQL_COMMAND_EXEC == INSERT* ]]; then
  echo Team insertion successful
fi

while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]; then
    SQL_COMMAND_EXEC=$($PSQL "insert into games (year, round, winner_id, opponent_id, winner_goals, opponent_goals)
        values (
          $YEAR, '$ROUND',
          (select team_id from teams where name = '$WINNER'),
          (select team_id from teams where name = '$OPPONENT'),
          $WINNER_GOALS, $OPPONENT_GOALS
      );")

    if [[ $SQL_COMMAND_EXEC == "INSERT 0 1" ]]; then
      echo Game insert successful. $WINNER vs $OPPONENT
    fi
  fi
done < $CSV_FILE
