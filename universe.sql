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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_periodic boolean,
    orbit_distance numeric(10,2),
    galaxy_id integer,
    has_life boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: coment_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.coment_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coment_comet_id_seq OWNER TO freecodecamp;

--
-- Name: coment_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.coment_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    description text,
    age numeric,
    has_black_hole boolean,
    galaxy_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric,
    has_life boolean,
    age_in_millions_of_years integer,
    planet_id integer,
    moon_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth_in_millions_of_km numeric,
    planet_id integer NOT NULL,
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
    mass numeric,
    has_planet boolean,
    has_life boolean,
    description text,
    radius integer,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.coment_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'visible from Earth every 76 years', true, 35.10, 1, false);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'One of the brightest comets of the 20th century', false, 621.00, 2, false);
INSERT INTO public.comet VALUES (3, 'Wild 2', 'visible from Earth every 76 years', false, 384.00, 1, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Spiral', 'The galaxy in which the Solar System is located', 13.6, true, 1);
INSERT INTO public.galaxy VALUES ('Andromeda', 'Spiral', 'The nearest major galaxy to the Milkey Way', 10.1, false, 2);
INSERT INTO public.galaxy VALUES ('Tirangulum', 'Spiral', 'A small galaxy that is a companion to the Andromeda Galaxy', 9.2, false, 3);
INSERT INTO public.galaxy VALUES ('Centaurus A', 'Elliptical', 'A nearby galaxy with an active galactic nucleus', 11.8, true, 4);
INSERT INTO public.galaxy VALUES ('Whirlpool', 'Spiral', 'A famous interacting galaxy with a prominent spiral structure', 12.4, false, 5);
INSERT INTO public.galaxy VALUES ('Sombrero', 'Lenticular', 'A galaxy known for its prominent dust lane resembling a hat', 10.9, true, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', NULL, true, 384.4, false, NULL, 9, 1);
INSERT INTO public.moon VALUES ('Phobos', NULL, true, 9.377, false, NULL, 3, 2);
INSERT INTO public.moon VALUES ('Deimos', NULL, true, 23.46, false, NULL, 3, 3);
INSERT INTO public.moon VALUES ('Ganymede', NULL, true, 638.3, false, NULL, 1, 4);
INSERT INTO public.moon VALUES ('Europa', NULL, true, 628.3, false, NULL, 1, 5);
INSERT INTO public.moon VALUES ('lo', NULL, true, 638.3, false, NULL, 1, 6);
INSERT INTO public.moon VALUES ('Titan', NULL, true, 1200, false, NULL, 2, 7);
INSERT INTO public.moon VALUES ('Enceladus', NULL, true, 1200, false, NULL, 2, 8);
INSERT INTO public.moon VALUES ('Triton', NULL, true, 4300, false, NULL, 7, 9);
INSERT INTO public.moon VALUES ('Nereid', NULL, false, 4300, false, NULL, 7, 10);
INSERT INTO public.moon VALUES ('Charon', NULL, true, 7400, false, NULL, 8, 11);
INSERT INTO public.moon VALUES ('Moonlet A', NULL, false, 2258, false, NULL, 9, 12);
INSERT INTO public.moon VALUES ('Moonlet B', NULL, false, 1.963, false, NULL, 9, 13);
INSERT INTO public.moon VALUES ('Callisto', NULL, true, 628.3, false, NULL, 1, 14);
INSERT INTO public.moon VALUES ('Rhea', NULL, true, 1200, false, NULL, 2, 15);
INSERT INTO public.moon VALUES ('Miranda', NULL, true, 4300, false, NULL, 7, 16);
INSERT INTO public.moon VALUES ('Oberon', NULL, true, 2900, false, NULL, 6, 17);
INSERT INTO public.moon VALUES ('Titania', NULL, true, 2900, false, NULL, 6, 18);
INSERT INTO public.moon VALUES ('Ariel', NULL, true, 2900, false, NULL, 6, 19);
INSERT INTO public.moon VALUES ('Umbriel', NULL, true, 2900, false, NULL, 6, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Jupiter', NULL, false, true, NULL, 843.07, 1, 1);
INSERT INTO public.planet VALUES ('Saturn', NULL, false, true, NULL, 1204.28, 2, 1);
INSERT INTO public.planet VALUES ('Mars', NULL, false, true, NULL, 55.65, 3, 1);
INSERT INTO public.planet VALUES ('Venus', NULL, false, true, NULL, 39.79, 4, 1);
INSERT INTO public.planet VALUES ('Mercury', NULL, false, true, NULL, 82.5, 5, 1);
INSERT INTO public.planet VALUES ('Uranus', NULL, false, true, NULL, 2586.88, 6, 1);
INSERT INTO public.planet VALUES ('Neptune', NULL, false, true, NULL, 4311.02, 7, 1);
INSERT INTO public.planet VALUES ('Pluto', NULL, false, true, NULL, 4293.37, 8, 1);
INSERT INTO public.planet VALUES ('Earth', NULL, true, true, NULL, 0.0, 9, 1);
INSERT INTO public.planet VALUES ('Kepler-453b', NULL, false, true, NULL, 156.5, 10, 1);
INSERT INTO public.planet VALUES ('Venus Express', NULL, false, false, NULL, 41.4, 11, 1);
INSERT INTO public.planet VALUES ('Gliese 581c', NULL, false, NULL, NULL, 11, 12, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.0, true, true, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 2, false, false, NULL, NULL, 1);
INSERT INTO public.star VALUES (3, 'Prixima Centauri', 1.12, true, false, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 17, false, false, NULL, NULL, 1);
INSERT INTO public.star VALUES (5, 'Vega', 2.1, true, false, NULL, NULL, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1.1, true, false, NULL, NULL, 1);


--
-- Name: coment_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.coment_comet_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet coment_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT coment_pkey PRIMARY KEY (comet_id);


--
-- Name: comet comet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_id UNIQUE (comet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon pk_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT pk_moon_id PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: comet coment_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT coment_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

