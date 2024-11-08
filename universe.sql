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
    name character varying(100) NOT NULL,
    type text,
    num_of_stars integer NOT NULL,
    has_supermassive_black_hole boolean NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    radius_km numeric(4,2),
    planet_id integer,
    is_habitable boolean NOT NULL
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
    radius_km numeric(4,2),
    orbital_period_days integer,
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    operational boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50),
    mass numeric(4,2),
    galaxy_id integer,
    is_main_sequence boolean NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 1000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 1000, true);
INSERT INTO public.galaxy VALUES (3, 'Way', 'Spiral', 1000, true);
INSERT INTO public.galaxy VALUES (4, 'Afradale', 'Spiral', 1000, true);
INSERT INTO public.galaxy VALUES (5, 'Sequoia', 'Spiral', 1000, true);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Spiral', 400, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.27, 3, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.01, 4, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.01, 4, false);
INSERT INTO public.moon VALUES (4, 'Europa', 0.25, 5, false);
INSERT INTO public.moon VALUES (5, 'Ganymede', 0.41, 5, false);
INSERT INTO public.moon VALUES (6, 'Selene', 0.27, 3, false);
INSERT INTO public.moon VALUES (7, 'Phokos', 0.01, 4, false);
INSERT INTO public.moon VALUES (8, 'Deimon', 0.01, 4, false);
INSERT INTO public.moon VALUES (9, 'Fortuna', 0.25, 5, false);
INSERT INTO public.moon VALUES (10, 'Gallaghar', 0.41, 5, false);
INSERT INTO public.moon VALUES (11, 'Elsova', 0.39, 5, false);
INSERT INTO public.moon VALUES (12, 'luna', 0.27, 3, false);
INSERT INTO public.moon VALUES (13, 'Mnemos', 0.01, 4, false);
INSERT INTO public.moon VALUES (14, 'Itu', 0.01, 4, false);
INSERT INTO public.moon VALUES (15, 'Epochs', 0.25, 5, false);
INSERT INTO public.moon VALUES (16, 'Voak', 0.41, 5, false);
INSERT INTO public.moon VALUES (17, 'Feldsher', 0.25, 5, false);
INSERT INTO public.moon VALUES (18, 'Prunator', 0.41, 5, false);
INSERT INTO public.moon VALUES (19, 'Deathstar', 0.39, 5, false);
INSERT INTO public.moon VALUES (20, 'Callisto', 0.39, 5, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.39, 88, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0.95, 225, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1.00, 365, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 0.53, 687, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 11.21, 4333, 1);
INSERT INTO public.planet VALUES (6, 'Philanx', 0.39, 88, 1);
INSERT INTO public.planet VALUES (7, 'Sophos', 0.95, 225, 1);
INSERT INTO public.planet VALUES (8, 'Vitalia', 1.00, 365, 1);
INSERT INTO public.planet VALUES (9, 'Solaris', 0.53, 687, 1);
INSERT INTO public.planet VALUES (10, 'Trinetra', 11.21, 4333, 1);
INSERT INTO public.planet VALUES (11, 'Duality', 9.45, 10759, 1);
INSERT INTO public.planet VALUES (12, 'Saturn', 9.45, 10759, 1);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 'Telescope', true, 3);
INSERT INTO public.satellite VALUES (2, 'International Space Station', 'Space station', true, 3);
INSERT INTO public.satellite VALUES (3, 'Voyager 1', 'Probe', false, 3);
INSERT INTO public.satellite VALUES (4, 'New Horizons', 'Probe', true, 6);
INSERT INTO public.satellite VALUES (5, 'Pioneer 10', 'Probe', false, 5);
INSERT INTO public.satellite VALUES (6, 'Mars Reconnaissance Orbiter', 'Orbiter', true, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 1.00, 1, true);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-type', 1.50, 1, true);
INSERT INTO public.star VALUES (3, 'Mihawk', 'G-type', 1.00, 1, true);
INSERT INTO public.star VALUES (4, 'Alpha tauri', 'A-type', 1.50, 1, true);
INSERT INTO public.star VALUES (5, 'Centaurus', 'Red dwarf', 0.10, 2, true);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Red dwarf', 0.10, 2, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

