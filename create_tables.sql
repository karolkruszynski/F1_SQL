--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0 (Debian 16.0-1.pgdg120+1)
-- Dumped by pg_dump version 16.0 (Debian 16.0-1.pgdg120+1)

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
-- Name: constructors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.constructors (
    constructorId smallint, 
    constructorRef character varying(20),
    name character varying(30),
    nationality character varying(20),
	PRIMARY KEY (constructorId)
);


--
-- Name: drivers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.drivers (
    driverId smallint, 
    driverRef character varying(20),
    number character varying(10),
    code character varying(10),
    forename character varying(20),
    surname character varying(30),
    dob character varying(10),
    nationality character varying(20),
	PRIMARY KEY (driverId)
);

CREATE TABLE public.races (
    raceId smallint ,
    year smallint,
    round smallint,
    circuitId smallint,
    name character varying(30),
    date character varying(10),
    time character varying(10),
	PRIMARY KEY (raceId)
);
--
-- Name: qualifying; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.qualifying (
    qualifyId smallint ,
    raceId smallint,
    driverId smallint,
    constructorId smallint,
    number smallint,
    position smallint,
    q1 character varying(10),
    q2 character varying(10),
    q3 character varying(10),
	PRIMARY KEY (qualifyId),
	FOREIGN KEY (constructorId) REFERENCES public.constructors(constructorId),
	FOREIGN KEY (raceId) REFERENCES public.races(raceId),
	FOREIGN KEY (driverId) REFERENCES public.drivers(driverId)
);


--
-- Name: races; Type: TABLE; Schema: public; Owner: -
--



--
-- PostgreSQL database dump complete
--


