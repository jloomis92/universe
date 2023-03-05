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
-- Name: astronauts; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronauts (
    astronauts_id integer NOT NULL,
    name character varying(60) NOT NULL,
    birthdate date NOT NULL,
    missions integer NOT NULL,
    is_living boolean NOT NULL,
    death_date date
);


ALTER TABLE public.astronauts OWNER TO freecodecamp;

--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronauts_astronaut_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronauts_astronaut_id_seq OWNER TO freecodecamp;

--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronauts_astronaut_id_seq OWNED BY public.astronauts.astronauts_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    type character varying(20) NOT NULL,
    distance character varying(20) NOT NULL,
    size_kpc numeric NOT NULL
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
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    discovery_year integer,
    discovered_by text NOT NULL
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
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    visited boolean NOT NULL,
    has_moons boolean NOT NULL,
    number_of_moons integer
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
    galaxy_id integer,
    name character varying(60) NOT NULL,
    star_type text NOT NULL,
    solar_mass numeric NOT NULL
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
-- Name: astronauts astronauts_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronauts ALTER COLUMN astronauts_id SET DEFAULT nextval('public.astronauts_astronaut_id_seq'::regclass);


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
-- Data for Name: astronauts; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronauts VALUES (1, 'Muhammed Faris', '1951-05-26', 2, true, NULL);
INSERT INTO public.astronauts VALUES (2, 'Neil Armstrong', '1930-08-05', 2, false, '2012-08-25');
INSERT INTO public.astronauts VALUES (3, 'Buzz Aldrin', '1930-01-20', 2, true, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sb', '8.277kpc', 26.8);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'SA(s)b', '765Mpc', 46.56);
INSERT INTO public.galaxy VALUES (3, 'IC 1101', 'cD', '354Mpc', 169.61);
INSERT INTO public.galaxy VALUES (4, 'Malin 1', 'SB0a', '366Mpc', 230);
INSERT INTO public.galaxy VALUES (5, 'ESO 383-76', 'cD5', '429Mpc', 540.89);
INSERT INTO public.galaxy VALUES (6, 'Messier 63', 'SAbc', '8.99Mpc', 33.66);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon / Earth I', 1609, 'Galileo');
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 1877, 'Asaph Hall');
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 1877, 'Asaph Hall');
INSERT INTO public.moon VALUES (4, 5, 'Io', 1610, 'Galileo');
INSERT INTO public.moon VALUES (5, 5, 'Ganymede', 1610, 'Galileo');
INSERT INTO public.moon VALUES (6, 5, 'Europa', 1610, 'Galileo');
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 1610, 'Galileo');
INSERT INTO public.moon VALUES (8, 6, 'Titan', 1655, 'Christiaan Huygens');
INSERT INTO public.moon VALUES (9, 6, 'Hyperion', 1848, 'William Bond, George Bond, William Lassell');
INSERT INTO public.moon VALUES (10, 6, 'Calypso', 1980, 'Dan Pascu, P. Kenneth Seidelmann, William A. Baum, Douglas G. Currie');
INSERT INTO public.moon VALUES (11, 6, 'Janus', 1966, 'Audouin Dollfus');
INSERT INTO public.moon VALUES (12, 7, 'Bianca', 1986, 'Bradford A. Smith / Voyager 2');
INSERT INTO public.moon VALUES (13, 7, 'Ophelia', 1986, 'Richard J. Terrile / Voyager 2');
INSERT INTO public.moon VALUES (14, 7, 'Juliet', 1986, 'Stephen P. Synnott / Voyager 2');
INSERT INTO public.moon VALUES (15, 7, 'Cupid', 2003, 'Mark R. Showalter, Jack J. Lissauer');
INSERT INTO public.moon VALUES (16, 8, 'Thalassa', 1989, 'Richard J. Terrille');
INSERT INTO public.moon VALUES (17, 8, 'Hippocamp', 2013, 'M. R. Showalter, I. de Pater, J. J. Lissauer, R. S. French');
INSERT INTO public.moon VALUES (18, 8, 'Sao', 2002, 'M. Holman, JJ Kavelaars, T. Grav, W. Fraser, D. Milisavljevic');
INSERT INTO public.moon VALUES (19, 9, 'Styx', 2012, 'M. R. Showalter');
INSERT INTO public.moon VALUES (20, 9, 'Kerberos', 2011, 'M. R. Showalter');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', false, false, 0);
INSERT INTO public.planet VALUES (2, 1, 'Venus', false, false, 0);
INSERT INTO public.planet VALUES (3, 1, 'Earth', true, true, 1);
INSERT INTO public.planet VALUES (4, 1, 'Mars', false, true, 2);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', false, true, 95);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', false, true, 83);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', false, true, 27);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', false, true, 14);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', false, true, 5);
INSERT INTO public.planet VALUES (10, 2, 'Proxima Centauri d', false, false, 0);
INSERT INTO public.planet VALUES (11, 2, 'Proxima Centauri b', false, false, 0);
INSERT INTO public.planet VALUES (12, 3, 'Sarth L971', false, false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol / Sun', 'G2V', 1);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 'M5.5Ve', 11.09);
INSERT INTO public.star VALUES (3, 2, 'Alpha Andromedae', 'B8IVpMnHg', 3.6);
INSERT INTO public.star VALUES (4, 2, 'Beta Andromedae', 'A3V', 3.6);
INSERT INTO public.star VALUES (5, 3, 'Spica', 'B1V', 11.43);
INSERT INTO public.star VALUES (6, 3, 'Zavijava', 'F9 V', 1.413);
INSERT INTO public.star VALUES (7, 4, 'Beta Comae Berenices', 'G8V', 1.15);
INSERT INTO public.star VALUES (8, 4, 'Gamaa Comae Berenices', 'K1 III Fe0.5', 1.65);
INSERT INTO public.star VALUES (9, 5, 'HD 115310', 'K1III', 2.71);
INSERT INTO public.star VALUES (10, 5, 'E Centauri', 'B9.5/A0V', 3.38);
INSERT INTO public.star VALUES (11, 6, 'Cor Caroli', 'A0pSiEuHg', 2.97);
INSERT INTO public.star VALUES (12, 6, 'La Superba', 'C54J(N3)', 1.2);


--
-- Name: astronauts_astronaut_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronauts_astronaut_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: astronauts astronauts_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronauts
    ADD CONSTRAINT astronauts_name_key UNIQUE (name);


--
-- Name: astronauts astronauts_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronauts
    ADD CONSTRAINT astronauts_pkey PRIMARY KEY (astronauts_id);


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
