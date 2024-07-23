--
-- PostgreSQL database dump
--

-- Dumped from database version 11.22 (Ubuntu 11.22-2.pgdg20.04+1)
-- Dumped by pg_dump version 13.14 (Ubuntu 13.14-1.pgdg20.04+1)

-- Started on 2024-04-05 13:50:57 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3100 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 214 (class 1259 OID 25426)
-- Name: alu_grupo_asig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alu_grupo_asig (
    id_alu integer NOT NULL,
    id_grupo_asig integer NOT NULL
);


ALTER TABLE public.alu_grupo_asig OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 25422)
-- Name: alu_grupo_asig_id_alu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alu_grupo_asig_id_alu_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alu_grupo_asig_id_alu_seq OWNER TO postgres;

--
-- TOC entry 3101 (class 0 OID 0)
-- Dependencies: 212
-- Name: alu_grupo_asig_id_alu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alu_grupo_asig_id_alu_seq OWNED BY public.alu_grupo_asig.id_alu;


--
-- TOC entry 213 (class 1259 OID 25424)
-- Name: alu_grupo_asig_id_grupo_asig_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alu_grupo_asig_id_grupo_asig_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alu_grupo_asig_id_grupo_asig_seq OWNER TO postgres;

--
-- TOC entry 3102 (class 0 OID 0)
-- Dependencies: 213
-- Name: alu_grupo_asig_id_grupo_asig_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alu_grupo_asig_id_grupo_asig_seq OWNED BY public.alu_grupo_asig.id_grupo_asig;


--
-- TOC entry 205 (class 1259 OID 25363)
-- Name: alumno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumno (
    id integer NOT NULL,
    rut_persona numeric NOT NULL,
    id_carrera integer NOT NULL,
    anno_ingreso numeric NOT NULL
);


ALTER TABLE public.alumno OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25361)
-- Name: alumno_id_carrera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumno_id_carrera_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumno_id_carrera_seq OWNER TO postgres;

--
-- TOC entry 3103 (class 0 OID 0)
-- Dependencies: 204
-- Name: alumno_id_carrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumno_id_carrera_seq OWNED BY public.alumno.id_carrera;


--
-- TOC entry 203 (class 1259 OID 25359)
-- Name: alumno_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumno_id_seq OWNER TO postgres;

--
-- TOC entry 3104 (class 0 OID 0)
-- Dependencies: 203
-- Name: alumno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumno_id_seq OWNED BY public.alumno.id;


--
-- TOC entry 208 (class 1259 OID 25387)
-- Name: asignatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asignatura (
    nombre character varying,
    id integer NOT NULL,
    id_carrera integer NOT NULL
);


ALTER TABLE public.asignatura OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 25385)
-- Name: asignatura_id_carrera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asignatura_id_carrera_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asignatura_id_carrera_seq OWNER TO postgres;

--
-- TOC entry 3105 (class 0 OID 0)
-- Dependencies: 207
-- Name: asignatura_id_carrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asignatura_id_carrera_seq OWNED BY public.asignatura.id_carrera;


--
-- TOC entry 206 (class 1259 OID 25383)
-- Name: asignatura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asignatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asignatura_id_seq OWNER TO postgres;

--
-- TOC entry 3106 (class 0 OID 0)
-- Dependencies: 206
-- Name: asignatura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asignatura_id_seq OWNED BY public.asignatura.id;


--
-- TOC entry 200 (class 1259 OID 25228)
-- Name: carrera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carrera (
    id integer NOT NULL,
    nombre character varying,
    id_univ integer NOT NULL
);


ALTER TABLE public.carrera OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 25224)
-- Name: carrera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrera_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrera_id_seq OWNER TO postgres;

--
-- TOC entry 3107 (class 0 OID 0)
-- Dependencies: 198
-- Name: carrera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrera_id_seq OWNED BY public.carrera.id;


--
-- TOC entry 199 (class 1259 OID 25226)
-- Name: carrera_id_univ_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrera_id_univ_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrera_id_univ_seq OWNER TO postgres;

--
-- TOC entry 3108 (class 0 OID 0)
-- Dependencies: 199
-- Name: carrera_id_univ_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrera_id_univ_seq OWNED BY public.carrera.id_univ;


--
-- TOC entry 211 (class 1259 OID 25406)
-- Name: grupo_asinatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupo_asinatura (
    id integer NOT NULL,
    id_asig integer NOT NULL,
    grupo character varying NOT NULL,
    semestre numeric NOT NULL,
    anno_actual numeric NOT NULL
);


ALTER TABLE public.grupo_asinatura OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 25404)
-- Name: grupo_asinatura_id_asig_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupo_asinatura_id_asig_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_asinatura_id_asig_seq OWNER TO postgres;

--
-- TOC entry 3109 (class 0 OID 0)
-- Dependencies: 210
-- Name: grupo_asinatura_id_asig_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupo_asinatura_id_asig_seq OWNED BY public.grupo_asinatura.id_asig;


--
-- TOC entry 209 (class 1259 OID 25402)
-- Name: grupo_asinatura_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupo_asinatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.grupo_asinatura_id_seq OWNER TO postgres;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 209
-- Name: grupo_asinatura_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupo_asinatura_id_seq OWNED BY public.grupo_asinatura.id;


--
-- TOC entry 202 (class 1259 OID 25245)
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    rut numeric NOT NULL,
    nombre character varying,
    fecha_nacimiento date
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 25243)
-- Name: persona_rut_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_rut_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_rut_seq OWNER TO postgres;

--
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 201
-- Name: persona_rut_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persona_rut_seq OWNED BY public.persona.rut;


--
-- TOC entry 197 (class 1259 OID 25215)
-- Name: universidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universidad (
    id integer NOT NULL,
    nombre character varying
);


ALTER TABLE public.universidad OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 25213)
-- Name: universidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.universidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universidad_id_seq OWNER TO postgres;

--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 196
-- Name: universidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.universidad_id_seq OWNED BY public.universidad.id;


--
-- TOC entry 2932 (class 2604 OID 25429)
-- Name: alu_grupo_asig id_alu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alu_grupo_asig ALTER COLUMN id_alu SET DEFAULT nextval('public.alu_grupo_asig_id_alu_seq'::regclass);


--
-- TOC entry 2933 (class 2604 OID 25430)
-- Name: alu_grupo_asig id_grupo_asig; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alu_grupo_asig ALTER COLUMN id_grupo_asig SET DEFAULT nextval('public.alu_grupo_asig_id_grupo_asig_seq'::regclass);


--
-- TOC entry 2926 (class 2604 OID 25366)
-- Name: alumno id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno ALTER COLUMN id SET DEFAULT nextval('public.alumno_id_seq'::regclass);


--
-- TOC entry 2927 (class 2604 OID 25367)
-- Name: alumno id_carrera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno ALTER COLUMN id_carrera SET DEFAULT nextval('public.alumno_id_carrera_seq'::regclass);


--
-- TOC entry 2928 (class 2604 OID 25390)
-- Name: asignatura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignatura ALTER COLUMN id SET DEFAULT nextval('public.asignatura_id_seq'::regclass);


--
-- TOC entry 2929 (class 2604 OID 25391)
-- Name: asignatura id_carrera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignatura ALTER COLUMN id_carrera SET DEFAULT nextval('public.asignatura_id_carrera_seq'::regclass);


--
-- TOC entry 2923 (class 2604 OID 25231)
-- Name: carrera id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera ALTER COLUMN id SET DEFAULT nextval('public.carrera_id_seq'::regclass);


--
-- TOC entry 2924 (class 2604 OID 25232)
-- Name: carrera id_univ; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera ALTER COLUMN id_univ SET DEFAULT nextval('public.carrera_id_univ_seq'::regclass);


--
-- TOC entry 2930 (class 2604 OID 25409)
-- Name: grupo_asinatura id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo_asinatura ALTER COLUMN id SET DEFAULT nextval('public.grupo_asinatura_id_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 25410)
-- Name: grupo_asinatura id_asig; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo_asinatura ALTER COLUMN id_asig SET DEFAULT nextval('public.grupo_asinatura_id_asig_seq'::regclass);


--
-- TOC entry 2925 (class 2604 OID 25349)
-- Name: persona rut; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona ALTER COLUMN rut SET DEFAULT nextval('public.persona_rut_seq'::regclass);


--
-- TOC entry 2922 (class 2604 OID 25218)
-- Name: universidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universidad ALTER COLUMN id SET DEFAULT nextval('public.universidad_id_seq'::regclass);


--
-- TOC entry 3094 (class 0 OID 25426)
-- Dependencies: 214
-- Data for Name: alu_grupo_asig; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alu_grupo_asig VALUES (1, 1);
INSERT INTO public.alu_grupo_asig VALUES (2, 1);
INSERT INTO public.alu_grupo_asig VALUES (3, 1);
INSERT INTO public.alu_grupo_asig VALUES (4, 1);
INSERT INTO public.alu_grupo_asig VALUES (5, 2);
INSERT INTO public.alu_grupo_asig VALUES (6, 2);
INSERT INTO public.alu_grupo_asig VALUES (7, 2);
INSERT INTO public.alu_grupo_asig VALUES (8, 2);
INSERT INTO public.alu_grupo_asig VALUES (9, 2);
INSERT INTO public.alu_grupo_asig VALUES (10, 2);
INSERT INTO public.alu_grupo_asig VALUES (11, 2);
INSERT INTO public.alu_grupo_asig VALUES (12, 1);
INSERT INTO public.alu_grupo_asig VALUES (1, 3);
INSERT INTO public.alu_grupo_asig VALUES (2, 3);
INSERT INTO public.alu_grupo_asig VALUES (3, 3);
INSERT INTO public.alu_grupo_asig VALUES (4, 4);
INSERT INTO public.alu_grupo_asig VALUES (5, 4);
INSERT INTO public.alu_grupo_asig VALUES (6, 4);
INSERT INTO public.alu_grupo_asig VALUES (7, 4);
INSERT INTO public.alu_grupo_asig VALUES (8, 4);
INSERT INTO public.alu_grupo_asig VALUES (9, 4);
INSERT INTO public.alu_grupo_asig VALUES (10, 5);
INSERT INTO public.alu_grupo_asig VALUES (11, 5);
INSERT INTO public.alu_grupo_asig VALUES (12, 5);
INSERT INTO public.alu_grupo_asig VALUES (1, 6);
INSERT INTO public.alu_grupo_asig VALUES (2, 6);
INSERT INTO public.alu_grupo_asig VALUES (3, 6);
INSERT INTO public.alu_grupo_asig VALUES (4, 6);
INSERT INTO public.alu_grupo_asig VALUES (5, 6);
INSERT INTO public.alu_grupo_asig VALUES (6, 6);
INSERT INTO public.alu_grupo_asig VALUES (7, 6);
INSERT INTO public.alu_grupo_asig VALUES (8, 6);
INSERT INTO public.alu_grupo_asig VALUES (9, 6);
INSERT INTO public.alu_grupo_asig VALUES (10, 6);
INSERT INTO public.alu_grupo_asig VALUES (11, 7);
INSERT INTO public.alu_grupo_asig VALUES (12, 7);


--
-- TOC entry 3085 (class 0 OID 25363)
-- Dependencies: 205
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.alumno VALUES (1, 1111, 1, 2022);
INSERT INTO public.alumno VALUES (2, 1112, 2, 2024);
INSERT INTO public.alumno VALUES (3, 1113, 2, 2022);
INSERT INTO public.alumno VALUES (4, 1114, 1, 2024);
INSERT INTO public.alumno VALUES (5, 1115, 1, 2022);
INSERT INTO public.alumno VALUES (6, 1116, 3, 2022);
INSERT INTO public.alumno VALUES (7, 1117, 3, 2022);
INSERT INTO public.alumno VALUES (8, 1118, 3, 2024);
INSERT INTO public.alumno VALUES (9, 1119, 1, 2022);
INSERT INTO public.alumno VALUES (10, 1110, 1, 2022);
INSERT INTO public.alumno VALUES (11, 1100, 4, 2024);
INSERT INTO public.alumno VALUES (12, 1101, 1, 2022);


--
-- TOC entry 3088 (class 0 OID 25387)
-- Dependencies: 208
-- Data for Name: asignatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.asignatura VALUES ('calculo 1', 1, 1);
INSERT INTO public.asignatura VALUES ('calculo 2', 2, 1);
INSERT INTO public.asignatura VALUES ('calculo 3', 3, 1);
INSERT INTO public.asignatura VALUES ('calculo 1', 4, 2);
INSERT INTO public.asignatura VALUES ('calculo 2', 5, 2);
INSERT INTO public.asignatura VALUES ('calculo 3', 6, 2);
INSERT INTO public.asignatura VALUES ('calculo 1', 7, 3);
INSERT INTO public.asignatura VALUES ('calculo 2', 8, 3);
INSERT INTO public.asignatura VALUES ('calculo 3', 9, 3);
INSERT INTO public.asignatura VALUES ('cuidado abuelos 11', 10, 4);
INSERT INTO public.asignatura VALUES ('cuidado abuelos 12', 11, 4);
INSERT INTO public.asignatura VALUES ('cuidado abuelos 13', 12, 4);


--
-- TOC entry 3080 (class 0 OID 25228)
-- Dependencies: 200
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carrera VALUES (1, 'informática', 1);
INSERT INTO public.carrera VALUES (2, 'Naval', 1);
INSERT INTO public.carrera VALUES (3, 'industrial', 1);
INSERT INTO public.carrera VALUES (4, 'medicina', 1);


--
-- TOC entry 3091 (class 0 OID 25406)
-- Dependencies: 211
-- Data for Name: grupo_asinatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grupo_asinatura VALUES (1, 1, 'A-1', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (2, 1, 'A-2', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (3, 2, 'A-1', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (4, 2, 'A-2', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (5, 3, 'A-1', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (6, 3, 'A-2', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (7, 4, 'A-1', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (8, 4, 'A-2', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (9, 5, 'A-1', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (10, 5, 'A-2', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (11, 6, 'A-1', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (12, 6, 'A-2', 1, 2023);
INSERT INTO public.grupo_asinatura VALUES (13, 1, 'A-1', 1, 2024);
INSERT INTO public.grupo_asinatura VALUES (14, 1, 'A-2', 1, 2024);
INSERT INTO public.grupo_asinatura VALUES (15, 2, 'A-1', 1, 2024);
INSERT INTO public.grupo_asinatura VALUES (16, 2, 'A-2', 1, 2024);
INSERT INTO public.grupo_asinatura VALUES (17, 3, 'A-1', 1, 2024);
INSERT INTO public.grupo_asinatura VALUES (18, 3, 'A-2', 1, 2024);
INSERT INTO public.grupo_asinatura VALUES (19, 4, 'A-1', 1, 2024);
INSERT INTO public.grupo_asinatura VALUES (20, 4, 'A-2', 1, 2024);
INSERT INTO public.grupo_asinatura VALUES (21, 5, 'A-1', 1, 2024);
INSERT INTO public.grupo_asinatura VALUES (22, 5, 'A-2', 1, 2024);
INSERT INTO public.grupo_asinatura VALUES (23, 6, 'A-1', 1, 2024);
INSERT INTO public.grupo_asinatura VALUES (24, 6, 'A-2', 1, 2024);


--
-- TOC entry 3082 (class 0 OID 25245)
-- Dependencies: 202
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.persona VALUES (1111, 'juanito', '2000-01-01');
INSERT INTO public.persona VALUES (1112, 'pepito', '2000-01-02');
INSERT INTO public.persona VALUES (1113, 'mauri', '2000-02-02');
INSERT INTO public.persona VALUES (1114, 'laura', '2001-01-02');
INSERT INTO public.persona VALUES (1115, 'juanito1', '2000-01-01');
INSERT INTO public.persona VALUES (1116, 'pepito1', '2000-01-02');
INSERT INTO public.persona VALUES (1117, 'mauri1', '2000-02-02');
INSERT INTO public.persona VALUES (1118, 'laura1', '2001-01-02');
INSERT INTO public.persona VALUES (1119, 'juanito2', '2000-01-01');
INSERT INTO public.persona VALUES (1110, 'pepito2', '2000-01-02');
INSERT INTO public.persona VALUES (1100, 'mauri2', '2000-02-02');
INSERT INTO public.persona VALUES (1101, 'laura2', '2001-01-02');


--
-- TOC entry 3077 (class 0 OID 25215)
-- Dependencies: 197
-- Data for Name: universidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.universidad VALUES (1, 'uach');


--
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 212
-- Name: alu_grupo_asig_id_alu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alu_grupo_asig_id_alu_seq', 1, false);


--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 213
-- Name: alu_grupo_asig_id_grupo_asig_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alu_grupo_asig_id_grupo_asig_seq', 1, false);


--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 204
-- Name: alumno_id_carrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumno_id_carrera_seq', 1, false);


--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 203
-- Name: alumno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumno_id_seq', 12, true);


--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 207
-- Name: asignatura_id_carrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asignatura_id_carrera_seq', 1, false);


--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 206
-- Name: asignatura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asignatura_id_seq', 12, true);


--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 198
-- Name: carrera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrera_id_seq', 4, true);


--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 199
-- Name: carrera_id_univ_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrera_id_univ_seq', 1, false);


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 210
-- Name: grupo_asinatura_id_asig_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupo_asinatura_id_asig_seq', 1, false);


--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 209
-- Name: grupo_asinatura_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupo_asinatura_id_seq', 24, true);


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 201
-- Name: persona_rut_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_rut_seq', 1, false);


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 196
-- Name: universidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.universidad_id_seq', 1, true);


--
-- TOC entry 2947 (class 2606 OID 25432)
-- Name: alu_grupo_asig alu_grupo_asig_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alu_grupo_asig
    ADD CONSTRAINT alu_grupo_asig_pk PRIMARY KEY (id_alu, id_grupo_asig);


--
-- TOC entry 2941 (class 2606 OID 25372)
-- Name: alumno alumno_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pk PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 25396)
-- Name: asignatura asignatura_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_pk PRIMARY KEY (id);


--
-- TOC entry 2937 (class 2606 OID 25237)
-- Name: carrera carrera_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_pk PRIMARY KEY (id);


--
-- TOC entry 2945 (class 2606 OID 25415)
-- Name: grupo_asinatura grupo_asinatura_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo_asinatura
    ADD CONSTRAINT grupo_asinatura_pk PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 25351)
-- Name: persona persona_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pk PRIMARY KEY (rut);


--
-- TOC entry 2935 (class 2606 OID 25223)
-- Name: universidad universidad_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_pk PRIMARY KEY (id);


--
-- TOC entry 2953 (class 2606 OID 25433)
-- Name: alu_grupo_asig alu_grupo_asig_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alu_grupo_asig
    ADD CONSTRAINT alu_grupo_asig_fk FOREIGN KEY (id_alu) REFERENCES public.alumno(id);


--
-- TOC entry 2954 (class 2606 OID 25438)
-- Name: alu_grupo_asig alu_grupo_asig_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alu_grupo_asig
    ADD CONSTRAINT alu_grupo_asig_fk_1 FOREIGN KEY (id_grupo_asig) REFERENCES public.grupo_asinatura(id);


--
-- TOC entry 2949 (class 2606 OID 25373)
-- Name: alumno alumno_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_fk FOREIGN KEY (id_carrera) REFERENCES public.carrera(id);


--
-- TOC entry 2950 (class 2606 OID 25378)
-- Name: alumno alumno_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_fk_1 FOREIGN KEY (rut_persona) REFERENCES public.persona(rut);


--
-- TOC entry 2951 (class 2606 OID 25397)
-- Name: asignatura asignatura_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_fk FOREIGN KEY (id_carrera) REFERENCES public.carrera(id);


--
-- TOC entry 2948 (class 2606 OID 25238)
-- Name: carrera carrera_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrera
    ADD CONSTRAINT carrera_fk FOREIGN KEY (id_univ) REFERENCES public.universidad(id);


--
-- TOC entry 2952 (class 2606 OID 25416)
-- Name: grupo_asinatura grupo_asinatura_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupo_asinatura
    ADD CONSTRAINT grupo_asinatura_fk FOREIGN KEY (id_asig) REFERENCES public.asignatura(id);


-- Completed on 2024-04-05 13:50:57 -03

--
-- PostgreSQL database dump complete
--

