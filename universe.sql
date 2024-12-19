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
    name character varying(60),
    galaxy_type character varying(30) NOT NULL,
    year_discovered_by_humans character varying(15) NOT NULL,
    distance_from_earth_in_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60),
    planet_id integer NOT NULL,
    orbital_period_in_earth_days numeric(15,3),
    color character varying(30),
    system_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60),
    star_id integer NOT NULL,
    orbital_period_in_earth_days numeric(15,3),
    moon_count integer,
    supports_humans boolean,
    has_rings boolean,
    system_id integer NOT NULL,
    type character varying(15)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60),
    galaxy_id integer NOT NULL,
    star_class character varying(4),
    color character varying(30),
    system_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(60),
    system_type character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_earth_in_light_years integer
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral', 'Prehistoric', 2500000);
INSERT INTO public.galaxy VALUES (3, 'ESO 383-76', 'Supergiant Elliptical', '1974', 654200000);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Supergiant Elliptical', '1781', 53490000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Spiral', '~before 1654', 2730000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', '1781', 25000000);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel', 'Lenticular Ring', '1941', 500000000);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 'Prehistoric', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 1, 27.300, 'Grey', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.318, 'Red, Grey', 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1.263, 'Reddish', 1);
INSERT INTO public.moon VALUES (4, 'Europa', 5, 3.551, 'Red, Tan, Blue, White', 1);
INSERT INTO public.moon VALUES (5, 'Io', 5, 1.796, 'Yellow, Orange, Black, White', 1);
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 16.890, 'Grey, Tan', 1);
INSERT INTO public.moon VALUES (7, 'Mimas', 6, 0.942, 'Grey, Yellow', 1);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 15.950, 'Orange', 1);
INSERT INTO public.moon VALUES (9, 'Tethys', 6, 1.888, 'Grey, Yellow', 1);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 4.519, 'Grey, Yellow', 1);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 79.300, 'Grey, Reddish Brown', 1);
INSERT INTO public.moon VALUES (12, 'Miranda', 7, 1.413, 'Grey', 1);
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 13.463, 'Grey, Reddish, Bluish', 1);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 8.706, 'Grey, Reddish', 1);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 4.144, 'Grey, Bluish', 1);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 2.520, 'Grey', 1);
INSERT INTO public.moon VALUES (17, 'Hi''iaka', 11, 49.120, NULL, 1);
INSERT INTO public.moon VALUES (18, 'Charon', 10, 6.387, 'Grey, Reddish Brown', 1);
INSERT INTO public.moon VALUES (19, 'Halimede', 8, 1897.080, 'Grey', 1);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 5.877, 'Grey, Reddish', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 365.256, 1, true, false, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 87.969, 0, false, false, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Venus', 1, 224.701, 0, false, false, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 686.980, 2, false, false, 1, 'Terrestrial');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 4332.589, 95, false, true, 1, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 10755.699, 146, false, true, 1, 'Gas Giant');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 30685.400, 28, false, true, 1, 'Ice Giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 60189.018, 16, false, true, 1, 'Ice Giant');
INSERT INTO public.planet VALUES (9, 'Ceres', 1, 1682.000, 0, false, false, 1, 'Dwarf');
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 90560.000, 5, false, false, 1, 'Dwarf');
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 103410.000, 2, false, true, 1, 'Dwarf');
INSERT INTO public.planet VALUES (12, 'Makemake', 1, 111845.000, 1, false, NULL, 1, 'Dwarf');
INSERT INTO public.planet VALUES (13, 'Barnard b', 3, 3.200, 0, false, false, 3, 'Terrestrial');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5.5', 'Red', 2);
INSERT INTO public.star VALUES (3, 'Barnard''s Star', 1, 'M4', 'Red', 3);
INSERT INTO public.star VALUES (4, 'Canopus', 1, 'F0', 'White', NULL);
INSERT INTO public.star VALUES (5, 'Polaris A', 1, 'F7Ib', 'Yellow', 4);
INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 'White', 1);
INSERT INTO public.star VALUES (6, 'Polaris B', 1, 'F3', 'Yellow', 4);
INSERT INTO public.star VALUES (7, 'Polaris Ab', 1, 'F6', 'Yellow', 4);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'Solar System', 'Planetary', 1, 0);
INSERT INTO public.system VALUES (2, 'Proxima Centauri System', 'Planetary', 1, 4);
INSERT INTO public.system VALUES (3, 'Barnard''s Star System', 'Planetary', 1, 6);
INSERT INTO public.system VALUES (4, 'Polaris System', 'Stellar', 1, 448);


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
-- Name: system system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_name_key UNIQUE (name);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_system_id_fkey FOREIGN KEY (system_id) REFERENCES public.system(system_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_system_id_fkey FOREIGN KEY (system_id) REFERENCES public.system(system_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_system_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_system_id_fkey FOREIGN KEY (system_id) REFERENCES public.system(system_id);


--
-- Name: system system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

