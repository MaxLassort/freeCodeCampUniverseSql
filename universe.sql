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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer NOT NULL,
    distance_from_center integer NOT NULL,
    size numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL
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
-- Name: last; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.last (
    last_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    is_big boolean
);


ALTER TABLE public.last OWNER TO freecodecamp;

--
-- Name: last_last_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.last_last_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.last_last_id_seq OWNER TO freecodecamp;

--
-- Name: last_last_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.last_last_id_seq OWNED BY public.last.last_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer NOT NULL,
    distance_from_center integer NOT NULL,
    size numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL,
    planet_id integer
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
    name character varying(30) NOT NULL,
    age integer NOT NULL,
    distance_from_center integer NOT NULL,
    size numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL,
    star_id integer
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
    name character varying(30) NOT NULL,
    age integer NOT NULL,
    distance_from_center integer NOT NULL,
    size numeric(10,2) NOT NULL,
    is_spherical boolean NOT NULL,
    description text NOT NULL,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: last last_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last ALTER COLUMN last_id SET DEFAULT nextval('public.last_last_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Orion', 800, 25000, 75000.50, true, 'A young galaxy located near the Orion constellation.');
INSERT INTO public.galaxy VALUES (2, 'Centaurus', 600, 120000, 85000.00, false, 'A galaxy located in the Centaurus constellation with a unique elliptical shape.');
INSERT INTO public.galaxy VALUES (3, 'Pegasus', 950, 500000, 90000.75, true, 'A spiral galaxy known for its brightness in the Pegasus constellation.');
INSERT INTO public.galaxy VALUES (4, 'Phoenix', 1000, 340000, 100000.30, false, 'The most distant galaxy observed in the Phoenix cluster.');
INSERT INTO public.galaxy VALUES (5, 'Hydra', 750, 420000, 65000.25, true, 'A large galaxy located in the Hydra constellation.');
INSERT INTO public.galaxy VALUES (6, 'Lyra', 500, 100000, 55000.80, false, 'A galaxy in the Lyra constellation known for its irregular shape.');
INSERT INTO public.galaxy VALUES (7, 'Draco', 950, 300000, 78000.60, true, 'A dwarf galaxy in the Draco constellation, close to the Milky Way.');


--
-- Data for Name: last; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.last VALUES (1, 'Last Star', 'The final star in the galaxy, known for its immense size.', true);
INSERT INTO public.last VALUES (2, 'Last Planet', 'A planet at the edge of the galaxy with unique characteristics.', false);
INSERT INTO public.last VALUES (3, 'Last Moon', 'The farthest moon orbiting a distant planet.', true);
INSERT INTO public.last VALUES (4, 'Last Nebula', 'A nebula marking the end of the observable universe.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (23, 'Moonlet 1', 100, 100000, 200.00, true, 'A small moon orbiting a distant planet.', 13);
INSERT INTO public.moon VALUES (24, 'Moonlet 2', 150, 150000, 250.00, true, 'A moon with a slightly irregular shape.', 13);
INSERT INTO public.moon VALUES (25, 'Moonlet 3', 200, 200000, 300.00, true, 'A moon with a smooth surface.', 14);
INSERT INTO public.moon VALUES (26, 'Moonlet 4', 250, 250000, 350.00, true, 'A larger moon with craters.', 14);
INSERT INTO public.moon VALUES (27, 'Moonlet 5', 300, 300000, 400.00, true, 'A moon known for its unique surface features.', 15);
INSERT INTO public.moon VALUES (28, 'Moonlet 6', 350, 350000, 450.00, true, 'A moon with a diverse topography.', 15);
INSERT INTO public.moon VALUES (29, 'Moonlet 7', 400, 400000, 500.00, true, 'A moon with a rocky surface.', 16);
INSERT INTO public.moon VALUES (30, 'Moonlet 8', 450, 450000, 550.00, true, 'A moon with evidence of volcanic activity.', 16);
INSERT INTO public.moon VALUES (31, 'Moonlet 9', 500, 500000, 600.00, true, 'A moon with an icy surface.', 17);
INSERT INTO public.moon VALUES (32, 'Moonlet 10', 550, 550000, 650.00, true, 'A moon with a thick atmosphere.', 17);
INSERT INTO public.moon VALUES (33, 'Moonlet 11', 600, 600000, 700.00, true, 'A moon with a significant number of impact craters.', 18);
INSERT INTO public.moon VALUES (34, 'Moonlet 12', 650, 650000, 750.00, true, 'A moon with an irregular orbit.', 18);
INSERT INTO public.moon VALUES (35, 'Moonlet 13', 700, 700000, 800.00, true, 'A moon with a unique orbital pattern.', 19);
INSERT INTO public.moon VALUES (36, 'Moonlet 14', 750, 750000, 850.00, true, 'A moon with a complex surface structure.', 19);
INSERT INTO public.moon VALUES (37, 'Moonlet 15', 800, 800000, 900.00, true, 'A large moon with a smooth surface.', 20);
INSERT INTO public.moon VALUES (38, 'Moonlet 16', 850, 850000, 950.00, true, 'A moon with evidence of ancient geological activity.', 20);
INSERT INTO public.moon VALUES (39, 'Moonlet 17', 900, 900000, 1000.00, true, 'A moon with a highly reflective surface.', 21);
INSERT INTO public.moon VALUES (40, 'Moonlet 18', 950, 950000, 1050.00, true, 'A moon with notable surface features.', 21);
INSERT INTO public.moon VALUES (41, 'Moonlet 19', 1000, 1000000, 1100.00, true, 'A moon with extensive geological history.', 22);
INSERT INTO public.moon VALUES (42, 'Moonlet 20', 1000, 1050000, 1150.00, true, 'A moon with a highly varied landscape.', 22);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Alpha Centauri b', 800, 50000000, 12000.00, true, 'An exoplanet located in the Alpha Centauri system.', 1);
INSERT INTO public.planet VALUES (14, 'Beta Centauri c', 500, 100000000, 13000.00, true, 'A planet in the Beta Centauri system, known for its potential habitability.', 1);
INSERT INTO public.planet VALUES (15, 'Kepler-22b', 750, 150000000, 14000.00, true, 'A planet in the Kepler-22 system, known for its Earth-like conditions.', 2);
INSERT INTO public.planet VALUES (16, 'Proxima Centauri d', 600, 30000000, 11500.00, true, 'A planet in the Proxima Centauri system, located close to our solar system.', 2);
INSERT INTO public.planet VALUES (17, 'HD 209458 b', 400, 250000000, 10000.00, true, 'Also known as Osiris, this exoplanet is famous for its atmosphere.', 3);
INSERT INTO public.planet VALUES (18, '55 Cancri e', 950, 200000000, 13000.00, true, 'A planet in the 55 Cancri system, known for its high carbon content.', 3);
INSERT INTO public.planet VALUES (19, 'TRAPPIST-1 d', 850, 35000000, 12000.00, true, 'An exoplanet in the TRAPPIST-1 system, part of a system with seven Earth-sized planets.', 4);
INSERT INTO public.planet VALUES (20, 'WASP-12b', 700, 180000000, 12500.00, true, 'A planet in the WASP-12 system, notable for its extreme conditions.', 4);
INSERT INTO public.planet VALUES (21, 'HD 189733 b', 650, 220000000, 13500.00, true, 'A planet in the HD 189733 system, known for its intense weather patterns.', 5);
INSERT INTO public.planet VALUES (22, 'WASP-43b', 300, 200000000, 11000.00, true, 'A hot Jupiter in the WASP-43 system, characterized by its high temperature.', 5);
INSERT INTO public.planet VALUES (23, 'HAT-P-32b', 400, 240000000, 14000.00, true, 'A planet in the HAT-P-32 system, known for its large size and heat.', 6);
INSERT INTO public.planet VALUES (24, 'WASP-18b', 450, 250000000, 14500.00, true, 'A planet in the WASP-18 system, known for its extreme temperatures and dense atmosphere.', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 100, 2000, 1200.50, false, 'A red supergiant star in the Orion constellation.', 1);
INSERT INTO public.star VALUES (2, 'Proxima', 50, 4000, 500.75, true, 'The closest star to Earth, located in the Centaurus constellation.', 2);
INSERT INTO public.star VALUES (3, 'Vega', 200, 7000, 1000.20, true, 'A bright star in the Lyra constellation.', 6);
INSERT INTO public.star VALUES (4, 'Aldebaran', 300, 10000, 1500.60, false, 'An orange giant star in the Taurus constellation.', 3);
INSERT INTO public.star VALUES (5, 'Antares', 150, 5000, 2000.45, true, 'A red supergiant star located in the Scorpius constellation.', 4);
INSERT INTO public.star VALUES (6, 'Sirius', 120, 8000, 1800.80, true, 'The brightest star in the Earths night sky, part of the Canis Major constellation.', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: last_last_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.last_last_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 42, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


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
-- Name: last last_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last
    ADD CONSTRAINT last_name_key UNIQUE (name);


--
-- Name: last last_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.last
    ADD CONSTRAINT last_pkey PRIMARY KEY (last_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


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
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


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
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


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
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_id_galaxy_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_galaxy_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

