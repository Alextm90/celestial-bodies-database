--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: close_comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.close_comets (
    close_comets_id bigint NOT NULL,
    name character varying(200) NOT NULL,
    age_in_millions integer NOT NULL,
    is_threat_to_humans text NOT NULL,
    light_years_from_earth numeric NOT NULL
);


ALTER TABLE public.close_comets OWNER TO freecodecamp;

--
-- Name: closest_comet_closest_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.closest_comet_closest_comet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.closest_comet_closest_comet_id_seq OWNER TO freecodecamp;

--
-- Name: closest_comet_closest_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.closest_comet_closest_comet_id_seq OWNED BY public.close_comets.close_comets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id bigint NOT NULL,
    name character varying(200) NOT NULL,
    age_in_millions integer NOT NULL,
    light_years_across integer NOT NULL,
    has_life boolean NOT NULL,
    has_friendly_life boolean NOT NULL,
    light_years_from_earth numeric NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
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
    moon_id bigint NOT NULL,
    name character varying(200) NOT NULL,
    circumference_in_miles integer NOT NULL,
    light_years_from_earth numeric NOT NULL,
    has_craters boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
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
    planet_id bigint NOT NULL,
    name character varying(200) NOT NULL,
    has_life boolean NOT NULL,
    has_friendly_life boolean NOT NULL,
    light_years_from_earth numeric NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
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
    star_id bigint NOT NULL,
    name character varying(200) NOT NULL,
    age_in_millions integer NOT NULL,
    circumference_in_miles integer NOT NULL,
    light_years_from_earth numeric NOT NULL,
    galaxy_id bigint NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
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
-- Name: close_comets close_comets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.close_comets ALTER COLUMN close_comets_id SET DEFAULT nextval('public.closest_comet_closest_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: close_comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.close_comets VALUES (1, 'small_comet', 1, 'false', 0.04);
INSERT INTO public.close_comets VALUES (2, 'medium_comet', 3, 'true', 0.001);
INSERT INTO public.close_comets VALUES (3, 'large_comet', 43, 'true', 0.0001);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', 593, 22, true, false, 393.4);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', 49, 700, true, true, 189.93);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', 49, 70, true, false, 1009.93);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', 3045, 561, true, true, 19.4);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', 305, 234, false, false, 44.7);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', 2002, 5, true, false, 10234);
INSERT INTO public.galaxy VALUES (7, 'galaxy7', 20, 54, true, true, 156.88);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 1200, 2.12, true, 1);
INSERT INTO public.moon VALUES (2, 'moon2', 200, 0.12, true, 2);
INSERT INTO public.moon VALUES (3, 'moon3', 13000, 22.14, true, 3);
INSERT INTO public.moon VALUES (4, 'moon4', 6781, 111.02, true, 4);
INSERT INTO public.moon VALUES (5, 'moon5', 18097, 9.9, true, 5);
INSERT INTO public.moon VALUES (6, 'moon6', 6000, 4532.9, true, 6);
INSERT INTO public.moon VALUES (7, 'moon7', 5834, 4, false, 7);
INSERT INTO public.moon VALUES (8, 'moon8', 23009, 0.021, false, 8);
INSERT INTO public.moon VALUES (9, 'moon9', 1000, 33, false, 9);
INSERT INTO public.moon VALUES (10, 'moon10', 53000, 899, false, 10);
INSERT INTO public.moon VALUES (11, 'moon11', 8342, 65.43, false, 11);
INSERT INTO public.moon VALUES (12, 'moon12', 9999, 2.1, false, 12);
INSERT INTO public.moon VALUES (13, 'moon13', 967, 9493.003, false, 12);
INSERT INTO public.moon VALUES (14, 'moon14', 9584, 55, false, 12);
INSERT INTO public.moon VALUES (15, 'moon15', 43, 0.15, true, 12);
INSERT INTO public.moon VALUES (16, 'moon16', 74821, 3.21, false, 12);
INSERT INTO public.moon VALUES (17, 'moon17', 145343, 1.11, false, 12);
INSERT INTO public.moon VALUES (18, 'moon18', 3983, 0.005, true, 12);
INSERT INTO public.moon VALUES (19, 'moon19', 17000, 66.54, true, 12);
INSERT INTO public.moon VALUES (20, 'moon20', 7454, 2.1, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', true, false, 33.45, 1);
INSERT INTO public.planet VALUES (2, 'planet2', false, false, 544.335, 2);
INSERT INTO public.planet VALUES (3, 'planet3', false, false, 675.01, 3);
INSERT INTO public.planet VALUES (4, 'planet4', true, true, 55.3, 4);
INSERT INTO public.planet VALUES (5, 'planet5', true, true, 5445.3, 5);
INSERT INTO public.planet VALUES (6, 'planet6', true, false, 49.3, 6);
INSERT INTO public.planet VALUES (7, 'planet7', false, false, 9.9, 6);
INSERT INTO public.planet VALUES (8, 'planet8', false, false, 11119.9, 6);
INSERT INTO public.planet VALUES (9, 'planet9', true, true, 0.9, 6);
INSERT INTO public.planet VALUES (10, 'planet10', true, false, 110.9, 6);
INSERT INTO public.planet VALUES (11, 'planet11', false, false, 88.08, 6);
INSERT INTO public.planet VALUES (12, 'planet12', true, false, 251.13, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 455, 123562, 9021, 1);
INSERT INTO public.star VALUES (2, 'star2', 1001, 1178332, 17893, 2);
INSERT INTO public.star VALUES (3, 'star3', 12, 8997651, 543, 3);
INSERT INTO public.star VALUES (4, 'star4', 100, 4567831, 78931, 4);
INSERT INTO public.star VALUES (5, 'star5', 4, 49872, 13, 5);
INSERT INTO public.star VALUES (6, 'star6', 761, 100897, 565.21, 6);


--
-- Name: closest_comet_closest_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.closest_comet_closest_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 55, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: close_comets closest_comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.close_comets
    ADD CONSTRAINT closest_comet_name_key UNIQUE (name);


--
-- Name: close_comets closest_comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.close_comets
    ADD CONSTRAINT closest_comet_pkey PRIMARY KEY (close_comets_id);


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
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

