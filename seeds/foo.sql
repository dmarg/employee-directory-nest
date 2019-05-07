--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: departments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE departments (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE departments_id_seq OWNED BY departments.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE employees (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    age integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE positions (
    id integer NOT NULL,
    employee_id integer,
    department_id integer,
    title character varying,
    historical_index integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE positions_id_seq OWNED BY positions.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posts (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY departments ALTER COLUMN id SET DEFAULT nextval('departments_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Name: positions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY positions ALTER COLUMN id SET DEFAULT nextval('positions_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-07-27 18:41:08.410093	2018-07-27 18:41:08.410093
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY departments (id, name, created_at, updated_at) FROM stdin;
1	Sales	2018-07-27 18:41:08.452595	2018-07-27 18:41:08.452595
2	Management	2018-07-27 18:41:08.454506	2018-07-27 18:41:08.454506
3	Engineering	2018-07-27 18:41:08.456072	2018-07-27 18:41:08.456072
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: -
--

COPY employees (id, first_name, last_name, age, created_at, updated_at) FROM stdin;
1	Eldora	Gusikowski	37	2018-07-27 18:41:08.833231	2018-07-27 18:41:08.833231
2	Jarvis	Botsford	54	2018-07-27 18:41:08.83777	2018-07-27 18:41:08.83777
3	Una	Harber	37	2018-07-27 18:41:08.84225	2018-07-27 18:41:08.84225
4	June	Steuber	63	2018-07-27 18:41:08.846548	2018-07-27 18:41:08.846548
5	Laurence	Huel	59	2018-07-27 18:41:08.850412	2018-07-27 18:41:08.850412
6	Rosella	Keebler	48	2018-07-27 18:41:08.85403	2018-07-27 18:41:08.85403
7	Anahi	Spencer	70	2018-07-27 18:41:08.857351	2018-07-27 18:41:08.857351
8	Katelin	Vandervort	58	2018-07-27 18:41:08.86149	2018-07-27 18:41:08.86149
9	Elian	Frami	51	2018-07-27 18:41:08.86633	2018-07-27 18:41:08.86633
10	Bennie	Aufderhar	62	2018-07-27 18:41:08.870913	2018-07-27 18:41:08.870913
11	Alexane	Schamberger	46	2018-07-27 18:41:08.875027	2018-07-27 18:41:08.875027
12	Alvina	Lehner	35	2018-07-27 18:41:08.879322	2018-07-27 18:41:08.879322
13	Eloise	Boyle	48	2018-07-27 18:41:08.883325	2018-07-27 18:41:08.883325
14	George	Boyle	67	2018-07-27 18:41:08.887005	2018-07-27 18:41:08.887005
15	Berta	Adams	40	2018-07-27 18:41:08.890381	2018-07-27 18:41:08.890381
16	Danika	Yost	80	2018-07-27 18:41:08.894015	2018-07-27 18:41:08.894015
17	Bianka	Hamill	54	2018-07-27 18:41:08.897428	2018-07-27 18:41:08.897428
18	Bobby	Erdman	22	2018-07-27 18:41:08.900912	2018-07-27 18:41:08.900912
19	Alfreda	Harvey	78	2018-07-27 18:41:08.9045	2018-07-27 18:41:08.9045
20	Tristian	Parisian	58	2018-07-27 18:41:08.909239	2018-07-27 18:41:08.909239
21	Mallie	Beatty	28	2018-07-27 18:41:08.913019	2018-07-27 18:41:08.913019
22	Sylvia	Balistreri	56	2018-07-27 18:41:08.916895	2018-07-27 18:41:08.916895
23	Mavis	Kris	55	2018-07-27 18:41:08.920898	2018-07-27 18:41:08.920898
24	Magnus	Hintz	60	2018-07-27 18:41:08.927245	2018-07-27 18:41:08.927245
25	Bernadette	Turner	57	2018-07-27 18:41:08.930776	2018-07-27 18:41:08.930776
26	Chanelle	Lynch	79	2018-07-27 18:41:08.934984	2018-07-27 18:41:08.934984
27	Enoch	Bartell	75	2018-07-27 18:41:08.939112	2018-07-27 18:41:08.939112
28	Edmund	McClure	31	2018-07-27 18:41:08.943436	2018-07-27 18:41:08.943436
29	Arthur	Johnston	59	2018-07-27 18:41:08.946948	2018-07-27 18:41:08.946948
30	Brook	Hayes	54	2018-07-27 18:41:08.950232	2018-07-27 18:41:08.950232
31	Reed	Goyette	55	2018-07-27 18:41:08.953518	2018-07-27 18:41:08.953518
32	Oswaldo	Ortiz	54	2018-07-27 18:41:08.9571	2018-07-27 18:41:08.9571
33	Hollis	Paucek	47	2018-07-27 18:41:08.960859	2018-07-27 18:41:08.960859
34	Weston	Tremblay	59	2018-07-27 18:41:08.965006	2018-07-27 18:41:08.965006
35	Verner	Morissette	34	2018-07-27 18:41:08.969271	2018-07-27 18:41:08.969271
36	Lexie	Mayert	35	2018-07-27 18:41:08.973123	2018-07-27 18:41:08.973123
37	Shirley	Wuckert	60	2018-07-27 18:41:08.976969	2018-07-27 18:41:08.976969
38	Carlo	Batz	71	2018-07-27 18:41:08.980795	2018-07-27 18:41:08.980795
39	Elise	Hegmann	77	2018-07-27 18:41:08.984223	2018-07-27 18:41:08.984223
40	Thelma	Steuber	50	2018-07-27 18:41:08.987541	2018-07-27 18:41:08.987541
41	Dallas	Bogisich	24	2018-07-27 18:41:08.990938	2018-07-27 18:41:08.990938
42	Cordia	Davis	68	2018-07-27 18:41:08.994351	2018-07-27 18:41:08.994351
43	Mustafa	Rice	43	2018-07-27 18:41:08.997972	2018-07-27 18:41:08.997972
44	Schuyler	Strosin	39	2018-07-27 18:41:09.001476	2018-07-27 18:41:09.001476
45	Deborah	Volkman	28	2018-07-27 18:41:09.005745	2018-07-27 18:41:09.005745
46	Marilou	Christiansen	70	2018-07-27 18:41:09.010185	2018-07-27 18:41:09.010185
47	Jenifer	Schimmel	58	2018-07-27 18:41:09.014439	2018-07-27 18:41:09.014439
48	Lucienne	Adams	78	2018-07-27 18:41:09.018098	2018-07-27 18:41:09.018098
49	Iva	Blanda	73	2018-07-27 18:41:09.021423	2018-07-27 18:41:09.021423
50	Herman	Hodkiewicz	42	2018-07-27 18:41:09.02573	2018-07-27 18:41:09.02573
51	Cullen	Cartwright	26	2018-07-27 18:41:09.030216	2018-07-27 18:41:09.030216
52	Bradley	Brekke	53	2018-07-27 18:41:09.035029	2018-07-27 18:41:09.035029
53	Holly	Kling	75	2018-07-27 18:41:09.039315	2018-07-27 18:41:09.039315
54	Jay	Jacobs	67	2018-07-27 18:41:09.044153	2018-07-27 18:41:09.044153
55	Teagan	O'Kon	57	2018-07-27 18:41:09.047488	2018-07-27 18:41:09.047488
56	Jayson	Lemke	50	2018-07-27 18:41:09.050745	2018-07-27 18:41:09.050745
57	Gretchen	Ullrich	33	2018-07-27 18:41:09.05398	2018-07-27 18:41:09.05398
58	Kristian	Marquardt	65	2018-07-27 18:41:09.0574	2018-07-27 18:41:09.0574
59	Loy	McClure	62	2018-07-27 18:41:09.060832	2018-07-27 18:41:09.060832
60	Billy	Bosco	56	2018-07-27 18:41:09.064268	2018-07-27 18:41:09.064268
61	Salma	Wisoky	35	2018-07-27 18:41:09.067723	2018-07-27 18:41:09.067723
62	Rene	Romaguera	40	2018-07-27 18:41:09.070806	2018-07-27 18:41:09.070806
63	Tyshawn	Padberg	66	2018-07-27 18:41:09.073894	2018-07-27 18:41:09.073894
64	Malinda	Fadel	57	2018-07-27 18:41:09.077259	2018-07-27 18:41:09.077259
65	Ola	Schimmel	54	2018-07-27 18:41:09.080624	2018-07-27 18:41:09.080624
66	Lennie	Green	59	2018-07-27 18:41:09.084137	2018-07-27 18:41:09.084137
67	Madelynn	Wiza	53	2018-07-27 18:41:09.087675	2018-07-27 18:41:09.087675
68	Bobby	Murazik	33	2018-07-27 18:41:09.091102	2018-07-27 18:41:09.091102
69	Kole	Pollich	73	2018-07-27 18:41:09.094546	2018-07-27 18:41:09.094546
70	Adrain	Osinski	48	2018-07-27 18:41:09.097864	2018-07-27 18:41:09.097864
71	Leta	Feest	52	2018-07-27 18:41:09.101051	2018-07-27 18:41:09.101051
72	Eunice	Kuhn	49	2018-07-27 18:41:09.1044	2018-07-27 18:41:09.1044
73	Fabiola	Haley	28	2018-07-27 18:41:09.108631	2018-07-27 18:41:09.108631
74	Clay	Roob	44	2018-07-27 18:41:09.11505	2018-07-27 18:41:09.11505
75	Westley	Murphy	37	2018-07-27 18:41:09.119814	2018-07-27 18:41:09.119814
76	Shemar	Bernier	65	2018-07-27 18:41:09.12424	2018-07-27 18:41:09.12424
77	Reece	Walker	20	2018-07-27 18:41:09.128625	2018-07-27 18:41:09.128625
78	Rosendo	Muller	56	2018-07-27 18:41:09.132501	2018-07-27 18:41:09.132501
79	Lessie	Effertz	47	2018-07-27 18:41:09.137185	2018-07-27 18:41:09.137185
80	Myron	Streich	46	2018-07-27 18:41:09.141243	2018-07-27 18:41:09.141243
81	Candido	Kilback	69	2018-07-27 18:41:09.145692	2018-07-27 18:41:09.145692
82	Giovanny	Rosenbaum	36	2018-07-27 18:41:09.149397	2018-07-27 18:41:09.149397
83	Jeramie	DuBuque	47	2018-07-27 18:41:09.152908	2018-07-27 18:41:09.152908
84	Antonio	Rodriguez	76	2018-07-27 18:41:09.157632	2018-07-27 18:41:09.157632
85	Nichole	Walsh	43	2018-07-27 18:41:09.160941	2018-07-27 18:41:09.160941
86	Kieran	Greenholt	76	2018-07-27 18:41:09.164393	2018-07-27 18:41:09.164393
87	Audreanne	Boyle	43	2018-07-27 18:41:09.167553	2018-07-27 18:41:09.167553
88	Clair	Bradtke	42	2018-07-27 18:41:09.172428	2018-07-27 18:41:09.172428
89	Kayden	Schultz	65	2018-07-27 18:41:09.176216	2018-07-27 18:41:09.176216
90	Chadd	Carter	78	2018-07-27 18:41:09.179589	2018-07-27 18:41:09.179589
91	Marques	Huel	66	2018-07-27 18:41:09.18307	2018-07-27 18:41:09.18307
92	Toby	Wunsch	64	2018-07-27 18:41:09.186776	2018-07-27 18:41:09.186776
93	Nikita	Roberts	79	2018-07-27 18:41:09.190088	2018-07-27 18:41:09.190088
94	Kieran	Bahringer	23	2018-07-27 18:41:09.193126	2018-07-27 18:41:09.193126
95	Kip	Lang	49	2018-07-27 18:41:09.196243	2018-07-27 18:41:09.196243
96	Naomie	Blanda	21	2018-07-27 18:41:09.19981	2018-07-27 18:41:09.19981
97	Nicola	O'Connell	39	2018-07-27 18:41:09.203669	2018-07-27 18:41:09.203669
98	Nola	Pfeffer	41	2018-07-27 18:41:09.207015	2018-07-27 18:41:09.207015
99	Issac	Ritchie	38	2018-07-27 18:41:09.210234	2018-07-27 18:41:09.210234
100	Kamryn	Konopelski	34	2018-07-27 18:41:09.213621	2018-07-27 18:41:09.213621
\.


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY positions (id, employee_id, department_id, title, historical_index, created_at, updated_at) FROM stdin;
1	1	3	Design Consultant	1	2018-07-27 18:41:08.834502	2018-07-27 18:41:08.834502
2	1	3	Product Mining Manager	2	2018-07-27 18:41:08.835379	2018-07-27 18:41:08.835379
3	2	3	Marketing Liaison	1	2018-07-27 18:41:08.83867	2018-07-27 18:41:08.83867
4	2	2	Central Planner	2	2018-07-27 18:41:08.839557	2018-07-27 18:41:08.839557
5	3	1	Farming Producer	1	2018-07-27 18:41:08.843258	2018-07-27 18:41:08.843258
6	3	3	Government Engineer	2	2018-07-27 18:41:08.844196	2018-07-27 18:41:08.844196
7	4	2	Manufacturing Analyst	1	2018-07-27 18:41:08.847475	2018-07-27 18:41:08.847475
8	4	2	Banking Orchestrator	2	2018-07-27 18:41:08.848298	2018-07-27 18:41:08.848298
9	5	2	Global Marketing Producer	1	2018-07-27 18:41:08.85118	2018-07-27 18:41:08.85118
10	5	1	District Education Analyst	2	2018-07-27 18:41:08.85197	2018-07-27 18:41:08.85197
11	6	1	District Sales Manager	1	2018-07-27 18:41:08.854819	2018-07-27 18:41:08.854819
12	6	2	Retail Officer	2	2018-07-27 18:41:08.855583	2018-07-27 18:41:08.855583
13	7	3	Dynamic Construction Liaison	1	2018-07-27 18:41:08.858054	2018-07-27 18:41:08.858054
14	7	2	Product Marketing Coordinator	2	2018-07-27 18:41:08.858758	2018-07-27 18:41:08.858758
15	8	2	Technology Supervisor	1	2018-07-27 18:41:08.863129	2018-07-27 18:41:08.863129
16	8	1	Design Liaison	2	2018-07-27 18:41:08.864276	2018-07-27 18:41:08.864276
17	9	2	Product Legal Officer	1	2018-07-27 18:41:08.867149	2018-07-27 18:41:08.867149
18	9	3	International Administration Liaison	2	2018-07-27 18:41:08.867896	2018-07-27 18:41:08.867896
19	10	2	Legacy Consultant	1	2018-07-27 18:41:08.871805	2018-07-27 18:41:08.871805
20	10	2	Design Director	2	2018-07-27 18:41:08.872727	2018-07-27 18:41:08.872727
21	11	1	Regional IT Developer	1	2018-07-27 18:41:08.876157	2018-07-27 18:41:08.876157
22	11	2	International Assistant	2	2018-07-27 18:41:08.877074	2018-07-27 18:41:08.877074
23	12	3	National Education Engineer	1	2018-07-27 18:41:08.880183	2018-07-27 18:41:08.880183
24	12	2	Education Analyst	2	2018-07-27 18:41:08.881113	2018-07-27 18:41:08.881113
25	13	1	Retail Engineer	1	2018-07-27 18:41:08.884168	2018-07-27 18:41:08.884168
26	13	3	Dynamic Liaison	2	2018-07-27 18:41:08.885017	2018-07-27 18:41:08.885017
27	14	3	Government Producer	1	2018-07-27 18:41:08.887781	2018-07-27 18:41:08.887781
28	14	3	District Farming Strategist	2	2018-07-27 18:41:08.888496	2018-07-27 18:41:08.888496
29	15	1	Farming Administrator	1	2018-07-27 18:41:08.891208	2018-07-27 18:41:08.891208
30	15	2	IT Developer	2	2018-07-27 18:41:08.891983	2018-07-27 18:41:08.891983
31	16	3	Retail Strategist	1	2018-07-27 18:41:08.894815	2018-07-27 18:41:08.894815
32	16	1	Legal Liaison	2	2018-07-27 18:41:08.895604	2018-07-27 18:41:08.895604
33	17	3	National Hospitality Director	1	2018-07-27 18:41:08.898135	2018-07-27 18:41:08.898135
34	17	2	Education Administrator	2	2018-07-27 18:41:08.898974	2018-07-27 18:41:08.898974
35	18	1	Product Advertising Administrator	1	2018-07-27 18:41:08.9016	2018-07-27 18:41:08.9016
36	18	3	Technology Assistant	2	2018-07-27 18:41:08.902317	2018-07-27 18:41:08.902317
37	19	3	Chief Administration Liaison	1	2018-07-27 18:41:08.905457	2018-07-27 18:41:08.905457
38	19	3	Forward Officer	2	2018-07-27 18:41:08.906816	2018-07-27 18:41:08.906816
39	20	3	Senior Advertising Liaison	1	2018-07-27 18:41:08.910116	2018-07-27 18:41:08.910116
40	20	2	Marketing Facilitator	2	2018-07-27 18:41:08.910931	2018-07-27 18:41:08.910931
41	21	2	Mining Supervisor	1	2018-07-27 18:41:08.913826	2018-07-27 18:41:08.913826
42	21	3	Dynamic Healthcare Coordinator	2	2018-07-27 18:41:08.914613	2018-07-27 18:41:08.914613
43	22	2	Consulting Planner	1	2018-07-27 18:41:08.917837	2018-07-27 18:41:08.917837
44	22	1	Forward Coordinator	2	2018-07-27 18:41:08.918721	2018-07-27 18:41:08.918721
45	23	3	Sales Planner	1	2018-07-27 18:41:08.921721	2018-07-27 18:41:08.921721
46	23	2	Chief Design Designer	2	2018-07-27 18:41:08.92251	2018-07-27 18:41:08.92251
47	24	3	Senior Sales Specialist	1	2018-07-27 18:41:08.928151	2018-07-27 18:41:08.928151
48	24	2	Real-Estate Strategist	2	2018-07-27 18:41:08.9289	2018-07-27 18:41:08.9289
49	25	1	Dynamic Facilitator	1	2018-07-27 18:41:08.931479	2018-07-27 18:41:08.931479
50	25	3	Legacy Legal Director	2	2018-07-27 18:41:08.93215	2018-07-27 18:41:08.93215
51	26	1	Dynamic Supervisor	1	2018-07-27 18:41:08.935909	2018-07-27 18:41:08.935909
52	26	2	Manufacturing Manager	2	2018-07-27 18:41:08.936821	2018-07-27 18:41:08.936821
53	27	2	District Banking Associate	1	2018-07-27 18:41:08.940149	2018-07-27 18:41:08.940149
54	27	3	Mining Technician	2	2018-07-27 18:41:08.941109	2018-07-27 18:41:08.941109
55	28	1	Advertising Administrator	1	2018-07-27 18:41:08.944296	2018-07-27 18:41:08.944296
56	28	2	Product Marketing Engineer	2	2018-07-27 18:41:08.945073	2018-07-27 18:41:08.945073
57	29	1	Advertising Facilitator	1	2018-07-27 18:41:08.947664	2018-07-27 18:41:08.947664
58	29	1	International Designer	2	2018-07-27 18:41:08.948382	2018-07-27 18:41:08.948382
59	30	1	Regional Specialist	1	2018-07-27 18:41:08.950926	2018-07-27 18:41:08.950926
60	30	2	Product Advertising Facilitator	2	2018-07-27 18:41:08.95161	2018-07-27 18:41:08.95161
61	31	2	Investor Real-Estate Facilitator	1	2018-07-27 18:41:08.954265	2018-07-27 18:41:08.954265
62	31	2	Central Hospitality Coordinator	2	2018-07-27 18:41:08.955055	2018-07-27 18:41:08.955055
63	32	3	Customer Hospitality Producer	1	2018-07-27 18:41:08.957953	2018-07-27 18:41:08.957953
64	32	1	Construction Consultant	2	2018-07-27 18:41:08.958712	2018-07-27 18:41:08.958712
65	33	1	Internal Marketing Assistant	1	2018-07-27 18:41:08.961807	2018-07-27 18:41:08.961807
66	33	1	Manufacturing Manager	2	2018-07-27 18:41:08.962725	2018-07-27 18:41:08.962725
67	34	3	Banking Officer	1	2018-07-27 18:41:08.966056	2018-07-27 18:41:08.966056
68	34	3	Mining Technician	2	2018-07-27 18:41:08.966938	2018-07-27 18:41:08.966938
69	35	1	Design Engineer	1	2018-07-27 18:41:08.970223	2018-07-27 18:41:08.970223
70	35	1	Hospitality Producer	2	2018-07-27 18:41:08.971091	2018-07-27 18:41:08.971091
71	36	3	Global Community-Services Consultant	1	2018-07-27 18:41:08.973983	2018-07-27 18:41:08.973983
72	36	3	Legacy Director	2	2018-07-27 18:41:08.974757	2018-07-27 18:41:08.974757
73	37	3	Legacy Planner	1	2018-07-27 18:41:08.977883	2018-07-27 18:41:08.977883
74	37	2	Customer Retail Officer	2	2018-07-27 18:41:08.978756	2018-07-27 18:41:08.978756
75	38	2	Lead Officer	1	2018-07-27 18:41:08.981606	2018-07-27 18:41:08.981606
76	38	3	Central Director	2	2018-07-27 18:41:08.982366	2018-07-27 18:41:08.982366
77	39	2	Global Marketing Director	1	2018-07-27 18:41:08.984973	2018-07-27 18:41:08.984973
78	39	2	Lead Accounting Director	2	2018-07-27 18:41:08.985678	2018-07-27 18:41:08.985678
79	40	1	Central Banking Associate	1	2018-07-27 18:41:08.988246	2018-07-27 18:41:08.988246
80	40	2	Healthcare Consultant	2	2018-07-27 18:41:08.988984	2018-07-27 18:41:08.988984
81	41	3	District Executive	1	2018-07-27 18:41:08.991667	2018-07-27 18:41:08.991667
82	41	2	Senior Agent	2	2018-07-27 18:41:08.99236	2018-07-27 18:41:08.99236
83	42	3	Legacy Hospitality Technician	1	2018-07-27 18:41:08.995213	2018-07-27 18:41:08.995213
84	42	3	Chief Orchestrator	2	2018-07-27 18:41:08.996013	2018-07-27 18:41:08.996013
85	43	3	Government Technician	1	2018-07-27 18:41:08.998822	2018-07-27 18:41:08.998822
86	43	1	IT Officer	2	2018-07-27 18:41:08.999618	2018-07-27 18:41:08.999618
87	44	1	Retail Manager	1	2018-07-27 18:41:09.002171	2018-07-27 18:41:09.002171
88	44	2	Product Retail Strategist	2	2018-07-27 18:41:09.002879	2018-07-27 18:41:09.002879
89	45	2	District Administration Designer	1	2018-07-27 18:41:09.007016	2018-07-27 18:41:09.007016
90	45	3	Construction Developer	2	2018-07-27 18:41:09.007927	2018-07-27 18:41:09.007927
91	46	1	Advertising Orchestrator	1	2018-07-27 18:41:09.011005	2018-07-27 18:41:09.011005
92	46	1	Education Administrator	2	2018-07-27 18:41:09.011794	2018-07-27 18:41:09.011794
93	47	3	Lead Banking Engineer	1	2018-07-27 18:41:09.015278	2018-07-27 18:41:09.015278
94	47	3	International Community-Services Administrator	2	2018-07-27 18:41:09.016128	2018-07-27 18:41:09.016128
95	48	2	Regional Specialist	1	2018-07-27 18:41:09.01881	2018-07-27 18:41:09.01881
96	48	2	National Assistant	2	2018-07-27 18:41:09.019495	2018-07-27 18:41:09.019495
97	49	2	Senior Administration Planner	1	2018-07-27 18:41:09.022115	2018-07-27 18:41:09.022115
98	49	2	Real-Estate Facilitator	2	2018-07-27 18:41:09.02278	2018-07-27 18:41:09.02278
99	50	1	Healthcare Director	1	2018-07-27 18:41:09.027016	2018-07-27 18:41:09.027016
100	50	1	Senior Marketing Liaison	2	2018-07-27 18:41:09.027944	2018-07-27 18:41:09.027944
101	51	2	Design Executive	1	2018-07-27 18:41:09.03115	2018-07-27 18:41:09.03115
102	51	3	Senior Healthcare Technician	2	2018-07-27 18:41:09.031993	2018-07-27 18:41:09.031993
103	52	1	Global Healthcare Associate	1	2018-07-27 18:41:09.035977	2018-07-27 18:41:09.035977
104	52	1	Administration Supervisor	2	2018-07-27 18:41:09.036917	2018-07-27 18:41:09.036917
105	53	2	Internal Marketing Coordinator	1	2018-07-27 18:41:09.040149	2018-07-27 18:41:09.040149
106	53	1	Healthcare Architect	2	2018-07-27 18:41:09.04147	2018-07-27 18:41:09.04147
107	54	2	Manufacturing Designer	1	2018-07-27 18:41:09.044908	2018-07-27 18:41:09.044908
108	54	1	Product Architect	2	2018-07-27 18:41:09.045672	2018-07-27 18:41:09.045672
109	55	1	Sales Analyst	1	2018-07-27 18:41:09.04821	2018-07-27 18:41:09.04821
110	55	1	Legacy Producer	2	2018-07-27 18:41:09.048899	2018-07-27 18:41:09.048899
111	56	1	Global Strategist	1	2018-07-27 18:41:09.051463	2018-07-27 18:41:09.051463
112	56	2	Community-Services Officer	2	2018-07-27 18:41:09.052178	2018-07-27 18:41:09.052178
113	57	1	Construction Consultant	1	2018-07-27 18:41:09.054681	2018-07-27 18:41:09.054681
114	57	3	District Technology Assistant	2	2018-07-27 18:41:09.055364	2018-07-27 18:41:09.055364
115	58	1	Manufacturing Director	1	2018-07-27 18:41:09.058134	2018-07-27 18:41:09.058134
116	58	2	Regional Retail Supervisor	2	2018-07-27 18:41:09.0589	2018-07-27 18:41:09.0589
117	59	3	Internal Technology Analyst	1	2018-07-27 18:41:09.061621	2018-07-27 18:41:09.061621
118	59	1	District IT Officer	2	2018-07-27 18:41:09.062341	2018-07-27 18:41:09.062341
119	60	1	Internal Producer	1	2018-07-27 18:41:09.065086	2018-07-27 18:41:09.065086
120	60	3	Customer Director	2	2018-07-27 18:41:09.065922	2018-07-27 18:41:09.065922
121	61	2	National Farming Manager	1	2018-07-27 18:41:09.068432	2018-07-27 18:41:09.068432
122	61	1	Chief Healthcare Assistant	2	2018-07-27 18:41:09.069109	2018-07-27 18:41:09.069109
123	62	3	International Executive	1	2018-07-27 18:41:09.071516	2018-07-27 18:41:09.071516
124	62	3	Hospitality Technician	2	2018-07-27 18:41:09.072201	2018-07-27 18:41:09.072201
125	63	1	Healthcare Administrator	1	2018-07-27 18:41:09.07456	2018-07-27 18:41:09.07456
126	63	1	Design Representative	2	2018-07-27 18:41:09.075272	2018-07-27 18:41:09.075272
127	64	3	Marketing Consultant	1	2018-07-27 18:41:09.07802	2018-07-27 18:41:09.07802
128	64	2	District Manufacturing Engineer	2	2018-07-27 18:41:09.078785	2018-07-27 18:41:09.078785
129	65	3	District Sales Liaison	1	2018-07-27 18:41:09.081376	2018-07-27 18:41:09.081376
130	65	3	District Healthcare Liaison	2	2018-07-27 18:41:09.082205	2018-07-27 18:41:09.082205
131	66	1	Regional Engineer	1	2018-07-27 18:41:09.084988	2018-07-27 18:41:09.084988
132	66	2	Investor Mining Associate	2	2018-07-27 18:41:09.085716	2018-07-27 18:41:09.085716
133	67	2	Sales Strategist	1	2018-07-27 18:41:09.088497	2018-07-27 18:41:09.088497
134	67	1	Customer Technician	2	2018-07-27 18:41:09.08924	2018-07-27 18:41:09.08924
135	68	1	Consulting Planner	1	2018-07-27 18:41:09.091943	2018-07-27 18:41:09.091943
136	68	1	Dynamic Banking Director	2	2018-07-27 18:41:09.092647	2018-07-27 18:41:09.092647
137	69	1	Forward Strategist	1	2018-07-27 18:41:09.095254	2018-07-27 18:41:09.095254
138	69	2	Product Government Manager	2	2018-07-27 18:41:09.095979	2018-07-27 18:41:09.095979
139	70	2	Customer Government Analyst	1	2018-07-27 18:41:09.098571	2018-07-27 18:41:09.098571
140	70	1	Construction Manager	2	2018-07-27 18:41:09.099297	2018-07-27 18:41:09.099297
141	71	3	Central Engineer	1	2018-07-27 18:41:09.101763	2018-07-27 18:41:09.101763
142	71	1	Marketing Executive	2	2018-07-27 18:41:09.102468	2018-07-27 18:41:09.102468
143	72	1	Marketing Executive	1	2018-07-27 18:41:09.105162	2018-07-27 18:41:09.105162
144	72	3	Healthcare Developer	2	2018-07-27 18:41:09.105879	2018-07-27 18:41:09.105879
145	73	2	Marketing Developer	1	2018-07-27 18:41:09.110224	2018-07-27 18:41:09.110224
146	73	1	Advertising Architect	2	2018-07-27 18:41:09.11137	2018-07-27 18:41:09.11137
147	74	2	Customer Retail Manager	1	2018-07-27 18:41:09.11651	2018-07-27 18:41:09.11651
148	74	1	National Administration Designer	2	2018-07-27 18:41:09.11747	2018-07-27 18:41:09.11747
149	75	3	Forward Community-Services Manager	1	2018-07-27 18:41:09.120695	2018-07-27 18:41:09.120695
150	75	3	National Government Architect	2	2018-07-27 18:41:09.121544	2018-07-27 18:41:09.121544
151	76	1	Real-Estate Developer	1	2018-07-27 18:41:09.125286	2018-07-27 18:41:09.125286
152	76	1	Administration Architect	2	2018-07-27 18:41:09.126243	2018-07-27 18:41:09.126243
153	77	2	Senior Healthcare Agent	1	2018-07-27 18:41:09.129551	2018-07-27 18:41:09.129551
154	77	3	Product Accounting Facilitator	2	2018-07-27 18:41:09.130406	2018-07-27 18:41:09.130406
155	78	2	Real-Estate Agent	1	2018-07-27 18:41:09.13331	2018-07-27 18:41:09.13331
156	78	3	Hospitality Engineer	2	2018-07-27 18:41:09.134071	2018-07-27 18:41:09.134071
157	79	3	National Sales Engineer	1	2018-07-27 18:41:09.137992	2018-07-27 18:41:09.137992
158	79	3	Regional Government Administrator	2	2018-07-27 18:41:09.138924	2018-07-27 18:41:09.138924
159	80	3	Chief Engineer	1	2018-07-27 18:41:09.142178	2018-07-27 18:41:09.142178
160	80	1	Education Consultant	2	2018-07-27 18:41:09.143172	2018-07-27 18:41:09.143172
161	81	2	International Education Liaison	1	2018-07-27 18:41:09.146588	2018-07-27 18:41:09.146588
162	81	1	Regional Government Engineer	2	2018-07-27 18:41:09.147455	2018-07-27 18:41:09.147455
163	82	2	Lead Planner	1	2018-07-27 18:41:09.15022	2018-07-27 18:41:09.15022
164	82	2	Administration Engineer	2	2018-07-27 18:41:09.150993	2018-07-27 18:41:09.150993
165	83	3	Global Accounting Director	1	2018-07-27 18:41:09.153638	2018-07-27 18:41:09.153638
166	83	2	District Sales Representative	2	2018-07-27 18:41:09.155738	2018-07-27 18:41:09.155738
167	84	2	Legacy Hospitality Strategist	1	2018-07-27 18:41:09.158355	2018-07-27 18:41:09.158355
168	84	1	Government Officer	2	2018-07-27 18:41:09.159057	2018-07-27 18:41:09.159057
169	85	1	Sales Coordinator	1	2018-07-27 18:41:09.161773	2018-07-27 18:41:09.161773
170	85	2	Lead Construction Consultant	2	2018-07-27 18:41:09.162477	2018-07-27 18:41:09.162477
171	86	3	Central Associate	1	2018-07-27 18:41:09.165123	2018-07-27 18:41:09.165123
172	86	3	Regional Specialist	2	2018-07-27 18:41:09.165806	2018-07-27 18:41:09.165806
173	87	1	Internal Retail Representative	1	2018-07-27 18:41:09.16825	2018-07-27 18:41:09.16825
174	87	1	Global Healthcare Analyst	2	2018-07-27 18:41:09.169481	2018-07-27 18:41:09.169481
175	88	1	Lead Accounting Supervisor	1	2018-07-27 18:41:09.173323	2018-07-27 18:41:09.173323
176	88	1	International Consulting Manager	2	2018-07-27 18:41:09.174134	2018-07-27 18:41:09.174134
177	89	1	Internal Real-Estate Supervisor	1	2018-07-27 18:41:09.177013	2018-07-27 18:41:09.177013
178	89	1	National Associate	2	2018-07-27 18:41:09.177757	2018-07-27 18:41:09.177757
179	90	2	Consulting Consultant	1	2018-07-27 18:41:09.18033	2018-07-27 18:41:09.18033
180	90	3	Legacy Designer	2	2018-07-27 18:41:09.181042	2018-07-27 18:41:09.181042
181	91	1	Marketing Engineer	1	2018-07-27 18:41:09.183843	2018-07-27 18:41:09.183843
182	91	2	Consulting Strategist	2	2018-07-27 18:41:09.184732	2018-07-27 18:41:09.184732
183	92	2	National Manufacturing Administrator	1	2018-07-27 18:41:09.187573	2018-07-27 18:41:09.187573
184	92	3	Retail Strategist	2	2018-07-27 18:41:09.188288	2018-07-27 18:41:09.188288
185	93	2	Product Sales Specialist	1	2018-07-27 18:41:09.190794	2018-07-27 18:41:09.190794
186	93	3	Sales Analyst	2	2018-07-27 18:41:09.191449	2018-07-27 18:41:09.191449
187	94	1	Chief Farming Director	1	2018-07-27 18:41:09.193813	2018-07-27 18:41:09.193813
188	94	3	Farming Producer	2	2018-07-27 18:41:09.194481	2018-07-27 18:41:09.194481
189	95	2	Real-Estate Administrator	1	2018-07-27 18:41:09.196955	2018-07-27 18:41:09.196955
190	95	3	Marketing Administrator	2	2018-07-27 18:41:09.19774	2018-07-27 18:41:09.19774
191	96	3	Consulting Director	1	2018-07-27 18:41:09.200734	2018-07-27 18:41:09.200734
192	96	1	Forward Sales Executive	2	2018-07-27 18:41:09.201587	2018-07-27 18:41:09.201587
193	97	1	Forward Manufacturing Architect	1	2018-07-27 18:41:09.204438	2018-07-27 18:41:09.204438
194	97	3	Investor Officer	2	2018-07-27 18:41:09.205181	2018-07-27 18:41:09.205181
195	98	3	Product Accounting Director	1	2018-07-27 18:41:09.20772	2018-07-27 18:41:09.20772
196	98	1	Dynamic Coordinator	2	2018-07-27 18:41:09.208414	2018-07-27 18:41:09.208414
197	99	3	Investor Community-Services Analyst	1	2018-07-27 18:41:09.210944	2018-07-27 18:41:09.210944
198	99	2	Dynamic Education Developer	2	2018-07-27 18:41:09.211662	2018-07-27 18:41:09.211662
199	100	3	Marketing Agent	1	2018-07-27 18:41:09.214518	2018-07-27 18:41:09.214518
200	100	3	Consulting Manager	2	2018-07-27 18:41:09.21525	2018-07-27 18:41:09.21525
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posts (id, title, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY schema_migrations (version) FROM stdin;
20170401132210
20170402200906
20170402202841
20180727184626
\.


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('departments_id_seq', 3, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('employees_id_seq', 100, true);


--
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('positions_id_seq', 200, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('posts_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_positions_on_department_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_positions_on_department_id ON positions USING btree (department_id);


--
-- Name: index_positions_on_employee_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_positions_on_employee_id ON positions USING btree (employee_id);


--
-- PostgreSQL database dump complete
--

