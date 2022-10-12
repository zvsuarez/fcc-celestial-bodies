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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_username_id_seq OWNER TO freecodecamp;

--
-- Name: users_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_username_id_seq OWNED BY public.users.username_id;


--
-- Name: users username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN username_id SET DEFAULT nextval('public.users_username_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (105, 'user_1665560277609', 2, 447);
INSERT INTO public.users VALUES (104, 'user_1665560277610', 5, 174);
INSERT INTO public.users VALUES (107, 'user_1665560281212', 2, 386);
INSERT INTO public.users VALUES (106, 'user_1665560281213', 5, 18);
INSERT INTO public.users VALUES (109, 'user_1665560286767', 2, 38);
INSERT INTO public.users VALUES (108, 'user_1665560286768', 5, 69);
INSERT INTO public.users VALUES (111, 'user_1665560290279', 2, 764);
INSERT INTO public.users VALUES (110, 'user_1665560290280', 5, 234);
INSERT INTO public.users VALUES (113, 'user_1665560294125', 2, 76);
INSERT INTO public.users VALUES (112, 'user_1665560294126', 5, 65);
INSERT INTO public.users VALUES (115, 'user_1665560297310', 2, 371);
INSERT INTO public.users VALUES (114, 'user_1665560297311', 5, 22);
INSERT INTO public.users VALUES (117, 'user_1665560301339', 2, 217);
INSERT INTO public.users VALUES (116, 'user_1665560301340', 5, 60);
INSERT INTO public.users VALUES (119, 'user_1665560308186', 2, 13);
INSERT INTO public.users VALUES (118, 'user_1665560308187', 5, 91);
INSERT INTO public.users VALUES (121, 'user_1665560310988', 2, 320);
INSERT INTO public.users VALUES (120, 'user_1665560310989', 5, 43);
INSERT INTO public.users VALUES (123, 'user_1665560356477', 2, 136);
INSERT INTO public.users VALUES (122, 'user_1665560356478', 5, 47);


--
-- Name: users_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_username_id_seq', 123, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

