--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6 (Ubuntu 10.6-0ubuntu0.18.10.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
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
-- Name: county; Type: TABLE; Schema: public; Owner: carnet
--

CREATE TABLE public.county (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.county OWNER TO carnet;

--
-- Name: county_id_seq; Type: SEQUENCE; Schema: public; Owner: carnet
--

CREATE SEQUENCE public.county_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.county_id_seq OWNER TO carnet;

--
-- Name: county_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carnet
--

ALTER SEQUENCE public.county_id_seq OWNED BY public.county.id;


--
-- Name: municipality; Type: TABLE; Schema: public; Owner: carnet
--

CREATE TABLE public.municipality (
    id integer NOT NULL,
    name character varying,
    city boolean,
    county_id integer
);


ALTER TABLE public.municipality OWNER TO carnet;

--
-- Name: municipality_id_seq; Type: SEQUENCE; Schema: public; Owner: carnet
--

CREATE SEQUENCE public.municipality_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipality_id_seq OWNER TO carnet;

--
-- Name: municipality_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carnet
--

ALTER SEQUENCE public.municipality_id_seq OWNED BY public.municipality.id;


--
-- Name: settlement; Type: TABLE; Schema: public; Owner: carnet
--

CREATE TABLE public.settlement (
    id integer NOT NULL,
    name character varying,
    post_number integer,
    municipality_id integer
);


ALTER TABLE public.settlement OWNER TO carnet;

--
-- Name: settlement_id_seq; Type: SEQUENCE; Schema: public; Owner: carnet
--

CREATE SEQUENCE public.settlement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settlement_id_seq OWNER TO carnet;

--
-- Name: settlement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carnet
--

ALTER SEQUENCE public.settlement_id_seq OWNED BY public.settlement.id;


--
-- Name: county id; Type: DEFAULT; Schema: public; Owner: carnet
--

ALTER TABLE ONLY public.county ALTER COLUMN id SET DEFAULT nextval('public.county_id_seq'::regclass);


--
-- Name: municipality id; Type: DEFAULT; Schema: public; Owner: carnet
--

ALTER TABLE ONLY public.municipality ALTER COLUMN id SET DEFAULT nextval('public.municipality_id_seq'::regclass);


--
-- Name: settlement id; Type: DEFAULT; Schema: public; Owner: carnet
--

ALTER TABLE ONLY public.settlement ALTER COLUMN id SET DEFAULT nextval('public.settlement_id_seq'::regclass);


--
-- Data for Name: county; Type: TABLE DATA; Schema: public; Owner: carnet
--

COPY public.county (id, name) FROM stdin;
1	Zagrebačka županija
2	Krapinsko-zagorska županija
3	Sisačko-moslavačka županija
4	Karlovačka županija
5	Varaždinska županija
6	Koprivničko-križevačka županija
7	Bjelovarsko-bilogorska županija
8	Primorsko-goranska županija
9	Ličko-senjska županija
10	Virovitičko-podravska županija
11	Požeško-slavonska županija
12	Brodsko-posavska županija
13	Zadarska županija
14	Osječko-baranjska županija
15	Šibensko-kninska županija
16	Vukovarsko-srijemska županija
17	Splitsko-dalmatinska županija
18	Istarska županija
19	Dubrovačko-neretvanska županija
20	Međimurska županija
21	Grad Zagreb
\.


--
-- Data for Name: municipality; Type: TABLE DATA; Schema: public; Owner: carnet
--

COPY public.municipality (id, name, city, county_id) FROM stdin;
1	Dugo Selo	t	1
2	Ivanić-Grad	t	1
3	Jastrebarsko	t	1
4	Samobor	t	1
5	Sveta Nedelja	t	1
6	Sveti Ivan Zelina	t	1
7	Velika Gorica	t	1
8	Vrbovec	t	1
9	Zaprešić	t	1
10	Bedenica	f	1
11	Bistra	f	1
12	Brckovljani	f	1
13	Brdovec	f	1
14	Dubrava	f	1
15	Dubravica	f	1
16	Farkaševac	f	1
17	Gradec	f	1
18	Jakovlje	f	1
19	Klinča Sela	f	1
20	Kloštar Ivanić	f	1
21	Krašić	f	1
22	Kravarsko	f	1
23	Križ	f	1
24	Luka	f	1
25	Marija Gorica	f	1
26	Orle	f	1
27	Pisarovina	f	1
28	Pokupsko	f	1
29	Preseka	f	1
30	Pušća	f	1
31	Rakovec	f	1
32	Rugvica	f	1
33	Stupnik	f	1
34	Žumberak	f	1
35	Donja Stubica	t	2
36	Klanjec	t	2
37	Krapina	t	2
38	Oroslavje	t	2
39	Pregrada	t	2
40	Zabok	t	2
41	Zlatar	t	2
42	Bedekovčina	f	2
43	Budinščina	f	2
44	Desinić	f	2
45	Đurmanec	f	2
46	Gornja Stubica	f	2
47	Hrašćina	f	2
48	Hum na Sutli	f	2
49	Jesenje	f	2
50	Konjščina	f	2
51	Kraljevec na Sutli	f	2
52	Krapinske Toplice	f	2
53	Kumrovec	f	2
54	Lobor	f	2
55	Mače	f	2
56	Marija Bistrica	f	2
57	Mihovljan	f	2
58	Novi Golubovec	f	2
59	Petrovsko	f	2
60	Radoboj	f	2
61	Stubičke Toplice	f	2
62	Sveti Križ Začretje	f	2
63	Tuhelj	f	2
64	Veliko Trgovišće	f	2
65	Zagorska Sela	f	2
66	Zlatar Bistrica	f	2
67	Glina	t	3
68	Hrvatska Kostajnica	t	3
69	Kutina	t	3
70	Novska	t	3
71	Petrinja	t	3
72	Sisak	t	3
73	Donji Kukuruzari	f	3
74	Dvor	f	3
75	Gvozd	f	3
76	Hrvatska Dubica	f	3
77	Jasenovac	f	3
78	Lekenik	f	3
79	Lipovljani	f	3
80	Majur	f	3
81	Martinska Ves	f	3
82	Sunja	f	3
83	Topusko	f	3
84	Velika Ludina	f	3
85	Popovača	t	3
86	Duga Resa	t	4
87	Karlovac	t	4
88	Ogulin	t	4
89	Ozalj	t	4
90	Slunj	t	4
91	Barilović	f	4
92	Bosiljevo	f	4
93	Cetingrad	f	4
94	Draganić	f	4
95	Generalski Stol	f	4
96	Josipdol	f	4
97	Kamanje	f	4
98	Krnjak	f	4
99	Lasinja	f	4
100	Netretić	f	4
101	Plaški	f	4
102	Rakovica	f	4
103	Ribnik	f	4
104	Saborsko	f	4
105	Tounj	f	4
106	Vojnić	f	4
107	Žakanje	f	4
108	Ivanec	t	5
109	Lepoglava	t	5
110	Ludbreg	t	5
111	Novi Marof	t	5
112	Varaždin	t	5
113	Varaždinske Toplice	t	5
114	Bednja	f	5
115	Beretinec	f	5
116	Breznica	f	5
117	Breznički Hum	f	5
118	Cestica	f	5
119	Donja Voća	f	5
120	Gornji Kneginec	f	5
121	Jalžabet	f	5
122	Klenovnik	f	5
123	Ljubešćica	f	5
124	Mali Bukovec	f	5
125	Martijanec	f	5
126	Maruševec	f	5
127	Petrijanec	f	5
128	Sračinec	f	5
129	Sveti Đurđ	f	5
130	Sveti Ilija	f	5
131	Trnovec Bartolovečki	f	5
132	Veliki Bukovec	f	5
133	Vidovec	f	5
134	Vinica	f	5
135	Visoko	f	5
136	Đurđevac	t	6
137	Koprivnica	t	6
138	Križevci	t	6
139	Drnje	f	6
140	Đelekovec	f	6
141	Ferdinandovac	f	6
142	Gola	f	6
143	Gornja Rijeka	f	6
144	Hlebine	f	6
145	Kalinovac	f	6
146	Kalnik	f	6
147	Kloštar Podravski	f	6
148	Koprivnički Bregi	f	6
149	Koprivnički Ivanec	f	6
150	Legrad	f	6
151	Molve	f	6
152	Novigrad Podravski	f	6
153	Novo Virje	f	6
154	Peteranec	f	6
155	Podravske Sesvete	f	6
156	Rasinja	f	6
157	Sokolovac	f	6
158	Sveti Ivan Žabno	f	6
159	Sveti Petar Orehovec	f	6
160	Virje	f	6
161	Bjelovar	t	7
162	Čazma	t	7
163	Daruvar	t	7
164	Garešnica	t	7
165	Grubišno Polje	t	7
166	Berek	f	7
167	Dežanovac	f	7
168	Đulovac	f	7
169	Hercegovac	f	7
170	Ivanska	f	7
171	Kapela	f	7
172	Končanica	f	7
173	Nova Rača	f	7
174	Rovišće	f	7
175	Severin	f	7
176	Sirač	f	7
177	Šandrovac	f	7
178	Štefanje	f	7
179	Velika Pisanica	f	7
180	Velika Trnovitica	f	7
181	Veliki Grđevac	f	7
182	Veliko Trojstvo	f	7
183	Zrinski Topolovac	f	7
184	Bakar	t	8
185	Cres	t	8
186	Crikvenica	t	8
187	Čabar	t	8
188	Delnice	t	8
189	Kastav	t	8
190	Kraljevica	t	8
191	Krk	t	8
192	Mali Lošinj	t	8
193	Novi Vinodolski	t	8
194	Opatija	t	8
195	Rab	t	8
196	Rijeka	t	8
197	Vrbovsko	t	8
198	Baška	f	8
199	Brod Moravice	f	8
200	Čavle	f	8
201	Dobrinj	f	8
202	Fužine	f	8
203	Jelenje	f	8
204	Klana	f	8
205	Kostrena	f	8
206	Lokve	f	8
207	Lopar	f	8
208	Lovran	f	8
209	Malinska – Dubašnica	f	8
210	Matulji	f	8
211	Mošćenička Draga	f	8
212	Mrkopalj	f	8
213	Omišalj	f	8
214	Punat	f	8
215	Ravna Gora	f	8
216	Skrad	f	8
217	Vinodolska općina	f	8
218	Viškovo	f	8
219	Vrbnik	f	8
220	Gospić	t	9
221	Novalja	t	9
222	Otočac	t	9
223	Senj	t	9
224	Brinje	f	9
225	Donji Lapac	f	9
226	Karlobag	f	9
227	Lovinac	f	9
228	Perušić	f	9
229	Plitvička jezera	f	9
230	Udbina	f	9
231	Vrhovine	f	9
232	Orahovica	t	10
233	Slatina	t	10
234	Virovitica	t	10
235	Crnac	f	10
236	Čačinci	f	10
237	Čađavica	f	10
238	Gradina	f	10
239	Lukač	f	10
240	Mikleuš	f	10
241	Nova Bukovica	f	10
242	Pitomača	f	10
243	Sopje	f	10
244	Suhopolje	f	10
245	Špišić Bukovica	f	10
246	Voćin	f	10
247	Zdenci	f	10
248	Kutjevo	t	11
249	Lipik	t	11
250	Pakrac	t	11
251	Pleternica	t	11
252	Požega	t	11
253	Brestovac	f	11
254	Čaglin	f	11
255	Jakšić	f	11
256	Kaptol	f	11
257	Velika	f	11
258	Nova Gradiška	t	12
259	Slavonski Brod	t	12
260	Bebrina	f	12
261	Brodski Stupnik	f	12
262	Bukovlje	f	12
263	Cernik	f	12
264	Davor	f	12
265	Donji Andrijevci	f	12
266	Dragalić	f	12
267	Garčin	f	12
268	Gornja Vrba	f	12
269	Gornji Bogićevci	f	12
270	Gundinci	f	12
271	Klakar	f	12
272	Nova Kapela	f	12
273	Okučani	f	12
274	Oprisavci	f	12
275	Oriovac	f	12
276	Podcrkavlje	f	12
277	Rešetari	f	12
278	Sibinj	f	12
279	Sikirevci	f	12
280	Slavonski Šamac	f	12
281	Stara Gradiška	f	12
282	Staro Petrovo Selo	f	12
283	Velika Kopanica	f	12
284	Vrbje	f	12
285	Vrpolje	f	12
286	Benkovac	t	13
287	Biograd na Moru	t	13
288	Nin	t	13
289	Obrovac	t	13
290	Pag	t	13
291	Zadar	t	13
292	Bibinje	f	13
293	Galovac	f	13
294	Gračac	f	13
295	Jasenice	f	13
296	Kali	f	13
297	Kolan	f	13
298	Kukljica	f	13
299	Lišane Ostrovičke	f	13
300	Novigrad	f	13
301	Pakoštane	f	13
302	Pašman	f	13
303	Polača	f	13
304	Poličnik	f	13
305	Posedarje	f	13
306	Povljana	f	13
307	Preko	f	13
308	Privlaka	f	13
309	Ražanac	f	13
310	Sali	f	13
311	Stankovci	f	13
312	Starigrad	f	13
313	Sukošan	f	13
314	Sveti Filip i Jakov	f	13
315	Škabrnja	f	13
316	Tkon	f	13
317	Vir	f	13
318	Vrsi	f	13
319	Zemunik Donji	f	13
320	Beli Manastir	t	14
321	Belišće	t	14
322	Donji Miholjac	t	14
323	Đakovo	t	14
324	Našice	t	14
325	Osijek	t	14
326	Valpovo	t	14
327	Antunovac	f	14
328	Bilje	f	14
329	Bizovac	f	14
330	Čeminac	f	14
331	Čepin	f	14
332	Darda	f	14
333	Donja Motičina	f	14
334	Draž	f	14
335	Drenje	f	14
336	Đurđenovac	f	14
337	Erdut	f	14
338	Ernestinovo	f	14
339	Feričanci	f	14
340	Gorjani	f	14
341	Jagodnjak	f	14
342	Kneževi Vinogradi	f	14
343	Koška	f	14
344	Levanjska Varoš	f	14
345	Magadenovac	f	14
346	Marijanci	f	14
347	Petlovac	f	14
348	Petrijevci	f	14
349	Podgorač	f	14
350	Podravska Moslavina	f	14
351	Popovac	f	14
352	Punitovci	f	14
353	Satnica Đakovačka	f	14
354	Semeljci	f	14
355	Strizivojna	f	14
356	Šodolovci	f	14
357	Trnava	f	14
358	Viljevo	f	14
359	Viškovci	f	14
360	Vladislavci	f	14
361	Vuka	f	14
362	Drniš	t	15
363	Knin	t	15
364	Skradin	t	15
365	Šibenik	t	15
366	Vodice	t	15
367	Bilice	f	15
368	Biskupija	f	15
369	Civljane	f	15
370	Ervenik	f	15
371	Kijevo	f	15
372	Kistanje	f	15
373	Murter – Kornati	f	15
374	Pirovac	f	15
375	Primošten	f	15
376	Promina	f	15
377	Rogoznica	f	15
378	Ružić	f	15
379	Tisno	f	15
380	Tribunj	f	15
381	Unešić	f	15
382	Ilok	t	16
383	Otok	t	16
384	Vinkovci	t	16
385	Vukovar	t	16
386	Županja	t	16
387	Andrijaševci	f	16
388	Babina Greda	f	16
389	Bogdanovci	f	16
390	Borovo	f	16
391	Bošnjaci	f	16
392	Cerna	f	16
393	Drenovci	f	16
394	Gradište	f	16
395	Gunja	f	16
396	Ivankovo	f	16
397	Jarmina	f	16
398	Lovas	f	16
399	Markušica	f	16
400	Negoslavci	f	16
401	Nijemci	f	16
402	Nuštar	f	16
403	Privlaka	f	16
404	Stari Jankovci	f	16
405	Stari Mikanovci	f	16
406	Štitar	f	16
407	Tompojevci	f	16
408	Tordinci	f	16
409	Tovarnik	f	16
410	Trpinja	f	16
411	Vođinci	f	16
412	Vrbanja	f	16
413	Hvar	t	17
414	Imotski	t	17
415	Kaštela	t	17
416	Komiža	t	17
417	Makarska	t	17
418	Omiš	t	17
419	Sinj	t	17
420	Solin	t	17
421	Split	t	17
422	Stari Grad	t	17
423	Supetar	t	17
424	Trilj	t	17
425	Trogir	t	17
426	Vis	t	17
427	Vrgorac	t	17
428	Vrlika	t	17
429	Baška Voda	f	17
430	Bol	f	17
431	Brela	f	17
432	Cista Provo	f	17
433	Dicmo	f	17
434	Dugi Rat	f	17
435	Dugopolje	f	17
436	Gradac	f	17
437	Hrvace	f	17
438	Jelsa	f	17
439	Klis	f	17
440	Lećevica	f	17
441	Lokvičići	f	17
442	Lovreć	f	17
443	Marina	f	17
444	Milna	f	17
445	Muć	f	17
446	Nerežišća	f	17
447	Okrug	f	17
448	Otok	f	17
449	Podbablje	f	17
450	Podgora	f	17
451	Podstrana	f	17
452	Postira	f	17
453	Prgomet	f	17
454	Primorski Dolac	f	17
455	Proložac	f	17
456	Pučišća	f	17
457	Runovići	f	17
458	Seget	f	17
459	Selca	f	17
460	Sućuraj	f	17
461	Sutivan	f	17
462	Šestanovac	f	17
463	Šolta	f	17
464	Tučepi	f	17
465	Zadvarje	f	17
466	Zagvozd	f	17
467	Zmijavci	f	17
468	Buje – Buie	t	18
469	Buzet	t	18
470	Labin	t	18
471	Novigrad – Cittanova	t	18
472	Pazin	t	18
473	Poreč – Parenzo	t	18
474	Pula – Pola	t	18
475	Rovinj – Rovigno	t	18
476	Umag – Umago	t	18
477	Vodnjan – Dignano	t	18
478	Bale – Valle	f	18
479	Barban	f	18
480	Brtonigla – Verteneglio	f	18
481	Cerovlje	f	18
482	Fažana – Fasana	f	18
483	Funtana – Fontane	f	18
484	Gračišće	f	18
485	Grožnjan – Grisignana	f	18
486	Kanfanar	f	18
487	Karojba	f	18
488	Kaštelir – Labinci – Castelliere-S. Domenica	f	18
489	Kršan	f	18
490	Lanišće	f	18
491	Ližnjan – Lisignano	f	18
492	Lupoglav	f	18
493	Marčana	f	18
494	Medulin	f	18
495	Motovun – Montona	f	18
496	Oprtalj – Portole	f	18
497	Pićan	f	18
498	Raša	f	18
499	Sveta Nedelja	f	18
500	Sveti Lovreč	f	18
501	Sveti Petar u Šumi	f	18
502	Svetvinčenat	f	18
503	Tar-Vabriga – Torre–Abrega	f	18
504	Perci	f	18
505	Tinjan	f	18
506	Višnjan–Visignano	f	18
507	Vižinada–Visinada	f	18
508	Vrsar – Orsera	f	18
509	Žminj	f	18
510	Dubrovnik	t	19
511	Korčula	t	19
512	Metković	t	19
513	Opuzen	t	19
514	Ploče	t	19
515	Blato	f	19
516	Dubrovačko primorje	f	19
517	Janjina	f	19
518	Konavle	f	19
519	Kula Norinska	f	19
520	Lastovo	f	19
521	Lumbarda	f	19
522	Mljet	f	19
523	Orebić	f	19
524	Pojezerje	f	19
525	Slivno	f	19
526	Smokvica	f	19
527	Ston	f	19
528	Trpanj	f	19
529	Vela Luka	f	19
530	Zažablje	f	19
531	Župa dubrovač­ka	f	19
532	Čakovec	t	20
533	Mursko Središće	t	20
534	Prelog	t	20
535	Belica	f	20
536	Dekanovec	f	20
537	Domašinec	f	20
538	Donja Dubrava	f	20
539	Donji Kraljevec	f	20
540	Donji Vidovec	f	20
541	Goričan	f	20
542	Gornji Mihaljevec	f	20
543	Kotoriba	f	20
544	Mala Subotica	f	20
545	Nedelišće	f	20
546	Orehovica	f	20
547	Podturen	f	20
548	Pribislavec	f	20
549	Selnica	f	20
550	Strahoninec	f	20
551	Sveta Marija	f	20
552	Sveti Juraj na Bregu	f	20
553	Sveti Martin na Muri	f	20
554	Šenkovec	f	20
555	Štrigova	f	20
556	Vratišinec	f	20
557	Zagreb	t	21
558	Zagreb	f	21
\.


--
-- Data for Name: settlement; Type: TABLE DATA; Schema: public; Owner: carnet
--

COPY public.settlement (id, name, post_number, municipality_id) FROM stdin;
1	Andrilovec	\N	1
2	Donje Dvorišće	\N	1
3	Dugo Selo	\N	1
4	Kopčevec	\N	1
5	Kozinščak	\N	1
6	Leprovica	\N	1
7	Lukarišće	\N	1
8	Mala Ostrna	\N	1
9	Prozorje	\N	1
10	Puhovo	\N	1
11	Velika Ostrna	\N	1
12	Caginec	\N	2
13	Deanovec	\N	2
14	Derežani	\N	2
15	Donji Šarampov	\N	2
16	Graberje Ivaničko	\N	2
17	Greda Breška	\N	2
18	Ivanić-Grad	\N	2
19	Jalševec Breški	\N	2
20	Lepšić	\N	2
21	Lijevi Dubrovčak	\N	2
22	Opatinec	\N	2
23	Posavski Bregi	\N	2
24	Prečno	\N	2
25	Prerovec	\N	2
26	Prkos Ivanićki	\N	2
27	Šemovec Breški	\N	2
28	Šumećani	\N	2
29	Tarno	\N	2
30	Topolje	\N	2
31	Trebovec	\N	2
32	Zaklepica	\N	2
33	Zelina Breška	\N	2
34	Belčići	\N	3
35	Brebrovac	\N	3
36	Brezari	\N	3
37	Breznik Plešivički	\N	3
38	Bukovac Svetojanski	\N	3
39	Celine	\N	3
40	Crna Mlaka	\N	3
41	Cvetković	\N	3
42	Čabdin	\N	3
43	Čeglje	\N	3
44	Črnilovec	\N	3
45	Dolanjski Jarak	\N	3
46	Domagović	\N	3
47	Donja Reka	\N	3
48	Donji Desinec	\N	3
49	Draga Svetojanska	\N	3
50	Dragovanščak	\N	3
51	Goljak	\N	3
52	Gorica Svetojanska	\N	3
53	Gornja Kupčina	\N	3
54	Gornja Reka	\N	3
55	Gornji Desinec	\N	3
56	Grabarak	\N	3
57	Gračac Slavetićki	\N	3
58	Guci Draganički	\N	3
59	Hrastje Plešivičko	\N	3
60	Hrašća	\N	3
61	Ivančići	\N	3
62	Izimje	\N	3
63	Jastrebarsko	\N	3
64	Jurjevčani	\N	3
65	Kupeć Dol	\N	3
66	Lanišće	\N	3
67	Lokošin Dol	\N	3
68	Malunje	\N	3
69	Miladini	\N	3
70	Novaki Petrovinski	\N	3
71	Orešje Okićko	\N	3
72	Paljugi	\N	3
73	Pavlovčani	\N	3
74	Pesak	\N	3
75	Petrovina	\N	3
76	Plešivica	\N	3
77	Prekrižje Plešivičko	\N	3
78	Prhoć	\N	3
79	Prilipje	\N	3
80	Prodin Dol	\N	3
81	Rastoki	\N	3
82	Redovje	\N	3
83	Slavetić	\N	3
84	Srednjak	\N	3
85	Stankovo	\N	3
86	Špigelski Breg	\N	3
87	Tihočaj	\N	3
88	Toplice	\N	3
89	Vlaškovec	\N	3
90	Volavje	\N	3
91	Vranov Dol	\N	3
92	Vukšin Šipak	\N	3
93	Zdihovo	\N	3
94	Beder	\N	4
95	Bobovica	\N	4
96	Braslovje	\N	4
97	Bratelji	\N	4
98	Bregana	\N	4
99	Breganica	\N	4
100	Brezovac Žumberački	\N	4
101	Budinjak	\N	4
102	Bukovje Podvrško	\N	4
103	Celine Samoborske	\N	4
104	Cerje Samoborsko	\N	4
105	Cerovica	\N	4
106	Dane	\N	4
107	Dolec Podokićki	\N	4
108	Domaslovec	\N	4
109	Draganje Selo	\N	4
110	Dragonoš	\N	4
111	Drežnik Podokićki	\N	4
112	Dubrava Samoborska	\N	4
113	Falašćak	\N	4
114	Farkaševec Samoborski	\N	4
115	Galgovo	\N	4
116	Golubići	\N	4
117	Gornja Vas	\N	4
118	Gradna	\N	4
119	Grdanjci	\N	4
120	Gregurić Breg	\N	4
121	Hrastina Samoborska	\N	4
122	Jarušje	\N	4
123	Javorek	\N	4
124	Kladje	\N	4
125	Klake	\N	4
126	Klokočevec Samoborski	\N	4
127	Konšćica	\N	4
128	Kostanjevec Podvrški	\N	4
129	Kotari	\N	4
130	Kravljak	\N	4
131	Lug Samoborski	\N	4
132	Mala Jazbina	\N	4
133	Mala Rakovica	\N	4
134	Mali Lipovec	\N	4
135	Manja Vas	\N	4
136	Medsave	\N	4
137	Molvice	\N	4
138	Noršić Selo	\N	4
139	Novo Selo Žumberačko	\N	4
140	Osredek Žumberački	\N	4
141	Osunja	\N	4
142	Otruševec	\N	4
143	Pavučnjak	\N	4
144	Petkov Breg	\N	4
145	Podgrađe Podokićko	\N	4
146	Podvrh	\N	4
147	Poklek	\N	4
148	Rakov Potok	\N	4
149	Rude	\N	4
150	Samobor	\N	4
151	Samoborski Otok	\N	4
152	Savršćak	\N	4
153	Selce Žumberačko	\N	4
154	Sječevac	\N	4
155	Slani Dol	\N	4
156	Slapnica	\N	4
157	Slavagora	\N	4
158	Smerovišće	\N	4
159	Stojdraga	\N	4
160	Sveti Martin pod Okićem	\N	4
161	Šimraki	\N	4
162	Šipački Breg	\N	4
163	Tisovac Žumberački	\N	4
164	Velika Jazbina	\N	4
165	Velika Rakovica	\N	4
166	Veliki Lipovec	\N	4
167	Višnjevec Podvrški	\N	4
168	Vratnik Samoborski	\N	4
169	Vrbovec Samoborski	\N	4
170	Vrhovčak	\N	4
171	Bestovje	\N	5
172	Brezje	\N	5
173	Jagnjić Dol	\N	5
174	Kalinovica	\N	5
175	Kerestinec	\N	5
176	Mala Gorica	\N	5
177	Novaki	\N	5
178	Orešje	\N	5
179	Rakitje	\N	5
180	Srebrnjak	\N	5
181	Strmec	\N	5
182	Sveta Nedelja	\N	5
183	Svetonedeljski Breg	\N	5
184	Žitarka	\N	5
185	Banje Selo Berislavec	\N	6
186	Biškupec Zelinski	\N	6
187	Blaškovec	\N	6
188	Blaževdol	\N	6
189	Breg Mokrički	\N	6
190	Brezovec Zelinski	\N	6
191	Bukevje	\N	6
192	Bukovec Zelinski	\N	6
193	Bunjak	\N	6
194	Curkovec	\N	6
195	Črečan	\N	6
196	Donja Drenova	\N	6
197	Donja Topličica	\N	6
198	Donja Zelina	\N	6
199	Donje Orešje	\N	6
200	Donje Psarjevo	\N	6
201	Dubovec Bisaški	\N	6
202	Filipovići	\N	6
203	Goričanec	\N	6
204	Goričica	\N	6
205	Gornja Drenova	\N	6
206	Gornja Topličica	\N	6
207	Gornje Orešje	\N	6
208	Gornje Psarjevo	\N	6
209	Gornji Vinkovec	\N	6
210	Hrastje	\N	6
211	Hrnjanec	\N	6
212	Kalinje	\N	6
213	Keleminovec	\N	6
214	Kladešćica	\N	6
215	Komin	\N	6
216	Krečaves	\N	6
217	Križevčec	\N	6
218	Laktec	\N	6
219	Majkovec	\N	6
220	Marinovec Zelinski	\N	6
221	Mokrica Tomaševečka	\N	6
222	Nespeš	\N	6
223	Novakovec Bisaški	\N	6
224	Novo Mjesto	\N	6
225	Obrež Zelinski	\N	6
226	Paukovec	\N	6
227	Polonje	\N	6
228	Polonje Tomaševečko	\N	6
229	Prepolno	\N	6
230	Pretoki	\N	6
231	Radoišće	\N	6
232	Salnik	\N	6
233	Selnica Psarjevačka	\N	6
234	Suhodol Zelinski	\N	6
235	Sveta Helena	\N	6
236	Sveti Ivan Zelina	\N	6
237	Šalovec	\N	6
238	Šulinec	\N	6
239	Šurdovec	\N	6
240	Tomaševec	\N	6
241	Velika Gora	\N	6
242	Vukovje Zelinsko	\N	6
243	Zadrkovec	\N	6
244	Zrinšćina	\N	6
245	Žitomir	\N	6
246	Bapča	\N	7
247	Bukovčak	\N	7
248	Buševec	\N	7
249	Cerovski Vrh	\N	7
250	Cvetković Brdo	\N	7
251	Črnkovec	\N	7
252	Donja Lomnica	\N	7
253	Donje Podotočje	\N	7
254	Drenje Šćitarjevsko	\N	7
255	Dubranec	\N	7
256	Gornja Lomnica	\N	7
257	Gornje Podotočje	\N	7
258	Gradići	\N	7
259	Gudci	\N	7
260	Gustelnica	\N	7
261	Jagodno	\N	7
262	Jerebić	\N	7
263	Ključić Brdo	\N	7
264	Kobilić	\N	7
265	Kozjača	\N	7
266	Kuče	\N	7
267	Lazi Turopoljski	\N	7
268	Lazina Čička	\N	7
269	Lekneno	\N	7
270	Lukavec	\N	7
271	Mala Buna	\N	7
272	Mala Kosnica	\N	7
273	Markuševec Turopoljski	\N	7
274	Mičevec	\N	7
275	Mraclin	\N	7
276	Novaki Šćitarjevski	\N	7
277	Novo Čiče	\N	7
278	Novo Selo Lekeničko	\N	7
279	Obrezina	\N	7
280	Ogulinec	\N	7
281	Okuje	\N	7
282	Petina	\N	7
283	Petravec	\N	7
284	Petrovina Turopoljska	\N	7
285	Poljana Čička	\N	7
286	Prvonožina	\N	7
287	Rakitovec	\N	7
288	Ribnica	\N	7
289	Sasi	\N	7
290	Selnica	\N	7
291	Sop Bukevski	\N	7
292	Staro Čiče	\N	7
293	Strmec Bukevski	\N	7
294	Šćitarjevo	\N	7
295	Šiljakovina	\N	7
296	Trnje	\N	7
297	Turopolje	\N	7
298	Velika Buna	\N	7
299	Velika Gorica	\N	7
300	Velika Kosnica	\N	7
301	Velika Mlaka	\N	7
302	Vukomerić	\N	7
303	Vukovina	\N	7
304	Zablatje Posavsko	\N	7
305	Banovo	\N	8
306	Brčevec	\N	8
307	Celine	\N	8
308	Cerik	\N	8
309	Cerje	\N	8
310	Dijaneš	\N	8
311	Donji Tkalec	\N	8
312	Dulepska	\N	8
313	Đivan	\N	8
314	Gaj	\N	8
315	Gornji Tkalec	\N	8
316	Gostović	\N	8
317	Graberanec	\N	8
318	Graberšćak	\N	8
319	Greda	\N	8
320	Hruškovica	\N	8
321	Konak	\N	8
322	Krkač	\N	8
323	Kućari	\N	8
324	Lonjica	\N	8
325	Lovrečka Varoš	\N	8
326	Lovrečka Velika	\N	8
327	Luka	\N	8
328	Lukovo	\N	8
329	Marenić	\N	8
330	Martinska Ves	\N	8
331	Naselje Stjepana Radića	\N	8
332	Negovec	\N	8
333	Novo Selo	\N	8
334	Peskovec	\N	8
335	Pirakovec	\N	8
336	Podolec	\N	8
337	Poljana	\N	8
338	Poljanski Lug	\N	8
339	Prilesje	\N	8
340	Samoborec	\N	8
341	Savska Cesta	\N	8
342	Topolovec	\N	8
343	Vrbovec	\N	8
344	Vrbovečki Pavlovec	\N	8
345	Vrhovec	\N	8
346	Žunci	\N	8
347	Hruševec Kupljenski	\N	9
348	Ivanec Bistranski	\N	9
349	Jablanovec	\N	9
350	Kupljenovo	\N	9
351	Lužnica	\N	9
352	Merenje	\N	9
353	Pojatno	\N	9
354	Šibice	\N	9
355	Zaprešić	\N	9
356	Bedenica	\N	10
357	Beloslavec	\N	10
358	Bosna	\N	10
359	Omamno	\N	10
360	Otrčkovec	\N	10
361	Turkovčina	\N	10
362	Bukovje	\N	11
363	Bistransko	\N	11
364	Donja Bistra	\N	11
365	Gornja Bistra	\N	11
366	Novaki Bistranski	\N	11
367	Oborovo Bistransko	\N	11
368	Poljanica Bistranska	\N	11
369	Božjakovina	\N	12
370	Brckovljani	\N	12
371	Gornja Greda	\N	12
372	Gornje Dvorišće	\N	12
373	Gračec	\N	12
374	Hrebinec	\N	12
375	Kusanovec	\N	12
376	Lupoglav	\N	12
377	Prečec	\N	12
378	Prikraj	\N	12
379	Stančić	\N	12
380	Štakorovec	\N	12
381	Tedrovec	\N	12
382	Brdovec	\N	13
383	Donji Laduč	\N	13
384	Drenje Brdovečko	\N	13
385	Gornji Laduč	\N	13
386	Harmica	\N	13
387	Javorje	\N	13
388	Ključ Brdovečki	\N	13
389	Prigorje Brdovečko	\N	13
390	Prudnice	\N	13
391	Savski Marof	\N	13
392	Šenkovec	\N	13
393	Vukovo Selo	\N	13
394	Zdenci Brdovečki	\N	13
395	Bađinec	\N	14
396	Brezje	\N	14
397	Donji Marinkovac	\N	14
398	Donji Vukšinac	\N	14
399	Dubrava	\N	14
400	Dubravski Markovac	\N	14
401	Gornji Marinkovac	\N	14
402	Gornji Vukšinac	\N	14
403	Graberec	\N	14
404	Habjanovac	\N	14
405	Koritna	\N	14
406	Kostanj	\N	14
407	Kunđevac	\N	14
408	Ladina	\N	14
409	Mostari	\N	14
410	Nova Kapela	\N	14
411	Novaki	\N	14
412	Paruževac	\N	14
413	Pehardovac	\N	14
414	Podlužan	\N	14
415	Radulec	\N	14
416	Stara Kapela	\N	14
417	Svinjarec	\N	14
418	Zetkan	\N	14
419	Zgališće	\N	14
420	Zvekovac	\N	14
421	Žukovec	\N	14
422	Bobovec Rozganski	\N	15
423	Donji Čemehovec	\N	15
424	Dubravica	\N	15
425	Kraj Gornji	\N	15
426	Lugarski Breg	\N	15
427	Lukavec Sutlanski	\N	15
428	Pologi	\N	15
429	Prosinec	\N	15
430	Rozga	\N	15
431	Vučilčevo	\N	15
432	Bolč	\N	16
433	Brezine	\N	16
434	Donji Markovac	\N	16
435	Farkaševac	\N	16
436	Ivančani	\N	16
437	Kabal	\N	16
438	Mački	\N	16
439	Majur	\N	16
440	Prašćevac	\N	16
441	Zvonik	\N	16
442	Žabnica	\N	16
443	Buzadovac	\N	17
444	Cugovec	\N	17
445	Festinec	\N	17
446	Fuka	\N	17
447	Grabrić	\N	17
448	Gradec	\N	17
449	Gradečki Pavlovec	\N	17
450	Haganj	\N	17
451	Lubena	\N	17
452	Mali Brezovec	\N	17
453	Podjales	\N	17
454	Pokasin	\N	17
455	Potočec	\N	17
456	Remetinec	\N	17
457	Repinec	\N	17
458	Salajci	\N	17
459	Stari Glog	\N	17
460	Tučenik	\N	17
461	Veliki Brezovec	\N	17
462	Zabrđe	\N	17
463	Igrišće	\N	18
464	Jakovlje	\N	18
465	Kraljev Vrh	\N	18
466	Beter	\N	19
467	Donja Purgarija	\N	19
468	Donja Zdenčina	\N	19
469	Goli Vrh	\N	19
470	Gonjeva	\N	19
471	Gornja Purgarija	\N	19
472	Gornja Zdenčina	\N	19
473	Klinča Sela	\N	19
474	Kozlikovo	\N	19
475	Kupinec	\N	19
476	Novo Selo Okićko	\N	19
477	Poljanica Okićka	\N	19
478	Repišće	\N	19
479	Tržić	\N	19
480	Bešlinec Čemernica Lonjska	\N	20
481	Donja Obreška	\N	20
482	Gornja Obreška	\N	20
483	Kloštar Ivanić	\N	20
484	Križci	\N	20
485	Lipovec Lonjski	\N	20
486	Predavec	\N	20
487	Sobočani	\N	20
488	Stara Marča	\N	20
489	Šćapovec	\N	20
490	Barovka	\N	21
491	Begovo Brdo Žumberačko	\N	21
492	Brezarić	\N	21
493	Brlenić	\N	21
494	Bukovica Prekriška	\N	21
495	Careva Draga	\N	21
496	Čučići	\N	21
497	Čunkova Draga	\N	21
498	Dol	\N	21
499	Donje Prekrižje	\N	21
500	Gornje Prekrižje	\N	21
501	Hrženik	\N	21
502	Hutin	\N	21
503	Jezerine	\N	21
504	Konjarić Vrh	\N	21
505	Kostel Pribićki	\N	21
506	Krašić	\N	21
507	Krnežići	\N	21
508	Krupače	\N	21
509	Kučer	\N	21
510	Kurpezova Gorica	\N	21
511	Medven Draga	\N	21
512	Mirkopolje	\N	21
513	Pećno	\N	21
514	Pribić	\N	21
515	Pribić Crkveni	\N	21
516	Prvinci	\N	21
517	Radina Gorica	\N	21
518	Rude Pribićke	\N	21
519	Staničići Žumberački	\N	21
520	Strmac Pribićki	\N	21
521	Svrževo	\N	21
522	Vranjak Žumberački	\N	21
523	Barbarići Kravarski	\N	22
524	Čakanec	\N	22
525	Donji Hruševec	\N	22
526	Gladovec Kravarski	\N	22
527	Gornji Hruševec	\N	22
528	Kravarsko	\N	22
529	Novo Brdo	\N	22
530	Podvornica	\N	22
531	Pustike	\N	22
532	Žitkovčica	\N	22
533	Bunjani	\N	23
534	Donji Prnjarovec	\N	23
535	Gornji Prnjarovec	\N	23
536	Johovec	\N	23
537	Konšćani	\N	23
538	Križ	\N	23
539	Mala Hrastilnica	\N	23
540	Novoselec	\N	23
541	Obedišće	\N	23
542	Okešinec	\N	23
543	Razljev	\N	23
544	Rečica Kriška	\N	23
545	Širinec	\N	23
546	Šušnjari	\N	23
547	Velika Hrastilnica	\N	23
548	Vezišće	\N	23
549	Krajska Ves	\N	24
550	Luka	\N	24
551	Pluska	\N	24
552	Vadina	\N	24
553	Žejinci	\N	24
554	Bijela Gorica Celine Goričke	\N	25
555	Hrastina	\N	25
556	Kraj Donji	\N	25
557	Kraj Gornji	\N	25
558	Križ Brdovečki	\N	25
559	Marija Gorica	\N	25
560	Oplaznik	\N	25
561	Trstenik	\N	25
562	Žlebec Gorički	\N	25
563	Bukevje	\N	26
564	Čret Posavski	\N	26
565	Drnek	\N	26
566	Obed	\N	26
567	Orle	\N	26
568	Ruča	\N	26
569	Stružec Posavski	\N	26
570	Suša	\N	26
571	Veleševec	\N	26
572	Vrbovo Posavsko	\N	26
573	Bratina	\N	27
574	Bregana Pisarovinska	\N	27
575	Donja Kupčina	\N	27
576	Dvoranci	\N	27
577	Gorica Jamnička	\N	27
578	Gradec Pokupski	\N	27
579	Jamnica Pisarovinska	\N	27
580	Lijevo Sredičko	\N	27
581	Lučelnica	\N	27
582	Pisarovina	\N	27
583	Podgorje Jamničko	\N	27
584	Selsko Brdo	\N	27
585	Topolovec Pisarovinski	\N	27
586	Velika Jamnička	\N	27
587	Auguštanovec	\N	28
588	Cerje Pokupsko	\N	28
589	Cvetnić Brdo	\N	28
590	Gladovec Pokupski	\N	28
591	Hotnja	\N	28
592	Lijevi Degoj	\N	28
593	Lijevi Štefanki	\N	28
594	Lukinić Brdo	\N	28
595	Opatija	\N	28
596	Pokupsko	\N	28
597	Roženica	\N	28
598	Strezojevo	\N	28
599	Šestak Brdo	\N	28
600	Zgurić Brdo	\N	28
601	Donja Velika	\N	29
602	Gornja Velika	\N	29
603	Gornjaki	\N	29
604	Kamenica	\N	29
605	Kraljev Vrh	\N	29
606	Krušljevec	\N	29
607	Ledina	\N	29
608	Pogančec	\N	29
609	Preseka	\N	29
610	Slatina	\N	29
611	Srednja Velika	\N	29
612	Strmec	\N	29
613	Šelovec	\N	29
614	Vinkovec	\N	29
615	Žabnjak	\N	29
616	Bregovljana	\N	30
617	Donja Pušća	\N	30
618	Dubrava Pušćanska	\N	30
619	Gornja Pušća	\N	30
620	Hrebine	\N	30
621	Hruševec Pušćanski	\N	30
622	Marija Magdalena	\N	30
623	Žlebec Pušćanski	\N	30
624	Baničevec	\N	31
625	Brezani	\N	31
626	Dropčevec	\N	31
627	Dvorišće	\N	31
628	Goli Vrh	\N	31
629	Hruškovec	\N	31
630	Hudovo	\N	31
631	Kolenica	\N	31
632	Lipnica	\N	31
633	Mlaka	\N	31
634	Rakovec	\N	31
635	Valetić	\N	31
636	Čista Mlaka	\N	32
637	Črnec Dugoselski	\N	32
638	Črnec Rugvički	\N	32
639	Donja Greda	\N	32
640	Dragošička	\N	32
641	Hrušćica	\N	32
642	Jalševec Nartski	\N	32
643	Ježevo	\N	32
644	Nart Savski	\N	32
645	Novaki Nartski	\N	32
646	Novaki Oborovski	\N	32
647	Obedišće Ježevsko	\N	32
648	Oborovo	\N	32
649	Okunšćak	\N	32
650	Otok Nartski	\N	32
651	Otok Svibovski	\N	32
652	Preseka Oborovska	\N	32
653	Prevlaka	\N	32
654	Rugvica	\N	32
655	Sop	\N	32
656	Struga Nartska	\N	32
657	Svibje	\N	32
658	Trstenik Nartski	\N	32
659	Gornji Stupnik	\N	33
660	Donji Stupnik	\N	33
661	Stupnički Obrež	\N	33
662	Cernik	\N	34
663	Donji Oštrc	\N	34
664	Drašći Vrh	\N	34
665	Glušinja	\N	34
666	Gornji Oštrc	\N	34
667	Grgetići	\N	34
668	Grič	\N	34
669	Hartje	\N	34
670	Javor	\N	34
671	Jezernice	\N	34
672	Jurkovo Selo	\N	34
673	Kalje	\N	34
674	Kordići Žumberački	\N	34
675	Kostanjevac	\N	34
676	Kupčina Žumberačka	\N	34
677	Markušići	\N	34
678	Mrzlo Polje Žumberačko	\N	34
679	Petričko Selo	\N	34
680	Plavci	\N	34
681	Radinovo Brdo	\N	34
682	Reštovo Žumberačko	\N	34
683	Sopote	\N	34
684	Sošice	\N	34
685	Stari Grad Žumberački	\N	34
686	Stupe	\N	34
687	Tomaševci	\N	34
688	Tupčina	\N	34
689	Veliki Vrh	\N	34
690	Visoće	\N	34
691	Višći Vrh	\N	34
692	Vlašić Brdo	\N	34
693	Vukovo Brdo	\N	34
694	Žamarija	\N	34
695	Željezno Žumberačko	\N	34
696	Žumberak	\N	34
697	Donja Podgora	\N	35
698	Donja Stubica	\N	35
699	Gornja Podgora	\N	35
700	Hižakovec	\N	35
701	Hruševec	\N	35
702	Lepa Ves	\N	35
703	Matenci	\N	35
704	Milekovo Selo	\N	35
705	Pustodol	\N	35
706	Vučak	\N	35
707	Bobovec Tomaševečki	\N	36
708	Bratovski Vrh	\N	36
709	Cesarska Ves	\N	36
710	Dol Klanječki	\N	36
711	Florijan	\N	36
712	Goljak Klanječki	\N	36
713	Gorkovec	\N	36
714	Gredice	\N	36
715	Klanjec	\N	36
716	Ledine Klanječke	\N	36
717	Lepoglavec	\N	36
718	Letovčan Novodvorski	\N	36
719	Letovčan Tomaševečki	\N	36
720	Lučelnica Tomaševečka	\N	36
721	Mihanovićev Dol	\N	36
722	Novi Dvori Klanječki	\N	36
723	Police	\N	36
724	Rakovec Tomaševečki	\N	36
725	Tomaševec	\N	36
726	Bobovje	\N	37
727	Doliće	\N	37
728	Donja Šemnica	\N	37
729	Gornja Pačetina	\N	37
730	Krapina	\N	37
731	Lazi Krapinski	\N	37
732	Lepajci	\N	37
733	Mihaljekov Jarek	\N	37
734	Podgora Krapinska	\N	37
735	Polje Krapinsko	\N	37
736	Pretkovec	\N	37
737	Pristava Krapinska	\N	37
738	Strahinje	\N	37
739	Straža Krapinska	\N	37
740	Škarićevo	\N	37
741	Šušelj Brijeg	\N	37
742	Tkalci	\N	37
743	Trški Vrh	\N	37
744	Velika Ves	\N	37
745	Vidovec Krapinski	\N	37
746	Vidovec Petrovski	\N	37
747	Zagora	\N	37
748	Žutnica	\N	37
749	Andraševec	\N	38
750	Krušljevo Selo	\N	38
751	Mokrice	\N	38
752	Oroslavje	\N	38
753	Stubička Slatina	\N	38
754	Benkovo	\N	39
755	Bregi Kostelski	\N	39
756	Bušin	\N	39
757	Cigrovec	\N	39
758	Donja Plemenšćina	\N	39
759	Gabrovec	\N	39
760	Gorjakovo	\N	39
761	Gornja Plemenšćina	\N	39
762	Klenice	\N	39
763	Kostel	\N	39
764	Kostelsko	\N	39
765	Mala Gora	\N	39
766	Marinec	\N	39
767	Martiša Ves	\N	39
768	Pavlovec Pregradski	\N	39
769	Pregrada	\N	39
770	Sopot	\N	39
771	Stipernica	\N	39
772	Svetojurski Vrh	\N	39
773	Valentinovo	\N	39
774	Velika Gora	\N	39
775	Vinagora	\N	39
776	Višnjevec	\N	39
777	Vojsak	\N	39
778	Vrhi Pregradski	\N	39
779	Vrhi Vinagorski	\N	39
780	Bračak	\N	40
781	Bregi Zabočki	\N	40
782	Dubrava Zabočka	\N	40
783	Grabrovec	\N	40
784	Grdenci	\N	40
785	Gubaševo	\N	40
786	Hum Zabočki	\N	40
787	Jakuševec Zabočki	\N	40
788	Lug Zabočki	\N	40
789	Martinišće	\N	40
790	Pavlovec Zabočki	\N	40
791	Prosenik Gubaševski	\N	40
792	Prosenik Začretski	\N	40
793	Repovec	\N	40
794	Špičkovina	\N	40
795	Tisanić Jarek	\N	40
796	Zabok	\N	40
797	Belec	\N	41
798	Borkovec	\N	41
799	Cetinovec	\N	41
800	Donja Batina	\N	41
801	Donja Selnica	\N	41
802	Ervenik Zlatarski	\N	41
803	Gornja Batina	\N	41
804	Gornja Selnica	\N	41
805	Juranšćina	\N	41
806	Ladislavec	\N	41
807	Martinšćina	\N	41
808	Petruševec	\N	41
809	Ratkovec	\N	41
810	Repno	\N	41
811	Šćrbinec	\N	41
812	Vižanovec	\N	41
813	Završje Belečko	\N	41
814	Zlatar	\N	41
815	Znož	\N	41
816	Bedekovčina	\N	42
817	Belovar Zlatarski	\N	42
818	Brestovec Orehovički	\N	42
819	Grabe	\N	42
820	Kebel	\N	42
821	Križanče	\N	42
822	Lug Orehovički	\N	42
823	Lug Poznanovečki	\N	42
824	Martinec Orehovički	\N	42
825	Orehovica	\N	42
826	Poznanovec	\N	42
827	Pustodol Orehovički	\N	42
828	Vojnić Breg	\N	42
829	Zadravec	\N	42
830	Židovinjak	\N	42
831	Budinščina	\N	43
832	Gotalovec	\N	43
833	Grtovec	\N	43
834	Krapinica	\N	43
835	Marigutić	\N	43
836	Pažurovec	\N	43
837	Pece	\N	43
838	Pokojec	\N	43
839	Pomperovec	\N	43
840	Prepuštovec	\N	43
841	Sveti Križ	\N	43
842	Topličica	\N	43
843	Zajezda	\N	43
844	Desinić	\N	44
845	Desinić Gora	\N	44
846	Donji Jalšovec	\N	44
847	Donji Zbilj	\N	44
848	Dubravica Desinićka	\N	44
849	Gaber	\N	44
850	Gora Košnička	\N	44
851	Gornji Jalšovec	\N	44
852	Gornji Zbilj	\N	44
853	Gostenje	\N	44
854	Grohot	\N	44
855	Hum Košnički	\N	44
856	Ivanić Desinićki	\N	44
857	Ivanić Košnički	\N	44
858	Jazbina	\N	44
859	Jelenjak	\N	44
860	Klanječno	\N	44
861	Košnica	\N	44
862	Nebojse	\N	44
863	Osredek Desinićki	\N	44
864	Ravnice Desinićke	\N	44
865	Stara Ves Košnička	\N	44
866	Šimunci	\N	44
867	Škalić Zagorski	\N	44
868	Trnovec Desinićki	\N	44
869	Turnišće Desinićko	\N	44
870	Turnovo	\N	44
871	Velika Horvatska	\N	44
872	Donji Macelj	\N	45
873	Đurmanec	\N	45
874	Goričanovec	\N	45
875	Gornji Macelj	\N	45
876	Hlevnica	\N	45
877	Hromec	\N	45
878	Jezerišće	\N	45
879	Koprivnica Zagorska	\N	45
880	Lukovčak	\N	45
881	Podbrezovica	\N	45
882	Prigorje	\N	45
883	Putkovec	\N	45
884	Ravninsko	\N	45
885	Banšćica	\N	46
886	Brezje	\N	46
887	Dobri Zdenci	\N	46
888	Dubovec	\N	46
889	Gornja Stubica	\N	46
890	Gusakovec	\N	46
891	Hum Stubički	\N	46
892	Jakšinec	\N	46
893	Karivaroš	\N	46
894	Modrovec	\N	46
895	Orehova Gorica	\N	46
896	Pasanska Gorica	\N	46
897	Repićevo Selo	\N	46
898	Samci	\N	46
899	Sekirevo Selo	\N	46
900	Slani Potok	\N	46
901	Sveti Matej	\N	46
902	Šagudovec	\N	46
903	Vinterovec	\N	46
904	Volavec	\N	46
905	Domovec	\N	47
906	Donji Kraljevec	\N	47
907	Gornjaki	\N	47
908	Gornji Kraljevec	\N	47
909	Hrašćina	\N	47
910	Husinec	\N	47
911	Jarek Habekov	\N	47
912	Maretić	\N	47
913	Trgovišće	\N	47
914	Vrbovo	\N	47
915	Brezno Gora	\N	48
916	Donje Brezno	\N	48
917	Druškovec Gora	\N	48
918	Druškovec Humski	\N	48
919	Gornje Brezno	\N	48
920	Grletinec	\N	48
921	Hum na Sutli	\N	48
922	Klenovec Humski	\N	48
923	Lastine	\N	48
924	Lupinjak	\N	48
925	Mali Tabor	\N	48
926	Orešje Humsko	\N	48
927	Poredje	\N	48
928	Prišlin	\N	48
929	Rusnica	\N	48
930	Strmec Humski	\N	48
931	Vrbišnica	\N	48
932	Zalug	\N	48
933	Brdo Jesenjsko	\N	49
934	Cerje Jesenjsko	\N	49
935	Donje Jesenje	\N	49
936	Gornje Jesenje	\N	49
937	Lužani Zagorski	\N	49
938	Bočadir	\N	50
939	Bočaki	\N	50
940	Brlekovo	\N	50
941	Donja Batina	\N	50
942	Donja Konjščina	\N	50
943	Galovec	\N	50
944	Gornja Konjščina	\N	50
945	Jelovec	\N	50
946	Jertovec	\N	50
947	Klimen	\N	50
948	Konjščina	\N	50
949	Kosovečko	\N	50
950	Krapina Selo	\N	50
951	Pešćeno	\N	50
952	Sušobreg	\N	50
953	Turnišće	\N	50
954	Draše	\N	51
955	Gornji Čemehovec	\N	51
956	Kačkovec	\N	51
957	Kapelski Vrh	\N	51
958	Kraljevec na Sutli	\N	51
959	Lukavec Klanječki	\N	51
960	Movrač	\N	51
961	Pušava	\N	51
962	Radakovo	\N	51
963	Strmec Sutlanski	\N	51
964	Čret	\N	52
965	Donje Vino	\N	52
966	Gregurovec	\N	52
967	Hršak Breg	\N	52
968	Jasenovac Zagorski	\N	52
969	Jurjevec	\N	52
970	Klokovec	\N	52
971	Klupci	\N	52
972	Krapinske Toplice	\N	52
973	Lovreća Sela	\N	52
974	Mala Erpenja	\N	52
975	Maturovec	\N	52
976	Oratje	\N	52
977	Selno	\N	52
978	Slivonja Jarek	\N	52
979	Viča Sela	\N	52
980	Vrtnjakovec	\N	52
981	Donji Škrnik	\N	53
982	Dugnjevec	\N	53
983	Kladnik	\N	53
984	Kumrovec	\N	53
985	Podgora	\N	53
986	Ravno Brezje	\N	53
987	Razdrto Tuheljsko	\N	53
988	Razvor	\N	53
989	Risvica	\N	53
990	Velinci	\N	53
991	Cebovec	\N	54
992	Lobor	\N	54
993	Markušbrijeg	\N	54
994	Petrova Gora	\N	54
995	Stari Golubovec	\N	54
996	Šipki	\N	54
997	Velika Petrovagorska	\N	54
998	Vinipotok	\N	54
999	Vojnovec Loborski	\N	54
1000	Završje Loborsko	\N	54
1001	Delkovec	\N	55
1002	Frkuljevec Peršaveški	\N	55
1003	Mače	\N	55
1004	Mali Bukovec	\N	55
1005	Mali Komor	\N	55
1006	Peršaves	\N	55
1007	Veliki Bukovec	\N	55
1008	Veliki Komor	\N	55
1009	Vukanci	\N	55
1010	Globočec	\N	56
1011	Hum Bistrički	\N	56
1012	Laz Bistrički	\N	56
1013	Laz Stubički	\N	56
1014	Marija Bistrica	\N	56
1015	Podgorje Bistričko	\N	56
1016	Podgrađe	\N	56
1017	Poljanica Bistrička	\N	56
1018	Selnica	\N	56
1019	Sušobreg Bistrički	\N	56
1020	Tugonica	\N	56
1021	Frkuljevec Mihovljanski	\N	57
1022	Gregurovec	\N	57
1023	Kuzminec	\N	57
1024	Mihovljan	\N	57
1025	Sutinske Toplice	\N	57
1026	Gora Veternička	\N	58
1027	Novi Golubovec	\N	58
1028	Očura	\N	58
1029	Velika Veternička	\N	58
1030	Veternica	\N	58
1031	Benkovec Petrovski	\N	59
1032	Brezovica Petrovska	\N	59
1033	Gredenec	\N	59
1034	Mala Pačetina	\N	59
1035	Petrovsko	\N	59
1036	Podgaj Petrovski	\N	59
1037	Preseka Petrovska	\N	59
1038	Rovno	\N	59
1039	Slatina Svedruška	\N	59
1040	Stara Ves Petrovska	\N	59
1041	Svedruža	\N	59
1042	Štuparje	\N	59
1043	Bregi Radobojski	\N	60
1044	Gorjani Sutinski	\N	60
1045	Gornja Šemnica	\N	60
1046	Jazvine	\N	60
1047	Kraljevec Radobojski	\N	60
1048	Kraljevec Šemnički	\N	60
1049	Orehovec Radobojski	\N	60
1050	Radoboj	\N	60
1051	Strahinje Radobojsko	\N	60
1052	Pila	\N	61
1053	Sljeme	\N	61
1054	Strmec Stubički	\N	61
1055	Stubičke Toplice	\N	61
1056	Brezova	\N	62
1057	Ciglenica Zagorska	\N	62
1058	Donja Pačetina	\N	62
1059	Dukovec	\N	62
1060	Galovec Začretski	\N	62
1061	Klupci	\N	62
1062	Komor Začretski	\N	62
1063	Kotarice	\N	62
1064	Kozjak Začretski	\N	62
1065	Mirkovec	\N	62
1066	Pustodol Začretski	\N	62
1067	Sekirišće	\N	62
1068	Sveti Križ Začretje	\N	62
1069	Štrucljevo	\N	62
1070	Švaljkovec	\N	62
1071	Temovec	\N	62
1072	Vrankovec	\N	62
1073	Završje Začretsko	\N	62
1074	Zleć	\N	62
1075	Banska Gorica	\N	63
1076	Črešnjevec	\N	63
1077	Glogovec Zagorski	\N	63
1078	Lenišće	\N	63
1079	Lipnica Zagorska	\N	63
1080	Pristava	\N	63
1081	Prosenik	\N	63
1082	Sveti Križ	\N	63
1083	Trsteno	\N	63
1084	Tuhelj	\N	63
1085	Tuheljske Toplice	\N	63
1086	Bezavina	\N	64
1087	Domahovo	\N	64
1088	Družilovec	\N	64
1089	Dubrovčan	\N	64
1090	Jalšje	\N	64
1091	Jezero Klanječko	\N	64
1092	Mrzlo Polje	\N	64
1093	Požarkovec	\N	64
1094	Ravnice	\N	64
1095	Strmec	\N	64
1096	Turnišće Klanječko	\N	64
1097	Velika Erpenja	\N	64
1098	Veliko Trgovišće	\N	64
1099	Vilanci	\N	64
1100	Vižovlje	\N	64
1101	Bojačno	\N	65
1102	Bratkovec	\N	65
1103	Brezakovec	\N	65
1104	Gornji Škrnik	\N	65
1105	Harina Zlaka	\N	65
1106	Ivanić Miljanski	\N	65
1107	Kuzminec Miljanski	\N	65
1108	Luke Poljanske	\N	65
1109	Miljana	\N	65
1110	Plavić	\N	65
1111	Poljana Sutlanska	\N	65
1112	Pušća	\N	65
1113	Zagorska Sela	\N	65
1114	Ervenik Zlatarski	\N	66
1115	Lipovec	\N	66
1116	Lovrečan	\N	66
1117	Opasanjek	\N	66
1118	Veleškovec	\N	66
1119	Zlatar Bistrica	\N	66
1120	Balinac	\N	67
1121	Baturi	\N	67
1122	Bijele Vode	\N	67
1123	Bišćanovo	\N	67
1124	Bojna	\N	67
1125	Borovita	\N	67
1126	Brestik	\N	67
1127	Brezovo Polje	\N	67
1128	Brnjeuška	\N	67
1129	Brubno	\N	67
1130	Buzeta	\N	67
1131	Dabrina	\N	67
1132	Desni Degoj	\N	67
1133	Dolnjaki	\N	67
1134	Donja Bučica	\N	67
1135	Donja Trstenica	\N	67
1136	Donje Jame	\N	67
1137	Donje Selište	\N	67
1138	Donje Taborište	\N	67
1139	Donji Klasnić	\N	67
1140	Donji Selkovac	\N	67
1141	Donji Viduševac	\N	67
1142	Dragotina	\N	67
1143	Drenovac Banski	\N	67
1144	Dvorišće	\N	67
1145	Glina	\N	67
1146	Gornja Bučica	\N	67
1147	Gornje Jame	\N	67
1148	Gornje Selište	\N	67
1149	Gornje Taborište	\N	67
1150	Gornji Klasnić	\N	67
1151	Gornji Selkovac	\N	67
1152	Gornji Viduševac	\N	67
1153	Gračanica Šišinečka	\N	67
1154	Hađer	\N	67
1155	Hajtić	\N	67
1156	Ilovačak	\N	67
1157	Joševica	\N	67
1158	Kihalac	\N	67
1159	Kozaperovica	\N	67
1160	Maja	\N	67
1161	Majske Poljane	\N	67
1162	Majski Trtnik	\N	67
1163	Mala Solina	\N	67
1164	Mali Gradac	\N	67
1165	Mali Obljaj	\N	67
1166	Marinbrod	\N	67
1167	Martinovići	\N	67
1168	Momčilovića Kosa	\N	67
1169	Novo Selo Glinsko	\N	67
1170	Prekopa	\N	67
1171	Prijeka	\N	67
1172	Ravno Rašće	\N	67
1173	Roviška	\N	67
1174	Skela	\N	67
1175	Slatina Pokupska	\N	67
1176	Stankovac	\N	67
1177	Svračica	\N	67
1178	Šaševa	\N	67
1179	Šatornja	\N	67
1180	Šibine	\N	67
1181	Trnovac Glinski	\N	67
1182	Trtnik Glinski	\N	67
1183	Turčenica	\N	67
1184	Velika Solina	\N	67
1185	Veliki Gradac	\N	67
1186	Veliki Obljaj	\N	67
1187	Vlahović	\N	67
1188	Zaloj	\N	67
1189	Čukur	\N	68
1190	Hrvatska Kostajnica	\N	68
1191	Panjani	\N	68
1192	Rausovac	\N	68
1193	Rosulje	\N	68
1194	Selište Kostajničko	\N	68
1195	Utolica	\N	68
1196	Banova Jaruga	\N	69
1197	Batina	\N	69
1198	Brinjani	\N	69
1199	Čaire	\N	69
1200	Gojlo	\N	69
1201	Husain	\N	69
1202	Ilova	\N	69
1203	Jamarica	\N	69
1204	Janja Lipa	\N	69
1205	Katoličke Čaire	\N	69
1206	Kletište	\N	69
1207	Krajiška Kutinica	\N	69
1208	Kutina	\N	69
1209	Kutinica	\N	69
1210	Kutinska Slatina	\N	69
1211	Međurić	\N	69
1212	Mikleuška	\N	69
1213	Mišinka	\N	69
1214	Repušnica	\N	69
1215	Selište	\N	69
1216	Stupovača	\N	69
1217	Šartovac	\N	69
1218	Zbjegovača	\N	69
1219	Bair	\N	70
1220	Borovac	\N	70
1221	Brestača	\N	70
1222	Brezovac Subocki	\N	70
1223	Bročice	\N	70
1224	Jazavica	\N	70
1225	Kozarice	\N	70
1226	Kričke	\N	70
1227	Lovska	\N	70
1228	Nova Subocka	\N	70
1229	Novi Grabovac	\N	70
1230	Novska	\N	70
1231	Paklenica	\N	70
1232	Plesmo	\N	70
1233	Popovac Subocki	\N	70
1234	Rađenovci	\N	70
1235	Rajčići	\N	70
1236	Rajić	\N	70
1237	Roždanik	\N	70
1238	Sigetac Novski	\N	70
1239	Stara Subocka	\N	70
1240	Stari Grabovac	\N	70
1241	Voćarica	\N	70
1242	Begovići	\N	71
1243	Bijelnik	\N	71
1244	Blinja	\N	71
1245	Brest Pokupski	\N	71
1246	Cepeliš	\N	71
1247	Čuntić	\N	71
1248	Deanovići	\N	71
1249	Dodoši	\N	71
1250	Donja Bačuga	\N	71
1251	Donja Budičina	\N	71
1252	Donja Mlinoga	\N	71
1253	Donja Pastuša	\N	71
1254	Donje Mokrice	\N	71
1255	Dragotinci	\N	71
1256	Dumače	\N	71
1257	Glinska Poljana	\N	71
1258	Gora	\N	71
1259	Gornja Bačuga	\N	71
1260	Gornja Mlinoga	\N	71
1261	Gornja Pastuša	\N	71
1262	Gornje Mokrice	\N	71
1263	Graberje	\N	71
1264	Grabovac Banski	\N	71
1265	Hrastovica	\N	71
1266	Hrvatski Čuntić	\N	71
1267	Jabukovac	\N	71
1268	Jošavica	\N	71
1269	Klinac	\N	71
1270	Kraljevčani	\N	71
1271	Križ Hrastovački	\N	71
1272	Luščani	\N	71
1273	Mačkovo Selo	\N	71
1274	Mala Gorica	\N	71
1275	Međurače	\N	71
1276	Miočinovići	\N	71
1277	Mošćenica	\N	71
1278	Moštanica	\N	71
1279	Nebojan	\N	71
1280	Nova Drenčina	\N	71
1281	Novi Farkašić	\N	71
1282	Novo Selište	\N	71
1283	Pecki	\N	71
1284	Petkovac	\N	71
1285	Petrinja	\N	71
1286	Prnjavor Čuntićki	\N	71
1287	Sibić	\N	71
1288	Slana	\N	71
1289	Srednje Mokrice	\N	71
1290	Strašnik	\N	71
1291	Stražbenica	\N	71
1292	Taborište	\N	71
1293	Tremušnjak	\N	71
1294	Veliki Šušnjar	\N	71
1295	Vratečko	\N	71
1296	Župić	\N	71
1297	Blinjski Kut	\N	72
1298	Budaševo	\N	72
1299	Bukovsko	\N	72
1300	Crnac	\N	72
1301	Čigoć	\N	72
1302	Donje Komarevo	\N	72
1303	Gornje Komarevo	\N	72
1304	Greda	\N	72
1305	Gušće	\N	72
1306	Hrastelnica	\N	72
1307	Jazvenik	\N	72
1308	Klobučak	\N	72
1309	Kratečko	\N	72
1310	Letovanci	\N	72
1311	Lonja	\N	72
1312	Lukavec Posavski	\N	72
1313	Madžari	\N	72
1314	Mužilovčica	\N	72
1315	Novo Pračno	\N	72
1316	Novo Selo	\N	72
1317	Novo Selo Palanječko	\N	72
1318	Odra Sisačka	\N	72
1319	Palanjek	\N	72
1320	Prelošćica	\N	72
1321	Sela	\N	72
1322	Sisak	\N	72
1323	Stara Drenčina	\N	72
1324	Staro Pračno	\N	72
1325	Staro Selo	\N	72
1326	Stupno	\N	72
1327	Suvoj	\N	72
1328	Topolovac	\N	72
1329	Veliko Svinjičko	\N	72
1330	Vurot	\N	72
1331	Žabno	\N	72
1332	Babina Rijeka	\N	73
1333	Borojevići	\N	73
1334	Donja Velešnja	\N	73
1335	Donji Bjelovac	\N	73
1336	Donji Kukuruzari	\N	73
1337	Gornja Velešnja	\N	73
1338	Gornji Bjelovac	\N	73
1339	Gornji Kukuruzari	\N	73
1340	Knezovljani	\N	73
1341	Komogovina	\N	73
1342	Kostreši Bjelovački	\N	73
1343	Lovča	\N	73
1344	Mečenčani	\N	73
1345	Prevršac	\N	73
1346	Umetić	\N	73
1347	Brđani Šamarički	\N	74
1348	Buinja	\N	74
1349	Buinjski Riječani	\N	74
1350	Čavlovica	\N	74
1351	Ćore	\N	74
1352	Divuša	\N	74
1353	Donja Oraovica	\N	74
1354	Donja Stupnica	\N	74
1355	Donji Dobretin	\N	74
1356	Donji Javoranj	\N	74
1357	Donji Žirovac	\N	74
1358	Draga	\N	74
1359	Draškovac	\N	74
1360	Dvor	\N	74
1361	Gage	\N	74
1362	Glavičani	\N	74
1363	Golubovac Divuški	\N	74
1364	Gorička	\N	74
1365	Gornja Oraovica	\N	74
1366	Gornja Stupnica	\N	74
1367	Gornji Dobretin	\N	74
1368	Gornji Javoranj	\N	74
1369	Gornji Žirovac	\N	74
1370	Grabovica	\N	74
1371	Grmušani	\N	74
1372	Gvozdansko	\N	74
1373	Hrtić	\N	74
1374	Javnica	\N	74
1375	Javornik	\N	74
1376	Jovac	\N	74
1377	Kepčije	\N	74
1378	Kobiljak	\N	74
1379	Komora	\N	74
1380	Kosna	\N	74
1381	Kotarani	\N	74
1382	Kozibrod	\N	74
1383	Kuljani	\N	74
1384	Lotine	\N	74
1385	Ljeskovac	\N	74
1386	Ljubina	\N	74
1387	Majdan	\N	74
1388	Matijevići	\N	74
1389	Ostojići	\N	74
1390	Paukovac	\N	74
1391	Pedalj	\N	74
1392	Rogulje	\N	74
1393	Rudeži	\N	74
1394	Rujevac	\N	74
1395	Sočanica	\N	74
1396	Stanić Polje	\N	74
1397	Struga Banska	\N	74
1398	Šakanlije	\N	74
1399	Šegestin	\N	74
1400	Švrakarica	\N	74
1401	Trgovi	\N	74
1402	Udetin	\N	74
1403	Unčani	\N	74
1404	Vanići	\N	74
1405	Volinja	\N	74
1406	Vrpolje Bansko	\N	74
1407	Zakopa	\N	74
1408	Zamlača	\N	74
1409	Zrin	\N	74
1410	Zut	\N	74
1411	Blatuša	\N	75
1412	Bović	\N	75
1413	Brnjavac	\N	75
1414	Crevarska Strana	\N	75
1415	Čremušnica	\N	75
1416	Dugo Selo	\N	75
1417	Golinja	\N	75
1418	Gornja Čemernica	\N	75
1419	Gornja Trstenica	\N	75
1420	Gvozd	\N	75
1421	Kirin	\N	75
1422	Kozarac	\N	75
1423	Ostrožin	\N	75
1424	Pješčanica	\N	75
1425	Podgorje	\N	75
1426	Slavsko Polje	\N	75
1427	Stipan	\N	75
1428	Šljivovac	\N	75
1429	Trepča	\N	75
1430	Baćin	\N	76
1431	Donji Cerovljani	\N	76
1432	Gornji Cerovljani	\N	76
1433	Hrvatska Dubica	\N	76
1434	Slabinja	\N	76
1435	Živaja	\N	76
1436	Drenov Bok	\N	77
1437	Jasenovac	\N	77
1438	Košutarica	\N	77
1439	Krapje	\N	77
1440	Mlaka	\N	77
1441	Puska	\N	77
1442	Tanac	\N	77
1443	Trebež	\N	77
1444	Uštica	\N	77
1445	Višnjica Uštička	\N	77
1446	Brežane Lekeničke	\N	78
1447	Brkiševina	\N	78
1448	Cerje Letovanićko	\N	78
1449	Donji Vukojevac	\N	78
1450	Dužica	\N	78
1451	Gornji Vukojevac	\N	78
1452	Lekenik	\N	78
1453	Letovanić	\N	78
1454	Palanjek Pokupski	\N	78
1455	Pešćenica	\N	78
1456	Petrovec	\N	78
1457	Pokupsko Vratečko	\N	78
1458	Poljana Lekenička	\N	78
1459	Stari Brod	\N	78
1460	Stari Farkašić	\N	78
1461	Šišinec	\N	78
1462	Vrh Letovanićki	\N	78
1463	Žažina	\N	78
1464	Kraljeva Velika	\N	79
1465	Krivaj	\N	79
1466	Lipovljani	\N	79
1467	Piljenice	\N	79
1468	Gornja Meminska	\N	80
1469	Gornji Hrastovac	\N	80
1470	Graboštani	\N	80
1471	Kostrići	\N	80
1472	Majur	\N	80
1473	Malo Krčevo	\N	80
1474	Mračaj	\N	80
1475	Srednja Meminska	\N	80
1476	Stubalj	\N	80
1477	Svinica	\N	80
1478	Veliko Krčevo	\N	80
1479	Bok Palanječki	\N	81
1480	Desni Dubrovčak	\N	81
1481	Desno Trebarjevo	\N	81
1482	Desno Željezno	\N	81
1483	Jezero Posavsko	\N	81
1484	Lijeva Luka	\N	81
1485	Lijevo Trebarjevo	\N	81
1486	Lijevo Željezno	\N	81
1487	Ljubljanica	\N	81
1488	Mahovo	\N	81
1489	Martinska Ves	\N	81
1490	Setuš	\N	81
1491	Strelečko	\N	81
1492	Tišina Erdedska	\N	81
1493	Tišina Kaptolska	\N	81
1494	Žirčica	\N	81
1495	Bestrma	\N	82
1496	Bistrač	\N	82
1497	Blinjska Greda	\N	82
1498	Bobovac	\N	82
1499	Brđani Cesta	\N	82
1500	Brđani Kosa	\N	82
1501	Crkveni Bok	\N	82
1502	Čapljani	\N	82
1503	Četvrtkovac	\N	82
1504	Donja Letina	\N	82
1505	Donji Hrastovac	\N	82
1506	Drljača	\N	82
1507	Gornja Letina	\N	82
1508	Gradusa Posavska	\N	82
1509	Greda Sunjska	\N	82
1510	Ivanjski Bok	\N	82
1511	Jasenovčani	\N	82
1512	Kinjačka	\N	82
1513	Kladari	\N	82
1514	Kostreši Šaški	\N	82
1515	Krivaj Sunjski	\N	82
1516	Mala Gradusa	\N	82
1517	Mala Paukova	\N	82
1518	Novoselci	\N	82
1519	Papići	\N	82
1520	Petrinjci	\N	82
1521	Pobrđani	\N	82
1522	Radonja Luka	\N	82
1523	Selišće Sunjsko	\N	82
1524	Sjeverovac	\N	82
1525	Slovinci	\N	82
1526	Staza	\N	82
1527	Strmen	\N	82
1528	Sunja	\N	82
1529	Šaš	\N	82
1530	Timarci	\N	82
1531	Vedro Polje	\N	82
1532	Velika Gradusa	\N	82
1533	Vukoševac	\N	82
1534	Žreme	\N	82
1535	Batinova Kosa	\N	83
1536	Bukovica	\N	83
1537	Crni Potok	\N	83
1538	Donja Čemernica	\N	83
1539	Gređani	\N	83
1540	Hrvatsko Selo	\N	83
1541	Katinovac	\N	83
1542	Mala Vranovina	\N	83
1543	Malička	\N	83
1544	Pecka	\N	83
1545	Perna	\N	83
1546	Ponikvari	\N	83
1547	Staro Selo Topusko	\N	83
1548	Topusko	\N	83
1549	Velika Vranovina	\N	83
1550	Vorkapić	\N	83
1551	Gornja Vlahinićka	\N	84
1552	Grabričina	\N	84
1553	Grabrov Potok	\N	84
1554	Katoličko Selišće	\N	84
1555	Kompator	\N	84
1556	Ludinica	\N	84
1557	Mala Ludina	\N	84
1558	Mustafina Klada	\N	84
1559	Okoli	\N	84
1560	Ruškovica	\N	84
1561	Velika Ludina	\N	84
1562	Vidrenjak	\N	84
1563	Ciglenica	\N	85
1564	Donja Gračenica	\N	85
1565	Donja Jelenska	\N	85
1566	Donja Vlahinička	\N	85
1567	Gornja Gračenica	\N	85
1568	Gornja Jelenska	\N	85
1569	Moslavačka Slatina	\N	85
1570	Osekovo	\N	85
1571	Podbrđe	\N	85
1572	Popovača	\N	85
1573	Potok	\N	85
1574	Stružec	\N	85
1575	Voloder	\N	85
1576	Belajska Vinica	\N	86
1577	Belavići	\N	86
1578	Bošt	\N	86
1579	Cerovački Galovići	\N	86
1580	Donje Mrzlo Polje	\N	86
1581	Donji Zvečaj	\N	86
1582	Duga Resa	\N	86
1583	Dvorjanci	\N	86
1584	Galović Selo	\N	86
1585	Gorica	\N	86
1586	Gornje Mrzlo Polje	\N	86
1587	Grganjica	\N	86
1588	Gršćaki	\N	86
1589	Kozalj Vrh	\N	86
1590	Lišnica	\N	86
1591	Mihalić Selo	\N	86
1592	Mrežničke Poljice	\N	86
1593	Mrežnički Brig	\N	86
1594	Mrežnički Novaki	\N	86
1595	Mrežnički Varoš	\N	86
1596	Mrežničko	\N	86
1597	Mrežničko Dvorište	\N	86
1598	Novo Brdo Mrežničko	\N	86
1599	Pećurkovo Brdo	\N	86
1600	Petrakovo Brdo	\N	86
1601	Sveti Petar Mrežnički	\N	86
1602	Šeketino Brdo	\N	86
1603	Venac Mrežnički	\N	86
1604	Zvečaj	\N	86
1605	Banska Selnica	\N	87
1606	Banski Moravci	\N	87
1607	Blatnica Pokupska	\N	87
1608	Brezova Glava	\N	87
1609	Brežani	\N	87
1610	Duga Resa	\N	87
1611	Cerovac Vukmanićki	\N	87
1612	Donja Trebinja	\N	87
1613	Donje Mekušje	\N	87
1614	Donji Sjeničak	\N	87
1615	Gornja Trebinja	\N	87
1616	Gornje Stative	\N	87
1617	Gornji Sjeničak	\N	87
1618	Goršćaki	\N	87
1619	Husje	\N	87
1620	Ivančići Pokupski	\N	87
1621	Ivanković Selo	\N	87
1622	Ivošević Selo	\N	87
1623	Kablar	\N	87
1624	Karasi	\N	87
1625	Karlovac	\N	87
1626	Klipino Brdo	\N	87
1627	Kljaić Brdo	\N	87
1628	Knez Gorica	\N	87
1629	Kobilić Pokupski	\N	87
1630	Konjkovsko	\N	87
1631	Koritinja	\N	87
1632	Ladvenjak	\N	87
1633	Lipje	\N	87
1634	Luka Pokupska	\N	87
1635	Mahićno	\N	87
1636	Manjerovići	\N	87
1637	Okić	\N	87
1638	Popović Brdo	\N	87
1639	Priselci	\N	87
1640	Rečica	\N	87
1641	Ribari	\N	87
1642	Skakavac	\N	87
1643	Slunjska Selnica	\N	87
1644	Slunjski Moravci	\N	87
1645	Šebreki	\N	87
1646	Šišljavić	\N	87
1647	Tušilović	\N	87
1648	Tuškani	\N	87
1649	Udbinja	\N	87
1650	Utinja	\N	87
1651	Vodostaj	\N	87
1652	Vukmanić	\N	87
1653	Vukoder	\N	87
1654	Zadobarje	\N	87
1655	Zagraj	\N	87
1656	Zamršje	\N	87
1657	Desmerice	\N	88
1658	Donje Dubrave	\N	88
1659	Donje Zagorje	\N	88
1660	Drežnica	\N	88
1661	Dujmić Selo	\N	88
1662	Gornje Dubrave	\N	88
1663	Gornje Zagorje	\N	88
1664	Hreljin Ogulinski	\N	88
1665	Jasenak	\N	88
1666	Marković Selo	\N	88
1667	Ogulin	\N	88
1668	Otok Oštarijski	\N	88
1669	Ponikve	\N	88
1670	Popovo Selo	\N	88
1671	Potok Musulinski	\N	88
1672	Puškarići	\N	88
1673	Ribarići	\N	88
1674	Sabljak Selo	\N	88
1675	Salopek Selo	\N	88
1676	Sveti Petar	\N	88
1677	Trošmarija	\N	88
1678	Turkovići Ogulinski	\N	88
1679	Vitunj	\N	88
1680	Zagorje	\N	88
1681	Badovinci	\N	89
1682	Belinsko Selo	\N	89
1683	Belošići	\N	89
1684	Boševci	\N	89
1685	Brašljevica	\N	89
1686	Bratovanci	\N	89
1687	Brezje Vivodinsko	\N	89
1688	Breznik	\N	89
1689	Brezovica Žumberačka	\N	89
1690	Budim Vivodinski	\N	89
1691	Bulići	\N	89
1692	Cerje Vivodinsko	\N	89
1693	Cvetišće	\N	89
1694	Dančulovići	\N	89
1695	Dojutrovica	\N	89
1696	Doljani Žumberački	\N	89
1697	Donji Lović	\N	89
1698	Donji Oštri Vrh Ozaljski	\N	89
1699	Dragoševci	\N	89
1700	Dučići	\N	89
1701	Durlinci	\N	89
1702	Dvorišće Ozaljsko	\N	89
1703	Dvorišće Vivodinsko	\N	89
1704	Ferenci	\N	89
1705	Fratrovci Ozaljski	\N	89
1706	Furjanići	\N	89
1707	Galezova Draga	\N	89
1708	Galin	\N	89
1709	Goleši Žumberački	\N	89
1710	Goli Vrh Ozaljski	\N	89
1711	Gorniki Vivodinski	\N	89
1712	Gornje Pokupje	\N	89
1713	Gornji Lović	\N	89
1714	Gornji Oštri Vrh Ozaljski	\N	89
1715	Goršćaki Ozaljski	\N	89
1716	Grandić Breg	\N	89
1717	Grdun	\N	89
1718	Gudalji	\N	89
1719	Hodinci	\N	89
1720	Hrastovica Vivodinska	\N	89
1721	Ilovac	\N	89
1722	Jaškovo	\N	89
1723	Kamenci	\N	89
1724	Kašt	\N	89
1725	Keseri	\N	89
1726	Kuljaji	\N	89
1727	Kunčani	\N	89
1728	Levkušje	\N	89
1729	Liješće	\N	89
1730	Lović Prekriški	\N	89
1731	Lukšići Ozaljski	\N	89
1732	Lukunić Draga	\N	89
1733	Mali Erjavec	\N	89
1734	Malinci	\N	89
1735	Novaki Ozaljski	\N	89
1736	Obrež Vivodinski	\N	89
1737	Ozalj	\N	89
1738	Pećarići	\N	89
1739	Petruš Vrh	\N	89
1740	Pilatovci	\N	89
1741	Podbrežje	\N	89
1742	Podgraj	\N	89
1743	Police Pirišće	\N	89
1744	Polje Ozaljsko	\N	89
1745	Popovići Žumberački	\N	89
1746	Požun	\N	89
1747	Radatovići	\N	89
1748	Radina Vas	\N	89
1749	Rajakovići	\N	89
1750	Rujevo	\N	89
1751	Sekulići	\N	89
1752	Slapno	\N	89
1753	Soldatići	\N	89
1754	Sršići	\N	89
1755	Stojavnica	\N	89
1756	Svetice	\N	89
1757	Svetičko Hrašće	\N	89
1758	Šiljki	\N	89
1759	Škaljevica	\N	89
1760	Tomašnica	\N	89
1761	Trešćerovac	\N	89
1762	Trg	\N	89
1763	Varaštovac	\N	89
1764	Veliki Erjavec	\N	89
1765	Vini Vrh	\N	89
1766	Vivodina	\N	89
1767	Vrbanska Draga	\N	89
1768	Vrh Ozaljski	\N	89
1769	Vrhovac	\N	89
1770	Vrhovački Sopot	\N	89
1771	Vrškovac	\N	89
1772	Vuketić	\N	89
1773	Vuksani	\N	89
1774	Zajačko Selo	\N	89
1775	Zaluka	\N	89
1776	Zorkovac	\N	89
1777	Zorkovac na Kupi	\N	89
1778	Zorkovac Vivodinski	\N	89
1779	Arapovac	\N	90
1780	Bandino Selo	\N	90
1781	Blagaj	\N	90
1782	Bukovac Perjasički	\N	90
1783	Crno Vrelo	\N	90
1784	Cvijanović Brdo	\N	90
1785	Cvitović	\N	90
1786	Čamerovac	\N	90
1787	Donja Glina	\N	90
1788	Donja Visočka	\N	90
1789	Donje Primišlje	\N	90
1790	Donje Taborište	\N	90
1791	Donji Cerovac	\N	90
1792	Donji Furjan	\N	90
1793	Donji Kremen	\N	90
1794	Donji Lađevac	\N	90
1795	Donji Nikšić	\N	90
1796	Donji Poloj	\N	90
1797	Donji Popovac	\N	90
1798	Dubrave	\N	90
1799	Glinsko Vrelo	\N	90
1800	Gornja Glina	\N	90
1801	Gornja Visočka	\N	90
1802	Gornje Primišlje	\N	90
1803	Gornje Taborište	\N	90
1804	Gornji Cerovac	\N	90
1805	Gornji Furjan	\N	90
1806	Gornji Kremen	\N	90
1807	Gornji Lađevac	\N	90
1808	Gornji Nikšić	\N	90
1809	Gornji Popovac	\N	90
1810	Grobnik	\N	90
1811	Jame	\N	90
1812	Klanac Perjasički	\N	90
1813	Kosa	\N	90
1814	Kosijer Selo	\N	90
1815	Kutanja	\N	90
1816	Kuzma Perjasička	\N	90
1817	Lađevačko Selište	\N	90
1818	Lapovac	\N	90
1819	Lumbardenik	\N	90
1820	Mali Vuković	\N	90
1821	Marindolsko Brdo	\N	90
1822	Miljevac	\N	90
1823	Mjesto Primišlje	\N	90
1824	Novo Selo	\N	90
1825	Pavlovac	\N	90
1826	Podmelnica	\N	90
1827	Polje	\N	90
1828	Rabinja	\N	90
1829	Rastoke	\N	90
1830	Salopek Luke	\N	90
1831	Sastavak	\N	90
1832	Slunj	\N	90
1833	Slunjčica	\N	90
1834	Snos	\N	90
1835	Sparednjak	\N	90
1836	Stojmerić	\N	90
1837	Šlivnjak	\N	90
1838	Točak	\N	90
1839	Tržić Primišljanski	\N	90
1840	Veljun	\N	90
1841	Veljunska Glina	\N	90
1842	Veljunski Ponorac	\N	90
1843	Videkić Selo	\N	90
1844	Zapoljak	\N	90
1845	Zečev Varoš	\N	90
1846	Banjsko Selo	\N	91
1847	Barilović	\N	91
1848	Belaj	\N	91
1849	Belajske Poljice	\N	91
1850	Belajski Malinci	\N	91
1851	Carevo Selo	\N	91
1852	Cerovac Barilovićki	\N	91
1853	Donja Perjasica	\N	91
1854	Donji Skrad	\N	91
1855	Donji Velemerić	\N	91
1856	Gaćeško Selo	\N	91
1857	Gornji Poloj	\N	91
1858	Gornji Velemerić	\N	91
1859	Kestenak	\N	91
1860	Koranska Strana	\N	91
1861	Koranski Brijeg	\N	91
1862	Koransko Selo	\N	91
1863	Kosijersko Selo	\N	91
1864	Križ Koranski	\N	91
1865	Leskovac Barilovićki	\N	91
1866	Lučica	\N	91
1867	Mala Kosa	\N	91
1868	Mali Kozinac	\N	91
1869	Marlovac	\N	91
1870	Maurovići	\N	91
1871	Miloševac	\N	91
1872	Mrežnica	\N	91
1873	Novi Dol	\N	91
1874	Novo Selo Perjasičko	\N	91
1875	Orijevac	\N	91
1876	Perjasica	\N	91
1877	Podvožić	\N	91
1878	Ponorac Perjasički	\N	91
1879	Potplaninsko	\N	91
1880	Siča	\N	91
1881	Srednji Poloj	\N	91
1882	Svojić	\N	91
1883	Šćulac	\N	91
1884	Štirkovac	\N	91
1885	Točak Perjasički	\N	91
1886	Veliki Kozinac	\N	91
1887	Vijenac Barilovićki	\N	91
1888	Zinajevac	\N	91
1889	Žabljak	\N	91
1890	Beč	\N	92
1891	Bitorajci	\N	92
1892	Bosanci	\N	92
1893	Bosiljevo	\N	92
1894	Dani	\N	92
1895	Dugače	\N	92
1896	Fratrovci	\N	92
1897	Fučkovac	\N	92
1898	Glavica	\N	92
1899	Grabrk	\N	92
1900	Hrsina	\N	92
1901	Jančani	\N	92
1902	Johi	\N	92
1903	Kasuni	\N	92
1904	Korenić Brdo	\N	92
1905	Kraljevo Selo	\N	92
1906	Krč Bosiljevski	\N	92
1907	Laslavići	\N	92
1908	Lipovšćaki	\N	92
1909	Lisičina Gorica	\N	92
1910	Malik	\N	92
1911	Mateše	\N	92
1912	Milani	\N	92
1913	Novo Selo Bosiljevsko	\N	92
1914	Orišje	\N	92
1915	Otok na Dobri	\N	92
1916	Podrebar	\N	92
1917	Podumol	\N	92
1918	Potok Bosiljevski	\N	92
1919	Pribanjci	\N	92
1920	Rendulići	\N	92
1921	Resnik Bosiljevski	\N	92
1922	Sela Bosiljevska	\N	92
1923	Skoblić Brdo	\N	92
1924	Soline	\N	92
1925	Spahići	\N	92
1926	Strgari	\N	92
1927	Špehari	\N	92
1928	Umol	\N	92
1929	Varoš Bosiljevska	\N	92
1930	Vodena Draga	\N	92
1931	Vrhova Gorica	\N	92
1932	Žubrinci	\N	92
1933	Batnoga	\N	93
1934	Begovo Brdo	\N	93
1935	Bilo	\N	93
1936	Bogovolja	\N	93
1937	Buhača	\N	93
1938	Cetingrad	\N	93
1939	Cetinski Varoš	\N	93
1940	Delić Poljana	\N	93
1941	Donja Žrvnica	\N	93
1942	Donje Gnojnice	\N	93
1943	Đurin Potok	\N	93
1944	Glinice	\N	93
1945	Gnojnice	\N	93
1946	Gojkovac	\N	93
1947	Gornja Žrvnica	\N	93
1948	Gornje Gnojnice	\N	93
1949	Grabarska	\N	93
1950	Kapljuv	\N	93
1951	Kestenje	\N	93
1952	Komesarac	\N	93
1953	Kruškovača	\N	93
1954	Kuk	\N	93
1955	Luke	\N	93
1956	Maljevac	\N	93
1957	Maljevačko Selište	\N	93
1958	Pašin Potok	\N	93
1959	Podcetin	\N	93
1960	Polojski Varoš	\N	93
1961	Ponor	\N	93
1962	Ruševica	\N	93
1963	Sadikovac	\N	93
1964	Srednje Selo	\N	93
1965	Strmačka	\N	93
1966	Šiljkovača	\N	93
1967	Tatar Varoš	\N	93
1968	Trnovi	\N	93
1969	Draganić	\N	94
1970	Brcković Draga	\N	95
1971	Crno Kamanje	\N	95
1972	Dobrenići	\N	95
1973	Donje Bukovlje	\N	95
1974	Duga Gora	\N	95
1975	Erdelj	\N	95
1976	Generalski Stol	\N	95
1977	Goričice Dobranske	\N	95
1978	Gorinci	\N	95
1979	Gornje Bukovlje	\N	95
1980	Gornji Zvečaj	\N	95
1981	Gradišće	\N	95
1982	Jankovo Selište	\N	95
1983	Keići	\N	95
1984	Lešće	\N	95
1985	Lipa	\N	95
1986	Lipov Pesak	\N	95
1987	Mateško Selo	\N	95
1988	Mrežnički Brest	\N	95
1989	Petrunići	\N	95
1990	Protulipa	\N	95
1991	Radočaji	\N	95
1992	Sarovo	\N	95
1993	Skukani	\N	95
1994	Tomašići	\N	95
1995	Trnovo	\N	95
1996	Carevo Polje	\N	96
1997	Cerovnik	\N	96
1998	Istočni Trojvrh	\N	96
1999	Josipdol	\N	96
2000	Modruš	\N	96
2001	Munjava	\N	96
2002	Munjava Modruška	\N	96
2003	Oštarije	\N	96
2004	Sabljaki Modruški	\N	96
2005	Salopeki Modruški	\N	96
2006	Skradnik	\N	96
2007	Trojvrh	\N	96
2008	Vajin Vrh	\N	96
2009	Vojnovac	\N	96
2010	Brlog Ozaljski	\N	97
2011	Kamanje	\N	97
2012	Mali Vrh Kamanjski	\N	97
2013	Orljakovo	\N	97
2014	Preseka Ozaljska	\N	97
2015	Reštovo	\N	97
2016	Veliki Vrh Kamanjski	\N	97
2017	Bijeli Klanac	\N	98
2018	Brebornica	\N	98
2019	Budačka Rijeka	\N	98
2020	Burić Selo	\N	98
2021	Čatrnja	\N	98
2022	Donji Budački	\N	98
2023	Dugi Dol	\N	98
2024	Dvorište	\N	98
2025	Gornji Budački	\N	98
2026	Gornji Skrad	\N	98
2027	Grabovac Krnjački	\N	98
2028	Grabovac Vojnićki	\N	98
2029	Hrvatsko Žarište	\N	98
2030	Jasnić Brdo	\N	98
2031	Keserov Potok	\N	98
2032	Krnjak	\N	98
2033	Mala Crkvina	\N	98
2034	Mlakovac	\N	98
2035	Pavković Selo	\N	98
2036	Perići	\N	98
2037	Podgorje Krnjačko	\N	98
2038	Poljana Vojnićka	\N	98
2039	Ponorac	\N	98
2040	Rastovac Budački	\N	98
2041	Suhodol Budački	\N	98
2042	Trupinjak	\N	98
2043	Velika Crkvina	\N	98
2044	Vojnović Brdo	\N	98
2045	Zagorje	\N	98
2046	Zimić	\N	98
2047	Banski Kovačevac	\N	99
2048	Crna Draga	\N	99
2049	Desni Štefanki	\N	99
2050	Desno Sredičko	\N	99
2051	Lasinja	\N	99
2052	Novo Selo Lasinjsko	\N	99
2053	Prkos Lasinjski	\N	99
2054	Sjeničak Lasinjski	\N	99
2055	Baići	\N	100
2056	Bogovci	\N	100
2057	Brajakovo Brdo	\N	100
2058	Bukovje Netretićko	\N	100
2059	Culibrki	\N	100
2060	Donje Prilišće	\N	100
2061	Donje Stative	\N	100
2062	Dubravci	\N	100
2063	Dubravčani	\N	100
2064	Frketić Selo	\N	100
2065	Goli Vrh Netretićki	\N	100
2066	Gornje Prilišće	\N	100
2067	Jakovci Netretićki	\N	100
2068	Jarče Polje	\N	100
2069	Kolenovac	\N	100
2070	Kučevice	\N	100
2071	Kunići Ribnički	\N	100
2072	Ladešići	\N	100
2073	Lončar Brdo	\N	100
2074	Lonjgari	\N	100
2075	Maletići	\N	100
2076	Mali Modruš Potok	\N	100
2077	Mračin	\N	100
2078	Mrzljaki	\N	100
2079	Netretić	\N	100
2080	Novigrad na Dobri	\N	100
2081	Pavičići	\N	100
2082	Piščetke	\N	100
2083	Planina Kunićka	\N	100
2084	Račak	\N	100
2085	Rešetarevo	\N	100
2086	Rosopajnik	\N	100
2087	Skupica	\N	100
2088	Srednje Prilišće	\N	100
2089	Straža	\N	100
2090	Tončići	\N	100
2091	Veliki Modruš Potok	\N	100
2092	Vinski Vrh	\N	100
2093	Vukova Gorica	\N	100
2094	Zaborsko Selo	\N	100
2095	Zagradci	\N	100
2096	Završje Netretićko	\N	100
2097	Janja Gora	\N	101
2098	Jezero I. Dio	\N	101
2099	Kunić	\N	101
2100	Lapat	\N	101
2101	Latin	\N	101
2102	Međeđak	\N	101
2103	Plaški	\N	101
2104	Pothum Plaščanski	\N	101
2105	Basara	\N	102
2106	Brajdić Selo	\N	102
2107	Brezovac	\N	102
2108	Broćanac	\N	102
2109	Čatrnja	\N	102
2110	Ćuić Brdo	\N	102
2111	Drage	\N	102
2112	Drežnik Grad	\N	102
2113	Gornja Močila	\N	102
2114	Grabovac	\N	102
2115	Irinovac	\N	102
2116	Jamarje	\N	102
2117	Jelov Klanac	\N	102
2118	Koranski Lug	\N	102
2119	Kordunski Ljeskovac	\N	102
2120	Korita	\N	102
2121	Lipovac	\N	102
2122	Lipovača	\N	102
2123	Mašvina	\N	102
2124	Nova Kršlja	\N	102
2125	Oštarski Stanovi	\N	102
2126	Rakovica	\N	102
2127	Rakovičko Selište	\N	102
2128	Sadilovac	\N	102
2129	Selište Drežničko	\N	102
2130	Stara Kršlja	\N	102
2131	Donja Stranica	\N	103
2132	Drenovica Lipnička	\N	103
2133	Gorica Lipnička	\N	103
2134	Gornja Stranica	\N	103
2135	Gornji Goli Vrh Lipnički	\N	103
2136	Griče	\N	103
2137	Jarnevići	\N	103
2138	Jasenovica	\N	103
2139	Lipnik	\N	103
2140	Martinski Vrh	\N	103
2141	Novaki Lipnički	\N	103
2142	Obrh	\N	103
2143	Ravnica	\N	103
2144	Ribnik	\N	103
2145	Skradsko Selo	\N	103
2146	Sopčić Vrh	\N	103
2147	Veselići	\N	103
2148	Begovac	\N	104
2149	Blata	\N	104
2150	Lička Jesenica	\N	104
2151	Saborsko	\N	104
2152	Gerovo Tounjsko	\N	105
2153	Kamenica Skradnička	\N	105
2154	Potok Tounjski	\N	105
2155	Rebrovići	\N	105
2156	Tounj	\N	105
2157	Tržić Tounjski	\N	105
2158	Zdenac	\N	105
2159	Brdo Utinjsko	\N	106
2160	Bukovica Utinjska	\N	106
2161	Donja Brusovača	\N	106
2162	Dunjak	\N	106
2163	Džaperovac	\N	106
2164	Gačeša Selo	\N	106
2165	Gejkovac	\N	106
2166	Gornja Brusovača	\N	106
2167	Jagrovac	\N	106
2168	Johovo	\N	106
2169	Jurga	\N	106
2170	Kartalije	\N	106
2171	Kestenovac	\N	106
2172	Klokoč	\N	106
2173	Klupica	\N	106
2174	Ključar	\N	106
2175	Knežević Kosa	\N	106
2176	Kokirevo	\N	106
2177	Kolarić	\N	106
2178	Krivaja Vojnićka	\N	106
2179	Krstinja	\N	106
2180	Kupljensko	\N	106
2181	Kusaja	\N	106
2182	Lipovac Krstinjski	\N	106
2183	Lisine	\N	106
2184	Loskunja	\N	106
2185	Malešević Selo	\N	106
2186	Mandić Selo	\N	106
2187	Međeđak Utinjski	\N	106
2188	Miholjsko	\N	106
2189	Mracelj	\N	106
2190	Mračaj Krstinjski	\N	106
2191	Petrova Poljana	\N	106
2192	Podsedlo	\N	106
2193	Prisjeka	\N	106
2194	Radmanovac	\N	106
2195	Radonja	\N	106
2196	Rajić Brdo	\N	106
2197	Selakova Poljana	\N	106
2198	Svinica Krstinjska	\N	106
2199	Široka Rijeka	\N	106
2200	Štakorovica	\N	106
2201	Utinja Vrelo	\N	106
2202	Vojišnica	\N	106
2203	Vojnić	\N	106
2204	Živković Kosa	\N	106
2205	Breznik Žakanjski	\N	107
2206	Brihovo	\N	107
2207	Bubnjarački Brod	\N	107
2208	Bubnjarci	\N	107
2209	Donji Bukovac Žakanjski	\N	107
2210	Ertić	\N	107
2211	Gornji Bukovac Žakanjski	\N	107
2212	Jadrići	\N	107
2213	Jugovac	\N	107
2214	Jurovo	\N	107
2215	Jurovski Brod	\N	107
2216	Kohanjac	\N	107
2217	Mala Paka	\N	107
2218	Mišinci	\N	107
2219	Mošanci	\N	107
2220	Pravutina	\N	107
2221	Sela Žakanjska	\N	107
2222	Sračak	\N	107
2223	Stankovci	\N	107
2224	Velika Paka	\N	107
2225	Zaluka Lipnička	\N	107
2226	Žakanje	\N	107
2227	Bedenec	\N	108
2228	Cerje Tužno	\N	108
2229	Gačice	\N	108
2230	Gečkovec	\N	108
2231	Horvatsko	\N	108
2232	Ivanec	\N	108
2233	Ivanečka Željeznica	\N	108
2234	Ivanečki Vrhovec	\N	108
2235	Ivanečko Naselje	\N	108
2236	Jerovec	\N	108
2237	Kaniža	\N	108
2238	Knapić	\N	108
2239	Lančić	\N	108
2240	Lovrečan	\N	108
2241	Lukavec	\N	108
2242	Margečan	\N	108
2243	Osečka	\N	108
2244	Pece	\N	108
2245	Prigorec	\N	108
2246	Punikve	\N	108
2247	Radovan	\N	108
2248	Ribić Breg	\N	108
2249	Salinovec	\N	108
2250	Seljanec	\N	108
2251	Stažnjevec	\N	108
2252	Škriljevec	\N	108
2253	Vitešinec	\N	108
2254	Vuglovec	\N	108
2255	Željeznica	\N	108
2256	Bednjica	\N	109
2257	Crkovec	\N	109
2258	Donja Višnjica	\N	109
2259	Gornja Višnjica	\N	109
2260	Jazbina Višnjička	\N	109
2261	Kamenica	\N	109
2262	Kamenički Vrhovec	\N	109
2263	Kameničko Podgorje	\N	109
2264	Lepoglava	\N	109
2265	Muričevec	\N	109
2266	Očura	\N	109
2267	Viletinec	\N	109
2268	Vulišinec	\N	109
2269	Zalužje	\N	109
2270	Zlogonje	\N	109
2271	Žarovnica	\N	109
2272	Apatija	\N	110
2273	Bolfan	\N	110
2274	Čukovec	\N	110
2275	Globočec Ludbreški	\N	110
2276	Hrastovsko	\N	110
2277	Kućan Ludbreški	\N	110
2278	Ludbreg	\N	110
2279	Poljanec	\N	110
2280	Segovina	\N	110
2281	Selnik	\N	110
2282	Sigetec Ludbreški	\N	110
2283	Slokovec	\N	110
2284	Vinogradi Ludbreški	\N	110
2285	Bela	\N	111
2286	Donje Makojišće	\N	111
2287	Filipići	\N	111
2288	Gornje Makojišće	\N	111
2289	Grana	\N	111
2290	Jelenščak	\N	111
2291	Kamena Gorica	\N	111
2292	Ključ	\N	111
2293	Krč	\N	111
2294	Madžarevo	\N	111
2295	Možđenec	\N	111
2296	Novi Marof	\N	111
2297	Orehovec	\N	111
2298	Oštrice	\N	111
2299	Paka	\N	111
2300	Podevčevo	\N	111
2301	Podrute	\N	111
2302	Presečno	\N	111
2303	Remetinec	\N	111
2304	Strmec Remetinečki	\N	111
2305	Sudovec	\N	111
2306	Topličica	\N	111
2307	Završje Podbelsko	\N	111
2308	Črnec Biškupečki	\N	112
2309	Donji Kućan	\N	112
2310	Gojanec	\N	112
2311	Gornji Kućan	\N	112
2312	Hrašćica	\N	112
2313	Jalkovec	\N	112
2314	Kućan Marof	\N	112
2315	Poljana Biškupečka	\N	112
2316	Varaždin	\N	112
2317	Zbelava	\N	112
2318	Boričevec Toplički Črnile	\N	113
2319	Čurilovec	\N	113
2320	Donja Poljana	\N	113
2321	Drenovec	\N	113
2322	Gornja Poljana	\N	113
2323	Grešćevina	\N	113
2324	Hrastovec Toplički	\N	113
2325	Jalševec Svibovečki	\N	113
2326	Jarki Horvatićevi	\N	113
2327	Leskovec Toplički	\N	113
2328	Lovrentovec	\N	113
2329	Lukačevec Toplički	\N	113
2330	Martinkovec	\N	113
2331	Petkovec Toplički	\N	113
2332	Pišćanovec	\N	113
2333	Retkovec Svibovečki	\N	113
2334	Rukljevina	\N	113
2335	Svibovec	\N	113
2336	Škarnik	\N	113
2337	Tuhovec	\N	113
2338	Varaždinske Toplice	\N	113
2339	Vrtlinovec	\N	113
2340	Bednja	\N	114
2341	Benkovec	\N	114
2342	Brezova Gora	\N	114
2343	Cvetlin	\N	114
2344	Jamno	\N	114
2345	Jazbina Cvetlinska	\N	114
2346	Ježovec	\N	114
2347	Mali Gorenec	\N	114
2348	Meljan	\N	114
2349	Osonjak	\N	114
2350	Pašnik	\N	114
2351	Pleš	\N	114
2352	Podgorje Bednjansko	\N	114
2353	Prebukovje	\N	114
2354	Purga Bednjanska	\N	114
2355	Rinkovec	\N	114
2356	Sveti Josip	\N	114
2357	Šaša	\N	114
2358	Šinkovica Bednjanska	\N	114
2359	Šinkovica Šaška	\N	114
2360	Trakošćan	\N	114
2361	Veliki Gorenec	\N	114
2362	Vranojelje	\N	114
2363	Vrbno	\N	114
2364	Vrhovec Bednjanski	\N	114
2365	Beretinec	\N	115
2366	Črešnjevo	\N	115
2367	Ledinec	\N	115
2368	Bisag	\N	116
2369	Borenec	\N	116
2370	Breznica	\N	116
2371	Čret Bisaški	\N	116
2372	Drašković	\N	116
2373	Jales Breznički	\N	116
2374	Jarek Bisaški	\N	116
2375	Mirkovec Breznički	\N	116
2376	Podvorec	\N	116
2377	Tkalec	\N	116
2378	Breznički Hum	\N	117
2379	Butkovec	\N	117
2380	Krščenovec	\N	117
2381	Radešić	\N	117
2382	Šćepanje	\N	117
2383	Babinec	\N	118
2384	Brezje Dravsko	\N	118
2385	Cestica	\N	118
2386	Dubrava Križovljanska	\N	118
2387	Falinić Breg	\N	118
2388	Gornje Vratno	\N	118
2389	Jarki	\N	118
2390	Kolarovec	\N	118
2391	Križanče	\N	118
2392	Križovljan Radovečki	\N	118
2393	Mali Lovrečan	\N	118
2394	Malo Gradišće	\N	118
2395	Natkrižovljan	\N	118
2396	Otok Virje	\N	118
2397	Radovec	\N	118
2398	Radovec Polje	\N	118
2399	Selci Križovljanski	\N	118
2400	Veliki Lovrečan	\N	118
2401	Virje Križovljansko	\N	118
2402	Vratno Otok	\N	118
2403	Budinščak	\N	119
2404	Donja Voća	\N	119
2405	Fotez Breg	\N	119
2406	Gornja Voća	\N	119
2407	Jelovec Voćanski	\N	119
2408	Plitvica Voćanska	\N	119
2409	Rijeka Voćanska	\N	119
2410	Slivarsko	\N	119
2411	Donji Kneginec	\N	120
2412	Gornji Kneginec	\N	120
2413	Lužan Biškupečki	\N	120
2414	Turčin	\N	120
2415	Varaždin Breg	\N	120
2416	Imbriovec Jalžabetski	\N	121
2417	Jakopovec	\N	121
2418	Jalžabet	\N	121
2419	Kaštelanec	\N	121
2420	Kelemen	\N	121
2421	Leštakovec	\N	121
2422	Novakovec	\N	121
2423	Pihovec	\N	121
2424	Dubravec	\N	122
2425	Goranec	\N	122
2426	Klenovnik	\N	122
2427	Lipovnik	\N	122
2428	Plemenšćina	\N	122
2429	Vukovoj	\N	122
2430	Kapela Kalnička	\N	123
2431	Ljubelj	\N	123
2432	Ljubelj Kalnički	\N	123
2433	Ljubešćica	\N	123
2434	Rakovec	\N	123
2435	Lunjkovec	\N	124
2436	Mali Bukovec	\N	124
2437	Martinić	\N	124
2438	Novo Selo Podravsko	\N	124
2439	Sveti Petar	\N	124
2440	Županec	\N	124
2441	Čičkovina	\N	125
2442	Gornji Martijanec	\N	125
2443	Hrastovljan	\N	125
2444	Križovljan	\N	125
2445	Madaraševec	\N	125
2446	Martijanec	\N	125
2447	Rivalno	\N	125
2448	Slanje	\N	125
2449	Sudovčina	\N	125
2450	Vrbanovec	\N	125
2451	Bikovec	\N	126
2452	Biljevec	\N	126
2453	Brodarovec	\N	126
2454	Cerje Nebojse	\N	126
2455	Čalinec	\N	126
2456	Donje Ladanje	\N	126
2457	Druškovec	\N	126
2458	Greda	\N	126
2459	Jurketinec	\N	126
2460	Kapelec	\N	126
2461	Korenjak	\N	126
2462	Koretinec	\N	126
2463	Koškovec	\N	126
2464	Maruševec	\N	126
2465	Novaki	\N	126
2466	Selnik	\N	126
2467	Donje Vratno	\N	127
2468	Družbinec	\N	127
2469	Majerje	\N	127
2470	Nova Ves Petrijanečka	\N	127
2471	Petrijanec	\N	127
2472	Strmec Podravski	\N	127
2473	Zelendvor	\N	127
2474	Sračinec	\N	128
2475	Svibovec Podravski	\N	128
2476	Hrženica	\N	129
2477	Karlovec Ludbreški	\N	129
2478	Komarnica Ludbreška	\N	129
2479	Luka Ludbreška	\N	129
2480	Obrankovec	\N	129
2481	Priles	\N	129
2482	Sesvete Ludbreške	\N	129
2483	Struga	\N	129
2484	Sveti Đurđ	\N	129
2485	Beletinec	\N	130
2486	Doljan	\N	130
2487	Križanec	\N	130
2488	Krušljevec	\N	130
2489	Seketin	\N	130
2490	Sveti Ilija	\N	130
2491	Tomaševec Biškupečki	\N	130
2492	Žigrovec	\N	130
2493	Bartolovec	\N	131
2494	Šemovec	\N	131
2495	Štefanec	\N	131
2496	Trnovec	\N	131
2497	Zamlaka	\N	131
2498	Žabnik	\N	131
2499	Dubovica	\N	132
2500	Kapela Podravska	\N	132
2501	Veliki Bukovec	\N	132
2502	Budislavec	\N	133
2503	Cargovec	\N	133
2504	Domitrovec	\N	133
2505	Krkanec	\N	133
2506	Nedeljanec	\N	133
2507	Papinec	\N	133
2508	Prekno	\N	133
2509	Šijanec	\N	133
2510	Tužno	\N	133
2511	Vidovec	\N	133
2512	Zamlača	\N	133
2513	Donje Vratno	\N	134
2514	Gornje Ladanje	\N	134
2515	Goruševnjak	\N	134
2516	Marčan	\N	134
2517	Pešćenica Vinička	\N	134
2518	Vinica	\N	134
2519	Vinica Breg	\N	134
2520	Čanjevo	\N	135
2521	Đurinovec	\N	135
2522	Kračevec	\N	135
2523	Presečno Visočko	\N	135
2524	Vinično	\N	135
2525	Visoko	\N	135
2526	Vrh Visočki	\N	135
2527	Budrovac	\N	136
2528	Čepelovac	\N	136
2529	Đurđevac	\N	136
2530	Grkine	\N	136
2531	Mičetinac	\N	136
2532	Severovci	\N	136
2533	Sirova Katalena	\N	136
2534	Suha Katalena	\N	136
2535	Sveta Ana	\N	136
2536	Bakovčica	\N	137
2537	Draganovec	\N	137
2538	Herešin	\N	137
2539	Jagnjedovec	\N	137
2540	Koprivnica	\N	137
2541	Kunovec Breg	\N	137
2542	Reka	\N	137
2543	Starigrad	\N	137
2544	Štaglinec	\N	137
2545	Apatovec	\N	138
2546	Beketinec	\N	138
2547	Bojnikovec	\N	138
2548	Bukovje Križevačko	\N	138
2549	Carevdar	\N	138
2550	Cubinec	\N	138
2551	Čabraji	\N	138
2552	Dijankovec	\N	138
2553	Doljanec	\N	138
2554	Donja Brckovčina	\N	138
2555	Donja Glogovnica	\N	138
2556	Donji Dubovec	\N	138
2557	Đurđic	\N	138
2558	Erdovec	\N	138
2559	Gornja Brckovčina	\N	138
2560	Gornja Glogovnica	\N	138
2561	Gornji Dubovec	\N	138
2562	Gračina	\N	138
2563	Ivanec Križevački	\N	138
2564	Jarčani	\N	138
2565	Karane	\N	138
2566	Kloštar Vojakovački	\N	138
2567	Kostadinovac	\N	138
2568	Križevci	\N	138
2569	Kučari	\N	138
2570	Kunđevec	\N	138
2571	Lemeš	\N	138
2572	Lemeš Križevački	\N	138
2573	Majurec	\N	138
2574	Male Sesvete	\N	138
2575	Mali Carevdar	\N	138
2576	Mali Potočec	\N	138
2577	Mali Raven	\N	138
2578	Marinovec	\N	138
2579	Mičijevac	\N	138
2580	Novaki Ravenski	\N	138
2581	Novi Bošnjani	\N	138
2582	Novi Đurđic	\N	138
2583	Osijek Vojakovački	\N	138
2584	Pavlovec Ravenski	\N	138
2585	Pesek	\N	138
2586	Pobrđani Vojakovački	\N	138
2587	Podgajec	\N	138
2588	Poljana Križevačka	\N	138
2589	Povelić	\N	138
2590	Prikraj Križevački	\N	138
2591	Ruševac	\N	138
2592	Srednji Dubovec	\N	138
2593	Stara Ves Ravenska	\N	138
2594	Stari Bošnjani	\N	138
2595	Sveta Helena	\N	138
2596	Sveti Martin	\N	138
2597	Špiranec	\N	138
2598	Većeslavec	\N	138
2599	Velike Sesvete	\N	138
2600	Veliki Potočec	\N	138
2601	Veliki Raven	\N	138
2602	Vojakovac	\N	138
2603	Vujići Vojakovački	\N	138
2604	Žibrinovec	\N	138
2605	Botovo	\N	139
2606	Drnje	\N	139
2607	Torčec	\N	139
2608	Đelekovec	\N	140
2609	Imbriovec	\N	140
2610	Brodić	\N	141
2611	Ferdinandovac	\N	141
2612	Gola	\N	142
2613	Gotalovo	\N	142
2614	Novačka	\N	142
2615	Otočka	\N	142
2616	Ždala	\N	142
2617	Barlabaševac	\N	143
2618	Deklešanec	\N	143
2619	Donja Rijeka	\N	143
2620	Dropkovec	\N	143
2621	Fajerovec	\N	143
2622	Fodrovec Riječki	\N	143
2623	Gornja Rijeka	\N	143
2624	Kolarec	\N	143
2625	Kostanjevec Riječki	\N	143
2626	Lukačevec	\N	143
2627	Nemčevec	\N	143
2628	Pofuki	\N	143
2629	Štrigovec	\N	143
2630	Vukšinec Riječki	\N	143
2631	Gabajeva Greda	\N	144
2632	Hlebine	\N	144
2633	Batinske	\N	145
2634	Kalinovac	\N	145
2635	Ladna Voda	\N	145
2636	Molvice	\N	145
2637	Borje	\N	146
2638	Kalnik	\N	146
2639	Kamešnica	\N	146
2640	Obrež Kalnički	\N	146
2641	Popovec Kalnički	\N	146
2642	Potok Kalnički	\N	146
2643	Šopron	\N	146
2644	Vojnovec Kalnički	\N	146
2645	Budančevica	\N	147
2646	Kloštar Podravski	\N	147
2647	Kozarevac	\N	147
2648	Prugovac	\N	147
2649	Glogovac	\N	148
2650	Jeduševac	\N	148
2651	Koprivnički Bregi	\N	148
2652	Botinovec	\N	149
2653	Goričko	\N	149
2654	Koprivnički Ivanec	\N	149
2655	Kunovec	\N	149
2656	Pustakovec	\N	149
2657	Antolovec	\N	150
2658	Kutnjak	\N	150
2659	Legrad	\N	150
2660	Mali Otok	\N	150
2661	Selnica Podravska	\N	150
2662	Veliki Otok	\N	150
2663	Zablatje	\N	150
2664	Čingi Lingi	\N	151
2665	Molve	\N	151
2666	Molve Grede	\N	151
2667	Repaš	\N	151
2668	Borovljani	\N	152
2669	Delovi	\N	152
2670	Javorovac	\N	152
2671	Novigrad Podravski	\N	152
2672	Plavšinac	\N	152
2673	Srdinac	\N	152
2674	Vlaislav	\N	152
2675	Novo Virje	\N	153
2676	Komatnica	\N	154
2677	Peteranec	\N	154
2678	Sigetec	\N	154
2679	Podravske Sesvete	\N	155
2680	Belanovo Selo	\N	156
2681	Cvetkovec	\N	156
2682	Duga Rijeka	\N	156
2683	Gorica	\N	156
2684	Grbaševec	\N	156
2685	Ivančec	\N	156
2686	Koledinec	\N	156
2687	Kuzminec	\N	156
2688	Ludbreški Ivanac	\N	156
2689	Lukovec	\N	156
2690	Mala Rasinjica	\N	156
2691	Mala Rijeka	\N	156
2692	Prkos	\N	156
2693	Radeljevo Selo	\N	156
2694	Rasinja	\N	156
2695	Ribnjak	\N	156
2696	Subotica Podravska	\N	156
2697	Velika Rasinjica	\N	156
2698	Veliki Grabičani	\N	156
2699	Veliki Poganac	\N	156
2700	Vojvodinec	\N	156
2701	Brđani Sokolovački	\N	157
2702	Domaji	\N	157
2703	Donja Velika	\N	157
2704	Donjara	\N	157
2705	Donji Maslarac	\N	157
2706	Gornja Velika	\N	157
2707	Gornji Maslarac	\N	157
2708	Grdak	\N	157
2709	Hudovljani	\N	157
2710	Jankovac	\N	157
2711	Kamenica	\N	157
2712	Ladislav Sokolovački	\N	157
2713	Lepavina	\N	157
2714	Mala Branjska	\N	157
2715	Mala Mučna	\N	157
2716	Mali Botinovac	\N	157
2717	Mali Grabičani	\N	157
2718	Mali Poganac	\N	157
2719	Miličani	\N	157
2720	Paunovac	\N	157
2721	Peščenik	\N	157
2722	Prnjavor Lepavinski	\N	157
2723	Rijeka Koprivnička	\N	157
2724	Rovištanci	\N	157
2725	Sokolovac	\N	157
2726	Srijem	\N	157
2727	Široko Selo	\N	157
2728	Trnovac Sokolovački	\N	157
2729	Velika Branjska	\N	157
2730	Velika Mučna	\N	157
2731	Veliki Botinovac	\N	157
2732	Vrhovac Sokolovački	\N	157
2733	Brdo	\N	158
2734	Cirkvensko	\N	158
2735	Brezovljani	\N	158
2736	Cepidlak	\N	158
2737	Cirkvena	\N	158
2738	Hrsovo	\N	158
2739	Kenđelovec	\N	158
2740	Kuštani	\N	158
2741	Ladinec	\N	158
2742	Markovac Križevački	\N	158
2743	Novi Glog	\N	158
2744	Predavec Križevački	\N	158
2745	Rašćani	\N	158
2746	Sveti Ivan Žabno	\N	158
2747	Sveti Petar Čvrstec	\N	158
2748	Škrinjari	\N	158
2749	Trema	\N	158
2750	Bočkovec	\N	159
2751	Bogačevo	\N	159
2752	Bogačevo Riječko	\N	159
2753	Brdo Orehovečko	\N	159
2754	Brezje Miholečko	\N	159
2755	Brežani	\N	159
2756	Črnčevec	\N	159
2757	Dedina	\N	159
2758	Donji Fodrovec	\N	159
2759	Ferežani	\N	159
2760	Finčevec	\N	159
2761	Gorica Miholečka	\N	159
2762	Gornji Fodrovec	\N	159
2763	Gregurovec	\N	159
2764	Guščerovec	\N	159
2765	Hižanovec	\N	159
2766	Hrgovec	\N	159
2767	Kapela Ravenska	\N	159
2768	Kusijevec	\N	159
2769	Međa	\N	159
2770	Miholec	\N	159
2771	Mikovec	\N	159
2772	Mokrice Miholečke	\N	159
2773	Orehovec	\N	159
2774	Piškovec	\N	159
2775	Podvinje Miholečko	\N	159
2776	Rovci	\N	159
2777	Sela Ravenska	\N	159
2778	Selanec	\N	159
2779	Selnica Miholečka	\N	159
2780	Sveti Petar Orehovec	\N	159
2781	Šalamunovec	\N	159
2782	Vinarec	\N	159
2783	Voljavec Riječki	\N	159
2784	Vukovec	\N	159
2785	Zaistovec	\N	159
2786	Zamladinec	\N	159
2787	Donje Zdjelice	\N	160
2788	Hampovica	\N	160
2789	Miholjanec	\N	160
2790	Rakitnica	\N	160
2791	Šemovci	\N	160
2792	Virje	\N	160
2793	Bjelovar	\N	161
2794	Breza	\N	161
2795	Brezovac	\N	161
2796	Ciglena	\N	161
2797	Galovac	\N	161
2798	Gornji Tomaš	\N	161
2799	Gudovac	\N	161
2800	Klokočevac	\N	161
2801	Kokinac	\N	161
2802	Kupinovac	\N	161
2803	Letičani	\N	161
2804	Mala Ciglena	\N	161
2805	Malo Korenovo	\N	161
2806	Novi Pavljani	\N	161
2807	Novoseljani	\N	161
2808	Obrovnica	\N	161
2809	Patkovac	\N	161
2810	Plavnice Gornje	\N	161
2811	Plavnice Stare	\N	161
2812	Prespa	\N	161
2813	Prgomelje	\N	161
2814	Prokljuvani	\N	161
2815	Puričani	\N	161
2816	Rajić	\N	161
2817	Stančići	\N	161
2818	Stari Pavljani	\N	161
2819	Tomaš	\N	161
2820	Trojstveni Markovac	\N	161
2821	Veliko Korenovo	\N	161
2822	Zvijerci	\N	161
2823	Ždralovi	\N	161
2824	Andigola	\N	162
2825	Bojana	\N	162
2826	Bosiljevo	\N	162
2827	Cerina	\N	162
2828	Čazma	\N	162
2829	Dapci	\N	162
2830	Dereza	\N	162
2831	Donji Draganec	\N	162
2832	Donji Dragičevci	\N	162
2833	Donji Lipovčani	\N	162
2834	Donji Miklouš	\N	162
2835	Gornji Draganec	\N	162
2836	Gornji Dragičevci	\N	162
2837	Gornji Lipovčani	\N	162
2838	Gornji Miklouš	\N	162
2839	Grabik	\N	162
2840	Grabovnica	\N	162
2841	Komuševac	\N	162
2842	Marčani	\N	162
2843	Martinac	\N	162
2844	Milaševac	\N	162
2845	Novo Selo	\N	162
2846	Općevac	\N	162
2847	Palančani	\N	162
2848	Pavličani	\N	162
2849	Pobjenik	\N	162
2850	Pobrđani	\N	162
2851	Prnjarovac	\N	162
2852	Prokljuvani	\N	162
2853	Sišćani	\N	162
2854	Sovari	\N	162
2855	Suhaja	\N	162
2856	Vagovina	\N	162
2857	Vrtlinska	\N	162
2858	Vučani	\N	162
2859	Zdenčec	\N	162
2860	Daruvar	\N	163
2861	Daruvarski Vinogradi	\N	163
2862	Doljani	\N	163
2863	Donji Daruvar	\N	163
2864	Gornji Daruvar	\N	163
2865	Lipovac Majur	\N	163
2866	Ljudevit Selo	\N	163
2867	Markovac	\N	163
2868	Vrbovac	\N	163
2869	Ciglenica	\N	164
2870	Dišnik	\N	164
2871	Duhovi	\N	164
2872	Garešnica	\N	164
2873	Garešnički Brestovac	\N	164
2874	Gornji Uljanik	\N	164
2875	Hrastovac	\N	164
2876	Kajgana	\N	164
2877	Kaniška Iva	\N	164
2878	Kapelica	\N	164
2879	Mala Bršljanica	\N	164
2880	Mali Pašijan	\N	164
2881	Malo Vukovje	\N	164
2882	Rogoža	\N	164
2883	Tomašica	\N	164
2884	Trnovitički Popovac	\N	164
2885	Uljanički Brijeg	\N	164
2886	Uljanik	\N	164
2887	Velika Bršljanica	\N	164
2888	Veliki Pašijan	\N	164
2889	Veliki Prokop	\N	164
2890	Veliko Vukovje	\N	164
2891	Zdenčac	\N	164
2892	Dapčevićki Brđani	\N	165
2893	Dijakovac	\N	165
2894	Donja Rašenica	\N	165
2895	Gornja Rašenica	\N	165
2896	Grbavac	\N	165
2897	Grubišno Polje	\N	165
2898	Ivanovo Selo	\N	165
2899	Lončarica	\N	165
2900	Mala Barna	\N	165
2901	Mala Dapčevica	\N	165
2902	Mala Jasenovača	\N	165
2903	Mala Peratovica	\N	165
2904	Mali Zdenci	\N	165
2905	Munije	\N	165
2906	Orlovac Zdenački	\N	165
2907	Poljani	\N	165
2908	Rastovac	\N	165
2909	Treglava	\N	165
2910	Turčević Polje	\N	165
2911	Velika Barna	\N	165
2912	Velika Dapčevica	\N	165
2913	Velika Jasenovača	\N	165
2914	Velika Peratovica	\N	165
2915	Veliki Zdenci	\N	165
2916	Begovača	\N	166
2917	Berek	\N	166
2918	Gornja Garešnica	\N	166
2919	Kostanjevac	\N	166
2920	Krivaja	\N	166
2921	Novo Selo Garešničko	\N	166
2922	Oštri Zid	\N	166
2923	Podgarić	\N	166
2924	Potok	\N	166
2925	Ruškovac	\N	166
2926	Šimljana	\N	166
2927	Šimljanica	\N	166
2928	Šimljanik	\N	166
2929	Blagorodovac	\N	167
2930	Dežanovac	\N	167
2931	Donji Sređani	\N	167
2932	Drlež	\N	167
2933	Golubinjak	\N	167
2934	Gornji Sređani	\N	167
2935	Goveđe Polje	\N	167
2936	Ivanovo Polje	\N	167
2937	Kaštel Dežanovački	\N	167
2938	Kreštelovac	\N	167
2939	Sokolovac	\N	167
2940	Trojeglava	\N	167
2941	Bastajski Brđani	\N	168
2942	Batinjani	\N	168
2943	Batinjska Rijeka	\N	168
2944	Borova Kosa	\N	168
2945	Dobra Kuća	\N	168
2946	Donja Vrijeska	\N	168
2947	Donje Cjepidlake	\N	168
2948	Đulovac	\N	168
2949	Gornja Vrijeska	\N	168
2950	Gornje Cjepidlake	\N	168
2951	Katinac	\N	168
2952	Koreničani	\N	168
2953	Kravljak	\N	168
2954	Mala Babina Gora	\N	168
2955	Mala Klisa	\N	168
2956	Mala Maslenjača	\N	168
2957	Mali Bastaji	\N	168
2958	Mali Miletinac	\N	168
2959	Nova Krivaja	\N	168
2960	Potočani	\N	168
2961	Puklica	\N	168
2962	Removac	\N	168
2963	Stara Krivaja	\N	168
2964	Škodinovac	\N	168
2965	Velika Babina Gora	\N	168
2966	Velika Klisa	\N	168
2967	Velika Maslenjača	\N	168
2968	Veliki Bastaji	\N	168
2969	Veliki Miletinac	\N	168
2970	Vukovije	\N	168
2971	Hercegovac	\N	169
2972	Ilovski Klokočevac	\N	169
2973	Ladislav	\N	169
2974	Palešnik	\N	169
2975	Velika Trnava	\N	169
2976	Babinac	\N	170
2977	Donja Petrička	\N	170
2978	Đurđic	\N	170
2979	Gornja Petrička	\N	170
2980	Ivanska	\N	170
2981	Kolarevo Selo	\N	170
2982	Križic	\N	170
2983	Paljevine	\N	170
2984	Rastovac	\N	170
2985	Samarica	\N	170
2986	Srijedska	\N	170
2987	Stara Plošćica	\N	170
2988	Utiskani	\N	170
2989	Babotok	\N	171
2990	Botinac	\N	171
2991	Donji Mosti	\N	171
2992	Gornje Zdelice	\N	171
2993	Gornji Mosti	\N	171
2994	Jabučeta	\N	171
2995	Kapela	\N	171
2996	Kobasičari	\N	171
2997	Lalići	\N	171
2998	Lipovo Brdo	\N	171
2999	Nova Diklenica	\N	171
3000	Novi Skucani	\N	171
3001	Pavlin Kloštar	\N	171
3002	Poljančani	\N	171
3003	Prnjavor	\N	171
3004	Reškovci	\N	171
3005	Sredice Gornje	\N	171
3006	Srednja Diklenica	\N	171
3007	Srednji Mosti	\N	171
3008	Stanići	\N	171
3009	Stara Diklenica	\N	171
3010	Starčevljani	\N	171
3011	Stari Skucani	\N	171
3012	Šiptari	\N	171
3013	Tvrda Reka	\N	171
3014	Visovi	\N	171
3015	Boriš	\N	172
3016	Brestovac Daruvarski	\N	172
3017	Brestovačka Brda	\N	172
3018	Dioš	\N	172
3019	Imsovac	\N	172
3020	Končanica	\N	172
3021	Otkopi	\N	172
3022	Stražanac	\N	172
3023	Šuplja Lipa	\N	172
3024	Bedenik	\N	173
3025	Bulinac	\N	173
3026	Dautan	\N	173
3027	Drljanovac	\N	173
3028	Kozarevac Račanski	\N	173
3029	Međurača	\N	173
3030	Nevinac	\N	173
3031	Nova Rača	\N	173
3032	Orlovac	\N	173
3033	Sasovac	\N	173
3034	Slovinska Kovačica	\N	173
3035	Stara Rača	\N	173
3036	Tociljevac	\N	173
3037	Dijebala	\N	174
3038	Domankuš	\N	174
3039	Draganić	\N	174
3040	Kakinac	\N	174
3041	Kovačevac	\N	174
3042	Kraljevac	\N	174
3043	Lipovčani	\N	174
3044	Marići	\N	174
3045	Podgorci	\N	174
3046	Predavac	\N	174
3047	Prekobrdo	\N	174
3048	Rovišće	\N	174
3049	Tuk	\N	174
3050	Žabjak	\N	174
3051	Orovac	\N	175
3052	Severin	\N	175
3053	Barica	\N	176
3054	Bijela	\N	176
3055	Donji Borki	\N	176
3056	Gornji Borki	\N	176
3057	Kip	\N	176
3058	Miljanovac	\N	176
3059	Pakrani	\N	176
3060	Sirač	\N	176
3061	Srednji Borki	\N	176
3062	Šibovac	\N	176
3063	Zaile	\N	176
3064	Jasenik	\N	177
3065	Kašljavac	\N	177
3066	Lasovac	\N	177
3067	Lasovac Brdo	\N	177
3068	Pupelica	\N	177
3069	Ravneš	\N	177
3070	Šandrovac	\N	177
3071	Blatnica	\N	178
3072	Daskatica	\N	178
3073	Donja Šušnjara	\N	178
3074	Gornja Šušnjara	\N	178
3075	Laminac	\N	178
3076	Narta	\N	178
3077	Starine	\N	178
3078	Staro Štefanje	\N	178
3079	Štefanje	\N	178
3080	Babinac	\N	179
3081	Bačkovica	\N	179
3082	Bedenička	\N	179
3083	Čađavac	\N	179
3084	Nova Pisanica	\N	179
3085	Polum	\N	179
3086	Ribnjačka	\N	179
3087	Velika Pisanica	\N	179
3088	Gornja Ploščica	\N	180
3089	Gornja Trnovitica	\N	180
3090	Mala Mlinska	\N	180
3091	Mala Trnovitica	\N	180
3092	Mlinski Vinogradi	\N	180
3093	Nova Ploščica	\N	180
3094	Velika Mlinska	\N	180
3095	Velika Trnovitica	\N	180
3096	Cremušina	\N	181
3097	Donja Kovačica	\N	181
3098	Dražica	\N	181
3099	Gornja Kovačica	\N	181
3100	Mala Pisanica	\N	181
3101	Mali Grđevac	\N	181
3102	Pavlovac	\N	181
3103	Sibenik	\N	181
3104	Topolovica	\N	181
3105	Veliki Grđevac	\N	181
3106	Zrinska	\N	181
3107	Ćurlovac	\N	182
3108	Dominkovica	\N	182
3109	Grginac	\N	182
3110	Kegljevac	\N	182
3111	Maglenča	\N	182
3112	Malo Trojstvo	\N	182
3113	Martinac	\N	182
3114	Paulovac	\N	182
3115	Veliko Trojstvo	\N	182
3116	Višnjevac	\N	182
3117	Vrbica	\N	182
3118	Gornji Križ	\N	183
3119	Jakopovac	\N	183
3120	Zrinski Topolovac	\N	183
3121	Bakar	\N	184
3122	Hreljin	\N	184
3123	Krasica	\N	184
3124	Kukuljanovo	\N	184
3125	Plosna	\N	184
3126	Ponikve	\N	184
3127	Praputnjak	\N	184
3128	Škrljevo	\N	184
3129	Zlobin	\N	184
3130	Beli	\N	185
3131	Cres	\N	185
3132	Dragozetići	\N	185
3133	Filozići	\N	185
3134	Grmov	\N	185
3135	Ivanje	\N	185
3136	Loznati	\N	185
3137	Lubenice	\N	185
3138	Mali Podol	\N	185
3139	Martinšćica	\N	185
3140	Merag	\N	185
3141	Miholašćica	\N	185
3142	Orlec	\N	185
3143	Pernat	\N	185
3144	Porozina	\N	185
3145	Predošćica	\N	185
3146	Stanić	\N	185
3147	Stivan	\N	185
3148	Sveti Petar	\N	185
3149	Valun	\N	185
3150	Važminec	\N	185
3151	Vidovići	\N	185
3152	Vodice	\N	185
3153	Vrana	\N	185
3154	Zbičina	\N	185
3155	Zbišina	\N	185
3156	Crikvenica	\N	186
3157	Dramalj	\N	186
3158	Jadranovo	\N	186
3159	Selce	\N	186
3160	Bazli	\N	187
3161	Brinjeva Draga	\N	187
3162	Čabar	\N	187
3163	Crni Lazi	\N	187
3164	Donji Žagari	\N	187
3165	Fažonci	\N	187
3166	Ferbežari	\N	187
3167	Gerovo	\N	187
3168	Gerovski Kraj	\N	187
3169	Gorači	\N	187
3170	Gornji Žagari	\N	187
3171	Hrib	\N	187
3172	Kamenski Hrib	\N	187
3173	Kozji Vrh	\N	187
3174	Kraljev Vrh	\N	187
3175	Kranjci	\N	187
3176	Lautari	\N	187
3177	Lazi	\N	187
3178	Makov Hrib	\N	187
3179	Mali Lug	\N	187
3180	Mandli	\N	187
3181	Okrivje	\N	187
3182	Parg	\N	187
3183	Plešce	\N	187
3184	Podstene	\N	187
3185	Požarnica	\N	187
3186	Prezid	\N	187
3187	Prhci	\N	187
3188	Prhutova Draga	\N	187
3189	Pršleti	\N	187
3190	Ravnice	\N	187
3191	Selo	\N	187
3192	Smrečje	\N	187
3193	Smrekari	\N	187
3194	Sokoli	\N	187
3195	Srednja Draga	\N	187
3196	Tropeti	\N	187
3197	Tršće	\N	187
3198	Vode	\N	187
3199	Vrhovci	\N	187
3200	Zamost	\N	187
3201	Zbitke	\N	187
3202	Bela Vodica	\N	188
3203	Belo	\N	188
3204	Biljevina	\N	188
3205	Brod na Kupi	\N	188
3206	Crni Lug	\N	188
3207	Čedanj	\N	188
3208	Dedin	\N	188
3209	Delnice	\N	188
3210	Donja Krašićevica	\N	188
3211	Donje Tihovo	\N	188
3212	Donji Ložac	\N	188
3213	Donji Okrug	\N	188
3214	Donji Turni	\N	188
3215	Gašparci	\N	188
3216	Golik	\N	188
3217	Gornja Krašićevica	\N	188
3218	Gornje Tihovo	\N	188
3219	Gornji Ložac	\N	188
3220	Gornji Okrug	\N	188
3221	Gornji Turni	\N	188
3222	Grbajel	\N	188
3223	Guče Selo	\N	188
3224	Gusti Laz	\N	188
3225	Hrvatsko	\N	188
3226	Iševnica	\N	188
3227	Kalić	\N	188
3228	Kočičin	\N	188
3229	Krivac	\N	188
3230	Kupa	\N	188
3231	Kuželj	\N	188
3232	Leska	\N	188
3233	Lučice	\N	188
3234	Mala Lešnica	\N	188
3235	Malo Selo	\N	188
3236	Marija Trošt	\N	188
3237	Plajzi	\N	188
3238	Podgora Turkovska	\N	188
3239	Požar	\N	188
3240	Radočaj Brodski	\N	188
3241	Raskrižje Tihovo	\N	188
3242	Razloge	\N	188
3243	Razloški Okrug	\N	188
3244	Sedalce	\N	188
3245	Srednja Krašićevica	\N	188
3246	Suhor	\N	188
3247	Ševalj	\N	188
3248	Turke	\N	188
3249	Vela Voda	\N	188
3250	Velika Lešnica	\N	188
3251	Zagolik	\N	188
3252	Zakrajc Turkovski	\N	188
3253	Zalesina	\N	188
3254	Zamost Brodski	\N	188
3255	Zapolje Brodsko	\N	188
3256	Zelin Crnoluški	\N	188
3257	Brnčići	\N	189
3258	Ćikovići	\N	189
3259	Kastav	\N	189
3260	Rubeši	\N	189
3261	Spinčići	\N	189
3262	Trinajstići	\N	189
3263	Bakarac	\N	190
3264	Kraljevica	\N	190
3265	Križišće	\N	190
3266	Mali Dol	\N	190
3267	Šmrika	\N	190
3268	Veli Dol	\N	190
3269	Bajčići	\N	191
3270	Brusići	\N	191
3271	Brzac	\N	191
3272	Kornić	\N	191
3273	Krk	\N	191
3274	Lakmartin	\N	191
3275	Linardići	\N	191
3276	Milohnići	\N	191
3277	Muraj	\N	191
3278	Nenadići	\N	191
3279	Pinezići	\N	191
3280	Poljica	\N	191
3281	Skrbčići	\N	191
3282	Vrh	\N	191
3283	Žgaljići	\N	191
3284	Belej	\N	192
3285	Ćunski	\N	192
3286	Ilovik	\N	192
3287	Male Srakane	\N	192
3288	Mali Lošinj	\N	192
3289	Nerezine	\N	192
3290	Osor	\N	192
3291	Punta Križa	\N	192
3292	Susak	\N	192
3293	Sveti Jakov	\N	192
3294	Unije	\N	192
3295	Ustrine	\N	192
3296	Vele Srakane	\N	192
3297	Veli Lošinj	\N	192
3298	Bater	\N	193
3299	Bile	\N	193
3300	Breze	\N	193
3301	Crno	\N	193
3302	Donji Zagon	\N	193
3303	Drinak	\N	193
3304	Gornji Zagon	\N	193
3305	Jakov Polje	\N	193
3306	Javorje	\N	193
3307	Klenovica	\N	193
3308	Krmpotske Vodice	\N	193
3309	Ledenice	\N	193
3310	Luka Krmpotska	\N	193
3311	Novi Vinodolski	\N	193
3312	Podmelnik	\N	193
3313	Povile	\N	193
3314	Ruševo Krmpotsko	\N	193
3315	Sibinj Krmpotski	\N	193
3316	Smokvica Krmpotska	\N	193
3317	Zabukovac	\N	193
3318	Dobreć	\N	194
3319	Gornje Selo	\N	194
3320	Ičići	\N	194
3321	Ika	\N	194
3322	Opatija	\N	194
3323	Oprič	\N	194
3324	Pobri	\N	194
3325	Poljane	\N	194
3326	Vela Učka	\N	194
3327	Veprinac	\N	194
3328	Banjol	\N	195
3329	Barbat na Rabu	\N	195
3330	Kampor	\N	195
3331	Mundanije	\N	195
3332	Palit	\N	195
3333	Rab	\N	195
3334	Supetarska Draga	\N	195
3335	Rijeka	\N	196
3336	Blaževci	\N	197
3337	Bunjevci	\N	197
3338	Carevići	\N	197
3339	Damalj	\N	197
3340	Dokmanovići	\N	197
3341	Dolenci	\N	197
3342	Donji Vučkovići	\N	197
3343	Donji Vukšići	\N	197
3344	Draga Lukovdolska	\N	197
3345	Dragovići	\N	197
3346	Gomirje	\N	197
3347	Gorenci	\N	197
3348	Gornji Vučkovići	\N	197
3349	Gornji Vukšići	\N	197
3350	Hajdine	\N	197
3351	Hambarište	\N	197
3352	Jablan	\N	197
3353	Jakšići	\N	197
3354	Kamensko	\N	197
3355	Klanac	\N	197
3356	Komlenići	\N	197
3357	Lesci	\N	197
3358	Liplje	\N	197
3359	Lukovdol	\N	197
3360	Ljubošina	\N	197
3361	Majer	\N	197
3362	Mali Jadrč	\N	197
3363	Matići	\N	197
3364	Međedi	\N	197
3365	Mlinari	\N	197
3366	Močile	\N	197
3367	Moravice	\N	197
3368	Musulini	\N	197
3369	Nadvučnik	\N	197
3370	Nikšići	\N	197
3371	Osojnik	\N	197
3372	Petrovići	\N	197
3373	Plemenitaš	\N	197
3374	Plešivica	\N	197
3375	Podvučnik	\N	197
3376	Poljana	\N	197
3377	Presika	\N	197
3378	Radigojna	\N	197
3379	Radočaj	\N	197
3380	Radoševići	\N	197
3381	Rim	\N	197
3382	Rtić	\N	197
3383	Severin na Kupi	\N	197
3384	Smišljak	\N	197
3385	Stubica	\N	197
3386	Štefanci	\N	197
3387	Tići	\N	197
3388	Tomići	\N	197
3389	Topolovica	\N	197
3390	Tuk	\N	197
3391	Veliki Jadrč	\N	197
3392	Vrbovsko	\N	197
3393	Vučinići	\N	197
3394	Vučnik	\N	197
3395	Vujnovići	\N	197
3396	Vukelići	\N	197
3397	Zapeć	\N	197
3398	Zaumol	\N	197
3399	Zdihovo	\N	197
3400	Žakule	\N	197
3401	Baška	\N	198
3402	Batomalj	\N	198
3403	Draga Bašćanska	\N	198
3404	Jurandvor	\N	198
3405	Brod Moravice	\N	199
3406	Colnari	\N	199
3407	Čučak	\N	199
3408	Delači	\N	199
3409	Doluš	\N	199
3410	Donja Dobra	\N	199
3411	Donja Lamana Draga	\N	199
3412	Donji Šajn	\N	199
3413	Donji Šehovac	\N	199
3414	Goliki	\N	199
3415	Gornja Lamana Draga	\N	199
3416	Gornji Kuti	\N	199
3417	Gornji Šajn	\N	199
3418	Gornji Šehovac	\N	199
3419	Goršeti	\N	199
3420	Kavrani	\N	199
3421	Klepeće Selo	\N	199
3422	Kocijani	\N	199
3423	Lokvica	\N	199
3424	Maklen	\N	199
3425	Male Drage	\N	199
3426	Moravička Sela	\N	199
3427	Naglići	\N	199
3428	Nove Hiže	\N	199
3429	Novi Lazi	\N	199
3430	Pauci	\N	199
3431	Planica	\N	199
3432	Podgorani	\N	199
3433	Podstene	\N	199
3434	Razdrto	\N	199
3435	Smišljak	\N	199
3436	Stari Lazi	\N	199
3437	Šepci Podstenski	\N	199
3438	Šimatovo	\N	199
3439	Vele Drage	\N	199
3440	Zahrt	\N	199
3441	Zavrh	\N	199
3442	Završje	\N	199
3443	Buzdohanj	\N	200
3444	Cernik	\N	200
3445	Čavle	\N	200
3446	Grobnik	\N	200
3447	Ilovik	\N	200
3448	Mavrinci	\N	200
3449	Podčudnič	\N	200
3450	Podrvanj	\N	200
3451	Soboli	\N	200
3452	Zastenice	\N	200
3453	Čižići	\N	201
3454	Dobrinj	\N	201
3455	Dolovo	\N	201
3456	Gabonjin	\N	201
3457	Gostinjac	\N	201
3458	Hlapa	\N	201
3459	Klanice	\N	201
3460	Klimno	\N	201
3461	Kras	\N	201
3462	Polje	\N	201
3463	Rasopasno	\N	201
3464	Rudine	\N	201
3465	Soline	\N	201
3466	Sužan	\N	201
3467	Sveti Ivan Dobrinjski	\N	201
3468	Sveti Vid Dobrinjski	\N	201
3469	Šilo	\N	201
3470	Tribulje	\N	201
3471	Žestilac	\N	201
3472	Županje	\N	201
3473	Belo Selo	\N	202
3474	Benkovac Fužinski	\N	202
3475	Fužine	\N	202
3476	Lič	\N	202
3477	Slavica	\N	202
3478	Vrata	\N	202
3479	Baštijani	\N	203
3480	Brnelići	\N	203
3481	Drastin	\N	203
3482	Dražice	\N	203
3483	Jelenje	\N	203
3484	Kukuljani	\N	203
3485	Lopača	\N	203
3486	Lubarska	\N	203
3487	Lukeži	\N	203
3488	Martinovo Selo	\N	203
3489	Milaši	\N	203
3490	Podhum	\N	203
3491	Podkilavac	\N	203
3492	Ratulje	\N	203
3493	Trnovica	\N	203
3494	Valići	\N	203
3495	Zoretići	\N	203
3496	Breza	\N	204
3497	Klana	\N	204
3498	Lisac	\N	204
3499	Studena	\N	204
3500	Škalnica	\N	204
3501	Kostrena	\N	205
3502	Homer	\N	206
3503	Lazac Lokvarski	\N	206
3504	Lokve	\N	206
3505	Mrzla Vodica	\N	206
3506	Podtisovac	\N	206
3507	Sljeme	\N	206
3508	Sopač	\N	206
3509	Zelin Mrzlovodički	\N	206
3510	Lopar	\N	207
3511	Liganj	\N	208
3512	Lovran	\N	208
3513	Lovranska Draga	\N	208
3514	Medveja	\N	208
3515	Tuliševica	\N	208
3516	Barušići	\N	209
3517	Bogovići	\N	209
3518	Kremenići	\N	209
3519	Ljutići	\N	209
3520	Malinska	\N	209
3521	Maršići	\N	209
3522	Milčetići	\N	209
3523	Milovčići	\N	209
3524	Oštrobradić	\N	209
3525	Porat	\N	209
3526	Radići	\N	209
3527	Sabljići	\N	209
3528	Sršići	\N	209
3529	Strilčići	\N	209
3530	Sveti Anton	\N	209
3531	Sveti Ivan	\N	209
3532	Sveti Vid-Miholjice	\N	209
3533	Turčić	\N	209
3534	Vantačići	\N	209
3535	Zidarići	\N	209
3536	Žgombići	\N	209
3537	Brdce	\N	210
3538	Bregi	\N	210
3539	Brešca	\N	210
3540	Jurdani	\N	210
3541	Jušići	\N	210
3542	Kučeli	\N	210
3543	Lipa	\N	210
3544	Male Mune	\N	210
3545	Mali Brgud	\N	210
3546	Matulji	\N	210
3547	Mihotići	\N	210
3548	Mučići	\N	210
3549	Pasjak	\N	210
3550	Permani	\N	210
3551	Rukavac	\N	210
3552	Rupa	\N	210
3553	Ružići	\N	210
3554	Šapjane	\N	210
3555	Vele Mune	\N	210
3556	Veli Brgud	\N	210
3557	Zaluki	\N	210
3558	Zvoneće	\N	210
3559	Žejane	\N	210
3560	Brseč	\N	211
3561	Donje Selo	\N	211
3562	Donji Kraj	\N	211
3563	Golovik	\N	211
3564	Grabrova	\N	211
3565	Kalac	\N	211
3566	Martina	\N	211
3567	Mošćenice	\N	211
3568	Mošćenička Draga	\N	211
3569	Obrš	\N	211
3570	Sučići	\N	211
3571	Sveta Jelena	\N	211
3572	Sveti Anton	\N	211
3573	Sveti Petar	\N	211
3574	Zagore	\N	211
3575	Begovo Razdolje	\N	212
3576	Brestova Draga	\N	212
3577	Mrkopalj	\N	212
3578	Sunger	\N	212
3579	Tuk Mrkopaljski	\N	212
3580	Tuk Vojni	\N	212
3581	Njivice	\N	213
3582	Omišalj	\N	213
3583	Punat	\N	214
3584	Stara Baška	\N	214
3585	Kupjak	\N	215
3586	Leskova Draga	\N	215
3587	Ravna Gora	\N	215
3588	Stara Sušica	\N	215
3589	Stari Laz	\N	215
3590	Šije	\N	215
3591	Belski Ravan	\N	216
3592	Brezje Dobransko	\N	216
3593	Bukov Vrh	\N	216
3594	Bukovac Podvrški	\N	216
3595	Buzin	\N	216
3596	Divjake	\N	216
3597	Gorani	\N	216
3598	Gorica Skradska	\N	216
3599	Gornja Dobra	\N	216
3600	Gramalj	\N	216
3601	Hlevci	\N	216
3602	Hosnik	\N	216
3603	Hribac	\N	216
3604	Mala Dobra	\N	216
3605	Malo Selce	\N	216
3606	Pećišće	\N	216
3607	Planina Skradska	\N	216
3608	Podslemeni Lazi	\N	216
3609	Podstena	\N	216
3610	Pucak	\N	216
3611	Raskrižje	\N	216
3612	Rasohe	\N	216
3613	Resnatac	\N	216
3614	Rogi	\N	216
3615	Skrad	\N	216
3616	Sleme Skradsko	\N	216
3617	Trški Lazi	\N	216
3618	Tusti Vrh	\N	216
3619	Veliko Selce	\N	216
3620	Vrh Brodski	\N	216
3621	Zakrajc Brodski	\N	216
3622	Žrnovac	\N	216
3623	Bribir	\N	217
3624	Drivenik	\N	217
3625	Grižane-Belgrad	\N	217
3626	Tribalj	\N	217
3627	Kosi	\N	218
3628	Marčelji	\N	218
3629	Marinići	\N	218
3630	Mladenići	\N	218
3631	Saršoni	\N	218
3632	Sroki	\N	218
3633	Viškovo	\N	218
3634	Garica	\N	219
3635	Kampelje	\N	219
3636	Risika	\N	219
3637	Vrbnik	\N	219
3638	Aleksinica	\N	220
3639	Barlete	\N	220
3640	Bilaj	\N	220
3641	Brezik	\N	220
3642	Brušane	\N	220
3643	Budak	\N	220
3644	Bužim	\N	220
3645	Debelo Brdo I	\N	220
3646	Debelo Brdo II	\N	220
3647	Divoselo	\N	220
3648	Donje Pazarište	\N	220
3649	Drenovac Radučki	\N	220
3650	Gospić	\N	220
3651	Kalinovača	\N	220
3652	Kaniža Gospićka	\N	220
3653	Klanac	\N	220
3654	Kruščica	\N	220
3655	Kruškovac	\N	220
3656	Kukljić	\N	220
3657	Lički Čitluk	\N	220
3658	Lički Novi	\N	220
3659	Lički Osik	\N	220
3660	Lički Ribnik	\N	220
3661	Mala Plana	\N	220
3662	Medak	\N	220
3663	Mogorić	\N	220
3664	Mušaluk	\N	220
3665	Novoselo Bilajsko	\N	220
3666	Novoselo Trnovačko	\N	220
3667	Ornice	\N	220
3668	Ostrvica	\N	220
3669	Oteš	\N	220
3670	Pavlovac Vrebački	\N	220
3671	Počitelj	\N	220
3672	Podastrana	\N	220
3673	Podoštra	\N	220
3674	Popovača Pazariška	\N	220
3675	Rastoka	\N	220
3676	Rizvanuša	\N	220
3677	Smiljan	\N	220
3678	Smiljansko Polje	\N	220
3679	Široka Kula	\N	220
3680	Trnovac	\N	220
3681	Vaganac	\N	220
3682	Velika Plana	\N	220
3683	Veliki Žitnik	\N	220
3684	Vranovine	\N	220
3685	Vrebac	\N	220
3686	Zavođe	\N	220
3687	Žabica	\N	220
3688	Caska	\N	221
3689	Gajac	\N	221
3690	Kustići	\N	221
3691	Lun	\N	221
3692	Metajna	\N	221
3693	Novalja	\N	221
3694	Potočnica	\N	221
3695	Stara Novalja	\N	221
3696	Vidalići	\N	221
3697	Zubovići	\N	221
3698	Brlog	\N	222
3699	Brloška Dubrava	\N	222
3700	Čovići	\N	222
3701	Dabar	\N	222
3702	Doljani	\N	222
3703	Drenov Klanac	\N	222
3704	Glavace	\N	222
3705	Gorići	\N	222
3706	Hrvatsko Polje	\N	222
3707	Kompolje	\N	222
3708	Kuterevo	\N	222
3709	Ličko Lešće	\N	222
3710	Lipovlje	\N	222
3711	Otočac	\N	222
3712	Podum	\N	222
3713	Ponori	\N	222
3714	Prozor	\N	222
3715	Ramljani	\N	222
3716	Sinac	\N	222
3717	Staro Selo	\N	222
3718	Škare	\N	222
3719	Švica	\N	222
3720	Alan	\N	223
3721	Biljevine	\N	223
3722	Bunica	\N	223
3723	Crni Kal	\N	223
3724	Jablanac	\N	223
3725	Klada	\N	223
3726	Krasno	\N	223
3727	Krivi Put	\N	223
3728	Lukovo	\N	223
3729	Melnice	\N	223
3730	Mrzli Dol	\N	223
3731	Pijavica	\N	223
3732	Podbilo	\N	223
3733	Prizna	\N	223
3734	Senj	\N	223
3735	Senjska Draga	\N	223
3736	Starigrad	\N	223
3737	Stinica	\N	223
3738	Stolac	\N	223
3739	Sveta Jelena	\N	223
3740	Sveti Juraj	\N	223
3741	Velike Brisnice	\N	223
3742	Veljun Primorski	\N	223
3743	Volarice	\N	223
3744	Vrataruša	\N	223
3745	Vratnik	\N	223
3746	Vrzići	\N	223
3747	Brinje	\N	224
3748	Glibodol	\N	224
3749	Jezerane	\N	224
3750	Križ Kamenica	\N	224
3751	Križpolje	\N	224
3752	Letinac	\N	224
3753	Lipice	\N	224
3754	Prokike	\N	224
3755	Rapain Klanac	\N	224
3756	Stajnica	\N	224
3757	Vodoteč	\N	224
3758	Žuta Lokva	\N	224
3759	Birovača	\N	225
3760	Boričevac	\N	225
3761	Brezovac Dobroselski	\N	225
3762	Bušević	\N	225
3763	Dnopolje	\N	225
3764	Dobroselo	\N	225
3765	Doljani	\N	225
3766	Donji Lapac	\N	225
3767	Donji Štrbci	\N	225
3768	Gajine	\N	225
3769	Gornji Lapac	\N	225
3770	Gornji Štrbci	\N	225
3771	Kestenovac	\N	225
3772	Kruge	\N	225
3773	Melinovac	\N	225
3774	Mišljenovac	\N	225
3775	Nebljusi	\N	225
3776	Oraovac	\N	225
3777	Barić Draga	\N	226
3778	Baške Oštarije	\N	226
3779	Cesarica	\N	226
3780	Crni Dabar	\N	226
3781	Došen Dabar	\N	226
3782	Karlobag	\N	226
3783	Konjsko	\N	226
3784	Kućišta Cesarička	\N	226
3785	Ledenik Cesarički	\N	226
3786	Lukovo Šugarje	\N	226
3787	Ravni Dabar	\N	226
3788	Staništa	\N	226
3789	Sušanj Cesarički	\N	226
3790	Vidovac Cesarički	\N	226
3791	Gornja Ploča	\N	227
3792	Kik	\N	227
3793	Ličko Cerje	\N	227
3794	Lovinac	\N	227
3795	Raduč	\N	227
3796	Ričice	\N	227
3797	Smokrić	\N	227
3798	Sveti Rok	\N	227
3799	Štikada	\N	227
3800	Vranik	\N	227
3801	Bukovac Perušićki	\N	228
3802	Donji Kosinj	\N	228
3803	Gornji Kosinj	\N	228
3804	Kaluđerovac	\N	228
3805	Klenovac	\N	228
3806	Konjsko Brdo	\N	228
3807	Kosa Janjačka	\N	228
3808	Kosinjski Bakovac	\N	228
3809	Kvarte	\N	228
3810	Krš	\N	228
3811	Lipovo Polje	\N	228
3812	Malo Polje	\N	228
3813	Mezinovac	\N	228
3814	Mlakva	\N	228
3815	Perušić	\N	228
3816	Prvan Selo	\N	228
3817	Rudinka	\N	228
3818	Studenci	\N	228
3819	Sveti Marko	\N	228
3820	Vukelići	\N	228
3821	Bjelopolje	\N	229
3822	Čanak	\N	229
3823	Čujića Krčevina	\N	229
3824	Donji Vaganac	\N	229
3825	Drakulić Rijeka	\N	229
3826	Gornji Vaganac	\N	229
3827	Gradina Korenička	\N	229
3828	Homoljac	\N	229
3829	Jasikovac	\N	229
3830	Jezerce	\N	229
3831	Kalebovac	\N	229
3832	Kapela Korenička	\N	229
3833	Kompolje Koreničko	\N	229
3834	Končarev Kraj	\N	229
3835	Korana	\N	229
3836	Korenica	\N	229
3837	Kozjan	\N	229
3838	Krbavica	\N	229
3839	Ličko Petrovo Selo	\N	229
3840	Mihaljevac	\N	229
3841	Novo Selo Koreničko	\N	229
3842	Oravac	\N	229
3843	Plitvica Selo	\N	229
3844	Plitvička Jezera	\N	229
3845	Plitvički Ljeskovac	\N	229
3846	Poljanak	\N	229
3847	Ponor Korenički	\N	229
3848	Prijeboj	\N	229
3849	Rastovača	\N	229
3850	Rešetar	\N	229
3851	Rudanovac	\N	229
3852	Sertić Poljana	\N	229
3853	Smoljanac	\N	229
3854	Šeganovac	\N	229
3855	Trnavac	\N	229
3856	Tuk Bjelopoljski	\N	229
3857	Vranovača	\N	229
3858	Vrelo Koreničko	\N	229
3859	Vrpile	\N	229
3860	Zaklopača	\N	229
3861	Željava	\N	229
3862	Breštane	\N	230
3863	Bunić	\N	230
3864	Čojluk	\N	230
3865	Debelo Brdo	\N	230
3866	Donji Mekinjar	\N	230
3867	Frkašić	\N	230
3868	Grabušić	\N	230
3869	Jagodnje	\N	230
3870	Jošan	\N	230
3871	Klašnjica	\N	230
3872	Komić	\N	230
3873	Krbava	\N	230
3874	Kurjak	\N	230
3875	Mutilić	\N	230
3876	Ondić	\N	230
3877	Pećane	\N	230
3878	Podlapača	\N	230
3879	Poljice	\N	230
3880	Rebić	\N	230
3881	Srednja Gora	\N	230
3882	Svračkovo Selo	\N	230
3883	Šalamunić	\N	230
3884	Tolić	\N	230
3885	Udbina	\N	230
3886	Vedašić	\N	230
3887	Visuć	\N	230
3888	Donji Babin Potok	\N	231
3889	Gornje Vrhovine	\N	231
3890	Gornji Babin Potok	\N	231
3891	Rudopolje	\N	231
3892	Turjanski	\N	231
3893	Vrhovine	\N	231
3894	Zalužnica	\N	231
3895	Bijeljevina Orahovička	\N	232
3896	Crkvari	\N	232
3897	Dolci	\N	232
3898	Donja Pištana	\N	232
3899	Duzluk	\N	232
3900	Gornja Pištana	\N	232
3901	Karlovac Feričanački	\N	232
3902	Kokočak	\N	232
3903	Magadinovac	\N	232
3904	Nova Jošava	\N	232
3905	Orahovica	\N	232
3906	Stara Jošava	\N	232
3907	Šumeđe	\N	232
3908	Bakić	\N	233
3909	Bistrica	\N	233
3910	Donji Meljani	\N	233
3911	Golenić	\N	233
3912	Gornji Miholjac	\N	233
3913	Ivanbrijeg	\N	233
3914	Kozice	\N	233
3915	Lukavac	\N	233
3916	Markovo	\N	233
3917	Medinci	\N	233
3918	Novi Senkovac	\N	233
3919	Radosavci	\N	233
3920	Slatina	\N	233
3921	Sladojevački Lug	\N	233
3922	Sladojevci	\N	233
3923	Čemernica	\N	234
3924	Golo Brdo	\N	234
3925	Jasenaš	\N	234
3926	Korija	\N	234
3927	Milanovac	\N	234
3928	Podgorje	\N	234
3929	Rezovac	\N	234
3930	Rezovačke Krčevine	\N	234
3931	Sveti Đurađ	\N	234
3932	Virovitica	\N	234
3933	Breštanovci	\N	235
3934	Crnac	\N	235
3935	Krivaja Pustara	\N	235
3936	Mali Rastovac	\N	235
3937	Milanovac	\N	235
3938	Novo Petrovo Polje	\N	235
3939	Staro Petrovo Polje	\N	235
3940	Suha Mlaka	\N	235
3941	Veliki Rastovac	\N	235
3942	Žabnjača	\N	235
3943	Brezovljani Vojlovički	\N	236
3944	Bukvik	\N	236
3945	Čačinci	\N	236
3946	Humljani	\N	236
3947	Krajna	\N	236
3948	Krasković	\N	236
3949	Paušinci	\N	236
3950	Prekoračani	\N	236
3951	Pušina	\N	236
3952	Rajino Polje	\N	236
3953	Slatinski Drenovac	\N	236
3954	Vojlovica	\N	236
3955	Čađavica	\N	237
3956	Čađavički Lug	\N	237
3957	Donje Bazije	\N	237
3958	Ilmin Dvor	\N	237
3959	Noskovačka Dubrava	\N	237
3960	Noskovci	\N	237
3961	Starin	\N	237
3962	Šaševo	\N	237
3963	Vraneševci	\N	237
3964	Zvonimirovac	\N	237
3965	Bačevac	\N	238
3966	Brezovica	\N	238
3967	Budakovac	\N	238
3968	Detkovac	\N	238
3969	Gradina	\N	238
3970	Lipovac	\N	238
3971	Lug Gradinski	\N	238
3972	Novi Gradac	\N	238
3973	Rušani	\N	238
3974	Vladimirovac	\N	238
3975	Žlebina	\N	238
3976	Brezik	\N	239
3977	Budrovac Lukački	\N	239
3978	Dugo Selo Lukačko	\N	239
3979	Gornje Bazje	\N	239
3980	Kapela Dvor	\N	239
3981	Katinka	\N	239
3982	Lukač	\N	239
3983	Rit	\N	239
3984	Terezino Polje	\N	239
3985	Turanovac	\N	239
3986	Veliko Polje	\N	239
3987	Zrinj Lukački	\N	239
3988	Balinci	\N	240
3989	Borik	\N	240
3990	Četekovac	\N	240
3991	Čojlug	\N	240
3992	Mikleuš	\N	240
3993	Bjelkovac	\N	241
3994	Brezik	\N	241
3995	Bukovački Antunovac	\N	241
3996	Dobrović	\N	241
3997	Donja Bukovica	\N	241
3998	Gornje Viljevo	\N	241
3999	Miljevci	\N	241
4000	Nova Bukovica	\N	241
4001	Dinjevac	\N	242
4002	Grabrovnica	\N	242
4003	Kladare	\N	242
4004	Križnica	\N	242
4005	Mala Črešnjevica	\N	242
4006	Otrovanec	\N	242
4007	Pitomača	\N	242
4008	Sedlarica	\N	242
4009	Stari Gradac	\N	242
4010	Starogradački Marof	\N	242
4011	Turnašica	\N	242
4012	Velika Črešnjevica	\N	242
4013	Gornje Predrijevo	\N	243
4014	Grabić	\N	243
4015	Josipovo	\N	243
4016	Kapinci	\N	243
4017	Nova Šarovka	\N	243
4018	Novaki	\N	243
4019	Sopjanska Greda	\N	243
4020	Sopje	\N	243
4021	Španat	\N	243
4022	Vaška	\N	243
4023	Višnjica	\N	243
4024	Borova	\N	244
4025	Budanica	\N	244
4026	Bukova	\N	244
4027	Cabuna	\N	244
4028	Dvorska	\N	244
4029	Gaćište	\N	244
4030	Gvozdanska	\N	244
4031	Jugovo Polje	\N	244
4032	Levinovac	\N	244
4033	Mala Trapinska	\N	244
4034	Naudovac	\N	244
4035	Orešac	\N	244
4036	Pčelić	\N	244
4037	Pepelana	\N	244
4038	Pivnica Slavonska	\N	244
4039	Rodin Potok	\N	244
4040	Sovjak	\N	244
4041	Suhopolje	\N	244
4042	Trnava Cabunska	\N	244
4043	Velika Trapinska	\N	244
4044	Zvonimirovo	\N	244
4045	Žiroslavje	\N	244
4046	Žubrica	\N	244
4047	Bušetina	\N	245
4048	Lozan	\N	245
4049	Novi Antunovac	\N	245
4050	Okrugljača	\N	245
4051	Rogovac	\N	245
4052	Špišić Bukovica	\N	245
4053	Vukosavljevica	\N	245
4054	Bokane	\N	246
4055	Čeralije	\N	246
4056	Dobrić	\N	246
4057	Donje Kusonje	\N	246
4058	Đuričić	\N	246
4059	Gornje Kusonje	\N	246
4060	Gornji Meljani	\N	246
4061	Hum	\N	246
4062	Hum Varoš	\N	246
4063	Kometnik-Jorgići	\N	246
4064	Kometnik-Zubići	\N	246
4065	Kuzma	\N	246
4066	Lisičine	\N	246
4067	Macute	\N	246
4068	Mačkovac	\N	246
4069	Novo Kusonje	\N	246
4070	Popovac	\N	246
4071	Rijenci	\N	246
4072	Sekulinci	\N	246
4073	Smude	\N	246
4074	Voćin	\N	246
4075	Bankovci	\N	247
4076	Donje Predrijevo	\N	247
4077	Duga Međa	\N	247
4078	Grudnjak	\N	247
4079	Kutovi	\N	247
4080	Obradovci	\N	247
4081	Slavonske Bare	\N	247
4082	Zdenci	\N	247
4083	Zokov Gaj	\N	247
4084	Bektež	\N	248
4085	Bjeliševac	\N	248
4086	Ciglenik	\N	248
4087	Ferovac	\N	248
4088	Grabarje	\N	248
4089	Gradište	\N	248
4090	Hrnjevac	\N	248
4091	Kula	\N	248
4092	Kutjevo	\N	248
4093	Lukač	\N	248
4094	Mitrovac	\N	248
4095	Ovčare	\N	248
4096	Poreč	\N	248
4097	Šumanovci	\N	248
4098	Tominovac	\N	248
4099	Venje	\N	248
4100	Vetovo	\N	248
4101	Antunovac	\N	249
4102	Bjelanovac	\N	249
4103	Brekinska	\N	249
4104	Brezine	\N	249
4105	Bujavica	\N	249
4106	Bukovčani	\N	249
4107	Dobrovac	\N	249
4108	Donji Čaglić	\N	249
4109	Filipovac	\N	249
4110	Gaj	\N	249
4111	Gornji Čaglić	\N	249
4112	Jagma	\N	249
4113	Japaga	\N	249
4114	Klisa	\N	249
4115	Korita	\N	249
4116	Kovačevac	\N	249
4117	Kukunjevac	\N	249
4118	Lipik	\N	249
4119	Livađani	\N	249
4120	Marino Selo	\N	249
4121	Poljana	\N	249
4122	Ribnjaci	\N	249
4123	Skenderovci	\N	249
4124	Strižičevac	\N	249
4125	Subocka	\N	249
4126	Šeovica	\N	249
4127	Badljevina	\N	250
4128	Batinjani	\N	250
4129	Bjelajci	\N	250
4130	Branešci	\N	250
4131	Brusnik	\N	250
4132	Bučje	\N	250
4133	Cicvare	\N	250
4134	Cikote	\N	250
4135	Dereza	\N	250
4136	Donja Obrijež	\N	250
4137	Donja Šumetlica	\N	250
4138	Donji Grahovljani	\N	250
4139	Dragović	\N	250
4140	Glavica	\N	250
4141	Gornja Obrijež	\N	250
4142	Gornja Šumetlica	\N	250
4143	Gornji Grahovljani	\N	250
4144	Jakovci	\N	250
4145	Kapetanovo Polje	\N	250
4146	Koturić	\N	250
4147	Kraguj	\N	250
4148	Kričke	\N	250
4149	Kusonje	\N	250
4150	Lipovac	\N	250
4151	Mali Banovac	\N	250
4152	Mali Budići	\N	250
4153	Novi Majur	\N	250
4154	Omanovac	\N	250
4155	Ožegovci	\N	250
4156	Pakrac	\N	250
4157	Ploštine	\N	250
4158	Popovci	\N	250
4159	Prekopakra	\N	250
4160	Prgomelje	\N	250
4161	Rogulje	\N	250
4162	Srednji Grahovljani	\N	250
4163	Stari Majur	\N	250
4164	Španovica	\N	250
4165	Tisovac	\N	250
4166	Toranj	\N	250
4167	Veliki Banovac	\N	250
4168	Veliki Budići	\N	250
4169	Ašikovci	\N	251
4170	Bilice	\N	251
4171	Blacko	\N	251
4172	Brđani	\N	251
4173	Bresnica	\N	251
4174	Brodski Drenovac	\N	251
4175	Bučje	\N	251
4176	Buk	\N	251
4177	Bzenica	\N	251
4178	Ćosinac	\N	251
4179	Frkljevci	\N	251
4180	Gradac	\N	251
4181	Kadanovci	\N	251
4182	Kalinić	\N	251
4183	Knežci	\N	251
4184	Komorica	\N	251
4185	Koprivnica	\N	251
4186	Kuzmica	\N	251
4187	Lakušija	\N	251
4188	Mali Bilač	\N	251
4189	Mihaljevići	\N	251
4190	Novoselci	\N	251
4191	Pleternica	\N	251
4192	Pleternički Mihaljevci	\N	251
4193	Poloje	\N	251
4194	Ratkovica	\N	251
4195	Resnik	\N	251
4196	Sesvete	\N	251
4197	Srednje Selo	\N	251
4198	Sulkovci	\N	251
4199	Svilna	\N	251
4200	Trapari	\N	251
4201	Tulnik	\N	251
4202	Vesela	\N	251
4203	Viškovci	\N	251
4204	Vrčin Dol	\N	251
4205	Zagrađe	\N	251
4206	Zarilac	\N	251
4207	Alaginci	\N	252
4208	Bankovci	\N	252
4209	Ćosine Laze	\N	252
4210	Crkveni Vrhovci	\N	252
4211	Dervišaga	\N	252
4212	Donji Emovci	\N	252
4213	Drškovci	\N	252
4214	Emovački Lug	\N	252
4215	Golobrdci	\N	252
4216	Gornji Emovci	\N	252
4217	Gradski Vrhovci	\N	252
4218	Komušina	\N	252
4219	Krivaj	\N	252
4220	Kunovci	\N	252
4221	Laze Prnjavor	\N	252
4222	Marindvor	\N	252
4223	Mihaljevci	\N	252
4224	Nova Lipa	\N	252
4225	Novi Mihaljevci	\N	252
4226	Novi Štitnjak	\N	252
4227	Novo Selo	\N	252
4228	Požega	\N	252
4229	Seoci	\N	252
4230	Stara Lipa	\N	252
4231	Šeovci	\N	252
4232	Škrabutnik	\N	252
4233	Štitnjak	\N	252
4234	Turnić	\N	252
4235	Ugarci	\N	252
4236	Vasine Laze	\N	252
4237	Vidovci	\N	252
4238	Amatovci	\N	253
4239	Bogdašić	\N	253
4240	Bolomače	\N	253
4241	Požega	\N	253
4242	Brestovac	\N	253
4243	Busnovi	\N	253
4244	Crljenci	\N	253
4245	Čečavac	\N	253
4246	Čečavački Vučjak	\N	253
4247	Daranovci	\N	253
4248	Deževci	\N	253
4249	Dolac	\N	253
4250	Donji Gučani	\N	253
4251	Gornji Gučani	\N	253
4252	Ivandol	\N	253
4253	Jaguplije	\N	253
4254	Jeminovac	\N	253
4255	Kamenska	\N	253
4256	Kamenski Šeovci	\N	253
4257	Kamenski Vučjak	\N	253
4258	Koprivna	\N	253
4259	Kruševo	\N	253
4260	Kujnik	\N	253
4261	Mihajlije	\N	253
4262	Mijači	\N	253
4263	Mrkoplje	\N	253
4264	Novo Zvečevo	\N	253
4265	Nurkovac	\N	253
4266	Oblakovac	\N	253
4267	Orljavac	\N	253
4268	Pasikovci	\N	253
4269	Pavlovci	\N	253
4270	Perenci	\N	253
4271	Podsreće	\N	253
4272	Požeški Brđani	\N	253
4273	Rasna	\N	253
4274	Ruševac	\N	253
4275	Sažije	\N	253
4276	Skenderovci	\N	253
4277	Sloboština	\N	253
4278	Striježevica	\N	253
4279	Šnjegavić	\N	253
4280	Šušnjari	\N	253
4281	Vilić Selo	\N	253
4282	Vranić	\N	253
4283	Zakorenje	\N	253
4284	Završje	\N	253
4285	Žigerovci	\N	253
4286	Čaglin	\N	254
4287	Darkovac	\N	254
4288	Djedina Rijeka	\N	254
4289	Dobra Voda	\N	254
4290	Dobrogošće	\N	254
4291	Draganlug	\N	254
4292	Duboka	\N	254
4293	Imrijevci	\N	254
4294	Ivanovci	\N	254
4295	Jasik	\N	254
4296	Jezero	\N	254
4297	Jurkovac	\N	254
4298	Kneževac	\N	254
4299	Latinovac	\N	254
4300	Migalovci	\N	254
4301	Milanlug	\N	254
4302	Mokreš	\N	254
4303	Nova Lipovica	\N	254
4304	Nova Ljeskovica	\N	254
4305	Novi Zdenkovac	\N	254
4306	Paka	\N	254
4307	Ruševo	\N	254
4308	Sapna	\N	254
4309	Sibokovac	\N	254
4310	Sovski Dol	\N	254
4311	Stara Ljeskovica	\N	254
4312	Stari Zdenkovac	\N	254
4313	Stojčinovac	\N	254
4314	Veliki Bilač	\N	254
4315	Vlatkovac	\N	254
4316	Vukojevica	\N	254
4317	Bertelovci	\N	255
4318	Cerovac	\N	255
4319	Eminovci	\N	255
4320	Granje	\N	255
4321	Jakšić	\N	255
4322	Radnovac	\N	255
4323	Rajsavac	\N	255
4324	Svetinja	\N	255
4325	Tekić	\N	255
4326	Treštanovci	\N	255
4327	Alilovci	\N	256
4328	Bešinci	\N	256
4329	Češljakovci	\N	256
4330	Doljanovci	\N	256
4331	Golo Brdo	\N	256
4332	Kaptol	\N	256
4333	Komarovci	\N	256
4334	Novi Bešinci	\N	256
4335	Podgorje	\N	256
4336	Ramanovci	\N	256
4337	Antunovac	\N	257
4338	Biškupci	\N	257
4339	Bratuljevci	\N	257
4340	Doljanci	\N	257
4341	Draga	\N	257
4342	Gornji Vrhovci	\N	257
4343	Kantrovci	\N	257
4344	Klisa	\N	257
4345	Lučinci	\N	257
4346	Markovac	\N	257
4347	Milanovac	\N	257
4348	Milivojevci	\N	257
4349	Nježić	\N	257
4350	Oljasi	\N	257
4351	Ozdakovci	\N	257
4352	Poljanska	\N	257
4353	Potočani	\N	257
4354	Radovanci	\N	257
4355	Smoljanovci	\N	257
4356	Stražeman	\N	257
4357	Toranj	\N	257
4358	Trenkovo	\N	257
4359	Trnovac	\N	257
4360	Velika	\N	257
4361	Kovačevac	\N	258
4362	Nova Gradiška	\N	258
4363	Ljupina	\N	258
4364	Prvča	\N	258
4365	Brodski Varoš	\N	259
4366	Slavonski Brod	\N	259
4367	Podvinje	\N	259
4368	Banovci	\N	260
4369	Bebrina	\N	260
4370	Dubočac	\N	260
4371	Kaniža	\N	260
4372	Stupnički Kuti	\N	260
4373	Šumeće	\N	260
4374	Zbjeg	\N	260
4375	Brodski Stupnik	\N	261
4376	Krajačići	\N	261
4377	Lovčić	\N	261
4378	Stari Slatinik	\N	261
4379	Bukovlje	\N	262
4380	Ježevik	\N	262
4381	Korduševci	\N	262
4382	Šušnjevci	\N	262
4383	Vranovci	\N	262
4384	Baćin Dol	\N	263
4385	Banićevac	\N	263
4386	Cernik	\N	263
4387	Giletinci	\N	263
4388	Golobrdac	\N	263
4389	Opatovac	\N	263
4390	Opršinac	\N	263
4391	Podvrško	\N	263
4392	Sinlije	\N	263
4393	Šagovina Cernička	\N	263
4394	Šumetlica	\N	263
4395	Davor	\N	264
4396	Orubica	\N	264
4397	Donji Andrijevci	\N	265
4398	Novo Topolje	\N	265
4399	Sredanci	\N	265
4400	Staro Topolje	\N	265
4401	Donji Bogićevci	\N	266
4402	Dragalić	\N	266
4403	Gorice	\N	266
4404	Mašić	\N	266
4405	Medari	\N	266
4406	Poljane	\N	266
4407	Bicko Selo	\N	267
4408	Garčin	\N	267
4409	Klokočevik	\N	267
4410	Sapci	\N	267
4411	Selna	\N	267
4412	Trnjani	\N	267
4413	Vrhovina	\N	267
4414	Zadubravlje	\N	267
4415	Donja Vrba	\N	268
4416	Gornja Vrba	\N	268
4417	Dubovac	\N	269
4418	Gornji Bogićevci	\N	269
4419	Kosovac	\N	269
4420	Ratkovac	\N	269
4421	Smrtić	\N	269
4422	Trnava	\N	269
4423	Gundinci	\N	270
4424	Donja Bebrina	\N	271
4425	Gornja Bebrina	\N	271
4426	Klakar	\N	271
4427	Rušćica	\N	271
4428	Batrina	\N	272
4429	Bili Brig	\N	272
4430	Donji Lipovac	\N	272
4431	Dragovci	\N	272
4432	Gornji Lipovac	\N	272
4433	Magić Mala	\N	272
4434	Nova Kapela	\N	272
4435	Pavlovci	\N	272
4436	Seoce	\N	272
4437	Siče	\N	272
4438	Srednji Lipovac	\N	272
4439	Stara Kapela	\N	272
4440	Benkovac	\N	273
4441	Bijela Stijena	\N	273
4442	Bobare	\N	273
4443	Bodegraj	\N	273
4444	Cage	\N	273
4445	Čaprginci	\N	273
4446	Čovac	\N	273
4447	Donji Rogolji	\N	273
4448	Gornji Rogolji	\N	273
4449	Lađevac	\N	273
4450	Lještani	\N	273
4451	Okučani	\N	273
4452	Šagovina Mašićka	\N	273
4453	Širinci	\N	273
4454	Trnakovac	\N	273
4455	Vrbovljani	\N	273
4456	Žuberkovac	\N	273
4457	Novi Grad	\N	274
4458	Oprisavci	\N	274
4459	Poljanci	\N	274
4460	Prnjavor	\N	274
4461	Stružani	\N	274
4462	Svilaj	\N	274
4463	Trnjanski Kuti	\N	274
4464	Zoljani	\N	274
4465	Bečic	\N	275
4466	Ciglenik	\N	275
4467	Kujnik	\N	275
4468	Lužani	\N	275
4469	Malino	\N	275
4470	Oriovac	\N	275
4471	Pričac	\N	275
4472	Radovanje	\N	275
4473	Slavonski Kobaš	\N	275
4474	Živike	\N	275
4475	Brodski Zdenci	\N	276
4476	Crni Potok	\N	276
4477	Donji Slatinik	\N	276
4478	Dubovik	\N	276
4479	Glogovica	\N	276
4480	Gornji Slatinik	\N	276
4481	Grabarje	\N	276
4482	Kindrovo	\N	276
4483	Matković Mala	\N	276
4484	Oriovčić	\N	276
4485	Podcrkavlje	\N	276
4486	Rastušje	\N	276
4487	Tomica	\N	276
4488	Adžamovci	\N	277
4489	Brđani	\N	277
4490	Bukovica	\N	277
4491	Drežnik	\N	277
4492	Gunjavci	\N	277
4493	Rešetari	\N	277
4494	Zapolje	\N	277
4495	Bartolovci	\N	278
4496	Brčino	\N	278
4497	Čelikovići	\N	278
4498	Gornji Andrijevci	\N	278
4499	Grgurevići	\N	278
4500	Grižići	\N	278
4501	Gromačnik	\N	278
4502	Jakačina Mala	\N	278
4503	Ravan	\N	278
4504	Sibinj	\N	278
4505	Slobodnica	\N	278
4506	Završje	\N	278
4507	Jaruge	\N	279
4508	Sikirevci	\N	279
4509	Kruševica	\N	280
4510	Slavonski Šamac	\N	280
4511	Donji Varoš	\N	281
4512	Gornji Varoš	\N	281
4513	Gređani	\N	281
4514	Novi Varoš	\N	281
4515	Pivare	\N	281
4516	Stara Gradiška	\N	281
4517	Uskoci	\N	281
4518	Blažević Dol	\N	282
4519	Donji Crnogovci	\N	282
4520	Godinjak	\N	282
4521	Gornji Crnogovci	\N	282
4522	Komarnica	\N	282
4523	Laze	\N	282
4524	Oštri Vrh	\N	282
4525	Starci	\N	282
4526	Staro Petrovo Selo	\N	282
4527	Štivica	\N	282
4528	Tisovac	\N	282
4529	Vladisovo	\N	282
4530	Vrbova	\N	282
4531	Beravci	\N	283
4532	Divoševci	\N	283
4533	Kupina	\N	283
4534	Mala Kopanica	\N	283
4535	Velika Kopanica	\N	283
4536	Bodovaljci	\N	284
4537	Dolina	\N	284
4538	Mačkovac	\N	284
4539	Savski Bok	\N	284
4540	Sičice	\N	284
4541	Visoka Greda	\N	284
4542	Vrbje	\N	284
4543	Čajkovci	\N	285
4544	Stari Perkovci	\N	285
4545	Vrpolje	\N	285
4546	Benkovac	\N	286
4547	Benkovačko Selo	\N	286
4548	Bjelina	\N	286
4549	Brgud	\N	286
4550	Bruška	\N	286
4551	Buković	\N	286
4552	Bulić	\N	286
4553	Dobra Voda	\N	286
4554	Donje Biljane	\N	286
4555	Donje Ceranje	\N	286
4556	Donji Karin	\N	286
4557	Donji Kašić	\N	286
4558	Donji Lepuri	\N	286
4559	Gornje Biljane	\N	286
4560	Gornje Ceranje	\N	286
4561	Islam Grčki	\N	286
4562	Kolarina	\N	286
4563	Korlat	\N	286
4564	Kožlovac	\N	286
4565	Kula Atlagić	\N	286
4566	Lisičić	\N	286
4567	Lišane Tinjske	\N	286
4568	Medviđa	\N	286
4569	Miranje	\N	286
4570	Nadin	\N	286
4571	Perušić Benkovački	\N	286
4572	Perušić Donji	\N	286
4573	Podgrađe	\N	286
4574	Podlug	\N	286
4575	Popovići	\N	286
4576	Pristeg	\N	286
4577	Prović	\N	286
4578	Radošinovci	\N	286
4579	Raštević	\N	286
4580	Rodaljice	\N	286
4581	Smilčić	\N	286
4582	Šopot	\N	286
4583	Tinj	\N	286
4584	Vukšić	\N	286
4585	Zagrad	\N	286
4586	Zapužane	\N	286
4587	Biograd na Moru	\N	287
4588	Grbe	\N	288
4589	Nin	\N	288
4590	Ninski Stanovi	\N	288
4591	Poljica-Brig	\N	288
4592	Zaton	\N	288
4593	Žerava	\N	288
4594	Bilišane	\N	289
4595	Bogatnik	\N	289
4596	Golubić	\N	289
4597	Gornji Karin	\N	289
4598	Kaštel Žegarski	\N	289
4599	Komazeci	\N	289
4600	Krupa	\N	289
4601	Kruševo	\N	289
4602	Muškovci	\N	289
4603	Nadvoda	\N	289
4604	Obrovac	\N	289
4605	Zelengrad	\N	289
4606	Bošana	\N	290
4607	Dinjiška	\N	290
4608	Gorica	\N	290
4609	Košljun	\N	290
4610	Miškovci	\N	290
4611	Pag	\N	290
4612	Smokvica	\N	290
4613	Stara Vas	\N	290
4614	Šimuni	\N	290
4615	Vlašići	\N	290
4616	Vrčići	\N	290
4617	Babindub	\N	291
4618	Brgulje	\N	291
4619	Crno	\N	291
4620	Ist	\N	291
4621	Kožino	\N	291
4622	Mali Iž	\N	291
4623	Molat	\N	291
4624	Olib	\N	291
4625	Petrčane	\N	291
4626	Premuda	\N	291
4627	Rava	\N	291
4628	Silba	\N	291
4629	Veli Iž	\N	291
4630	Zadar	\N	291
4631	Zapuntel	\N	291
4632	Bibinje	\N	292
4633	Galovac	\N	293
4634	Begluci	\N	294
4635	Brotnja	\N	294
4636	Bruvno	\N	294
4637	Cerovac	\N	294
4638	Dabašnica	\N	294
4639	Deringaj	\N	294
4640	Drenovac Osredački	\N	294
4641	Duboki Dol	\N	294
4642	Dugopolje	\N	294
4643	Glogovo	\N	294
4644	Grab	\N	294
4645	Gračac	\N	294
4646	Gubavčevo Polje	\N	294
4647	Kaldrma	\N	294
4648	Kijani	\N	294
4649	Kom	\N	294
4650	Kunovac Kupirovački	\N	294
4651	Kupirovo	\N	294
4652	Mazin	\N	294
4653	Nadvrelo	\N	294
4654	Neteka	\N	294
4655	Omsica	\N	294
4656	Osredci	\N	294
4657	Otrić	\N	294
4658	Palanka	\N	294
4659	Pribudić	\N	294
4660	Prljevo	\N	294
4661	Rastičevo	\N	294
4662	Rudopolje Bruvanjsko	\N	294
4663	Srb	\N	294
4664	Suvaja	\N	294
4665	Tiškovac Lički	\N	294
4666	Tomingaj	\N	294
4667	Velika Popina	\N	294
4668	Vučipolje	\N	294
4669	Zaklopac	\N	294
4670	Zrmanja	\N	294
4671	Zrmanja Vrelo	\N	294
4672	Jasenice	\N	295
4673	Rovanjska	\N	295
4674	Zaton Obrovački	\N	295
4675	Kali	\N	296
4676	Kolan	\N	297
4677	Kolanski Gajac	\N	297
4678	Mandre	\N	297
4679	Kukljica	\N	298
4680	Dobropoljci	\N	299
4681	Lišane Ostrovičke	\N	299
4682	Ostrovica	\N	299
4683	Novigrad	\N	300
4684	Paljuv	\N	300
4685	Pridraga	\N	300
4686	Drage	\N	301
4687	Pakoštane	\N	301
4688	Vrana	\N	301
4689	Vrgada	\N	301
4690	Banj	\N	302
4691	Dobropoljana	\N	302
4692	Kraj	\N	302
4693	Mrljane	\N	302
4694	Neviđane	\N	302
4695	Pašman	\N	302
4696	Ždrelac	\N	302
4697	Donja Jagodnja	\N	303
4698	Gornja Jagodnja	\N	303
4699	Kakma	\N	303
4700	Polača	\N	303
4701	Briševo	\N	304
4702	Dračevac Ninski	\N	304
4703	Gornji Poličnik	\N	304
4704	Lovinac	\N	304
4705	Murvica	\N	304
4706	Murvica Gornja	\N	304
4707	Poličnik	\N	304
4708	Rupalj	\N	304
4709	Suhovare	\N	304
4710	Visočane	\N	304
4711	Grgurice	\N	305
4712	Islam Latinski	\N	305
4713	Podgradina	\N	305
4714	Posedarje	\N	305
4715	Slivnica	\N	305
4716	Vinjerac	\N	305
4717	Ždrilo	\N	305
4718	Povljana	\N	306
4719	Lukoran	\N	307
4720	Ošljak	\N	307
4721	Poljana	\N	307
4722	Preko	\N	307
4723	Rivanj	\N	307
4724	Sestrunj	\N	307
4725	Sutomišćica	\N	307
4726	Ugljan	\N	307
4727	Privlaka	\N	308
4728	Jovići	\N	309
4729	Krneza	\N	309
4730	Ljubač	\N	309
4731	Ljubački Stanovi	\N	309
4732	Podvršje	\N	309
4733	Radovin	\N	309
4734	Ražanac	\N	309
4735	Rtina	\N	309
4736	Božava	\N	310
4737	Brbinj	\N	310
4738	Dragove	\N	310
4739	Luka	\N	310
4740	Sali	\N	310
4741	Savar	\N	310
4742	Soline	\N	310
4743	Veli Rat	\N	310
4744	Verunić	\N	310
4745	Zaglav	\N	310
4746	Zverinac	\N	310
4747	Žman	\N	310
4748	Banjevci	\N	311
4749	Bila Vlaka	\N	311
4750	Budak	\N	311
4751	Crljenik	\N	311
4752	Morpolača	\N	311
4753	Stankovci	\N	311
4754	Velim	\N	311
4755	Seline	\N	312
4756	Starigrad	\N	312
4757	Tribanj	\N	312
4758	Debeljak	\N	313
4759	Glavica	\N	313
4760	Gorica	\N	313
4761	Sukošan	\N	313
4762	Donje Raštane	\N	314
4763	Gornje Raštane	\N	314
4764	Sikovo	\N	314
4765	Sveti Filip i Jakov	\N	314
4766	Sveti Petar	\N	314
4767	Turanj	\N	314
4768	Prkos	\N	315
4769	Škabrnja	\N	315
4770	Tkon	\N	316
4771	Lozice	\N	317
4772	Torovi	\N	317
4773	Vir	\N	317
4774	Poljica	\N	318
4775	Vrsi	\N	318
4776	Smoković	\N	319
4777	Zemunik Donji	\N	319
4778	Zemunik Gornji	\N	319
4779	Beli Manastir	\N	320
4780	Branjin Vrh	\N	320
4781	Šećerana	\N	320
4782	Šumarina	\N	320
4783	Belišće	\N	321
4784	Bistrinci	\N	321
4785	Bocanjevci	\N	321
4786	Gat	\N	321
4787	Gorica Valpovačka	\N	321
4788	Kitišanci	\N	321
4789	Tiborjanci	\N	321
4790	Veliškovci	\N	321
4791	Vinogradci	\N	321
4792	Donji Miholjac	\N	322
4793	Golinci	\N	322
4794	Miholjački Poreč	\N	322
4795	Podgajci Podravski	\N	322
4796	Radikovci	\N	322
4797	Rakitovica	\N	322
4798	Sveti Đurađ	\N	322
4799	Budrovci	\N	323
4800	Đakovo	\N	323
4801	Đurđanci	\N	323
4802	Ivanovci Gorjanski	\N	323
4803	Kuševac	\N	323
4804	Novi Perkovci	\N	323
4805	Piškorevci	\N	323
4806	Selci Đakovački	\N	323
4807	Široko Polje	\N	323
4808	Brezik Našički	\N	324
4809	Ceremošnjak	\N	324
4810	Crna Klada	\N	324
4811	Gradac Našički	\N	324
4812	Granice	\N	324
4813	Jelisavac	\N	324
4814	Lađanska	\N	324
4815	Lila	\N	324
4816	Londžica	\N	324
4817	Makloševac	\N	324
4818	Markovac Našički	\N	324
4819	Martin	\N	324
4820	Našice	\N	324
4821	Polubaše	\N	324
4822	Ribnjak	\N	324
4823	Rozmajerovac	\N	324
4824	Velimirovac	\N	324
4825	Vukojevci	\N	324
4826	Zoljan	\N	324
4827	Brijest	\N	325
4828	Briješće	\N	325
4829	Josipovac	\N	325
4830	Klisa	\N	325
4831	Nemetin	\N	325
4832	Osijek	\N	325
4833	Podravlje	\N	325
4834	Sarvaš	\N	325
4835	Tenja	\N	325
4836	Tvrđavica	\N	325
4837	Višnjevac	\N	325
4838	Harkanovci	\N	326
4839	Ivanovci	\N	326
4840	Ladimirevci	\N	326
4841	Marjančaci	\N	326
4842	Nard	\N	326
4843	Šag	\N	326
4844	Valpovo	\N	326
4845	Zelčin	\N	326
4846	Antunovac	\N	327
4847	Ivanovac	\N	327
4848	Bilje	\N	328
4849	Kopačevo	\N	328
4850	Kozjak	\N	328
4851	Lug	\N	328
4852	Podunavlje	\N	328
4853	Tikveš	\N	328
4854	Vardarac	\N	328
4855	Zlatna Greda	\N	328
4856	Bizovac	\N	329
4857	Brođanci	\N	329
4858	Cerovac	\N	329
4859	Cret Bizovački	\N	329
4860	Habjanovci	\N	329
4861	Novaki Bizovački	\N	329
4862	Samatovci	\N	329
4863	Selci	\N	329
4864	Čeminac	\N	330
4865	Grabovac	\N	330
4866	Kozarac	\N	330
4867	Mitrovac	\N	330
4868	Novi Čeminac	\N	330
4869	Beketinci	\N	331
4870	Čepin	\N	331
4871	Čepinski Martinci	\N	331
4872	Čokadinci	\N	331
4873	Livana	\N	331
4874	Darda	\N	332
4875	Mece	\N	332
4876	Švajcarnica	\N	332
4877	Uglješ	\N	332
4878	Donja Motičina	\N	333
4879	Gornja Motičina	\N	333
4880	Seona	\N	333
4881	Batina	\N	334
4882	Draž	\N	334
4883	Duboševica	\N	334
4884	Gajić	\N	334
4885	Podolje	\N	334
4886	Topolje	\N	334
4887	Borovik	\N	335
4888	Bračevci	\N	335
4889	Bučje Gorjansko	\N	335
4890	Drenje	\N	335
4891	Kućanci Đakovački	\N	335
4892	Mandićevac	\N	335
4893	Paljevina	\N	335
4894	Podgorje Bračevačko	\N	335
4895	Potnjani	\N	335
4896	Preslatinci	\N	335
4897	Pridvorje	\N	335
4898	Slatinik Drenjski	\N	335
4899	Beljevina	\N	336
4900	Bokšić	\N	336
4901	Bokšić Lug	\N	336
4902	Đurđenovac	\N	336
4903	Gabrilovac	\N	336
4904	Klokočevci	\N	336
4905	Ličko Novo Selo	\N	336
4906	Lipine	\N	336
4907	Našičko Novo Selo	\N	336
4908	Pribiševci	\N	336
4909	Sušine	\N	336
4910	Šaptinovci	\N	336
4911	Teodorovac	\N	336
4912	Aljmaš	\N	337
4913	Bijelo Brdo	\N	337
4914	Dalj	\N	337
4915	Erdut	\N	337
4916	Divoš	\N	338
4917	Ernestinovo	\N	338
4918	Laslovo	\N	338
4919	Feričanci	\N	339
4920	Gazije	\N	339
4921	Valenovac	\N	339
4922	Vučjak Feričanački	\N	339
4923	Gorjani	\N	340
4924	Tomašanci	\N	340
4925	Bolman	\N	341
4926	Jagodnjak	\N	341
4927	Majške Međe	\N	341
4928	Novi Bolman	\N	341
4929	Jasenovac	\N	342
4930	Kamenac	\N	342
4931	Karanac	\N	342
4932	Kneževi Vinogradi	\N	342
4933	Kotlina	\N	342
4934	Mirkovac	\N	342
4935	Sokolovac	\N	342
4936	Suza	\N	342
4937	Zmajevac	\N	342
4938	Andrijevac	\N	343
4939	Branimirovac	\N	343
4940	Breznica Našička	\N	343
4941	Koška	\N	343
4942	Ledenik	\N	343
4943	Lug Subotički	\N	343
4944	Niza	\N	343
4945	Normanci	\N	343
4946	Ordanja	\N	343
4947	Topoline	\N	343
4948	Borojevci	\N	344
4949	Breznica Đakovačka	\N	344
4950	Čenkovo	\N	344
4951	Levanjska Varoš	\N	344
4952	Majar	\N	344
4953	Milinac	\N	344
4954	Musić	\N	344
4955	Ovčara	\N	344
4956	Paučje	\N	344
4957	Ratkov Dol	\N	344
4958	Slobodna Vlast	\N	344
4959	Beničanci	\N	345
4960	Kućanci	\N	345
4961	Lacići	\N	345
4962	Magadenovac	\N	345
4963	Malinovac	\N	345
4964	Šljivoševci	\N	345
4965	Bočkinci	\N	346
4966	Brezovica	\N	346
4967	Čamagajevci	\N	346
4968	Črnkovci	\N	346
4969	Kunišinci	\N	346
4970	Marijanci	\N	346
4971	Marjanski Ivanovci	\N	346
4972	Baranjsko Petrovo Selo	\N	347
4973	Luč	\N	347
4974	Novi Bezdan	\N	347
4975	Novo Nevesinje	\N	347
4976	Petlovac	\N	347
4977	Sudaraž	\N	347
4978	Širine	\N	347
4979	Torjanci	\N	347
4980	Zeleno Polje	\N	347
4981	Petrijevci	\N	348
4982	Satnica	\N	348
4983	Bijela Loza	\N	349
4984	Budimci	\N	349
4985	Kelešinka	\N	349
4986	Kršinci	\N	349
4987	Ostrošinci	\N	349
4988	Podgorač	\N	349
4989	Poganovci	\N	349
4990	Razbojište	\N	349
4991	Stipanovci	\N	349
4992	Gezinci	\N	350
4993	Krčenik	\N	350
4994	Martinci Miholjački	\N	350
4995	Podravska Moslavina	\N	350
4996	Branjina	\N	351
4997	Kneževo	\N	351
4998	Popovac	\N	351
4999	Josipovac Punitovački	\N	352
5000	Jurjevac Punitovački	\N	352
5001	Krndija	\N	352
5002	Punitovci	\N	352
5003	Gašinci	\N	353
5004	Satnica Đakovačka	\N	353
5005	Kešinci	\N	354
5006	Koritna	\N	354
5007	Mrzović	\N	354
5008	Semeljci	\N	354
5009	Vrbica	\N	354
5010	Merolino Sikirevačko	\N	355
5011	Strizivojna	\N	355
5012	Ada	\N	356
5013	Koprivna	\N	356
5014	Palača	\N	356
5015	Paulin Dvor	\N	356
5016	Petrova Slatina	\N	356
5017	Silaš	\N	356
5018	Šodolovci	\N	356
5019	Dragotin	\N	357
5020	Hrkanovci Đakovački	\N	357
5021	Kondrić	\N	357
5022	Lapovci	\N	357
5023	Svetoblažje	\N	357
5024	Trnava	\N	357
5025	Blanje	\N	358
5026	Bockovac	\N	358
5027	Cret Viljevski	\N	358
5028	Ivanovo	\N	358
5029	Kapelna	\N	358
5030	Krunoslavje	\N	358
5031	Viljevo	\N	358
5032	Forkuševci	\N	359
5033	Viškovci	\N	359
5034	Vučevci	\N	359
5035	Dopsin	\N	360
5036	Hrastin	\N	360
5037	Vladislavci	\N	360
5038	Hrastovac	\N	361
5039	Lipovac Hrastinski	\N	361
5040	Vuka	\N	361
5041	Badanj	\N	362
5042	Biočić	\N	362
5043	Bogatić	\N	362
5044	Brištane	\N	362
5045	Drinovci	\N	362
5046	Drniš	\N	362
5047	Kadina Glavica	\N	362
5048	Kanjane	\N	362
5049	Kaočine	\N	362
5050	Karalić	\N	362
5051	Ključ	\N	362
5052	Kričke	\N	362
5053	Lišnjak	\N	362
5054	Miočić	\N	362
5055	Nos Kalik	\N	362
5056	Pakovo Selo	\N	362
5057	Parčić	\N	362
5058	Pokrovnik	\N	362
5059	Radonić	\N	362
5060	Sedramić	\N	362
5061	Siverić	\N	362
5062	Širitovci	\N	362
5063	Štikovo	\N	362
5064	Tepljuh	\N	362
5065	Trbounje	\N	362
5066	Velušić	\N	362
5067	Žitnić	\N	362
5068	Golubić	\N	363
5069	Knin	\N	363
5070	Kninsko Polje	\N	363
5071	Kovačić	\N	363
5072	Ljubač	\N	363
5073	Očestovo	\N	363
5074	Plavno	\N	363
5075	Polača	\N	363
5076	Potkonje	\N	363
5077	Radljevac	\N	363
5078	Strmica	\N	363
5079	Vrpolje	\N	363
5080	Žagrović	\N	363
5081	Bičine	\N	364
5082	Bratiškovci	\N	364
5083	Bribir	\N	364
5084	Cicvare	\N	364
5085	Dubravice	\N	364
5086	Gorice	\N	364
5087	Gračac	\N	364
5088	Ićevo	\N	364
5089	Krković	\N	364
5090	Lađevci	\N	364
5091	Međare	\N	364
5092	Piramatovci	\N	364
5093	Plastovo	\N	364
5094	Rupe	\N	364
5095	Skradin	\N	364
5096	Skradinsko Polje	\N	364
5097	Sonković	\N	364
5098	Vačani	\N	364
5099	Velika Glava	\N	364
5100	Žažvić	\N	364
5101	Ždrapanj	\N	364
5102	Boraja	\N	365
5103	Brnjica	\N	365
5104	Čvrljevo	\N	365
5105	Danilo Biranj	\N	365
5106	Danilo Gornje	\N	365
5107	Danilo Kraljice	\N	365
5108	Donje Polje	\N	365
5109	Dubrava kod Šibenika	\N	365
5110	Goriš	\N	365
5111	Gradina	\N	365
5112	Grebaštica	\N	365
5113	Jadrtovac	\N	365
5114	Kaprije	\N	365
5115	Konjevrate	\N	365
5116	Krapanj	\N	365
5117	Lepenica	\N	365
5118	Lozovac	\N	365
5119	Mravnica	\N	365
5120	Perković	\N	365
5121	Podine	\N	365
5122	Radonić	\N	365
5123	Raslina	\N	365
5124	Sitno Donje	\N	365
5125	Slivno	\N	365
5126	Šibenik	\N	365
5127	Vrpolje	\N	365
5128	Vrsno	\N	365
5129	Zaton	\N	365
5130	Zlarin	\N	365
5131	Žirje	\N	365
5132	Čista Mala	\N	366
5133	Čista Velika	\N	366
5134	Gaćelezi	\N	366
5135	Grabovci	\N	366
5136	Prvić Luka	\N	366
5137	Prvić Šepurine	\N	366
5138	Srima	\N	366
5139	Vodice	\N	366
5140	Bilice	\N	367
5141	Biskupija	\N	368
5142	Markovac	\N	368
5143	Orlić	\N	368
5144	Ramljane	\N	368
5145	Riđane	\N	368
5146	Uzdolje	\N	368
5147	Vrbnik	\N	368
5148	Zvjerinac	\N	368
5149	Cetina	\N	369
5150	Civljane	\N	369
5151	Ervenik	\N	370
5152	Mokro Polje	\N	370
5153	Oton	\N	370
5154	Pađene	\N	370
5155	Radučić	\N	370
5156	Kijevo	\N	371
5157	Biovičino Selo	\N	372
5158	Đevrske	\N	372
5159	Gošić	\N	372
5160	Ivoševci	\N	372
5161	Kakanj	\N	372
5162	Kistanje	\N	372
5163	Kolašac	\N	372
5164	Krnjeuve	\N	372
5165	Modrino Selo	\N	372
5166	Nunić	\N	372
5167	Parčić	\N	372
5168	Smrdelje	\N	372
5169	Varivode	\N	372
5170	Zečevo	\N	372
5171	Kornati	\N	373
5172	Murter	\N	373
5173	Kašić	\N	374
5174	Pirovac	\N	374
5175	Putičanje	\N	374
5176	Kruševo	\N	375
5177	Primošten	\N	375
5178	Primošten Burnji	\N	375
5179	Široke	\N	375
5180	Vadalj	\N	375
5181	Vezac	\N	375
5182	Bobodol	\N	376
5183	Bogetić	\N	376
5184	Čitluk	\N	376
5185	Lukar	\N	376
5186	Ljubotić	\N	376
5187	Matase	\N	376
5188	Mratovo	\N	376
5189	Oklaj	\N	376
5190	Puljane	\N	376
5191	Razvođe	\N	376
5192	Suknovci	\N	376
5193	Dvornica	\N	377
5194	Jarebinjak	\N	377
5195	Ložnice	\N	377
5196	Oglavci	\N	377
5197	Podglavica	\N	377
5198	Podorljak	\N	377
5199	Ražanj	\N	377
5200	Rogoznica	\N	377
5201	Sapina Doca	\N	377
5202	Zečevo Rogozničko	\N	377
5203	Baljci	\N	378
5204	Čavoglave	\N	378
5205	Gradac	\N	378
5206	Kljake	\N	378
5207	Mirlović Polje	\N	378
5208	Moseć	\N	378
5209	Otavice	\N	378
5210	Ružić	\N	378
5211	Umljanović	\N	378
5212	Betina	\N	379
5213	Dazlina	\N	379
5214	Dubrava kod Tisna	\N	379
5215	Jezera	\N	379
5216	Prosika	\N	379
5217	Tisno	\N	379
5218	Tribunj	\N	380
5219	Cera	\N	381
5220	Čvrljevo	\N	381
5221	Donje Planjane	\N	381
5222	Donje Utore	\N	381
5223	Donje Vinovo	\N	381
5224	Gornje Planjane	\N	381
5225	Gornje Utore	\N	381
5226	Gornje Vinovo	\N	381
5227	Koprno	\N	381
5228	Ljubostinje	\N	381
5229	Mirlović Zagora	\N	381
5230	Nevest	\N	381
5231	Ostrogašica	\N	381
5232	Podumci	\N	381
5233	Unešić	\N	381
5234	Visoka	\N	381
5235	Bapska	\N	382
5236	Ilok	\N	382
5237	Mohovo	\N	382
5238	Šarengrad	\N	382
5239	Komletinci	\N	383
5240	Otok	\N	383
5241	Mirkovci	\N	384
5242	Vinkovci	\N	384
5243	Lipovača	\N	385
5244	Sotin	\N	385
5245	Vukovar	\N	385
5246	Županja	\N	386
5247	Andrijaševci	\N	387
5248	Rokovci	\N	387
5249	Babina Greda	\N	388
5250	Bogdanovci	\N	389
5251	Petrovci	\N	389
5252	Svinjarevci	\N	389
5253	Borovo	\N	390
5254	Bošnjaci	\N	391
5255	Cerna	\N	392
5256	Šiškovci	\N	392
5257	Drenovci	\N	393
5258	Đurići	\N	393
5259	Posavski Podgajci	\N	393
5260	Račinovci	\N	393
5261	Rajevo Selo	\N	393
5262	Gradište	\N	394
5263	Gunja	\N	395
5264	Ivankovo	\N	396
5265	Prkovci	\N	396
5266	Retkovci	\N	396
5267	Jarmina	\N	397
5268	Lovas	\N	398
5269	Opatovac	\N	398
5270	Gaboš	\N	399
5271	Karadžićevo	\N	399
5272	Markušica	\N	399
5273	Ostrovo	\N	399
5274	Podrinje	\N	399
5275	Negoslavci	\N	400
5276	Apševci	\N	401
5277	Banovci	\N	401
5278	Donje Novo Selo	\N	401
5279	Đeletovci	\N	401
5280	Lipovac	\N	401
5281	Nijemci	\N	401
5282	Podgrađe	\N	401
5283	Vinkovački Banovci	\N	401
5284	Cerić	\N	402
5285	Marinci	\N	402
5286	Nuštar	\N	402
5287	Privlaka	\N	403
5288	Novi Jankovci	\N	404
5289	Orolik	\N	404
5290	Slakovci	\N	404
5291	Srijemske Laze	\N	404
5292	Stari Jankovci	\N	404
5293	Novi Mikanovci	\N	405
5294	Stari Mikanovci	\N	405
5295	Štitar	\N	406
5296	Berak	\N	407
5297	Bokšić	\N	407
5298	Čakovci	\N	407
5299	Grabovo	\N	407
5300	Mikluševci	\N	407
5301	Tompojevci	\N	407
5302	Antin	\N	408
5303	Korog	\N	408
5304	Mlaka Antinska	\N	408
5305	Tordinci	\N	408
5306	Ilača	\N	409
5307	Tovarnik	\N	409
5308	Bobota	\N	410
5309	Bršadin	\N	410
5310	Ćelija	\N	410
5311	Ludvinci	\N	410
5312	Pačetin	\N	410
5313	Trpinja	\N	410
5314	Vera	\N	410
5315	Vođinci	\N	411
5316	Soljani	\N	412
5317	Strošinci	\N	412
5318	Vrbanja	\N	412
5319	Brusje	\N	413
5320	Hvar	\N	413
5321	Jagodna	\N	413
5322	Malo Grablje	\N	413
5323	Milna	\N	413
5324	Sveta Nedjelja	\N	413
5325	Velo Grablje	\N	413
5326	Zaraće	\N	413
5327	Donji Vinjani	\N	414
5328	Glavina Donja	\N	414
5329	Glavina Gornja	\N	414
5330	Gornji Vinjani	\N	414
5331	Imotski	\N	414
5332	Medvidovića Draga	\N	414
5333	Kaštel Gomilica	\N	415
5334	Kaštel Kambelovac	\N	415
5335	Kaštel Lukšić	\N	415
5336	Kaštel Novi	\N	415
5337	Kaštel Stari	\N	415
5338	Kaštel Sućurac	\N	415
5339	Kaštel Štafilić	\N	415
5340	Biševo	\N	416
5341	Borovik	\N	416
5342	Duboka	\N	416
5343	Komiža	\N	416
5344	Oključna	\N	416
5345	Palagruža	\N	416
5346	Podhumlje	\N	416
5347	Podšpilje	\N	416
5348	Sveti Andrija	\N	416
5349	Žena Glava	\N	416
5350	Makarska	\N	417
5351	Veliko Brdo	\N	417
5352	Blato na Cetini	\N	418
5353	Borak	\N	418
5354	Čelina	\N	418
5355	Čisla	\N	418
5356	Donji Dolac	\N	418
5357	Dubrava	\N	418
5358	Gata	\N	418
5359	Gornji Dolac	\N	418
5360	Kostanje	\N	418
5361	Kučiće	\N	418
5362	Lokva Rogoznica	\N	418
5363	Marušići	\N	418
5364	Mimice	\N	418
5365	Naklice	\N	418
5366	Nova Sela	\N	418
5367	Omiš	\N	418
5368	Ostrvica	\N	418
5369	Pisak	\N	418
5370	Podašpilje	\N	418
5371	Podgrađe	\N	418
5372	Putišići	\N	418
5373	Seoca	\N	418
5374	Slime	\N	418
5375	Smolonje	\N	418
5376	Srijane	\N	418
5377	Stanići	\N	418
5378	Svinišće	\N	418
5379	Trnbusi	\N	418
5380	Tugare	\N	418
5381	Zakučac	\N	418
5382	Zvečanje	\N	418
5383	Bajagić	\N	419
5384	Brnaze	\N	419
5385	Čitluk	\N	419
5386	Glavice	\N	419
5387	Gljev	\N	419
5388	Jasensko	\N	419
5389	Karakašica	\N	419
5390	Lučane	\N	419
5391	Obrovac Sinjski	\N	419
5392	Radošić	\N	419
5393	Sinj	\N	419
5394	Suhač	\N	419
5395	Turjaci	\N	419
5396	Zelovo	\N	419
5397	Blaca	\N	420
5398	Kučine	\N	420
5399	Mravince	\N	420
5400	Solin	\N	420
5401	Vranjic	\N	420
5402	Donje Sitno	\N	421
5403	Gornje Sitno	\N	421
5404	Kamen	\N	421
5405	Slatine	\N	421
5406	Split	\N	421
5407	Srinjine	\N	421
5408	Stobreč	\N	421
5409	Žrnovnica	\N	421
5410	Dol	\N	422
5411	Rudina	\N	422
5412	Selca kod Starog Grada	\N	422
5413	Stari Grad	\N	422
5414	Vrbanj	\N	422
5415	Mirca	\N	423
5416	Splitska	\N	423
5417	Supetar	\N	423
5418	Škrip	\N	423
5419	Bisko	\N	424
5420	Budimir	\N	424
5421	Čačvina	\N	424
5422	Čaporice	\N	424
5423	Gardun	\N	424
5424	Grab	\N	424
5425	Jabuka	\N	424
5426	Kamensko	\N	424
5427	Košute	\N	424
5428	Krivodol	\N	424
5429	Ljut	\N	424
5430	Nova Sela	\N	424
5431	Podi	\N	424
5432	Rože	\N	424
5433	Strizirep	\N	424
5434	Strmendolac	\N	424
5435	Tijarica	\N	424
5436	Trilj	\N	424
5437	Ugljane	\N	424
5438	Vedrine	\N	424
5439	Velić	\N	424
5440	Vinine	\N	424
5441	Vojnić Sinjski	\N	424
5442	Voštane	\N	424
5443	Vrabač	\N	424
5444	Vrpolje	\N	424
5445	Arbanija	\N	425
5446	Divulje	\N	425
5447	Drvenik Mali	\N	425
5448	Drvenik Veliki	\N	425
5449	Mastrinka	\N	425
5450	Plano	\N	425
5451	Trogir	\N	425
5452	Žedno	\N	425
5453	Brgujac	\N	426
5454	Dračevo Polje	\N	426
5455	Marinje Zemlje	\N	426
5456	Milna	\N	426
5457	Plisko Polje	\N	426
5458	Podselje	\N	426
5459	Podstražje	\N	426
5460	Rogačić	\N	426
5461	Rukavac	\N	426
5462	Stončica	\N	426
5463	Vis	\N	426
5464	Banja	\N	427
5465	Dragljane	\N	427
5466	Draževitići	\N	427
5467	Duge Njive	\N	427
5468	Dusina	\N	427
5469	Kljenak	\N	427
5470	Kokorići	\N	427
5471	Kotezi	\N	427
5472	Kozica	\N	427
5473	Mijaca	\N	427
5474	Orah	\N	427
5475	Podprolog	\N	427
5476	Poljica Kozička	\N	427
5477	Prapatnice	\N	427
5478	Rašćane	\N	427
5479	Ravča	\N	427
5480	Stilja	\N	427
5481	Umčani	\N	427
5482	Veliki Prolog	\N	427
5483	Vina	\N	427
5484	Višnjica	\N	427
5485	Vlaka	\N	427
5486	Vrgorac	\N	427
5487	Zavojane	\N	427
5488	Garjak	\N	428
5489	Ježević	\N	428
5490	Koljane	\N	428
5491	Kosore	\N	428
5492	Maovice	\N	428
5493	Otišić	\N	428
5494	Podosoje	\N	428
5495	Vinalić	\N	428
5496	Vrlika	\N	428
5497	Bast	\N	429
5498	Baška Voda	\N	429
5499	Bratuš	\N	429
5500	Krvavica	\N	429
5501	Promajna	\N	429
5502	Bol	\N	430
5503	Murvica	\N	430
5504	Brela	\N	431
5505	Gornja Brela	\N	431
5506	Aržano	\N	432
5507	Biorine	\N	432
5508	Cista Provo	\N	432
5509	Cista Velika	\N	432
5510	Dobranje	\N	432
5511	Svib	\N	432
5512	Ercegovci	\N	433
5513	Kraj	\N	433
5514	Krušvar	\N	433
5515	Osoje	\N	433
5516	Prisoje	\N	433
5517	Sičane	\N	433
5518	Sušci	\N	433
5519	Duće	\N	434
5520	Dugi Rat	\N	434
5521	Jesenice	\N	434
5522	Dugopolje	\N	435
5523	Koprivno	\N	435
5524	Kotlenice	\N	435
5525	Liska	\N	435
5526	Brist	\N	436
5527	Drvenik	\N	436
5528	Gradac	\N	436
5529	Podaca	\N	436
5530	Zaostrog	\N	436
5531	Dabar	\N	437
5532	Donji Bitelić	\N	437
5533	Gornji Bitelić	\N	437
5534	Hrvace	\N	437
5535	Laktac	\N	437
5536	Maljkovo	\N	437
5537	Potravlje	\N	437
5538	Rumin	\N	437
5539	Satrić	\N	437
5540	Vučipolje	\N	437
5541	Zasiok	\N	437
5542	Gdinj	\N	438
5543	Gromin Dolac	\N	438
5544	Humac	\N	438
5545	Ivan Dolac	\N	438
5546	Jelsa	\N	438
5547	Pitve	\N	438
5548	Poljica	\N	438
5549	Svirče	\N	438
5550	Vrboska	\N	438
5551	Vrisnik	\N	438
5552	Zastražišće	\N	438
5553	Zavala	\N	438
5554	Brštanovo	\N	439
5555	Dugobabe	\N	439
5556	Klis	\N	439
5557	Konjsko	\N	439
5558	Korušce	\N	439
5559	Nisko	\N	439
5560	Prugovo	\N	439
5561	Veliki Bročanac	\N	439
5562	Vučevica	\N	439
5563	Divojevići	\N	440
5564	Kladnjice	\N	440
5565	Lećevica	\N	440
5566	Radošić	\N	440
5567	Dolića Draga	\N	441
5568	Lokvičići	\N	441
5569	Dobrinče	\N	442
5570	Lovreć	\N	442
5571	Medovdolac	\N	442
5572	Opanci	\N	442
5573	Studenci	\N	442
5574	Blizna Donja	\N	443
5575	Blizna Gornja	\N	443
5576	Dograde	\N	443
5577	Gustirna	\N	443
5578	Marina	\N	443
5579	Mitlo	\N	443
5580	Najevi	\N	443
5581	Poljica	\N	443
5582	Pozorac	\N	443
5583	Rastovac	\N	443
5584	Sevid	\N	443
5585	Svinca	\N	443
5586	Vinišće	\N	443
5587	Vinovac	\N	443
5588	Vrsine	\N	443
5589	Bobovišća	\N	444
5590	Bobovišća na Moru	\N	444
5591	Ložišća	\N	444
5592	Milna	\N	444
5593	Podhume	\N	444
5594	Bračević	\N	445
5595	Crivac	\N	445
5596	Donje Ogorje	\N	445
5597	Donje Postinje	\N	445
5598	Donji Muć	\N	445
5599	Gizdavac	\N	445
5600	Gornje Ogorje	\N	445
5601	Gornje Postinje	\N	445
5602	Gornji Muć	\N	445
5603	Mala Milešina	\N	445
5604	Neorić	\N	445
5605	Pribude	\N	445
5606	Radunić	\N	445
5607	Ramljane	\N	445
5608	Sutina	\N	445
5609	Velika Milešina	\N	445
5610	Zelovo	\N	445
5611	Donji Humac	\N	446
5612	Dračevica	\N	446
5613	Nerežišća	\N	446
5614	Okrug Donji	\N	447
5615	Okrug Gornji	\N	447
5616	Gala	\N	448
5617	Korita	\N	448
5618	Otok	\N	448
5619	Ovrlje	\N	448
5620	Ruda	\N	448
5621	Udovičić	\N	448
5622	Drum	\N	449
5623	Grubine	\N	449
5624	Hršćevani	\N	449
5625	Ivanbegovina	\N	449
5626	Kamenmost	\N	449
5627	Krivodol	\N	449
5628	Podbablje Gornje	\N	449
5629	Poljica	\N	449
5630	Drašnice	\N	450
5631	Gornje Igrane	\N	450
5632	Igrane	\N	450
5633	Podgora	\N	450
5634	Živogošće	\N	450
5635	Podstrana	\N	451
5636	Dol	\N	452
5637	Postira	\N	452
5638	Bogdanovići	\N	453
5639	Labin	\N	453
5640	Prgomet	\N	453
5641	Sitno	\N	453
5642	Trolokve	\N	453
5643	Primorski Dolac	\N	454
5644	Donji Proložac	\N	455
5645	Gornji Proložac	\N	455
5646	Postranje	\N	455
5647	Ričice	\N	455
5648	Šumet	\N	455
5649	Gornji Humac	\N	456
5650	Pražnica	\N	456
5651	Pučišća	\N	456
5652	Podosoje	\N	457
5653	Runović	\N	457
5654	Slivno	\N	457
5655	Bristivica	\N	458
5656	Ljubitovica	\N	458
5657	Prapatnica	\N	458
5658	Seget Donji	\N	458
5659	Seget Gornji	\N	458
5660	Seget Vranjica	\N	458
5661	Novo Selo	\N	459
5662	Selca	\N	459
5663	Povlja	\N	459
5664	Sumartin	\N	459
5665	Bogomolje	\N	460
5666	Selca kod Bogomolja	\N	460
5667	Sućuraj	\N	460
5668	Sutivan	\N	461
5669	Grabovac	\N	462
5670	Katuni	\N	462
5671	Kreševo	\N	462
5672	Šestanovac	\N	462
5673	Žeževica	\N	462
5674	Donje Selo	\N	463
5675	Gornje Selo	\N	463
5676	Grohote	\N	463
5677	Maslinica	\N	463
5678	Nečujam	\N	463
5679	Rogač	\N	463
5680	Srednje Selo	\N	463
5681	Stomorska	\N	463
5682	Vrabač	\N	463
5683	Tučepi	\N	464
5684	Zadvarje	\N	465
5685	Biokovsko Selo	\N	466
5686	Krstatice	\N	466
5687	Rastovac	\N	466
5688	Rašćane Gornje	\N	466
5689	Zagvozd	\N	466
5690	Župa	\N	466
5691	Župa Srednja	\N	466
5692	Zmijavci	\N	467
5693	Baredine – Baredine	\N	468
5694	Bibali – Bibali	\N	468
5695	Brdo – Collalto	\N	468
5696	Brič – Briz	\N	468
5697	Buje – Buie	\N	468
5698	Buroli – Buroli	\N	468
5699	Bužin – Busin	\N	468
5700	Gamboci – Gambozzi	\N	468
5701	Kaldanija – Caldania	\N	468
5702	Kanegra – Canegra	\N	468
5703	Kaštel – Castelvenere	\N	468
5704	Krasica – Crassiza	\N	468
5705	Kršete – Carsette	\N	468
5706	Kućibreg – Cucibreg	\N	468
5707	Lozari – Losari	\N	468
5708	Marušići – Marussici	\N	468
5709	Merišće – Merischie	\N	468
5710	Momjan – Momiano	\N	468
5711	Oskoruš – Oscurus	\N	468
5712	Plovanija – Plovania	\N	468
5713	Sveta Marija na Krasu – dio	\N	468
5714	Madonna del Carso – in parte	\N	468
5715	Škrile – Scrile	\N	468
5716	Škudelini – Scudelin	\N	468
5717	Triban – Tribano	\N	468
5718	Veli Mlin – Molino Grande	\N	468
5719	Baredine	\N	469
5720	Bartolići	\N	469
5721	Barušići	\N	469
5722	Benčići	\N	469
5723	Blatna Vas	\N	469
5724	Brnobići	\N	469
5725	Buzet	\N	469
5726	Cunj	\N	469
5727	Čiritež	\N	469
5728	Črnica	\N	469
5729	Duričići	\N	469
5730	Erkovčići	\N	469
5731	Forčići	\N	469
5732	Gornja Nugla	\N	469
5733	Hum	\N	469
5734	Juradi	\N	469
5735	Juričići	\N	469
5736	Kajini	\N	469
5737	Klarići	\N	469
5738	Kompanj	\N	469
5739	Kosoriga	\N	469
5740	Kotli	\N	469
5741	Kras	\N	469
5742	Krbavčići	\N	469
5743	Krkuž	\N	469
5744	Krti	\N	469
5745	Krušvari	\N	469
5746	Mala Huba	\N	469
5747	Mali Mlun	\N	469
5748	Marčenegla	\N	469
5749	Marinci	\N	469
5750	Martinci	\N	469
5751	Medveje	\N	469
5752	Negnar	\N	469
5753	Paladini	\N	469
5754	Pengari	\N	469
5755	Peničići	\N	469
5756	Perci	\N	469
5757	Počekaji	\N	469
5758	Podkuk	\N	469
5759	Podrebar	\N	469
5760	Pračana	\N	469
5761	Prodani	\N	469
5762	Račice	\N	469
5763	Račički Brijeg	\N	469
5764	Rim	\N	469
5765	Rimnjak	\N	469
5766	Roč	\N	469
5767	Ročko Polje	\N	469
5768	Salež	\N	469
5769	Selca	\N	469
5770	Seljaci	\N	469
5771	Senj	\N	469
5772	Sirotići	\N	469
5773	Sovinjak	\N	469
5774	Sovinjska Brda	\N	469
5775	Sovinjsko Polje	\N	469
5776	Stanica Roč	\N	469
5777	Strana	\N	469
5778	Sušići	\N	469
5779	Sveti Donat	\N	469
5780	Sveti Ivan	\N	469
5781	Sveti Martin	\N	469
5782	Šćulci	\N	469
5783	Škuljari	\N	469
5784	Štrped	\N	469
5785	Ugrini	\N	469
5786	Veli Mlun	\N	469
5787	Vrh	\N	469
5788	Žonti	\N	469
5789	Bartići	\N	470
5790	Breg	\N	470
5791	Duga Luka	\N	470
5792	Gondolići	\N	470
5793	Gora Glušići	\N	470
5794	Kapelica	\N	470
5795	Kranjci	\N	470
5796	Labin	\N	470
5797	Marceljani	\N	470
5798	Presika	\N	470
5799	Rabac	\N	470
5800	Ripenda Kosi	\N	470
5801	Ripenda Kras	\N	470
5802	Ripenda Verbanci	\N	470
5803	Rogočana	\N	470
5804	Salakovci	\N	470
5805	Vinež	\N	470
5806	Antenal – Antenal	\N	471
5807	Bužinija – Businia	\N	471
5808	Dajla – Daila	\N	471
5809	Mareda – Mareda	\N	471
5810	Novigrad – Cittanova	\N	471
5811	Beram	\N	472
5812	Bertoši	\N	472
5813	Brajkovići	\N	472
5814	Butoniga	\N	472
5815	Grdoselo	\N	472
5816	Heki	\N	472
5817	Ježenj	\N	472
5818	Kašćerga	\N	472
5819	Kršikla	\N	472
5820	Lindar	\N	472
5821	Pazin	\N	472
5822	Stari Pazin	\N	472
5823	Trviž	\N	472
5824	Vela Traba	\N	472
5825	Zabrežani	\N	472
5826	Zamask	\N	472
5827	Zamaski Dol	\N	472
5828	Zarečje	\N	472
5829	Antonci Baderna	\N	473
5830	Banki	\N	473
5831	Bašarinka	\N	473
5832	Blagdanići	\N	473
5833	Bonaci	\N	473
5834	Bratovići	\N	473
5835	Brčići	\N	473
5836	Buići	\N	473
5837	Cancini	\N	473
5838	Červar-Porat	\N	473
5839	Črvar	\N	473
5840	Čuši	\N	473
5841	Dekovići	\N	473
5842	Dračevac	\N	473
5843	Filipini	\N	473
5844	Fuškulin	\N	473
5845	Garbina	\N	473
5846	Gulići	\N	473
5847	Jakići II	\N	473
5848	Jasenovica	\N	473
5849	Jehnići	\N	473
5850	Jurići	\N	473
5851	Kadumi	\N	473
5852	Katun	\N	473
5853	Kirmenjak	\N	473
5854	Kosinožići	\N	473
5855	Kukci	\N	473
5856	Ladrovići	\N	473
5857	Mali Maj	\N	473
5858	Materada Maj	\N	473
5859	Matulini	\N	473
5860	Mičetići	\N	473
5861	Mihatovići	\N	473
5862	Mihelići	\N	473
5863	Montižana	\N	473
5864	Mugeba	\N	473
5865	Mušalež	\N	473
5866	Nova Vas	\N	473
5867	Poreč – Parenzo	\N	473
5868	Radmani	\N	473
5869	Radoši kod Žbandaja	\N	473
5870	Rakovci	\N	473
5871	Rupeni	\N	473
5872	Ružići	\N	473
5873	Starići	\N	473
5874	Stranići kod Nove Vasi	\N	473
5875	Šeraje	\N	473
5876	Špadići	\N	473
5877	Štifanići	\N	473
5878	Šušnjići	\N	473
5879	Valkarin	\N	473
5880	Veleniki	\N	473
5881	Veli Maj	\N	473
5882	Vranići kod Poreča	\N	473
5883	Vrvari	\N	473
5884	Vržnaveri	\N	473
5885	Žbandaj	\N	473
5886	Pula – Pola	\N	474
5887	Štinjan	\N	474
5888	Rovinj – Rovigno	\N	475
5889	Rovinjsko Selo	\N	475
5890	Babići – Babici	\N	476
5891	Bašanija – Bassania	\N	476
5892	Crveni Vrh – Monte Rosso	\N	476
5893	Čepljani – Ceppiani	\N	476
5894	Đuba – Giubba	\N	476
5895	Finida – Finida	\N	476
5896	Juricani – Giurizzani	\N	476
5897	Katoro – Catoro	\N	476
5898	Kmeti – Metti	\N	476
5899	Križine – Crisine	\N	476
5900	Lovrečica – San Lorenzo	\N	476
5901	Materada – Matterada	\N	476
5902	Monterol – Monterol	\N	476
5903	Murine – Morno	\N	476
5904	Petrovija – Petrovia	\N	476
5905	Savudrija – Salvore	\N	476
5906	Seget – Seghetto	\N	476
5907	Sveta Marija na Krasu – dio Madonna del Carso	\N	476
5908	Umag – Umago	\N	476
5909	Valica – Valizza	\N	476
5910	Vardica – Vardiza	\N	476
5911	Vilanija – Villania	\N	476
5912	Zambratija – Zambrattia	\N	476
5913	Gajana – Gaiano	\N	477
5914	Galižana – Gallesano	\N	477
5915	Peroj – Peroi	\N	477
5916	Vodnjan – Dignano	\N	477
5917	Bale – Valle	\N	478
5918	Golaš	\N	478
5919	Krmed	\N	478
5920	Balići II	\N	479
5921	Barban	\N	479
5922	Bašići	\N	479
5923	Bičići	\N	479
5924	Borinići	\N	479
5925	Bratulići	\N	479
5926	Cvitići	\N	479
5927	Dolica	\N	479
5928	Draguzeti	\N	479
5929	Glavani	\N	479
5930	Gorica	\N	479
5931	Grandići	\N	479
5932	Hrboki	\N	479
5933	Jurićev Kal	\N	479
5934	Koromani	\N	479
5935	Kožljani	\N	479
5936	Manjadvorci	\N	479
5937	Medančići	\N	479
5938	Melnica	\N	479
5939	Orihi	\N	479
5940	Petehi	\N	479
5941	Prhati	\N	479
5942	Puntera	\N	479
5943	Rajki	\N	479
5944	Rebići	\N	479
5945	Rojnići	\N	479
5946	Sutivanac	\N	479
5947	Šajini	\N	479
5948	Vadreš	\N	479
5949	Varož	\N	479
5950	Želiski	\N	479
5951	Brtonigla – Verteneglio	\N	480
5952	Fiorini – Fiorini	\N	480
5953	Karigador – Carigador	\N	480
5954	Nova Vas – Villanova	\N	480
5955	Radini	\N	480
5956	Belaj	\N	481
5957	Borut	\N	481
5958	Cerovlje	\N	481
5959	Ćusi	\N	481
5960	Draguć	\N	481
5961	Gologorica	\N	481
5962	Gologorički Dol	\N	481
5963	Gradinje	\N	481
5964	Grimalda	\N	481
5965	Korelići	\N	481
5966	Novaki Pazinski	\N	481
5967	Oslići	\N	481
5968	Pagubice	\N	481
5969	Paz	\N	481
5970	Previž	\N	481
5971	Fažana – Fasana	\N	482
5972	Valbandon	\N	482
5973	Funtana – Fontane	\N	483
5974	Batlug	\N	484
5975	Bazgalji	\N	484
5976	Gračišće	\N	484
5977	Jakačići	\N	484
5978	Mandalenčići	\N	484
5979	Milotski Breg	\N	484
5980	Škopljak	\N	484
5981	Antonci – Antonzi	\N	485
5982	Bijele Zemlje – Terre Bianche	\N	485
5983	Grožnjan – Grisignana	\N	485
5984	Kostanjica – Castagna	\N	485
5985	Kuberton – Cuberton	\N	485
5986	Makovci – Macovzi	\N	485
5987	Martinčići – Martincici	\N	485
5988	Šterna – Sterna	\N	485
5989	Vrnjak – Vergnacco	\N	485
5990	Završje – Piemonte	\N	485
5991	Barat	\N	486
5992	Brajkovići	\N	486
5993	Bubani	\N	486
5994	Burići	\N	486
5995	Červari	\N	486
5996	Dubravci	\N	486
5997	Jural	\N	486
5998	Kanfanar	\N	486
5999	Korenići	\N	486
6000	Kurili	\N	486
6001	Ladići	\N	486
6002	Marići	\N	486
6003	Maružini	\N	486
6004	Matohanci	\N	486
6005	Mrgani	\N	486
6006	Okreti	\N	486
6007	Pilkovići	\N	486
6008	Putini	\N	486
6009	Sošići	\N	486
6010	Šorići	\N	486
6011	Žuntići	\N	486
6012	Karojba	\N	487
6013	Motovunski Novaki	\N	487
6014	Rakotule	\N	487
6015	Škropeti	\N	487
6016	Babići	\N	488
6017	Brnobići	\N	488
6018	Cerjani	\N	488
6019	Deklići	\N	488
6020	Dvori	\N	488
6021	Kaštelir – Castelliere	\N	488
6022	Kovači	\N	488
6023	Krančići	\N	488
6024	Labinci – S. Domenica	\N	488
6025	Mekiši kod Kaštelira	\N	488
6026	Rogovići	\N	488
6027	Rojci	\N	488
6028	Roškići	\N	488
6029	Tadini	\N	488
6030	Valentići	\N	488
6031	Blaškovići	\N	489
6032	Boljevići	\N	489
6033	Čambarelići	\N	489
6034	Jesenovik	\N	489
6035	Kostrčani	\N	489
6036	Kožljak	\N	489
6037	Kršan	\N	489
6038	Lanišće	\N	489
6039	Lazarići	\N	489
6040	Letaj	\N	489
6041	Nova Vas	\N	489
6042	Plomin	\N	489
6043	Plomin Luka	\N	489
6044	Polje Čepić	\N	489
6045	Potpićan	\N	489
6046	Purgarija Čepić	\N	489
6047	Stepčići	\N	489
6048	Šušnjevica	\N	489
6049	Veljaki	\N	489
6050	Vozilići	\N	489
6051	Zagorje	\N	489
6052	Zankovci	\N	489
6053	Zatka Čepić	\N	489
6054	Brest	\N	490
6055	Brgudac	\N	490
6056	Dane	\N	490
6057	Jelovice	\N	490
6058	Klenovšćak	\N	490
6059	Kropinjak	\N	490
6060	Lanišće	\N	490
6061	Podgaće	\N	490
6062	Prapoće	\N	490
6063	Račja Vas	\N	490
6064	Rašpor	\N	490
6065	Slum	\N	490
6066	Trstenik	\N	490
6067	Vodice	\N	490
6068	Jadreški – Giadreschi	\N	491
6069	Ližnjan – Lisignano	\N	491
6070	Muntić – Monticchio	\N	491
6071	Šišan – Sissano	\N	491
6072	Valtura – Altura	\N	491
6073	Boljun	\N	492
6074	Boljunsko Polje	\N	492
6075	Brest pod Učkom	\N	492
6076	Dolenja Vas	\N	492
6077	Lesišćina	\N	492
6078	Lupoglav	\N	492
6079	Ravno Brdo	\N	492
6080	Semić	\N	492
6081	Vranja	\N	492
6082	Belavići	\N	493
6083	Bratulići	\N	493
6084	Cokuni	\N	493
6085	Divšići	\N	493
6086	Filipana	\N	493
6087	Hreljići	\N	493
6088	Kavran	\N	493
6089	Krnica	\N	493
6090	Kujići	\N	493
6091	Loborika	\N	493
6092	Mali Vareški	\N	493
6093	Marčana	\N	493
6094	Mutvoran	\N	493
6095	Orbanići	\N	493
6096	Pavićini	\N	493
6097	Peruški	\N	493
6098	Pinezići	\N	493
6099	Prodol	\N	493
6100	Rakalj	\N	493
6101	Šarići	\N	493
6102	Šegotići	\N	493
6103	Veliki Vareški	\N	493
6104	Banjole	\N	494
6105	Medulin	\N	494
6106	Pomer	\N	494
6107	Premantura	\N	494
6108	Brkač – Bercaz (S. Pancrazio)	\N	495
6109	Kaldir – Caldier	\N	495
6110	Motovun – Montona	\N	495
6111	Sveti Bartol – S. Bortolo	\N	495
6112	Bencani – Benzani	\N	496
6113	Čepić – Ceppich	\N	496
6114	Golubići – Golobici	\N	496
6115	Gradinje – Gradigne	\N	496
6116	Ipši – Ipsi	\N	496
6117	Krajići – Craici	\N	496
6118	Livade – Levade	\N	496
6119	Oprtalj – Portole	\N	496
6120	Pirelići – Perelici	\N	496
6121	Sveta Lucija – S. Lucia	\N	496
6122	Sveti Ivan – S. Giovanni	\N	496
6123	Šorgi – Sorghi	\N	496
6124	Vižintini – Visintini	\N	496
6125	Vižintini Vrhi – Monti di Visintini	\N	496
6126	Zrenj – Stridone (Sdregna)	\N	496
6127	Žnjidarići – Znidarici	\N	496
6128	Grobnik	\N	497
6129	Jakomići	\N	497
6130	Krbune	\N	497
6131	Kukurini	\N	497
6132	Montovani	\N	497
6133	Orič	\N	497
6134	Pićan	\N	497
6135	Sveta Katarina	\N	497
6136	Tupljak	\N	497
6137	Zajci	\N	497
6138	Barbići	\N	498
6139	Brgod	\N	498
6140	Brovinje	\N	498
6141	Crni	\N	498
6142	Diminići	\N	498
6143	Drenje	\N	498
6144	Koromačno	\N	498
6145	Krapan	\N	498
6146	Kunj	\N	498
6147	Letajac	\N	498
6148	Most-Raša	\N	498
6149	Polje	\N	498
6150	Raša	\N	498
6151	Ravni	\N	498
6152	Skitača	\N	498
6153	Stanišovi	\N	498
6154	Sveta Marina	\N	498
6155	Sveti Bartul	\N	498
6156	Škvaranska	\N	498
6157	Topid	\N	498
6158	Trget	\N	498
6159	Trgetari	\N	498
6160	Viškovići	\N	498
6161	Cere	\N	499
6162	Eržišće	\N	499
6163	Frančići	\N	499
6164	Jurazini	\N	499
6165	Kraj Drage	\N	499
6166	Mali Golji	\N	499
6167	Mali Turini	\N	499
6168	Marići	\N	499
6169	Markoci	\N	499
6170	Nedešćina	\N	499
6171	Paradiž	\N	499
6172	Ružići	\N	499
6173	Santalezi	\N	499
6174	Snašići	\N	499
6175	Sveti Martin	\N	499
6176	Štrmac	\N	499
6177	Šumber	\N	499
6178	Veli Golji	\N	499
6179	Veli Turini	\N	499
6180	Vrećari	\N	499
6181	Županići	\N	499
6182	Čehići	\N	500
6183	Frnjolići	\N	500
6184	Heraki	\N	500
6185	Ivići	\N	500
6186	Jakići I	\N	500
6187	Jurcani	\N	500
6188	Kapovići	\N	500
6189	Knapići	\N	500
6190	Kršuli	\N	500
6191	Krunčići	\N	500
6192	Lakovići	\N	500
6193	Lovreča	\N	500
6194	Medaki	\N	500
6195	Medvidići	\N	500
6196	Orbani	\N	500
6197	Pajari	\N	500
6198	Perini	\N	500
6199	Radići	\N	500
6200	Rajki	\N	500
6201	Selina	\N	500
6202	Stranići kod Svetog	\N	500
6203	Sveti Lovreč	\N	500
6204	Vošteni	\N	500
6205	Zgrabljići	\N	500
6206	Sveti Petar u Šumi	\N	501
6207	Bibići	\N	502
6208	Bokordići	\N	502
6209	Boškari	\N	502
6210	Bričanci	\N	502
6211	Butkovići	\N	502
6212	Cukrići	\N	502
6213	Čabrunići	\N	502
6214	Foli	\N	502
6215	Juršići	\N	502
6216	Kranjčići	\N	502
6217	Pajkovići	\N	502
6218	Peresiji	\N	502
6219	Pusti	\N	502
6220	Raponji	\N	502
6221	Režanci	\N	502
6222	Salambati	\N	502
6223	Smoljanci	\N	502
6224	Svetvinčenat	\N	502
6225	Štokovci	\N	502
6226	Frata	\N	503
6227	Gedići	\N	504
6228	Perci	\N	504
6229	Rošini	\N	504
6230	Tar–Torre	\N	504
6231	Vabriga-Abrega	\N	504
6232	Brčići	\N	505
6233	Brečevići	\N	505
6234	Jakovici	\N	505
6235	Kringa	\N	505
6236	Muntrilj	\N	505
6237	Radetići	\N	505
6238	Tinjan	\N	505
6239	Žužići	\N	505
6240	Anžići	\N	506
6241	Bačva	\N	506
6242	Barat	\N	506
6243	Barići	\N	506
6244	Baškoti	\N	506
6245	Benčani	\N	506
6246	Broskvari	\N	506
6247	Bucalovići	\N	506
6248	Bujarići	\N	506
6249	Cerion	\N	506
6250	Cvitani	\N	506
6251	Deklevi	\N	506
6252	Diklići	\N	506
6253	Fabci	\N	506
6254	Farini	\N	506
6255	Gambetići	\N	506
6256	Kočići	\N	506
6257	Kolumbera	\N	506
6258	Korlevići	\N	506
6259	Košutići	\N	506
6260	Kurjavići	\N	506
6261	Legovići	\N	506
6262	Majkusi	\N	506
6263	Markovac	\N	506
6264	Milanezi	\N	506
6265	Prašćari	\N	506
6266	Prhati	\N	506
6267	Pršurići	\N	506
6268	Radoši kod Višnjana	\N	506
6269	Radovani	\N	506
6270	Rafaeli	\N	506
6271	Rapavel	\N	506
6272	Sinožići	\N	506
6273	Smolići	\N	506
6274	Srebrnići	\N	506
6275	Strpačići	\N	506
6276	Sveti Ivan	\N	506
6277	Štuti	\N	506
6278	Vejaki	\N	506
6279	Višnjan–Visignano	\N	506
6280	Vranići kod Višnjana	\N	506
6281	Vrhjani	\N	506
6282	Zoričići	\N	506
6283	Ženodraga	\N	506
6284	Žikovići	\N	506
6285	Žužići	\N	506
6286	Bajkini	\N	507
6287	Baldaši	\N	507
6288	Brig	\N	507
6289	Bukori	\N	507
6290	Crklada	\N	507
6291	Čuki	\N	507
6292	Danci	\N	507
6293	Ferenci	\N	507
6294	Filipi	\N	507
6295	Grubići	\N	507
6296	Jadruhi	\N	507
6297	Lašići	\N	507
6298	Markovići	\N	507
6299	Mastelići	\N	507
6300	Mekiši kod Vižinade	\N	507
6301	Nardući	\N	507
6302	Ohnići	\N	507
6303	Piškovica	\N	507
6304	Staniši	\N	507
6305	Trombal	\N	507
6306	Velići	\N	507
6307	Vižinada – Visinada	\N	507
6308	Vranići kod Vižinade	\N	507
6309	Vranje Selo	\N	507
6310	Vrbani	\N	507
6311	Vrh Lašići	\N	507
6312	Žudetići	\N	507
6313	Begi	\N	508
6314	Bralići	\N	508
6315	Delići	\N	508
6316	Flengi	\N	508
6317	Gradina	\N	508
6318	Kloštar	\N	508
6319	Kontešići	\N	508
6320	Marasi	\N	508
6321	Vrsar – Orsera	\N	508
6322	Balići I	\N	509
6323	Benčići	\N	509
6324	Cere	\N	509
6325	Debeljuhi	\N	509
6326	Domijanići	\N	509
6327	Gradišće	\N	509
6328	Gržini	\N	509
6329	Jurići	\N	509
6330	Karlovići	\N	509
6331	Klimni	\N	509
6332	Krajcar Breg	\N	509
6333	Krculi	\N	509
6334	Kresini	\N	509
6335	Križanci	\N	509
6336	Krničari	\N	509
6337	Kršanci	\N	509
6338	Laginji	\N	509
6339	Matijaši	\N	509
6340	Modrušani	\N	509
6341	Mužini	\N	509
6342	Orbanići	\N	509
6343	Pamići	\N	509
6344	Pifari	\N	509
6345	Prkačini	\N	509
6346	Pucići	\N	509
6347	Rudani	\N	509
6348	Šivati	\N	509
6349	Tomišići	\N	509
6350	Vadediji	\N	509
6351	Vidulini	\N	509
6352	Zeci	\N	509
6353	Žagrići	\N	509
6354	Žminj	\N	509
6355	Bosanka	\N	510
6356	Brsečine	\N	510
6357	Čajkovica	\N	510
6358	Čajkovići	\N	510
6359	Donje Obuljeno	\N	510
6360	Dubravica	\N	510
6361	Dubrovnik	\N	510
6362	Gornje Obuljeno	\N	510
6363	Gromača	\N	510
6364	Kliševo	\N	510
6365	Knežica	\N	510
6366	Koločep	\N	510
6367	Komolac	\N	510
6368	Lopud	\N	510
6369	Lozica	\N	510
6370	Ljubač	\N	510
6371	Mokošica	\N	510
6372	Mravinjac	\N	510
6373	Mrčevo	\N	510
6374	Nova Mokošica	\N	510
6375	Orašac	\N	510
6376	Osojnik	\N	510
6377	Petrovo Selo	\N	510
6378	Pobrežje	\N	510
6379	Prijevor	\N	510
6380	Rožat	\N	510
6381	Suđurađ	\N	510
6382	Sustjepan	\N	510
6383	Šipanska Luka	\N	510
6384	Šumet	\N	510
6385	Trsteno	\N	510
6386	Zaton	\N	510
6387	Čara	\N	511
6388	Korčula	\N	511
6389	Pupnat	\N	511
6390	Račišće	\N	511
6391	Žrnovo	\N	511
6392	Dubravica	\N	512
6393	Glušci	\N	512
6394	Metković	\N	512
6395	Prud	\N	512
6396	Vid	\N	512
6397	Buk Vlaka	\N	513
6398	Opuzen	\N	513
6399	Pržinovac	\N	513
6400	Baćina	\N	514
6401	Banja	\N	514
6402	Komin	\N	514
6403	Peračko Blato	\N	514
6404	Plina Jezero	\N	514
6405	Ploče	\N	514
6406	Rogotin	\N	514
6407	Staševica	\N	514
6408	Šarić Struga	\N	514
6409	Blato	\N	515
6410	Potirna	\N	515
6411	Banići	\N	516
6412	Čepikuće	\N	516
6413	Doli	\N	516
6414	Imotica	\N	516
6415	Kručica	\N	516
6416	Lisac	\N	516
6417	Majkovi	\N	516
6418	Mravnica	\N	516
6419	Ošlje	\N	516
6420	Podgora	\N	516
6421	Podimoć	\N	516
6422	Slano	\N	516
6423	Smokovljani	\N	516
6424	Stupa	\N	516
6425	Štedrica	\N	516
6426	Točionik	\N	516
6427	Topolo	\N	516
6428	Trnova	\N	516
6429	Trnovica	\N	516
6430	Visočani	\N	516
6431	Drače	\N	517
6432	Janjina	\N	517
6433	Osobjava	\N	517
6434	Popova Luka	\N	517
6435	Sreser	\N	517
6436	Brotnice	\N	518
6437	Cavtat	\N	518
6438	Čilipi	\N	518
6439	Drvenik	\N	518
6440	Duba Konavoska	\N	518
6441	Dubravka	\N	518
6442	Dunave	\N	518
6443	Đurinići	\N	518
6444	Gabrili	\N	518
6445	Gruda	\N	518
6446	Jasenice	\N	518
6447	Komaji	\N	518
6448	Kuna Konavoska	\N	518
6449	Lovorno	\N	518
6450	Ljuta	\N	518
6451	Mihanići	\N	518
6452	Mikulići	\N	518
6453	Močići	\N	518
6454	Molunat	\N	518
6455	Palje Brdo	\N	518
6456	Pločice	\N	518
6457	Poljice	\N	518
6458	Popovići	\N	518
6459	Pridvorje	\N	518
6460	Radovčići	\N	518
6461	Stravča	\N	518
6462	Šilješki	\N	518
6463	Uskoplje	\N	518
6464	Vitaljina	\N	518
6465	Vodovađa	\N	518
6466	Zastolje	\N	518
6467	Zvekovica	\N	518
6468	Borovci	\N	519
6469	Desne	\N	519
6470	Krvavac	\N	519
6471	Krvavac II	\N	519
6472	Kula Norinska	\N	519
6473	Matijevići	\N	519
6474	Momići	\N	519
6475	Nova Sela	\N	519
6476	Podrujnica	\N	519
6477	Glavat	\N	520
6478	Lastovo	\N	520
6479	Pasadur	\N	520
6480	Skrivena Luka	\N	520
6481	Sušac	\N	520
6482	Uble	\N	520
6483	Zaklopatica	\N	520
6484	Lumbarda	\N	521
6485	Babine Kuće	\N	522
6486	Babino Polje	\N	522
6487	Blato	\N	522
6488	Goveđari	\N	522
6489	Korita	\N	522
6490	Kozarica	\N	522
6491	Maranovići	\N	522
6492	Njivice	\N	522
6493	Okuklje	\N	522
6494	Polače	\N	522
6495	Pomena	\N	522
6496	Pristanište	\N	522
6497	Prožura	\N	522
6498	Prožurska Luka	\N	522
6499	Ropa	\N	522
6500	Saplunara	\N	522
6501	Solin	\N	522
6502	Sobra	\N	522
6503	Tatinica	\N	522
6504	Velika Loza	\N	522
6505	Donja Banda	\N	523
6506	Kučište	\N	523
6507	Kuna Pelješka	\N	523
6508	Lovište	\N	523
6509	Nakovanj	\N	523
6510	Orebić	\N	523
6511	Oskorušno	\N	523
6512	Pijavičino	\N	523
6513	Podgorje	\N	523
6514	Podobuče	\N	523
6515	Potomje	\N	523
6516	Stanković	\N	523
6517	Trstenik	\N	523
6518	Viganj	\N	523
6519	Brečići	\N	524
6520	Dubrave	\N	524
6521	Kobiljača	\N	524
6522	Mali Prolog	\N	524
6523	Otrić-Seoci	\N	524
6524	Pozla Gora	\N	524
6525	Blace	\N	525
6526	Duba	\N	525
6527	Duboka	\N	525
6528	Klek	\N	525
6529	Komarna	\N	525
6530	Kremena	\N	525
6531	Lovorje	\N	525
6532	Lučina	\N	525
6533	Mihalj	\N	525
6534	Otok	\N	525
6535	Pižinovac	\N	525
6536	Podgradina	\N	525
6537	Raba	\N	525
6538	Slivno Ravno	\N	525
6539	Trn	\N	525
6540	Tuštevac	\N	525
6541	Vlaka	\N	525
6542	Zavala	\N	525
6543	Smokvica	\N	526
6544	Boljenovići	\N	527
6545	Brijesta	\N	527
6546	Broce	\N	527
6547	Česvinica	\N	527
6548	Dančanje	\N	527
6549	Duba Stonska	\N	527
6550	Dubrava	\N	527
6551	Hodilje	\N	527
6552	Luka	\N	527
6553	Mali Ston	\N	527
6554	Metohija	\N	527
6555	Putniković	\N	527
6556	Sparagovići	\N	527
6557	Ston	\N	527
6558	Tomislavovac	\N	527
6559	Zabrđe	\N	527
6560	Zaton Doli	\N	527
6561	Žuljana	\N	527
6562	Donja Vrućica	\N	528
6563	Duba Pelješka	\N	528
6564	Gornja Vrućica	\N	528
6565	Trpanj	\N	528
6566	Vela Luka	\N	529
6567	Badžula	\N	530
6568	Bijeli Vir	\N	530
6569	Dobranje	\N	530
6570	Mislina	\N	530
6571	Mlinište	\N	530
6572	Vidonje	\N	530
6573	Brašina	\N	531
6574	Buići	\N	531
6575	Čelopeci	\N	531
6576	Čibača	\N	531
6577	Donji Brgat	\N	531
6578	Gornji Brgat	\N	531
6579	Grbavac	\N	531
6580	Kupari	\N	531
6581	Makoše	\N	531
6582	Mandaljena	\N	531
6583	Martinovići	\N	531
6584	Mlini	\N	531
6585	Petrača	\N	531
6586	Plat	\N	531
6587	Soline	\N	531
6588	Srebreno	\N	531
6589	Zavrelje	\N	531
6590	Čakovec	\N	532
6591	Ivanovec	\N	532
6592	Krištanovec	\N	532
6593	Kuršanec	\N	532
6594	Mačkovec	\N	532
6595	Mihovljan	\N	532
6596	Novo Selo na Dravi	\N	532
6597	Novo Selo Rok	\N	532
6598	Savska Ves	\N	532
6599	Slemenice	\N	532
6600	Šandorovec	\N	532
6601	Štefanec	\N	532
6602	Totovec	\N	532
6603	Žiškovec	\N	532
6604	Hlapičina	\N	533
6605	Križovec	\N	533
6606	Mursko Središće	\N	533
6607	Peklenica	\N	533
6608	Štrukovec	\N	533
6609	Cirkovljan	\N	534
6610	Čehovec	\N	534
6611	Čukovec	\N	534
6612	Draškovec	\N	534
6613	Hemuševec	\N	534
6614	Oporovec	\N	534
6615	Otok	\N	534
6616	Prelog	\N	534
6617	Belica	\N	535
6618	Gardinovec	\N	535
6619	Dekanovec	\N	536
6620	Domašinec	\N	537
6621	Turčišće	\N	537
6622	Donja Dubrava	\N	538
6623	Donji Hrašćan	\N	539
6624	Donji Kraljevec	\N	539
6625	Donji Pustakovec	\N	539
6626	Hodošan	\N	539
6627	Palinovec	\N	539
6628	Sveti Juraj u Trnju	\N	539
6629	Donji Vidovec	\N	540
6630	Goričan	\N	541
6631	Badličan	\N	542
6632	Bogdanovec	\N	542
6633	Dragoslavec Breg	\N	542
6634	Dragoslavec Selo	\N	542
6635	Gornja Dubrava	\N	542
6636	Gornji Mihaljevec	\N	542
6637	Križopotje	\N	542
6638	Martinuševec	\N	542
6639	Preseka	\N	542
6640	Prhovec	\N	542
6641	Tupkovec	\N	542
6642	Vugrišinec	\N	542
6643	Vukanovec	\N	542
6644	Kotoriba	\N	543
6645	Držimurec	\N	544
6646	Mala Subotica	\N	544
6647	Palovec	\N	544
6648	Piškorovec	\N	544
6649	Strelec	\N	544
6650	Sveti Križ	\N	544
6651	Črečan	\N	545
6652	Dunjkovec	\N	545
6653	Gornji Hrašćan	\N	545
6654	Gornji Kuršanec	\N	545
6655	Macinec	\N	545
6656	Nedelišće	\N	545
6657	Parag	\N	545
6658	Pretetinec	\N	545
6659	Pušćine	\N	545
6660	Slakovec	\N	545
6661	Trnovec	\N	545
6662	Orehovica	\N	546
6663	Podbrest	\N	546
6664	Vularija	\N	546
6665	Celine	\N	547
6666	Ferketinec	\N	547
6667	Miklavec	\N	547
6668	Novakovec	\N	547
6669	Podturen	\N	547
6670	Sivica	\N	547
6671	Pribislavec	\N	548
6672	Bukovec	\N	549
6673	Donji Koncovčak	\N	549
6674	Donji Zebanec	\N	549
6675	Gornji Zebanec	\N	549
6676	Merhatovec	\N	549
6677	Plešivica	\N	549
6678	Praporčan	\N	549
6679	Selnica	\N	549
6680	Zaveščak	\N	549
6681	Zebanec Selo	\N	549
6682	Strahoninec	\N	550
6683	Donji Mihaljevec	\N	551
6684	Sveta Marija	\N	551
6685	Brezje	\N	552
6686	Dragoslavec	\N	552
6687	Frkanovec	\N	552
6688	Lopatinec	\N	552
6689	Mali Mihaljevec	\N	552
6690	Okrugli Vrh	\N	552
6691	Pleškovec	\N	552
6692	Vučetinec	\N	552
6693	Zasadbreg	\N	552
6694	Brezovec	\N	553
6695	Čestijanec	\N	553
6696	Gornji Koncovčak	\N	553
6697	Gradiščak	\N	553
6698	Grkaveščak	\N	553
6699	Jurovčak	\N	553
6700	Jurovec	\N	553
6701	Kapelščak	\N	553
6702	Lapšina	\N	553
6703	Marof	\N	553
6704	Sveti Martin na Muri	\N	553
6705	Vrhovljan	\N	553
6706	Žabnik	\N	553
6707	Knezovec	\N	554
6708	Šenkovec	\N	554
6709	Banfi	\N	555
6710	Grabrovnik	\N	555
6711	Jalšovec	\N	555
6712	Leskovec	\N	555
6713	Prekopa	\N	555
6714	Robadje	\N	555
6715	Stanetinec	\N	555
6716	Sveti Urban	\N	555
6717	Štrigova	\N	555
6718	Železna Gora	\N	555
6719	Gornji Kraljevec	\N	556
6720	Vratišinec	\N	556
6721	Adamovec	\N	557
6722	Belovar	\N	557
6723	Blaguša	\N	557
6724	Botinec	\N	557
6725	Brebernica	\N	557
6726	Brezovica	\N	558
6727	Budenec	\N	558
6728	Buzin	\N	558
6729	Cerje	\N	558
6730	Demerje	\N	558
6731	Desprim	\N	558
6732	Dobrodol	\N	558
6733	Donji Čehi	\N	558
6734	Donji Dragonožec	\N	558
6735	Donji Trpuci	\N	558
6736	Drenčec	\N	558
6737	Drežnik Brezovički	\N	558
6738	Dumovec	\N	558
6739	Đurđekovec	\N	558
6740	Gajec	\N	558
6741	Glavnica Donja	\N	558
6742	Glavnica Gornja	\N	558
6743	Glavničica	\N	558
6744	Goli Breg	\N	558
6745	Goranec	\N	558
6746	Gornji Čehi	\N	558
6747	Gornji Dragonožec	\N	558
6748	Gornji Trpuci	\N	558
6749	Grančari	\N	558
6750	Havidić Selo	\N	558
6751	Horvati	\N	558
6752	Hrašće Turopoljsko	\N	558
6753	Hrvatski Leskovac	\N	558
6754	Hudi Bitek	\N	558
6755	Ivanja Reka	\N	558
6756	Jesenovec	\N	558
6757	Ježdovec	\N	558
6758	Kašina	\N	558
6759	Kašinska Sopnica	\N	558
6760	Kučilovina	\N	558
6761	Kućanec	\N	558
6762	Kupinečki Kraljevec	\N	558
6763	Lipnica	\N	558
6764	Lučko	\N	558
6765	Lužan	\N	558
6766	Mala Mlaka	\N	558
6767	Markovo Polje	\N	558
6768	Moravče	\N	558
6769	Odra	\N	558
6770	Odranski Obrež	\N	558
6771	Paruževina	\N	558
6772	Planina Donja	\N	558
6773	Planina Gornja	\N	558
6774	Popovec	\N	558
6775	Prekvršje	\N	558
6776	Prepuštovec	\N	558
6777	Sesvete	\N	558
6778	Soblinec	\N	558
6779	Starjak	\N	558
6780	Strmec	\N	558
6781	Šašinovec	\N	558
6782	Šimunčevec	\N	558
6783	Veliko Polje	\N	558
6784	Vuger Selo	\N	558
6785	Vugrovec Donji	\N	558
6786	Vugrovec Gornji	\N	558
6787	Vurnovec	\N	558
6788	Zadvorsko	\N	558
6789	Zagreb	\N	558
6790	Žerjavinec	\N	558
\.


--
-- Name: county_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carnet
--

SELECT pg_catalog.setval('public.county_id_seq', 21, true);


--
-- Name: municipality_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carnet
--

SELECT pg_catalog.setval('public.municipality_id_seq', 558, true);


--
-- Name: settlement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: carnet
--

SELECT pg_catalog.setval('public.settlement_id_seq', 6790, true);


--
-- Name: municipality _municipality_county_uc; Type: CONSTRAINT; Schema: public; Owner: carnet
--

ALTER TABLE ONLY public.municipality
    ADD CONSTRAINT _municipality_county_uc UNIQUE (name, county_id, city);


--
-- Name: settlement _settlement_municipality_uc; Type: CONSTRAINT; Schema: public; Owner: carnet
--

ALTER TABLE ONLY public.settlement
    ADD CONSTRAINT _settlement_municipality_uc UNIQUE (name, municipality_id);


--
-- Name: county county_name_key; Type: CONSTRAINT; Schema: public; Owner: carnet
--

ALTER TABLE ONLY public.county
    ADD CONSTRAINT county_name_key UNIQUE (name);


--
-- Name: county county_pkey; Type: CONSTRAINT; Schema: public; Owner: carnet
--

ALTER TABLE ONLY public.county
    ADD CONSTRAINT county_pkey PRIMARY KEY (id);


--
-- Name: municipality municipality_pkey; Type: CONSTRAINT; Schema: public; Owner: carnet
--

ALTER TABLE ONLY public.municipality
    ADD CONSTRAINT municipality_pkey PRIMARY KEY (id);


--
-- Name: settlement settlement_pkey; Type: CONSTRAINT; Schema: public; Owner: carnet
--

ALTER TABLE ONLY public.settlement
    ADD CONSTRAINT settlement_pkey PRIMARY KEY (id);


--
-- Name: municipality municipality_county_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carnet
--

ALTER TABLE ONLY public.municipality
    ADD CONSTRAINT municipality_county_id_fkey FOREIGN KEY (county_id) REFERENCES public.county(id);


--
-- Name: settlement settlement_municipality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carnet
--

ALTER TABLE ONLY public.settlement
    ADD CONSTRAINT settlement_municipality_id_fkey FOREIGN KEY (municipality_id) REFERENCES public.municipality(id);


--
-- PostgreSQL database dump complete
--

