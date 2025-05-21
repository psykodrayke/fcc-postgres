--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: detection_method; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.detection_method (
    detection_method_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.detection_method OWNER TO freecodecamp;

--
-- Name: detection_method_detection_method_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.detection_method_detection_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detection_method_detection_method_id_seq OWNER TO freecodecamp;

--
-- Name: detection_method_detection_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.detection_method_detection_method_id_seq OWNED BY public.detection_method.detection_method_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    redshift numeric(6,5),
    mass_estimate_value numeric(15,2),
    mass_unit_id integer,
    has_active_galactic_nucleus boolean,
    morphological_type character varying(10),
    distance_in_million_ly double precision,
    number_of_stars_estimate bigint,
    dominant_element character varying(10),
    has_satellite_galaxies boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: mass_unit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mass_unit (
    mass_unit_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.mass_unit OWNER TO freecodecamp;

--
-- Name: mass_unit_mass_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.mass_unit_mass_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mass_unit_mass_unit_id_seq OWNER TO freecodecamp;

--
-- Name: mass_unit_mass_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.mass_unit_mass_unit_id_seq OWNED BY public.mass_unit.mass_unit_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    planet_id integer,
    radius_in_km numeric(6,2),
    orbital_distance_in_km numeric(10,2),
    is_tidally_locked boolean,
    composition_type character varying(20),
    discovery_year integer,
    moon_type character varying(20),
    albedo numeric(6,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    star_id integer,
    mass_value numeric(6,2),
    mass_unit_id integer,
    orbital_period_in_days numeric(7,2),
    is_habitable_candidate boolean,
    planet_type character varying(20),
    temperature_in_kelvin numeric(6,2),
    discovery_year integer,
    confidence_level numeric(4,3) NOT NULL,
    detection_method_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_id integer,
    mass_value real,
    mass_unit_id integer,
    luminosity_solar real,
    is_variable_star boolean,
    spectral_type character varying(7),
    distance_in_ly double precision,
    age_in_billion_years numeric(15,2),
    metallicity character varying(20),
    has_planetary_system boolean,
    confidence_level numeric(4,3),
    detection_method_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: detection_method detection_method_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.detection_method ALTER COLUMN detection_method_id SET DEFAULT nextval('public.detection_method_detection_method_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: mass_unit mass_unit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mass_unit ALTER COLUMN mass_unit_id SET DEFAULT nextval('public.mass_unit_mass_unit_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: detection_method; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.detection_method VALUES (1, 'Direct Observation', NULL);
INSERT INTO public.detection_method VALUES (2, 'Radial Velocity', NULL);
INSERT INTO public.detection_method VALUES (3, 'Transit', NULL);
INSERT INTO public.detection_method VALUES (4, 'X-ray transit', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral with a supermassive black hole at its center.', 0.00001, 150000000000.00, 3, true, 'SBbc', 0, 100000000000, 'Hydrogen', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'The closest spiral galaxy to the Milky Way and on a collision course with it.', -0.00100, 1200000000000.00, 3, false, 'Sb', 2.5, 1000000000000, 'Hydrogen', true);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'A face-on spiral galaxy interacting with a smaller companion galaxy.', 0.00154, 160000000000.00, 3, false, 'SAbc', 23, 100000000000, 'Hydrogen', true);
INSERT INTO public.galaxy VALUES (4, 'Messier 101', 'Also known as the Pinwheel Galaxy, noted for its asymmetrical spiral arms.', 0.00080, 100000000000.00, 3, false, 'Scd', 21, 100000000000, 'Hydrogen', true);
INSERT INTO public.galaxy VALUES (5, 'Canis Major Dwarf Galaxy', 'A debated irregular dwarf galaxy possibly orbiting the Milky Way.', 0.00002, 1000000000.00, 3, false, 'Irr', 0.025, 1000000000, 'Hydrogen', true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'A nearby irregular galaxy and satellite of the Milky Way.', 0.00093, 10000000000.00, 3, false, 'Irr', 0.163, 30000000000, 'Hydrogen', true);


--
-- Data for Name: mass_unit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mass_unit VALUES (1, 'Earth', NULL);
INSERT INTO public.mass_unit VALUES (2, 'Jupiter', NULL);
INSERT INTO public.mass_unit VALUES (3, 'Solar', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only natural satellite of Earth, responsible for tides and lunar phases.', 3, 1737.40, 384400.00, true, 'Rocky', NULL, 'Major', 0.12);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer of Mars''s two moons, heavily cratered.', 4, 11.10, 9376.00, true, 'Rocky', 1877, 'Irregular', 0.07);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and more distant of Mars''s two moons, smoother than Phobos.', 4, 6.20, 23460.00, true, 'Rocky', 1877, 'Irregular', 0.07);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter''s moon known for intense volcanic activity, the most geologically active body in the Solar System.', 5, 1821.60, 421700.00, true, 'Rocky/Sulfuric', 1610, 'Major', 0.63);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter''s ice-covered moon with a subsurface ocean that may harbor life.', 5, 1560.80, 671100.00, true, 'Ice/Rock', 1610, 'Major', 0.67);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System, even larger than Mercury.', 5, 2634.10, 1070400.00, true, 'Ice/Rock', 1610, 'Major', 0.43);
INSERT INTO public.moon VALUES (7, 'Callisto', 'An ancient and heavily cratered moon of Jupiter.', 5, 2410.30, 1882700.00, true, 'Ice/Rock', 1610, 'Major', 0.22);
INSERT INTO public.moon VALUES (8, 'Mimas', 'Saturnian moon known for its enormous Herschel crater.', 6, 198.20, 185540.00, true, 'Ice', 1789, 'Minor', 0.96);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'A geologically active moon of Saturn that ejects plumes of water vapor.', 6, 252.10, 237950.00, true, 'Ice', 1789, 'Minor', 0.81);
INSERT INTO public.moon VALUES (10, 'Tethys', 'Saturnian moon with a huge canyon and icy surface.', 6, 531.10, 294660.00, true, 'Ice', 1684, 'Minor', 1.23);
INSERT INTO public.moon VALUES (11, 'Dione', 'A moon of Saturn with icy cliffs and evidence of past tectonics.', 6, 561.40, 377400.00, true, 'Ice', 1684, 'Minor', 1.00);
INSERT INTO public.moon VALUES (12, 'Rhea', 'The second-largest moon of Saturn, heavily cratered with possible rings.', 6, 763.80, 527040.00, true, 'Ice', 1672, 'Minor', 0.95);
INSERT INTO public.moon VALUES (13, 'Titan', 'Saturn''s largest moon with thick atmosphere and methane lakes.', 6, 2574.70, 1221870.00, true, 'Ice/Hydrocarbon', 1655, 'Major', 0.22);
INSERT INTO public.moon VALUES (14, 'Iapetus', 'Two-toned Saturnian moon with a mysterious equatorial ridge.', 6, 734.50, 3561300.00, true, 'Ice/Rock', 1671, 'Minor', 0.05);
INSERT INTO public.moon VALUES (15, 'Ariel', 'A Uranian moon with signs of past geological activity.', 7, 578.90, 190900.00, true, 'Ice/Rock', 1851, 'Minor', 0.39);
INSERT INTO public.moon VALUES (16, 'Umbriel', 'A dark Uranian moon with few surface features.', 7, 584.70, 266000.00, true, 'Ice/Rock', 1851, 'Minor', 0.11);
INSERT INTO public.moon VALUES (17, 'Titania', 'The largest moon of Uranus, featuring canyons and fault valleys.', 7, 788.40, 436300.00, true, 'Ice/Rock', 1787, 'Minor', 0.17);
INSERT INTO public.moon VALUES (18, 'Oberon', 'The outermost major moon of Uranus, with old, cratered surfaces.', 7, 761.40, 583500.00, true, 'Ice/Rock', 1787, 'Minor', 0.14);
INSERT INTO public.moon VALUES (19, 'Miranda', 'A small moon of Uranus with extreme surface features and cliffs.', 7, 235.80, 129900.00, true, 'Ice/Rock', 1948, 'Minor', 0.32);
INSERT INTO public.moon VALUES (20, 'Triton', 'Neptune''s largest moon, retrograde orbit, possibly captured.', 8, 1353.40, 354800.00, true, 'Ice/Rock', 1846, 'Major', 0.76);
INSERT INTO public.moon VALUES (21, 'Nereid', 'An irregular and distant Neptunian moon with an eccentric orbit.', 8, 170.00, 5513400.00, true, 'Rocky', 1949, 'Irregular', 0.16);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest and innermost planet of the Solar System.', 1, 0.06, 1, 87.97, false, 'Terrestrial', 440.00, NULL, 1.000, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet from the Sun with a thick, toxic atmosphere.', 1, 0.82, 1, 224.70, false, 'Terrestrial', 737.00, NULL, 1.000, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The third planet from the Sun and the only known planet to support life.', 1, 1.00, 1, 365.25, true, 'Terrestrial', 288.00, NULL, 1.000, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet from the Sun, with a thin atmosphere and surface features similar to Earth’s. Possible habitable candidate.', 1, 0.11, 1, 686.98, true, 'Terrestrial', 210.00, NULL, 1.000, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The fifth planet and largest gas giant in the Solar System.', 1, 1.00, 2, 4332.60, false, 'Gas giant', 120.00, NULL, 1.000, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet from the Sun, famous for its extensive ring system.', 1, 95.20, 1, 10759.00, false, 'Gas giant', 134.00, NULL, 1.000, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the Sun, with a unique sideways rotation.', 1, 14.50, 1, 30687.00, false, 'Ice giant', 76.00, NULL, 1.000, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth and farthest known planet in the Solar System.', 1, 17.10, 1, 60190.00, false, 'Ice giant', 72.00, NULL, 1.000, 1);
INSERT INTO public.planet VALUES (9, '51 Pegasi b', 'The first exoplanet discovered around a Sun-like star.', 7, 0.46, 2, 4.23, false, 'Gas giant', 1255.00, 1995, 0.990, 2);
INSERT INTO public.planet VALUES (10, 'Gamma Cephei Ab', 'A gas giant exoplanet orbiting the primary star in the Gamma Cephei binary system.', 6, 1.60, 2, 902.00, false, 'Gas giant', 300.00, 1988, 0.980, 2);
INSERT INTO public.planet VALUES (11, 'Gliese 12 b', 'An Earth-sized planet recently discovered in the habitable zone of Gliese 12.', 8, 0.94, 1, 12.80, true, 'Terrestrial', 320.00, 2024, 0.960, 3);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 'The first exoplanet observed to transit its star; a hot Jupiter.', 4, 220.00, 1, 3.52, false, 'Gas giant', 1320.00, 1999, 0.995, 3);
INSERT INTO public.planet VALUES (13, 'Kepler-62f', 'A super-Earth exoplanet in the habitable zone of Kepler-62.', 10, 2.80, 1, 267.30, true, 'Super-Earth', 208.00, 2013, 0.980, 3);
INSERT INTO public.planet VALUES (14, 'LHS 1140 b', 'A super-Earth orbiting in the habitable zone of its red dwarf host.', 9, 6.60, 1, 24.70, true, 'Super-Earth', 230.00, 2017, 0.970, 3);
INSERT INTO public.planet VALUES (15, 'M51-ULS-1 b', 'A candidate planet orbiting an X-ray binary in the Whirlpool Galaxy. Possible habitable candidate.', 2, NULL, NULL, NULL, true, 'Unconfirmed', NULL, 2021, 0.700, 4);
INSERT INTO public.planet VALUES (16, 'Proxima Centauri b', 'An Earth-sized exoplanet orbiting in the habitable zone of Proxima Centauri. Possible habitable candidate.', 5, 1.27, 1, 11.20, true, 'Terrestrial', 234.00, 2016, 0.990, 2);
INSERT INTO public.planet VALUES (17, 'TRAPPIST-1e', 'One of the most Earth-sized planets in the TRAPPIST-1 system, located in the habitable zone.', 3, 0.69, 1, 6.10, true, 'Terrestrial', 251.00, 2017, 0.990, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the G-type main-sequence star at the center of our solar system.', 1, 1, 3, 1, true, 'G2V', 1.58e-05, 4.60, 'Solar', true, 1.000, 1);
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', 'An ultra-cool red dwarf in the constellation Aquarius, known for its 7 Earth-sized exoplanets.', 1, 0.089, 3, 0.000525, true, 'M8V', 39.46, 7.60, 'Low', true, 0.980, 3);
INSERT INTO public.star VALUES (4, 'HD 209458', 'A Sun-like star in the Pegasus constellation that hosts the first transiting exoplanet ever discovered.', 1, 1.148, 3, 1.6, false, 'G0V', 159, 4.00, 'High', true, 0.995, 3);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'The closest known star to the Sun, a red dwarf with at least two known exoplanets.', 1, 0.1221, 3, 0.0017, true, 'M5.5Ve', 4.2465, 4.85, 'Low', true, 1.000, 2);
INSERT INTO public.star VALUES (6, 'Gamma Cephei', 'An orange subgiant star with a Jupiter-sized exoplanet and part of a binary system.', 1, 1.4, 3, 10.6, false, 'K1IV', 45, 6.60, 'High', true, 0.980, 2);
INSERT INTO public.star VALUES (7, '51 Pegasi', 'The first Sun-like star discovered to have an exoplanet orbiting it.', 1, 1.11, 3, 1.3, false, 'G2IV', 50.9, 6.10, 'High', true, 0.990, 2);
INSERT INTO public.star VALUES (8, 'Gliese 12', 'A cool red dwarf star with a recently discovered Earth-sized exoplanet in the habitable zone.', 1, 0.33, 3, 0.012, true, 'M4V', 40, 5.00, 'Low', true, 0.960, 3);
INSERT INTO public.star VALUES (9, 'LHS 1140', 'A red dwarf in the Cetus constellation with a known super-Earth in the habitable zone.', 1, 0.146, 3, 0.0038, true, 'M4.5V', 41, 5.00, 'Low', true, 0.970, 3);
INSERT INTO public.star VALUES (10, 'Kepler-62', 'A K-type main-sequence star known for five exoplanets, including two in the habitable zone.', 1, 0.69, 3, 0.21, false, 'K2V', 1200, 7.00, 'Moderate', true, 0.980, 3);
INSERT INTO public.star VALUES (2, 'M51-ULS-1', 'A high-mass X-ray binary in the Whirlpool Galaxy, consisting of a stellar remnant and a massive companion star, likely a blue supergiant.', 3, NULL, NULL, NULL, NULL, 'B', 23000000, NULL, NULL, true, 0.700, 4);


--
-- Name: detection_method_detection_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.detection_method_detection_method_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: mass_unit_mass_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mass_unit_mass_unit_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: detection_method detection_method_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.detection_method
    ADD CONSTRAINT detection_method_name_key UNIQUE (name);


--
-- Name: detection_method detection_method_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.detection_method
    ADD CONSTRAINT detection_method_pkey PRIMARY KEY (detection_method_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: mass_unit mass_unit_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mass_unit
    ADD CONSTRAINT mass_unit_name_key UNIQUE (name);


--
-- Name: mass_unit mass_unit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mass_unit
    ADD CONSTRAINT mass_unit_pkey PRIMARY KEY (mass_unit_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_mass_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_mass_unit_id_fkey FOREIGN KEY (mass_unit_id) REFERENCES public.mass_unit(mass_unit_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_detection_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_detection_method_id_fkey FOREIGN KEY (detection_method_id) REFERENCES public.detection_method(detection_method_id);


--
-- Name: planet planet_mass_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_mass_unit_id_fkey FOREIGN KEY (mass_unit_id) REFERENCES public.mass_unit(mass_unit_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_detection_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_detection_method_id_fkey FOREIGN KEY (detection_method_id) REFERENCES public.detection_method(detection_method_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_mass_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_mass_unit_id_fkey FOREIGN KEY (mass_unit_id) REFERENCES public.mass_unit(mass_unit_id);


--
-- PostgreSQL database dump complete
--

