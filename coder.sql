--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: zoraaver
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO zoraaver;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: zoraaver
--

CREATE TABLE public.courses (
    id bigint NOT NULL,
    title character varying,
    description character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    img_url character varying
);


ALTER TABLE public.courses OWNER TO zoraaver;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: zoraaver
--

CREATE SEQUENCE public.courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO zoraaver;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zoraaver
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: zoraaver
--

CREATE TABLE public.lessons (
    id bigint NOT NULL,
    title character varying,
    subsection_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    test text,
    starter_code text,
    language character varying,
    content text,
    sort_id integer DEFAULT 0
);


ALTER TABLE public.lessons OWNER TO zoraaver;

--
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: zoraaver
--

CREATE SEQUENCE public.lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lessons_id_seq OWNER TO zoraaver;

--
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zoraaver
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: zoraaver
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO zoraaver;

--
-- Name: sections; Type: TABLE; Schema: public; Owner: zoraaver
--

CREATE TABLE public.sections (
    id bigint NOT NULL,
    title character varying,
    course_id integer,
    sort_id integer DEFAULT 0
);


ALTER TABLE public.sections OWNER TO zoraaver;

--
-- Name: sections_id_seq; Type: SEQUENCE; Schema: public; Owner: zoraaver
--

CREATE SEQUENCE public.sections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sections_id_seq OWNER TO zoraaver;

--
-- Name: sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zoraaver
--

ALTER SEQUENCE public.sections_id_seq OWNED BY public.sections.id;


--
-- Name: subsections; Type: TABLE; Schema: public; Owner: zoraaver
--

CREATE TABLE public.subsections (
    id bigint NOT NULL,
    title character varying,
    section_id integer,
    sort_id integer DEFAULT 0
);


ALTER TABLE public.subsections OWNER TO zoraaver;

--
-- Name: subsections_id_seq; Type: SEQUENCE; Schema: public; Owner: zoraaver
--

CREATE SEQUENCE public.subsections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subsections_id_seq OWNER TO zoraaver;

--
-- Name: subsections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zoraaver
--

ALTER SEQUENCE public.subsections_id_seq OWNED BY public.subsections.id;


--
-- Name: user_courses; Type: TABLE; Schema: public; Owner: zoraaver
--

CREATE TABLE public.user_courses (
    id bigint NOT NULL,
    user_id integer,
    course_id integer
);


ALTER TABLE public.user_courses OWNER TO zoraaver;

--
-- Name: user_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: zoraaver
--

CREATE SEQUENCE public.user_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_courses_id_seq OWNER TO zoraaver;

--
-- Name: user_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zoraaver
--

ALTER SEQUENCE public.user_courses_id_seq OWNED BY public.user_courses.id;


--
-- Name: user_lessons; Type: TABLE; Schema: public; Owner: zoraaver
--

CREATE TABLE public.user_lessons (
    id bigint NOT NULL,
    lesson_id integer,
    user_id integer,
    status integer DEFAULT 1,
    code text
);


ALTER TABLE public.user_lessons OWNER TO zoraaver;

--
-- Name: user_lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: zoraaver
--

CREATE SEQUENCE public.user_lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_lessons_id_seq OWNER TO zoraaver;

--
-- Name: user_lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zoraaver
--

ALTER SEQUENCE public.user_lessons_id_seq OWNED BY public.user_lessons.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: zoraaver
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying,
    password_digest character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    admin boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO zoraaver;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: zoraaver
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO zoraaver;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zoraaver
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- Name: sections id; Type: DEFAULT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.sections ALTER COLUMN id SET DEFAULT nextval('public.sections_id_seq'::regclass);


--
-- Name: subsections id; Type: DEFAULT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.subsections ALTER COLUMN id SET DEFAULT nextval('public.subsections_id_seq'::regclass);


--
-- Name: user_courses id; Type: DEFAULT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.user_courses ALTER COLUMN id SET DEFAULT nextval('public.user_courses_id_seq'::regclass);


--
-- Name: user_lessons id; Type: DEFAULT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.user_lessons ALTER COLUMN id SET DEFAULT nextval('public.user_lessons_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: zoraaver
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-01-29 10:25:32.478445	2020-01-29 10:25:32.478445
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: zoraaver
--

COPY public.courses (id, title, description, created_at, updated_at, img_url) FROM stdin;
1	Ruby	Learn to program in Ruby, a high-level, dynamically-typed scripting language	2020-01-29 10:26:51.048104	2020-01-29 12:04:15.765595	https://avatars2.githubusercontent.com/u/210414?s=200&v=4
3	C++	Learn C++, a high-performance, compiled language	2020-01-29 15:28:08.200752	2020-01-29 15:28:08.200752	https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/150px-ISO_C%2B%2B_Logo.svg.png
2	Javascript	Learn Javascript, the language of the web	2020-01-29 10:28:49.507165	2020-02-03 14:30:56.22904	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/JavaScript-logo.png/600px-JavaScript-logo.png
\.


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: zoraaver
--

COPY public.lessons (id, title, subsection_id, created_at, updated_at, test, starter_code, language, content, sort_id) FROM stdin;
24	Data and behaviour	11	2020-01-29 16:57:17.617162	2020-02-06 13:17:49.106367	\N	\N	ruby	\N	1
25	Modelling the world	11	2020-01-29 16:57:29.404208	2020-02-06 13:17:49.115775	\N	\N	ruby	\N	2
26	Encapsulation and Abstraction	11	2020-01-29 16:59:57.116053	2020-02-06 13:17:49.117995	\N	\N	ruby	\N	3
28	Declaring classes	12	2020-01-29 17:01:08.941651	2020-02-06 13:17:49.125115	\N	\N	ruby	\N	1
30	Instance variables	12	2020-01-29 17:02:53.176993	2020-02-06 13:17:49.127179	\N	\N	ruby	\N	2
31	Class variables	12	2020-01-29 17:02:58.771728	2020-02-06 13:17:49.129005	\N	\N	ruby	\N	3
33	Attribute macros	13	2020-01-29 17:04:29.249823	2020-02-06 13:17:49.133543	\N	\N	ruby	\N	1
2	Expressions and statements	6	2020-01-29 16:48:18.919914	2020-01-29 16:48:18.919914	\N	\N	ruby	\N	0
8	If else statements	7	2020-01-29 16:51:31.120075	2020-01-29 16:51:31.120075	\N	\N	ruby	\N	0
11	Map and each	8	2020-01-29 16:52:57.778227	2020-01-29 16:52:57.778227	\N	\N	ruby	\N	0
15	A programmer's life	9	2020-01-29 16:54:25.638968	2020-01-29 16:54:25.638968	\N	\N	ruby	\N	0
19	Functional programming	10	2020-01-29 16:55:30.933837	2020-01-29 16:55:30.933837	\N	\N	ruby	\N	0
23	Programming paradigms	11	2020-01-29 16:56:59.805482	2020-01-29 16:56:59.805482	\N	\N	ruby	\N	0
27	Initializing objects	12	2020-01-29 17:00:59.2185	2020-01-29 17:00:59.2185	\N	\N	ruby	\N	0
32	Setter and getter	13	2020-01-29 17:04:17.750862	2020-01-29 17:04:17.750862	\N	\N	ruby	\N	0
34	Storing meta information	14	2020-01-29 17:06:50.016901	2020-01-29 17:06:50.016901	\N	\N	ruby	\N	0
3	Functions	6	2020-01-29 16:48:29.797624	2020-02-06 13:17:49.152589	\N	\N	ruby	\N	1
4	Variables	6	2020-01-29 16:48:47.298144	2020-02-06 13:17:49.154628	\N	\N	ruby	\N	2
5	Data types	6	2020-01-29 16:49:10.296973	2020-02-06 13:17:49.15699	\N	\N	ruby	\N	3
7	Practice functions	6	2020-01-29 16:50:29.973469	2020-02-06 13:17:49.159462	\N	\N	ruby	\N	4
9	Switch statements	7	2020-01-29 16:51:41.272172	2020-02-06 13:17:49.165251	\N	\N	ruby	\N	1
10	Ternary operator	7	2020-01-29 16:52:18.26915	2020-02-06 13:17:49.167151	\N	\N	ruby	\N	2
12	Find and select	8	2020-01-29 16:53:13.910234	2020-02-06 13:17:49.170434	\N	\N	ruby	\N	1
13	Iteration methods versus loops	8	2020-01-29 16:53:37.795487	2020-02-06 13:17:49.172346	\N	\N	ruby	\N	2
14	Reduce and sum	8	2020-01-29 16:53:56.400911	2020-02-06 13:17:49.17438	\N	\N	ruby	\N	3
16	A better approach	9	2020-01-29 16:54:35.770157	2020-02-06 13:17:49.177747	\N	\N	ruby	\N	1
17	Using IRB	9	2020-01-29 16:54:46.187293	2020-02-06 13:17:49.179531	\N	\N	ruby	\N	2
18	Debugging	9	2020-01-29 16:54:57.542669	2020-02-06 13:17:49.181256	\N	\N	ruby	\N	3
20	Simple Procs	10	2020-01-29 16:55:41.232862	2020-02-06 13:17:49.184572	\N	\N	ruby	\N	1
21	What is a function?	10	2020-01-29 16:56:03.486515	2020-02-06 13:17:49.186719	\N	\N	ruby	\N	2
22	Higher order functions	10	2020-01-29 16:56:12.273354	2020-02-06 13:17:49.188702	\N	\N	ruby	\N	3
36	Reusing code	15	2020-01-29 17:07:18.249983	2020-01-29 17:07:18.249983	\N	\N	ruby	\N	0
40	Source code	20	2020-01-31 10:53:05.885297	2020-01-31 14:46:36.935606	\N	\N	cpp	\N	0
44	Variables	21	2020-01-31 10:54:18.217413	2020-01-31 14:46:36.948464	\N	\N	cpp	\N	0
41	Machine code	20	2020-01-31 10:53:21.948121	2020-02-06 13:21:00.828785	\N	\N	cpp	\N	1
46	Declaring variables	22	2020-01-31 10:58:48.816899	2020-01-31 14:46:36.974784	\N	\N	cpp	\N	0
49	Function prototypes	23	2020-01-31 10:59:40.047674	2020-01-31 14:46:36.983516	\N	\N	cpp	\N	0
43	Expressions	20	2020-01-31 10:53:43.436005	2020-02-06 13:21:00.835924	\N	\N	cpp	\N	2
52	typeof operator	26	2020-02-03 13:49:03.429539	2020-02-03 13:49:29.911608	\N	\N	javascript	\N	0
61	Global scope	25	2020-02-03 13:54:16.181521	2020-02-03 13:54:16.181521	\N	\N	javscript	\N	0
63	for loops	28	2020-02-03 13:59:15.503566	2020-02-03 13:59:15.503566	\N	\N	javscript	\N	0
68	if else	27	2020-02-03 14:01:12.344091	2020-02-03 14:01:12.344091	\N	\N	javscript	\N	0
42	Statements	20	2020-01-31 10:53:33.54029	2020-02-06 13:21:00.839394	\N	\N	cpp	\N	3
71	Declaring a function	29	2020-02-03 14:07:14.703135	2020-02-03 14:07:14.703135	\N	\N	javascript	\N	0
75	Execution context	30	2020-02-03 14:09:15.486515	2020-02-03 14:09:15.486515	\N	\N	javascript	\N	0
79	Defining an arrow function	31	2020-02-03 14:10:22.973152	2020-02-03 14:10:41.973314	\N	\N	javascript	\N	0
83	Passing functions to functions	32	2020-02-03 14:12:07.101511	2020-02-03 14:12:07.101511	\N	\N	javascript	\N	0
86	Accessing arguments	33	2020-02-03 14:12:52.617363	2020-02-03 14:12:52.617363	\N	\N	javascript	\N	0
89	Defining an object	35	2020-02-03 14:15:58.035569	2020-02-03 14:15:58.035569	\N	\N	javascript	\N	0
35	self again	14	2020-01-29 17:06:59.044267	2020-02-06 13:17:49.138604	\N	\N	ruby	\N	1
37	is-a relationship	15	2020-01-29 17:07:34.549698	2020-02-06 13:17:49.143657	\N	\N	ruby	\N	1
38	Super	15	2020-01-29 17:07:48.161234	2020-02-06 13:17:49.145498	\N	\N	ruby	\N	2
39	When to inherit	15	2020-01-29 17:07:57.428407	2020-02-06 13:17:49.147556	\N	\N	ruby	\N	3
56	Const, let and var	24	2020-02-03 13:53:13.607883	2020-02-06 13:20:47.919696	\N	\N	javscript	\N	0
57	String	24	2020-02-03 13:53:21.194597	2020-02-06 13:20:47.922051	\N	\N	javscript	\N	1
96	Defining an array	34	2020-02-03 14:20:59.566384	2020-02-03 14:21:19.320998	\N	\N	javascript	\N	0
58	Boolean	24	2020-02-03 13:53:28.420324	2020-02-06 13:10:50.78338	\N	\N	javscript	\N	3
59	Undefined and null	24	2020-02-03 13:53:40.113466	2020-02-06 13:10:50.785731	\N	\N	javscript	\N	4
60	Symbol	24	2020-02-03 13:53:51.021558	2020-02-06 13:10:50.787779	\N	\N	javscript	\N	5
62	Block scope	25	2020-02-03 13:54:23.6004	2020-02-06 13:10:50.792633	\N	\N	javscript	\N	1
53	Weird JS	26	2020-02-03 13:49:50.075223	2020-02-06 13:10:50.797494	\N	\N	javascript	\N	1
54	Typescript	26	2020-02-03 13:50:01.911268	2020-02-06 13:10:50.799266	\N	\N	javascript	\N	2
69	else if	27	2020-02-03 14:01:18.660684	2020-02-06 13:10:50.804976	\N	\N	javscript	\N	1
70	switch	27	2020-02-03 14:01:36.136889	2020-02-06 13:10:50.806767	\N	\N	javascript	\N	2
47	Initializing variables	22	2020-01-31 10:59:00.196814	2020-02-06 13:21:00.855117	\N	\N	cpp	\N	1
48	Variable scope	22	2020-01-31 10:59:10.252862	2020-02-06 13:21:00.85792	\N	\N	cpp	\N	2
50	Function signatures	23	2020-01-31 10:59:52.000272	2020-02-06 13:21:00.863572	\N	\N	cpp	\N	1
72	Function parameters	29	2020-02-03 14:07:33.095374	2020-02-06 13:10:50.82331	\N	\N	javascript	\N	1
73	Return statements	29	2020-02-03 14:07:44.521207	2020-02-06 13:10:50.825058	\N	\N	javascript	\N	2
74	Scope revisited	29	2020-02-03 14:07:57.438654	2020-02-06 13:10:50.826784	\N	\N	javascript	\N	3
76	this keyword	30	2020-02-03 14:09:39.881677	2020-02-06 13:10:50.831647	\N	\N	javascript	\N	1
77	Call and apply	30	2020-02-03 14:09:49.916756	2020-02-06 13:10:50.833654	\N	\N	javascript	\N	2
78	Bind	30	2020-02-03 14:09:55.656236	2020-02-06 13:10:50.835435	\N	\N	javascript	\N	3
80	Inherited context	31	2020-02-03 14:10:52.764407	2020-02-06 13:10:50.840104	\N	\N	javascript	\N	1
81	Arrow function syntax in depth	31	2020-02-03 14:11:10.173825	2020-02-06 13:10:50.8419	\N	\N	javascript	\N	2
82	Arrow practice	31	2020-02-03 14:11:24.241139	2020-02-06 13:10:50.843584	\N	\N	javascript	\N	3
84	Higher order functions	32	2020-02-03 14:12:17.708542	2020-02-06 13:10:50.84846	\N	\N	javascript	\N	1
85	Lambda functions	32	2020-02-03 14:12:25.678294	2020-02-06 13:10:50.85021	\N	\N	javascript	\N	2
87	Rest operator	33	2020-02-03 14:13:00.082064	2020-02-06 13:10:50.854676	\N	\N	javascript	\N	1
88	Default arguments	33	2020-02-03 14:13:14.944743	2020-02-06 13:10:50.85643	\N	\N	javascript	\N	2
98	Mutating arrays	34	2020-02-03 14:21:39.524284	2020-02-06 13:10:50.862635	\N	\N	javascript	\N	1
99	Spread operator	34	2020-02-03 14:21:46.60596	2020-02-06 13:10:50.86482	\N	\N	javascript	\N	2
90	Key value pairs	35	2020-02-03 14:16:13.648986	2020-02-06 13:10:50.871216	\N	\N	javascript	\N	1
91	Dot notation	35	2020-02-03 14:16:20.1075	2020-02-06 13:10:50.872995	\N	\N	javascript	\N	2
92	Object methods	35	2020-02-03 14:16:26.809991	2020-02-06 13:10:50.87475	\N	\N	javascript	\N	3
93	Mutating objects	35	2020-02-03 14:16:36.581119	2020-02-06 13:10:50.876468	\N	\N	javascript	\N	4
94	References and values	35	2020-02-03 14:16:45.151554	2020-02-06 13:10:50.878196	\N	\N	javascript	\N	5
95	Spread operator revisited	35	2020-02-03 14:16:55.02047	2020-02-06 13:10:50.880236	\N	\N	javascript	\N	6
55	Number	24	2020-02-03 13:52:50.582586	2020-02-06 13:20:47.924024	\N	\N	javscript	\N	2
67	break and continue	28	2020-02-03 14:00:21.931531	2020-02-06 13:20:47.936893	\N	\N	javscript	\N	1
64	while loops	28	2020-02-03 13:59:22.352358	2020-02-06 13:20:47.93887	\N	\N	javscript	\N	2
65	do while loops	28	2020-02-03 13:59:28.662781	2020-02-06 13:20:47.940688	\N	\N	javscript	\N	3
66	Nested loops	28	2020-02-03 14:00:09.147937	2020-02-06 13:20:47.942229	\N	\N	javscript	\N	4
51	Function naming	23	2020-01-31 11:00:28.082994	2020-02-06 13:21:00.866623	\N	\N	cpp	\N	2
97	Array iteration methods	34	2020-02-03 14:21:30.736049	2020-02-13 16:50:40.108201	const fs = require('fs');\nconst assert = require('chai').assert;\nconst expect = require('chai').expect;\nconst sourceFile = fs.readFileSync('tests/javascript/code.js', 'utf-8');\nconst jsdom = require('mocha-jsdom')\njsdom({ src: sourceFile, url: "http://localhost" })\n\n\ndescribe('#allTrue', function () {\n    it('should return true if all values are true', function () {\n        expect(allTrue([true, true, true, true])).to.equal(true);\n    })\n\n    it('should return true if all values are true/truthy', function () {\n        expect(allTrue([true, 1, true, "hello"])).to.equal(true);\n    })\n\n    it('should return false if any value is false/falsey', function () {\n        expect(allTrue([true, true, 0, true])).to.equal(false);\n    })\n})\n\ndescribe("#anyTrue", function () {\n    it('should return true if any value if true/truthy', function () {\n        expect(anyTrue([true, false, false, undefined, null])).to.equal(true);\n    })\n\n    it('should return false if all values are false/falsey', function () {\n        expect(anyTrue([false, false, false, undefined, null])).to.equal(false);\n    })\n})\n\n\ndescribe("#reduceToProduct", function () {\n    it('should reduce an array of integers to a single product correctly', function () {\n        expect(reduceToProduct([5,2,3], 7)).to.equal(30/7);\n    })\n\n    it('should account for negative numbers', function () {\n        expect(reduceToProduct([-1,6,-2,3.4], 5)).to.equal(8.16);\n    })\n        \n    it('should account for zero in the second argument', function () {\n        expect(reduceToProduct([-1,2,20.3,40], 0)).to.equal(-Infinity);\n    })\n\n})\n\n\ndescribe("#fractionSum", function () {\n    it('should find the proportion of each element relative to the sum of the array elements', function () {\n        expect(fractionSum([1,2,3,4])).to.deep.equal([0.1,0.2,0.3,0.4]);\n    })\n\n    it('should account for negative numbers', function () {\n        expect(fractionSum([-1,-2,-3, 4])).to.deep.equal([0.5, 1, 1.5, -2]);\n    })\n\n    it('should allow for when the sum of elements is zero', function () {\n        expect(fractionSum([1,2,3,-1,-5])).to.deep.equal([Infinity, Infinity, Infinity, -Infinity, -Infinity]);\n    })\n})\n\n\ndescribe('#stringLengthSorter', function () {\n    it('should sort strings based on their length', function () {\n        expect(stringLengthSorter(["john", "josephine", "marly", "ab", "Where's my cheese boy?"])).to.deep.equal(["ab", "john", "marly", "josephine", "Where's my cheese boy?" ])\n    })\n})\n\n\ndescribe('#camelCaser', function () {\n    it('should camel case each string in the array', function () {\n        expect(camelCaser(["john_snow", "raheem_sterling", "george_w_bush"])).to.deep.equal(["johnSnow", "raheemSterling", "georgeWBush"])\n    })\n})\n	// try to use the built-in JS array methods!	javascript	<p>\n    Javascript luckily has its own built-in methods to iterate over arrays and perform operations on its constituent elements.\n    We will cover them in order of increasing complexity. Note that all of these methods accept functions as arguments (they are \n    <em>higher order functions</em>) so it is commonplace to pass in arrow functions as arguments.\n</p>\n\n<h3>forEach()</h3>\n\n<p>\n    The first method we will cover is \n    <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach">\n        forEach()\n    </a>: a slightly more refined way of iterating through the elements of an array without having to use a <code>for</code> loop.\n    Its syntax is as follows: \n</p>\n    <pre> myArray.forEach(someFunction) </pre>\n<p>\n   This will run <code>someFunction</code> over each element in the array <code>myArray</code> where\n   each element is passed as an argument to <code>someFunction</code>. To see this more clearly consider the\n   following example:\n</p>\n\n<pre>const arr = [1,2,3];\nconst doubleArr = [];\narr.forEach((element, index, array) =&gt; doubleArr.push(element*2));\n</pre>\n\n<p>\n    If we check <var>doubleArr</var> we will find it contains the values <samp> [2,4,6] </samp>.\n    The three arguments <var>element, index, array</var> are always passed to the callback function but\n    usually we only want to capture the <var>element</var> argument. Note that <code>forEach()</code> returns\n    <var>undefined</var> so we shouldn't set a variable equal to the return value of a <code>forEach()</code>\n    expression (unless you want a variable to be equal to undefined...). Here's another example:\n</p>\n\n<pre>const arr = ["tom", "jane", "lucy"];\nconst capitalizedArr = [];\narr.forEach(e =&gt; capitalizedArr.push(e.charAt(0).toUpperCase() + e.slice(1)));\n</pre>\n\n<p>\n   Now you'll see that <code>capitalizedArr = ["Tom", "Jane", "Lucy"]</code>! (try it out in the console if you're not sure).\n   What you will notice in the previous two examples is that we stored the results of each callback in <code>forEach()</code> in a \n   new array. There is in fact a method which does this for us: <code>map()</code>. \n</p>\n\n<h3>map()</h3>\n\n<p>\n    <code>map()</code>, like <code>forEach()</code> takes a callback as an argument, but it <em>applies</em> the callback we provide\n    to each element, returning a brand new array with our <em>mapped</em> elements. This is generally more useful than <code>forEach()\n   </code> which only gives access to the contents of an array without returning a new array. Take a look at this example:\n</p>\n\n<pre>const arr = [1,2,3,4,5,6,7,8,9];\nconst cubedArr = arr.map(e =&gt; e**3);\n</pre>\n\n<p>\n    Check that <code>cubedArr = [1, 8, 27, 64, 125, 216, 343, 512, 729]</code> in the console as expected. Hopefully you \n    can see how useful this method will be considering we often want to transform each element of an array in \n    some particular way without mutating our original array. The tests at the end of the lesson should provide some more\n    familiarity with <code>map()</code>. \n</p>\n\n<h3>reduce()</h3>\n\n<p>\n    The next method we will cover is <a href = "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce">reduce()</a>.\n    In summary, <code>reduce</code> reduces or accumulates all the values of an array in some manner into a single value. It's syntax is as follows:\n</p>\n\n<pre>myArray.reduce((accumulator, currentValue) =&gt; (// do some stuff), initialValue)\n</pre>\n\ne.g.\n\n<pre>const arr = [1,2,3,4];\nconst squareSum = arr.reduce((sum, val) =&gt; sum += val**2, 0);\n</pre>\n\n<p>\n   <var>squareSum</var> now equals 30, the sum of the squares of the first four natural numbers. Note that if you don't provide \n   an initial value to <code>reduce()</code> it will use the first value of the array it is called on, which is not particulary\n   intuitive e.g. the last example would have given 1 + 1 + 4 + 9 + 25 = 31. Also we must make sure the arrow function we provide\n   returns something as this will be used as the accumulator argument for the next iteration.\n</p>\n\n<h3>sort()</h3>\n\n<p>\n   The last method we will cover is <a href = "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort">sort()</a>,\n   which (surprise, surprise) sorts the content of an array. Unlike <code>map()</code> and <code>reduce()</code>, <code>sort()</code> sorts elements\n   in place so it <em>mutates</em> the original array - this is important to remember if you want to keep a copy of the original unsorted array.\n   It does this using a comparison function we provide to determine in which manner the elements are to be sorted. The comparison\n   function to be provided must return a <code>number</code> and not a <code>boolean</code> as one might expect. Two elements are \n   given to the comparison function and depending on the sign of the number it returns, one element will be given priority over the other.\n   If a negative number is returned, the first element is given priority (it comes before the second element in the resulting array) \n   and if a positive number is returned the second element is given priority. If 0 is returned, the elements stay in their original \n   order with respect to each other. Here are some examples:\n</p>\n\n<pre>const arr = [2,5,3,1,4,0];\narr.sort((a,b) =&gt; (a - b));\n// arr = [0,1,2,3,4,5]\nconst anotherArr = [4,3,5,6,2];\nanotherArr.sort((a,b) =&gt; (b - a));\n// anotherArr = [6,5,4,3,2];\n</pre>\n\n<p>\n    The first example sorts the array in ascending order and relies on the fact that if <var>a</var> &gt; <var>b</var>, <code>a - b</code> \n    will be positive and correspondingly negative if  <var>b</var> &gt; <var>a</var>. The second example works in a similar fashion\n    with <var>a</var> and <var>b</var> flipped so that the array is sorted in descending order.\n</p>\n\n\n<p>\n   There are more methods like <a href = "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find">find()</a>\n   and <a href = "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter">filter()</a> but hopefully \n   you'll see their syntax and use is not so dissimlar to the methods named here.\n</p>\n\n<h2>Tests</h2>\n\n<ol>\n    <li>\n        Write a function <code>allTrue(arr)</code> which returns true only if all elements in <var>arr</var> are true/truthy. Similarly write a function\n        <code>anyTrue(arr)</code> which returns true if any value is true/truthy. Both functions should return either true or false. \n    </li>\n    <li>\n        Write a function <code>reduceToProduct(arr, n)</code> which finds the product of all the numbers in an array divided by the second argument\n        <var>n</var>. e.g. <code>reduceToProduct([3,10,2], 3)</code> should return 20.\n    </li>\n    <li>\n        Write a function <code>fractionSum(arr)</code> which returns an array with each element of the original array divided by the sum of all the\n        elements e.g. <code>fractionSum([1,2,3,4])</code> should return <samp> [0.1, 0.2, 0.3, 0.4] </samp>\n    </li>\n    <li>\n        Write a function <code>stringLengthSorter(arr)</code> which sorts an array of strings based on their length.\n    </li>\n    <li>\n        Write a function <code>camelCaser(arr)</code> which takes an array of snake_cased strings ("snake_case") and returns and array of\n        camelCased ("snakeCase") strings. \n    </li>\n</ol>\n\n\n\n\n	3
45	Functions	21	2020-01-31 10:54:26.285943	2020-02-13 20:30:42.777352	#include <gtest/gtest.h>\n#include "./code.cpp"\n\nTEST(FunctionTests, add) {\n    EXPECT_EQ(add(1,2), 3);\n    EXPECT_EQ(add(-123,90), -33);\n    EXPECT_EQ(add(0, 100001), 100001);\n}\n\nTEST(FunctionTests, divide) {\n    EXPECT_FLOAT_EQ(divide(18.0, 9.0), 2.0);\n    EXPECT_FLOAT_EQ(divide(2.25, 1.5), 1.5);\n    EXPECT_FLOAT_EQ(divide(2.0,7.0), 0.28571428571);\n}\n\nTEST(FunctionTests, oneNumber) {\n    EXPECT_EQ(oneNumber(), 1);\n}\n\n\nint main(int argc, char *argv[])\n{\n    ::testing::InitGoogleTest(&argc, argv);\n    return RUN_ALL_TESTS();\n}\n	// write your code below	cpp	<p>\n   Functions in C++ are the basic building blocks which allow us to encapsulate "work". We will cover functions in much more detail later on but for now we'll go over \n   their basic syntax and usage because they are fundamental to any program (in any programming language).\n</p>\n\n<h3>Structure of a function</h3>\n\n<p>\n    A function is a bit like a machine which takes inputs and does some work on these inputs to return a single output. To define a function we first need to tell\n    the compiler what data types the function will accept as parameters and what data type it will return:\n</p>\n\n<pre>// basic function declaration:\nreturnType nameOfFunction(argumentType1 arg1, argumentType2 arg2);\n</pre>\n\n<p>\n   Note that a function can take any number of arguments or zero arguments. If a function takes multiple arguments they must be separated by commas. It is also\n   possible that a function returns nothing in which case we specify the return value as the special keyword <code>void</code>. Here are some examples:\n</p>\n\n<pre>int multiply(int a, int b);\n// multiply function returns an integer and takes two integer arguments a and b.\nstring capitalize(string text);\n// capitalize function returns a string and takes a single argument text of type string.\nvoid print(double temp);\n// print function returns nothing and takes a single argument temp of type double.\nint random();\n// random function takes no arguments and returns an integer.\n</pre>\n\n<p>\n   The above examples are all known as <em>function prototypes</em> (another type of statement in C++): we don't specify the work which the function will\n   do but rather it's specific form (i.e the type of data it accepts and returns). This is necessary as much as it is necessary to state the data \n   type when declaring a variable.\n</p>\n\n<h3>Function body</h3>\n\n<p>\n   In order to specify what a function is to do we have to actually write the function including its <em>body</em>. It is easiest to see this by example:\n</p>\n\n<pre>int multiply(int a, int b) \n{\n   return a*b;\n} \n</pre>\n\n<p>\n   <code>return</code> is a C++ keyword specifying what the function in question is to return when it is called. In the <code>multiply</code> example we return\n   the product of the arguments <var>a</var> and <var>b</var>. We have to include a return statement in this function and it has to return something of type int (\n   which it does). If the data type in the return statement doesn't match what was specified in the prototype, the compiler will complain. In addition, if the return\n   type is not <code>void</code> (i.e. the function returns something) then the function body must include a <code>return</code> statement. A function\n   protype always comes before its full definition just as a variable declaration must come before anything is assigned to it. That being said, it is in \n   fact possible to skip the function prototype altogether but this has consequences on how the function is executed at run time. For now, \n   always include a function prototype as it is the norm.  Finally, note that the return statement in a function will terminate it's execution;\n   that is, any statements in the function body after a return statement will not get executed. This will become important when we begin to discuss \n   control flow as some return statements may be conditionally executed.\n</p>\n\n<pre>float subtract(float a, float b) \n{\n   return a - b;\n   // stuff after here never executed!\n}\n</pre>\n\n<h3>Calling a function</h3>\n\n<p>\n   So far we have discussed how to define and declare a function but if we actually want to use a function we have to <em>call</em> it. Luckily, calling a function is\n   very easy! Continuing with the multiply example, we would call it like so:\n</p>\n\n<pre>// some code...\nint a = 3;\nint b = 4;\nint c = multiply(a, b);\nint d = multiply(2, 5);\n// some more code...\n</pre>\n\n<p>\n   As you can see we call a function using its name and a set of brackets to enclose the arguments it will recieve. This is what makes functions so useful: we can define \n   them once and call them as many times as we like, allowing us to encapsulate logic into chunks. We can even call (and almost always do) functions within\n   the bodies of other functions. This allows a program to be split into small chunks of work which all have a specific purpose. While the examples given here are very\n   basic, you will see in the remainder of the course how useful it is to split up and delegate 'work' to different functions.\n</p>\n\n<p>The best way to learn functions is to start using them! See if you can write some functions below to pass the tests:</p>\n\n<ul>\n      <li>Write a function <code>add</code> which takes two integers and returns their sum (also an integer). It's up to you what to call your function parameters.</li>\n      <li>\n          Write a function <code>divide</code> which takes two doubles and returns the first argument divided by the second. Don't worry about zero division for now,\n          we'll discuss how to deal with such things later on. The return type should also be double.\n      </li>\n      <li>Write a function <code>oneNumber</code> which takes no arguments and always returns the number 1.</li>\n</ul>\n	1
6	Writing your first methods	6	2020-01-29 16:50:10.432679	2020-02-13 20:29:03.371994	require 'rspec'\nrequire_relative 'code.rb'\n\ndescribe "helloWorld" do\n  it "returns 'hello world!'" do\n    expect(helloWorld).to eq("hello world!")\n  end\nend\n\ndescribe "doubleSum" do\n  it "returns the sum of two positive numbers" do\n    expect(doubleSum(3,4)).to eq(14)\n  end\n\n  it "allows for negative numbers" do\n    expect(doubleSum(3, -4)).to eq(-2)\n  end\n\n  it "allows for non-integers" do\n    expect(doubleSum(0.1, 3)).to eq(6.2)\n  end\nend\n	# write the function helloWorld below!	ruby	<p>\n    Now that we’ve covered the basics of variables, functions and programs you can write your very first functions!\n    (Admittedly they won’t do very much but hopefully it will show the progress you’ve made over the past few lessons).\n</p>\n\n<p>\n   Write a function <code>helloWorld</code> which returns a string <samp> "hello world!" </samp> (remember \n   that the string has to exactly match to pass the test...). Write another function <code>doubleSum(a,b)</code>\n   which will return double the sum of the input numbers a and b.\n</p>\n\n	5
101	Operator overloading practice	39	2020-03-01 16:07:44.609557	2020-03-02 11:17:09.359506	#include <gtest/gtest.h>\n#include <initializer_list>\n#include <iomanip>\n#include <iostream>\n#include <cmath>\n#include "./code.cpp"\n\nstruct MatrixTest : testing::Test {\n\n    int m1values[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9 };\n    int m2values[9] = { 3, 4, 7, 2, 5, 1034, 90, -304, 25 };\n    double m4values[9] = { 3.4, 5.3, 1000.0, 90.2, 22.1, 32.3, -10000.0, 324.1, 0.02 };\n    double m3values[9] = { 45.2, 12.23, 90.23, 1312.1, -187.2, 90.2, 80.2, 52.9, 0.0 };\n\n    Matrix<int, 3, 3>* m1;\n    Matrix<int, 3, 3>* m2;\n    Matrix<double, 3, 3>* m3;\n    Matrix<double, 3, 3>* m4;\n\n    MatrixTest() {\n        m1 = new Matrix<int, 3, 3>\n        {\n                1, 2, 3,\n                4, 5, 6,\n                7, 8, 9\n        };\n        m2 = new Matrix<int, 3, 3>\n        {\n                3, 4, 7,\n                2, 5, 1034,\n                90, -304, 25\n        };\n\n        m3 = new Matrix<double, 3, 3>\n        {\n                45.2, 12.23, 90.23,\n                1312.1, -187.2, 90.2,\n                80.2, 52.9, 0.0\n        };\n        m4 = new Matrix<double, 3, 3>\n        {\n                3.4, 5.3, 1000.0,\n                90.2, 22.1, 32.3,\n                -10000.0, 324.1, 0.02\n        };\n\n\n    }\n\n    ~MatrixTest() {\n        delete m1;\n        delete m2;\n        delete m3;\n        delete m4;\n    }\n\n};\n\nTEST_F(MatrixTest, AddMatrices) {\n\n    Matrix<int, 3, 3> t1 = {\n        4, 6, 10,\n        6, 10, 1040,\n        97, -296, 34\n    };\n\n    Matrix<double, 3, 3> t2 = {\n        48.6, 17.53, 1090.23,\n        1402.3, -165.1, 122.5,\n        -9919.8, 377.0, 0.02\n    };\n    EXPECT_EQ(t1, *m1 + *m2);\n    EXPECT_EQ(t2, *m3 + *m4);\n}\n\nTEST_F(MatrixTest, SubtractMatrices) {\n\n    Matrix<int, 3, 3> t1 = {\n        -2, -2, -4,\n        2, 0, -1028,\n        -83, 312, -16\n    };\n\n    Matrix<double, 3, 3> t2 = {\n        41.8, 6.93, -909.77,\n        1221.9, -209.3, 57.9,\n        10'080.2, -271.2, -0.02\n    };\n\n    EXPECT_EQ(t1, *m1 - *m2);\n    EXPECT_EQ(t2, *m3 - *m4);\n}\n\nTEST_F(MatrixTest, MultiplyMatrices) {\n\n    Matrix<int, 3, 3> t1 = {\n        277, -898, 2150,\n        562 ,-1783 ,5348,\n        847, -2668, 8546\n    };\n    Matrix<double, 3, 3> t2 = {\n        -901043.174, 29753.386, 45596.8336,\n        -914424.3, 32050.83, 1306055.244,\n        5044.26, 1594.15, 81908.67\n    };\n\n    EXPECT_EQ(t1, (*m1)*(*m2));\n    EXPECT_EQ(t2, (*m3)*(*m4));\n}\n\nTEST_F(MatrixTest, ElementAccess) {\n    EXPECT_EQ((*m1)(1, 1), 5);\n    EXPECT_EQ((*m2)(2, 2), 25);\n    EXPECT_EQ((*m3)(2, 1), 52.9);\n    EXPECT_EQ((*m4)(1, 2), 32.3);\n}\n\nTEST_F(MatrixTest, DivideByNumber) {\n\n    double m3values[9] = { 45.2, 12.23, 90.23, 1312.1, -187.2, 90.2, 80.2, 52.9, 0.0 };\n\n    Matrix<double, 3, 3> t1 = { m3values[0]/3, m3values[1]/3,m3values[2]/3, m3values[3]/3,m3values[4]/3, m3values[5]/3,m3values[6]/3, m3values[7]/3,m3values[8]/3 };\n    Matrix<double, 3, 3> t2 = { m4values[0]/4, m4values[1]/4,m4values[2]/4, m4values[3]/4,m4values[4]/4, m4values[5]/4,m4values[6]/4, m4values[7]/4,m4values[8]/4 };\n    EXPECT_EQ(t1, (*m3)/3);\n    EXPECT_EQ(t2, (*m4)/4);\n}\n\nTEST_F(MatrixTest, MultiplyByNumber) {\n    Matrix<double, 3, 3> t1 = \n    { \n        m3values[0]*3, m3values[1]*3,m3values[2]*3,\n        m3values[3]*3,m3values[4]*3, m3values[5]*3,\n        m3values[6]*3, m3values[7]*3,m3values[8]*3 \n    };\n    Matrix<double, 3, 3> t2 = \n    {\n        m4values[0]*4, m4values[1]*4,m4values[2]*4,\n        m4values[3]*4,m4values[4]*4 , m4values[5]*4,\n        m4values[6]*4, m4values[7]*4,m4values[8]*4 \n    };\n\n    EXPECT_EQ(t1, 3*(*m3));\n    EXPECT_EQ(t2, 4*(*m4));\n\n}\n\nint main(int argc, char *argv[])\n{\n    ::testing::InitGoogleTest(&argc, argv);\n    return RUN_ALL_TESTS();\n}\n	template<typename T, int rows, int columns>\nclass Matrix {\n\n    private:\n        T m_data[rows*columns] {};\n\n        // in order for Matrix multiplication to work we need to declare the transpose of a matrix as a friend\n        friend class Matrix<T, columns, rows>;\n\n    public:\n\n        // default constructor intializes all values to 0\n        Matrix() { }\n\n        Matrix(std::initializer_list<T> values)  {\n            std::copy(values.begin(), values.end(), m_data);\n        }\n\n        Matrix(const Matrix<T, rows, columns>& m) {\n            for (int i = 0; i < m.size(); ++i)\n                m_data[i] = m.m_data[i];\n        }\n\n        // getter methods\n\n        int rowNumber() const { return rows; }\n        int columnNumber() const { return columns; }\n        int size() const { return rows*columns; }\n\n        // equality operator defind for the tests, don't touch it!\n        bool operator==(const Matrix<T, rows, columns>& m1) const {\n            for (int i = 0; i < size(); ++i) {\n                if (fabs(m_data[i] - m1.m_data[i]) > 0.0005f) {\n                    return false;\n                }\n            }\n            return true;\n        };\n\n        // used to print matrices in tests\n\n        friend std::ostream& operator<<(std::ostream& os, const Matrix<T, rows, columns>& m) {\n            for (int i = 0; i < m.size(); ++i) {\n                if (i%m.rowNumber() == 0) os << '\\n';\n                os << std::setprecision(12) << m.m_data[i] << ' ';\n            }\n            return os;\n        };\n\n        // implement the following methods (inside the class definition)\n\n        Matrix<T, rows, columns> operator+(const Matrix<T, rows, columns>& m1) const\n        {\n            Matrix<T, rows, columns> result;\n            return result;\n        }\n\n        Matrix<T, rows, columns> operator-(const Matrix<T, rows, columns>& m1) const\n        {\n            Matrix<T, rows, columns> result;\n            return result;\n        }\n\n        Matrix<T, rows, rows> operator*(const Matrix<T, columns, rows>& m1) {\n            Matrix<T, rows, rows> result;\n            return result;\n        };\n\n        Matrix<T, rows, columns> operator/(const T divisor) const {\n            Matrix result;\n            return result;\n        }\n        T& operator() (int i, int j) { return m_data[0]; } ;\n\n        friend Matrix<T, rows, columns> operator*(const T multiplier, const Matrix<T, rows, columns>& m) {\n            Matrix result;\n            return result;\n        };\n\n};\n\n	cpp	<p>\n    Now that we've covered templates and operator overloading try to finish off the Matrix class\n    below. Note that we haven't covered <code>friends</code> yet but you can ignore it for the moment.\n    If you get stuck, try to look up basic matrix algebra online! The overloaded\n    <code>operator()</code> should accept two arguments to find a particular element in the\n    matrix (we're using a 1d array to represent a 2d matrix) e.g. <code>m(0,1)</code> should\n    return the element at the first row and second column of the matrix (using 0-based indexing).\n</p>	1
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: zoraaver
--

COPY public.schema_migrations (version) FROM stdin;
20200128150529
20200129095024
20200129095046
20200129095102
20200129095118
20200129095132
20200129095728
20200129120200
20200129152437
20200130120358
20200130142353
20200130142547
20200130142819
20200130143251
20200130152023
20200130162933
20200131124703
20200131124902
20200131125300
20200131125356
20200131125444
20200131134451
20200131144315
20200204095157
20200204100317
20200206125209
20200206125221
20200206125229
20200206145205
20200207151946
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: zoraaver
--

COPY public.sections (id, title, course_id, sort_id) FROM stdin;
3	Introduction	3	0
12	Variables	2	0
13	Control flow	2	1
14	Functions	2	2
15	Arrays and objects	2	3
4	Fundamentals	3	1
5	Data types	3	2
6	Arrays, strings, vectors and pointers	3	3
7	Control flow	3	4
8	Functions	3	5
9	Objects and Classes	3	6
10	Inheritance and friends	3	7
11	The Standard Template Library	3	8
2	Object oriented Ruby	1	1
1	Fundamentals	1	0
\.


--
-- Data for Name: subsections; Type: TABLE DATA; Schema: public; Owner: zoraaver
--

COPY public.subsections (id, title, section_id, sort_id) FROM stdin;
20	The compiler	3	0
22	Variables	4	0
27	Conditionals	13	0
29	Declaration	14	0
34	Arrays	15	0
7	Control flow	1	1
8	Ruby iteration methods	1	2
9	IRB	1	3
10	Procs and functional programming	1	4
25	Scope	12	1
26	Type conversion	12	2
28	Loops	13	1
30	Calling functions	14	1
31	Arrow functions	14	2
32	Functions as first class data	14	3
33	Arguments object	14	4
35	Objects	15	1
12	Objects and classes	2	1
13	Instance methods	2	2
14	Class methods	2	3
21	Programs	3	1
23	Functions	4	1
11	Introduction	2	0
15	Inheritance	2	4
24	Data types	12	0
6	Introduction	1	0
39	Operator overloading	9	0
\.


--
-- Data for Name: user_courses; Type: TABLE DATA; Schema: public; Owner: zoraaver
--

COPY public.user_courses (id, user_id, course_id) FROM stdin;
1	1	1
2	1	2
3	1	3
6	4	2
7	4	1
9	5	2
10	4	3
11	6	2
12	6	1
13	5	3
\.


--
-- Data for Name: user_lessons; Type: TABLE DATA; Schema: public; Owner: zoraaver
--

COPY public.user_lessons (id, lesson_id, user_id, status, code) FROM stdin;
2	8	1	1	\N
4	2	1	2	\N
7	3	1	2	\N
69	57	4	2	\N
70	55	4	2	\N
14	99	1	2	\N
71	58	4	1	\N
13	4	1	2	\N
5	11	1	1	\N
6	12	1	1	\N
15	98	1	2	\N
8	55	1	1	\N
16	96	1	2	\N
68	56	4	2	\N
72	59	4	1	\N
12	89	1	2	\N
78	2	4	1	\N
79	23	4	1	\N
80	22	4	1	\N
92	57	6	2	\N
9	56	1	2	\N
74	57	1	2	\N
93	55	6	1	\N
10	63	1	2	\N
17	45	1	2	\nint add(int a, int b);\ndouble divide(double a, double b);\nint oneNumber();\n\nint add(int a, int b) {\n    return a + b;\n}\n\ndouble divide(double a, double b) {\n    return a/b;\n}\n\nint oneNumber() {\n    return 1;\n}\n\n
87	44	1	2	\N
94	33	6	1	\N
76	56	5	1	\N
77	97	5	1	\N
11	97	1	2	function stringLengthSorter(arr) {\n    return arr.sort((a,b) => a.length - b.length)\n}\n\nfunction reduceToProduct(arr, n) {\n    return arr.reduce((acc, curr) => acc*curr, 1)/n ;\n}\n\nfunction anyTrue(arr) {\n    return arr.reduce((acc, curr) => acc || curr) || false\n}\n\nfunction allTrue(arr) {\n    return arr.reduce((acc, curr) => acc && curr)? true : false\n}\n\nfunction fractionSum(arr) {\n    const sum = arr.reduce((acc, curr) => acc + curr, 0);\n    return arr.map(e => e/sum) ;\n}\n\nfunction camelCaser(arr) {\n    return arr.map(w => {\n        let words = w.split("_");\n        words = words.map((e, idx) => {\n            return (idx !== 0)? e.charAt(0).toUpperCase() + e.slice(1) : e\n        })\n        return words.join("");\n    })\n}
82	71	4	2	\N
83	72	4	1	\N
84	73	4	1	\N
95	71	6	2	\N
86	99	4	2	\N
96	72	6	1	\N
97	73	6	1	\N
98	74	6	1	\N
88	8	4	2	\N
99	75	6	1	\N
100	76	6	1	\N
90	46	4	1	\N
101	77	6	1	\N
102	78	6	1	\N
103	79	6	1	\N
104	80	6	1	\N
81	6	4	2	# write the function helloWorld below!\ndef helloWorld\n    "hello world!"\nend\n\ndef doubleSum(a, b)\n    2*(a + b)\nend
73	97	4	1	// try to use the built-in JS array methods!\nfunction allTrue() {\n    return true;\n}
105	81	6	1	\N
106	82	6	1	\N
85	45	4	2	int add(int a, int b);\ndouble divide(double a, double b);\nint oneNumber();\n\nint add(int a, int b) {\n    return a + b;\n}\n\ndouble divide(double a, double b) {\n    return a/b;\n}\n\nint oneNumber() {\n    return 10;\n}\n\n
91	56	6	2	\N
107	83	6	1	\N
108	84	6	1	\N
109	85	6	1	\N
110	86	6	1	\N
111	87	6	1	\N
112	88	6	1	\N
113	96	6	1	\N
114	98	6	1	\N
115	99	6	1	\N
118	101	4	1	template<typename T, int rows, int columns>\nclass Matrix {\n\n    private:\n        T m_data[rows*columns] {};\n\n    public:\n\n        // default constructor intializes all values to 0\n        Matrix() { }\n\n        Matrix(std::initializer_list<T> values)  {\n            std::copy(values.begin(), values.end(), m_data);\n        }\n\n        Matrix(const Matrix<T, rows, columns>& m) {\n            for (int i = 0; i < m.size(); ++i)\n                m_data[i] = m.m_data[i];\n        }\n\n        // getter methods\n\n        int rowNumber() const { return rows; }\n        int columnNumber() const { return columns; }\n        int size() const { return rows*columns; }\n\n        // equality operator used for the tests, don't touch it!\n        bool operator==(const Matrix<T, rows, columns>& m1) const {\n            for (int i = 0; i < size(); ++i) {\n                if (fabs(m_data[i] - m1.m_data[i]) > 0.0005f) {\n                    return false;\n                }\n            }\n            return true;\n        };\n\n        // used to print matrices in tests\n\n        friend std::ostream& operator<<(std::ostream& os, const Matrix<T, rows, columns>& m) {\n            for (int i = 0; i < m.size(); ++i) {\n                if (i%m.rowNumber() == 0) os << '\\n';\n                os << std::setprecision(12) << m.m_data[i] << ' ';\n            }\n            return os;\n        };\n\n        // implement the following methods (inside the class definition)\n\n        Matrix<T, rows, columns> operator+(const Matrix<T, rows, columns>& m1) const\n        {\n            Matrix<T, rows, columns> result;\n            return result;\n        }\n\n        Matrix<T, rows, columns> operator-(const Matrix<T, rows, columns>& m1) const\n        {\n            Matrix<T, rows, columns> result;\n            return result;\n        }\n\n        Matrix<T, rows, columns> operator*(const Matrix<T, rows, columns>& m1) const {\n            Matrix<T, rows, columns> result;\n            return result;\n        };\n\n        Matrix<T, rows, columns> operator/(const T divisor) const {\n            Matrix result;\n            return result;\n        }\n        T& operator() (int i, int j) { return m_data[0]; } ;\n\n        friend Matrix<T, rows, columns> operator*(const T multiplier, const Matrix<T, rows, columns>& m) {\n            Matrix result;\n            return result;\n        };\n\n};\n
116	97	6	1	function allTrue(arr) {\n    for (let i = 0; i < arr.length; i++) {\n        if (!arr[i]) {\n            return false;\n        }\n    }\n    return true;\n}
89	9	4	2	\N
3	6	1	2	# write the function helloWorld below!\ndef helloWorld\n    "hello world!"\nend\n\ndef doubleSum(a, b)\n    2*(a + b)\nend\n\ndef heyMan(a, b)\n    "hey man"\nend
117	101	1	2	template<typename T, int rows, int columns>\nclass Matrix {\n\n    private:\n        T m_data[rows*columns] {};\n\n        // in order for Matrix multiplication to work we need to declare the transpose of a matrix as a friend\n        friend class Matrix<T, columns, rows>;\n\n    public:\n\n        // default constructor intializes all values to 0\n        Matrix() { }\n\n        Matrix(std::initializer_list<T> values)  {\n            std::copy(values.begin(), values.end(), m_data);\n        }\n\n        Matrix(const Matrix<T, rows, columns>& m) {\n            for (int i = 0; i < m.size(); ++i)\n                m_data[i] = m.m_data[i];\n        }\n\n        // getter methods\n\n        int rowNumber() const { return rows; }\n        int columnNumber() const { return columns; }\n        int size() const { return rows*columns; }\n\n        // equality operator defind for the tests, don't touch it!\n        bool operator==(const Matrix<T, rows, columns>& m1) const {\n            for (int i = 0; i < size(); ++i) {\n                if (fabs(m_data[i] - m1.m_data[i]) > 0.0005f) {\n                    return false;\n                }\n            }\n            return true;\n        };\n\n        // used to print matrices in tests\n\n        friend std::ostream& operator<<(std::ostream& os, const Matrix<T, rows, columns>& m) {\n            for (int i = 0; i < m.size(); ++i) {\n                if (i%m.rowNumber() == 0) os << '\\n';\n                os << std::setprecision(12) << m.m_data[i] << ' ';\n            }\n            return os;\n        };\n\n        // implement the following methods (inside the class definition)\n\n        Matrix<T, rows, columns> operator+(const Matrix<T, rows, columns>& m1) const\n        {\n            Matrix<T, rows, columns> result;\n            for (int i = 0; i < size(); ++i)\n                result.m_data[i] = m_data[i] + m1.m_data[i];\n            return result;\n        }\n\n        Matrix<T, rows, columns> operator-(const Matrix<T, rows, columns>& m1) const\n        {\n            Matrix<T, rows, columns> result;\n            for (int i = 0; i < size(); ++i){\n                result.m_data[i] = m_data[i] - m1.m_data[i];\n            }\n            return result;\n        }\n\n        Matrix<T, rows, rows> operator*(const Matrix<T, columns, rows>& m1) {\n            Matrix<T, rows, rows> result;\n\n            for (int i = 0; i < result.rowNumber(); ++i) {\n                for (int j = 0; j < result.columnNumber(); ++j) {\n                    for (int k = 0; k < m1.rowNumber(); ++k ) {\n                        result(i, j) += m_data[ i*columns + k ]*m1.m_data[ k*rows + j ];\n                    }\n                }\n            }\n            return result;\n        };\n\n        Matrix<T, rows, columns> operator/(const T divisor) const {\n            Matrix result;\n            for (int i = 0; i < result.rowNumber(); ++i) {\n                for (int j = 0; j < result.columnNumber(); ++j ) {\n                    result(i, j) = m_data[i*rows + j]/divisor;\n                }\n            }\n            return result;\n        }\n        T& operator() (int i, int j) { return m_data[i*columns + j]; } ;\n\n        friend Matrix<T, rows, columns> operator*(const T multiplier, const Matrix<T, rows, columns>& m) {\n            Matrix result;\n            for (int i = 0; i < result.rowNumber(); ++i) {\n                for (int j = 0; j < result.columnNumber(); ++j ) {\n                    result(i, j) = m.m_data[i*rows + j]*multiplier;\n                }\n            }\n            return result;\n        };\n\n};\n\n
119	101	5	1	template<typename T, int rows, int columns>\nclass Matrix {\n\n    private:\n        T m_data[rows*columns] {};\n\n        // in order for Matrix multiplication to work we need to declare the transpose of a matrix as a friend\n        friend class Matrix<T, columns, rows>;\n\n    public:\n\n        // default constructor intializes all values to 0\n        Matrix() { }\n\n        Matrix(std::initializer_list<T> values)  {\n            std::copy(values.begin(), values.end(), m_data);\n        }\n\n        Matrix(const Matrix<T, rows, columns>& m) {\n            for (int i = 0; i < m.size(); ++i)\n                m_data[i] = m.m_data[i];\n        }\n\n        // getter methods\n\n        int rowNumber() const { return rows; }\n        int columnNumber() const { return columns; }\n        int size() const { return rows*columns; }\n\n        // equality operator defind for the tests, don't touch it!\n        bool operator==(const Matrix<T, rows, columns>& m1) const {\n            for (int i = 0; i < size(); ++i) {\n                if (fabs(m_data[i] - m1.m_data[i]) > 0.0005f) {\n                    return false;\n                }\n            }\n            return true;\n        };\n\n        // used to print matrices in tests\n\n        friend std::ostream& operator<<(std::ostream& os, const Matrix<T, rows, columns>& m) {\n            for (int i = 0; i < m.size(); ++i) {\n                if (i%m.rowNumber() == 0) os << '\\n';\n                os << std::setprecision(12) << m.m_data[i] << ' ';\n            }\n            return os;\n        };\n\n        // implement the following methods (inside the class definition)\n\n        Matrix<T, rows, columns> operator+(const Matrix<T, rows, columns>& m1) const\n        {\n            Matrix<T, rows, columns> result;\n            return result;\n        }\n\n        Matrix<T, rows, columns> operator-(const Matrix<T, rows, columns>& m1) const\n        {\n            Matrix<T, rows, columns> result;\n            return result;\n        }\n\n        Matrix<T, rows, rows> operator*(const Matrix<T, columns, rows>& m1) {\n            Matrix<T, rows, rows> result;\n            return result;\n        };\n\n        Matrix<T, rows, columns> operator/(const T divisor) const {\n            Matrix result;\n            return result;\n        }\n        T& operator() (int i, int j) { return m_data[0]; } ;\n\n        friend Matrix<T, rows, columns> operator*(const T multiplier, const Matrix<T, rows, columns>& m) {\n            Matrix result;\n            return result;\n        };\n\n};\n\n
120	7	1	2	\N
121	46	1	1	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: zoraaver
--

COPY public.users (id, email, password_digest, created_at, updated_at, admin) FROM stdin;
4	john@gmail.com	$2a$12$3V6XxVWS3/x.tPZNXFDCL.k6yB0a31NC1x3aaFohsPZF6ZE85mXi6	2020-02-07 12:52:02.494429	2020-02-07 12:52:02.494429	f
1	zoraaver@gmail.com	$2a$12$dytOJyJJmoaHcMoM9eIAmexK1oCu2XHaEs0Mx8zhAOnuyDM6WAL3C	2020-01-29 10:27:30.833523	2020-02-07 15:20:59.619146	t
5	qing@test.com	$2a$12$Y9tp4W/EFittDjCyv9h08uIlK7dWR0t865qXesbUrmxCuW3ZAYcFS	2020-02-13 15:24:53.59621	2020-02-13 15:24:53.59621	f
6	test@gmail.com	$2a$12$sgK1h7N8/xyyZrrQ2tk/gOXby345eHJInAw8mRju16PeJ1VWcxtfa	2020-02-18 19:52:26.53634	2020-02-18 19:52:26.53634	f
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zoraaver
--

SELECT pg_catalog.setval('public.courses_id_seq', 3, true);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zoraaver
--

SELECT pg_catalog.setval('public.lessons_id_seq', 101, true);


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zoraaver
--

SELECT pg_catalog.setval('public.sections_id_seq', 37, true);


--
-- Name: subsections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zoraaver
--

SELECT pg_catalog.setval('public.subsections_id_seq', 39, true);


--
-- Name: user_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zoraaver
--

SELECT pg_catalog.setval('public.user_courses_id_seq', 13, true);


--
-- Name: user_lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zoraaver
--

SELECT pg_catalog.setval('public.user_lessons_id_seq', 121, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zoraaver
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: subsections subsections_pkey; Type: CONSTRAINT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.subsections
    ADD CONSTRAINT subsections_pkey PRIMARY KEY (id);


--
-- Name: user_courses user_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.user_courses
    ADD CONSTRAINT user_courses_pkey PRIMARY KEY (id);


--
-- Name: user_lessons user_lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.user_lessons
    ADD CONSTRAINT user_lessons_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: zoraaver
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_lessons_on_sort_id; Type: INDEX; Schema: public; Owner: zoraaver
--

CREATE INDEX index_lessons_on_sort_id ON public.lessons USING btree (sort_id);


--
-- Name: index_sections_on_sort_id; Type: INDEX; Schema: public; Owner: zoraaver
--

CREATE INDEX index_sections_on_sort_id ON public.sections USING btree (sort_id);


--
-- Name: index_subsections_on_sort_id; Type: INDEX; Schema: public; Owner: zoraaver
--

CREATE INDEX index_subsections_on_sort_id ON public.subsections USING btree (sort_id);


--
-- PostgreSQL database dump complete
--

