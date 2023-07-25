--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answers (
    answer_id integer NOT NULL,
    answer_text text NOT NULL,
    is_correct boolean DEFAULT false NOT NULL,
    question_id integer,
    explanation text
);


ALTER TABLE public.answers OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    category_name character varying(50) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    question_id integer NOT NULL,
    question_text text NOT NULL,
    difficulty_level character varying(10) NOT NULL,
    category_id integer,
    explanation text
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: quiz_results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quiz_results (
    result_id integer NOT NULL,
    user_id integer,
    difficulty_level character varying(10),
    score numeric,
    category_name character varying(50)
);


ALTER TABLE public.quiz_results OWNER TO postgres;

--
-- Name: quiz_results_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quiz_results_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quiz_results_result_id_seq OWNER TO postgres;

--
-- Name: quiz_results_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quiz_results_result_id_seq OWNED BY public.quiz_results.result_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: quiz_results result_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_results ALTER COLUMN result_id SET DEFAULT nextval('public.quiz_results_result_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answers (answer_id, answer_text, is_correct, question_id, explanation) FROM stdin;
1	1776	t	1	\N
2	1800	f	1	\N
3	1820	f	1	\N
4	1900	f	1	\N
5	Mahatma Gandhi	t	2	\N
6	Nelson Mandela	f	2	\N
7	Winston Churchill	f	2	\N
8	Martin Luther King Jr.	f	2	\N
9	World War II	f	3	\N
10	World War I	t	3	\N
11	Korean War	f	3	\N
12	Vietnam War	f	3	\N
13	George Washington	t	4	\N
14	Thomas Jefferson	f	4	\N
15	John Adams	f	4	\N
16	Abraham Lincoln	f	4	\N
17	Nile River	t	5	\N
18	Amazon River	f	5	\N
19	Mississippi River	f	5	\N
20	Yangtze River	f	5	\N
21	Tokyo	t	6	\N
22	Beijing	f	6	\N
23	Seoul	f	6	\N
24	Bangkok	f	6	\N
25	Mount Kilimanjaro	t	7	\N
26	Mount Everest	f	7	\N
27	Mont Blanc	f	7	\N
28	Mount McKinley	f	7	\N
29	Peru	t	8	\N
30	Brazil	f	8	\N
31	Colombia	f	8	\N
32	Chile	f	8	\N
1242	Destiny Child	t	311	\N
33	The Hanging Gardens of Babylon	f	9	\N
34	The Colossus of Rhodes	f	9	\N
35	The Lighthouse of Alexandria	f	9	\N
1243	Spice Girls	f	311	\N
36	The Great Pyramid of Giza	t	9	\N
37	Brad Pitt	f	10	\N
38	Tom Cruise	f	10	\N
39	Arnold Schwarzenegger	t	10	\N
40	Johnny Depp	f	10	\N
41	Paris	f	11	\N
42	London	t	11	\N
43	New York City	f	11	\N
44	Berlin	f	11	\N
45	35	f	12	\N
46	44	f	12	\N
47	46	t	12	\N
48	50	f	12	\N
49	USS Indianapolis	f	13	\N
50	RMS Titanic	t	13	\N
51	HMS Bounty	f	13	\N
52	USS Arizona	f	13	\N
1244	Little Mix	f	311	\N
54	Pablo Picasso	f	14	\N
55	Vincent van Gogh	f	14	\N
56	Leonardo da Vinci	t	14	\N
57	Michelangelo	f	14	\N
58	Neil Armstrong	t	15	\N
59	Buzz Aldrin	f	15	\N
60	John Glenn	f	15	\N
61	Yuri Gagarin	f	15	\N
62	Martin Luther King Jr.	f	16	\N
63	Jesse Jackson	f	16	\N
64	Barack Obama	t	16	\N
65	Colin Powell	f	16	\N
66	Zone Identification Plan	f	17	\N
67	Zone Improvement Program	t	17	\N
68	Zipper Integrated Protocol	f	17	\N
69	Zone Inclusion Parameter	f	17	\N
70	Greece	f	18	\N
71	Egypt	t	18	\N
72	Mexico	f	18	\N
73	Italy	f	18	\N
74	Greece	t	19	\N
75	Rome	f	19	\N
76	Egypt	f	19	\N
77	China	f	19	\N
78	1943	f	20	\N
79	1945	t	20	\N
80	1947	f	20	\N
81	1950	f	20	\N
82	Rosa Parks	f	21	\N
83	Malcolm X	f	21	\N
84	Martin Luther King Jr.	t	21	\N
85	Harriet Tubman	f	21	\N
86	Spain	t	22	\N
87	Portugal	f	22	\N
88	Italy	f	22	\N
89	France	f	22	\N
90	The Revolutionary War	f	23	\N
91	The Civil War	t	23	\N
92	The War of 1812	f	23	\N
93	The World War I	f	23	\N
94	Benjamin Franklin	f	24	\N
95	George Washington	f	24	\N
96	Thomas Jefferson	t	24	\N
97	John Adams	f	24	\N
98	Athens	f	25	\N
99	Rome	f	25	\N
100	Pompeii	t	25	\N
101	Alexandria	f	25	\N
102	Joseph Stalin	f	26	\N
103	Adolf Hitler	t	26	\N
104	Benito Mussolini	f	26	\N
105	Winston Churchill	f	26	\N
106	Socrates	f	27	\N
107	Plato	f	27	\N
108	Aristotle	t	27	\N
109	Heraclitus	f	27	\N
110	Cleopatra	f	28	\N
111	Nefertiti	t	28	\N
112	Hatshepsut	f	28	\N
113	Ramses II	f	28	\N
114	The Boston Massacre	f	29	\N
115	The Tea Party	t	29	\N
116	The Boston Tea Dump	f	29	\N
117	The Boston Rebellion	f	29	\N
118	William Shakespeare	t	30	\N
119	Charles Dickens	f	30	\N
120	Jane Austen	f	30	\N
121	Mark Twain	f	30	\N
122	Ancient Egyptians	f	31	\N
123	Mayans	f	31	\N
124	Aztecs	f	31	\N
125	Incas	t	31	\N
126	Rosa Parks	t	32	\N
127	Harriet Tubman	f	32	\N
128	Maya Angelou	f	32	\N
129	Coretta Scott King	f	32	\N
130	Julius Caesar	t	33	\N
131	Augustus	f	33	\N
132	Nero	f	33	\N
133	Cicero	f	33	\N
134	The Cold War	t	34	\N
135	World War II	f	34	\N
136	The Vietnam War	f	34	\N
137	The Korean War	f	34	\N
138	Marco Polo	f	35	\N
139	Christopher Columbus	f	35	\N
140	Vasco da Gama	t	35	\N
141	Ferdinand Magellan	f	35	\N
142	Julius Caesar	f	36	\N
143	Augustus	f	36	\N
144	Alexander the Great	t	36	\N
145	Nero	f	36	\N
146	Marie Curie	t	37	\N
147	Amelia Earhart	f	37	\N
148	Rosa Parks	f	37	\N
149	Margaret Thatcher	f	37	\N
150	Three Mile Island accident	f	38	\N
151	Chernobyl disaster	t	38	\N
152	Fukushima Daiichi nuclear disaster	f	38	\N
1245	TLC	f	311	\N
153	Hiroshima atomic bombing	f	38	\N
154	India	t	39	\N
155	South Africa	f	39	\N
156	Pakistan	f	39	\N
157	Bangladesh	f	39	\N
158	France	f	40	\N
159	Poland	t	40	\N
160	Czechoslovakia	f	40	\N
161	Austria	f	40	\N
162	Mexico	f	41	\N
163	Argentina	f	41	\N
164	Venezuela	f	41	\N
165	Cuba	t	41	\N
166	Canada	f	42	\N
167	Netherlands	t	42	\N
168	Sweden	f	42	\N
169	Denmark	f	42	\N
170	United Kingdom	f	43	\N
171	United States	f	43	\N
172	New Zealand	t	43	\N
173	Australia	f	43	\N
174	France	t	44	\N
175	Belgium	f	44	\N
176	Germany	f	44	\N
177	United Kingdom	f	44	\N
178	Julius Caesar	f	45	\N
179	Mark Antony	f	45	\N
180	Romulus	t	45	\N
181	Augustus	f	45	\N
182	Thomas Jefferson	t	46	\N
183	George Washington	f	46	\N
184	Benjamin Franklin	f	46	\N
185	John Adams	f	46	\N
186	1915	f	47	\N
187	1916	f	47	\N
188	1914	t	47	\N
189	1917	f	47	\N
190	Ancient Greece	f	48	\N
191	Ancient Egypt	f	48	\N
192	Ancient Rome	f	48	\N
193	Ancient India	t	48	\N
198	To discuss the unification of Germany	f	50	\N
199	To negotiate the end of World War I	f	50	\N
200	To address the spread of cholera in Europe	f	50	\N
201	To regulate European colonization and trade in Africa	t	50	\N
202	Treaty of Versailles	t	51	\N
203	Treaty of Tordesillas	f	51	\N
204	Treaty of Ghent	f	51	\N
205	Treaty of Paris	f	51	\N
206	Ancient Egypt	f	52	\N
207	Ancient Greece	f	52	\N
208	Ancient China	t	52	\N
209	Ancient Rome	f	52	\N
210	1989	t	53	\N
211	1990	f	53	\N
212	1987	f	53	\N
213	1991	f	53	\N
214	Genghis Khan	t	54	\N
215	Kublai Khan	f	54	\N
216	Attila the Hun	f	54	\N
217	Tamerlane (Timur)	f	54	\N
218	1337	f	55	\N
219	1347	t	55	\N
220	1353	f	55	\N
221	1361	f	55	\N
222	It established the first European Parliament.	f	56	\N
223	It granted universal suffrage in England.	f	56	\N
224	It marked the end of the Crusades.	f	56	\N
225	It limited the power of the English monarchy and laid the foundation for constitutional law.	t	56	\N
226	Friedrich Engels	f	57	\N
227	Karl Marx	t	57	\N
228	Vladimir Lenin	f	57	\N
229	Leon Trotsky	f	57	\N
230	Auschwitz	f	58	\N
231	Dachau	t	58	\N
232	Buchenwald	f	58	\N
233	Treblinka	f	58	\N
234	Snake	t	59	\N
235	Scorpion	f	59	\N
236	Spider	f	59	\N
237	Centipede	f	59	\N
238	Jesse Owens	t	60	\N
239	Carl Lewis	f	60	\N
240	Usain Bolt	f	60	\N
241	Michael Phelps	f	60	\N
242	New Amsterdam	t	61	\N
243	New London	f	61	\N
244	New England	f	61	\N
245	New Orleans	f	61	\N
246	Australia	t	62	\N
247	Canada	f	62	\N
248	South Africa	f	62	\N
249	India	f	62	\N
250	Hugo Chavez	f	63	\N
251	Juan Peron	f	63	\N
252	Fidel Castro	f	63	\N
253	Ernesto "Che" Guevara	t	63	\N
254	Franz Ferdinand	t	64	\N
255	Woodrow Wilson	f	64	\N
256	Winston Churchill	f	64	\N
257	Charles de Gaulle	f	64	\N
258	Alexander Fleming	t	65	\N
259	Louis Pasteur	f	65	\N
260	Robert Koch	f	65	\N
261	Wilhelm Roentgen	f	65	\N
262	ENIAC (Electronic Numerical Integrator and Computer)	t	66	\N
263	UNIVAC (Universal Automatic Computer)	f	66	\N
264	EDVAC (Electronic Discrete Variable Automatic Computer)	f	66	\N
265	ABC (Atanasoff-Berry Computer)	f	66	\N
266	Jim Crow Laws	t	67	\N
267	Segregation Acts	f	67	\N
268	Civil Rights Acts	f	67	\N
269	Freedom Laws	f	67	\N
270	Love Me Tender	t	68	\N
271	Jailhouse Rock	f	68	\N
272	Blue Hawaii	f	68	\N
273	Viva Las Vegas	f	68	\N
274	Coachella	f	69	\N
275	Lollapalooza	f	69	\N
276	Woodstock	t	69	\N
277	Glastonbury	f	69	\N
278	John Calvin	f	70	\N
279	Martin Luther	t	70	\N
280	Pope Leo X	f	70	\N
281	John Wesley	f	70	\N
282	Category 1	f	71	\N
283	Category 2	f	71	\N
284	Category 4	f	71	\N
285	Category 3	t	71	\N
286	Homo sapiens	f	72	\N
287	Homo erectus	t	72	\N
288	Neanderthals	f	72	\N
289	Australopithecus	f	72	\N
290	Nagasaki	t	73	\N
291	Tokyo	f	73	\N
292	Kyoto	f	73	\N
293	Osaka	f	73	\N
294	Francisco Franco	f	74	\N
295	Fidel Castro	t	74	\N
296	Joseph Stalin	f	74	\N
297	Benito Mussolini	f	74	\N
298	Christopher Columbus	f	75	\N
299	Vasco da Gama	f	75	\N
300	Ferdinand Magellan	f	75	\N
301	Marco Polo	t	75	\N
302	1961	f	76	\N
303	1957	t	76	\N
304	1973	f	76	\N
305	1949	f	76	\N
306	Julius Caesar	f	77	\N
307	Alexander the Great	f	77	\N
308	Attila the Hun	t	77	\N
309	Genghis Khan	f	77	\N
310	Vikings	t	78	\N
311	Native Americans	f	78	\N
312	Chinese explorers	f	78	\N
313	Ancient Egyptians	f	78	\N
314	Smallpox	t	79	\N
315	Polio	f	79	\N
316	Tuberculosis	f	79	\N
317	Measles	f	79	\N
318	Johannes Gutenberg	t	80	\N
319	Leonardo da Vinci	f	80	\N
320	Galileo Galilei	f	80	\N
321	Isaac Newton	f	80	\N
322	Australia	f	81	\N
323	New Zealand	f	81	\N
324	Canada	f	81	\N
325	Ireland	t	81	\N
326	1666	t	82	\N
327	1776	f	82	\N
328	1720	f	82	\N
329	1605	f	82	\N
330	16th century	f	83	\N
331	18th century	t	83	\N
332	19th century	f	83	\N
333	20th century	f	83	\N
334	Once	t	84	\N
335	Twice	f	84	\N
336	Four times	f	84	\N
337	Never	f	84	\N
338	Isaac Newton	f	85	\N
339	Galileo Galilei	f	85	\N
340	Archimedes	t	85	\N
341	Aristotle	f	85	\N
342	Roman Civilization	f	86	\N
343	Mesopotamian Civilization	t	86	\N
344	Egyptian Civilization	f	86	\N
345	Indus Valley Civilization	f	86	\N
346	Queen Elizabeth I	f	87	\N
347	Queen Anne	f	87	\N
348	Queen Mary I	f	87	\N
349	Lady Jane Grey	t	87	\N
350	Valentina Tereshkova	t	88	\N
351	Sally Ride	f	88	\N
352	Yuri Gagarin	f	88	\N
353	Amelia Earhart	f	88	\N
354	Paris	f	89	\N
355	London	f	89	\N
356	Athens	t	89	\N
357	Rome	f	89	\N
358	Yuri Gagarin	f	90	\N
359	Valentina Tereshkova	f	90	\N
360	Alexei Leonov	t	90	\N
361	Sergey Korolev	f	90	\N
362	Discovery	f	91	\N
363	Endeavour	f	91	\N
364	Columbia	t	91	\N
365	Atlantis	f	91	\N
366	Vladimir Lenin	f	92	\N
367	Kim Jong-un	f	92	\N
368	Mao Zedong	t	92	\N
369	Fidel Castro	f	92	\N
370	Four	t	93	\N
371	Two	f	93	\N
372	Five	f	93	\N
373	Three	f	93	\N
374	Charles Lindbergh	t	94	\N
375	Amelia Earhart	f	94	\N
376	Orville Wright	f	94	\N
377	Howard Hughes	f	94	\N
378	Rome	f	95	\N
379	Athens	f	95	\N
380	Babylon	t	95	\N
381	Cairo	f	95	\N
382	20 years	f	96	\N
383	50 years	f	96	\N
384	100 years	t	96	\N
385	150 years	f	96	\N
386	Nikola Tesla	f	97	\N
387	Thomas Edison	t	97	\N
388	Alexander Graham Bell	f	97	\N
389	Benjamin Franklin	f	97	\N
390	France	t	98	\N
391	England	f	98	\N
392	Italy	f	98	\N
393	Spain	f	98	\N
394	Peru	f	99	\N
395	Mexico	t	99	\N
396	Brazil	f	99	\N
397	Colombia	f	99	\N
398	1962	f	100	\N
399	1963	t	100	\N
400	1964	f	100	\N
401	1965	f	100	\N
402	The Tang Dynasty	f	101	\N
403	The Han Dynasty	f	101	\N
404	The Qing Dynasty	t	101	\N
405	The Yuan Dynasty	f	101	\N
406	The Persian Empire	f	102	\N
407	The Roman Empire	t	102	\N
408	The Ottoman Empire	f	102	\N
409	The Mongol Empire	f	102	\N
410	Egypt	f	103	\N
411	Greece	f	103	\N
412	Mexico	t	103	\N
413	Italy	f	103	\N
414	The Silk Road	t	104	\N
415	The Spice Route	f	104	\N
416	The Mediterranean Trade Route	f	104	\N
417	The Trans-Saharan Trade Route	f	104	\N
418	Confucius	f	105	\N
419	Emperor Qin Shi Huang	f	105	\N
420	Yu the Great	t	105	\N
421	Genghis Khan	f	105	\N
422	Hera	f	106	\N
423	Athena	t	106	\N
424	Aphrodite	f	106	\N
425	Artemis	f	106	\N
430	Constantinople	t	108	\N
431	Athens	f	108	\N
432	Alexandria	f	108	\N
433	Rome	f	108	\N
1246	Titanic	t	312	\N
434	The "Lex Canuleia" was a law that established the rights and privileges of the patrician class in ancient Rome.	f	109	\N
435	The "Lex Canuleia" was a law that prohibited the intermarriage between patricians and plebeians in ancient Rome.	f	109	\N
436	The "Lex Canuleia" was a law that allowed intermarriage between patricians and plebeians, ending the legal ban on such unions and promoting social integration in ancient Rome.	t	109	\N
437	The "Lex Canuleia" was a law that expanded the power of the Roman Senate and restricted the authority of the consuls in ancient Rome.	f	109	\N
438	The Eureka Society	f	110	\N
439	The Templar Order	f	110	\N
440	The Illuminati	f	110	\N
441	The Black Hand	t	110	\N
442	Marquis de Lafayette	t	111	\N
443	Napoleon Bonaparte	f	111	\N
444	Alexander the Great	f	111	\N
445	Genghis Khan	f	111	\N
446	Thomas Jefferson	f	112	\N
447	Alexander Hamilton	t	112	\N
448	John Adams	f	112	\N
449	Patrick Henry	f	112	\N
450	Richard the Lionheart	f	113	\N
451	Joan of Arc	f	113	\N
452	Charlemagne	f	113	\N
453	Simon de Montfort	t	113	\N
1247	The Bodyguard	f	312	\N
1248	Dirty Dancing	f	312	\N
1249	Ghost	f	312	\N
1250	Pearl Jam	f	313	\N
458	Leonidas I	f	115	\N
459	Pericles	f	115	\N
460	Lysander	t	115	\N
461	Alexander the Great	f	115	\N
462	Christopher Columbus	f	116	\N
463	Ferdinand Magellan	f	116	\N
464	Vasco da Gama	f	116	\N
465	Marco Polo	t	116	\N
466	Strasbourg	t	117	\N
467	London	f	117	\N
468	Paris	f	117	\N
469	Rome	f	117	\N
470	The Great Pyramid of Giza	t	118	\N
471	The Colossus of Rhodes	f	118	\N
472	The Statue of Zeus at Olympia	f	118	\N
473	The Hanging Gardens of Babylon	f	118	\N
474	The War of the Roses	f	119	\N
475	The Paraguayan War	t	119	\N
476	The Seven Years' War	f	119	\N
477	The Crimean War	f	119	\N
478	Kingdom of Mali	f	120	\N
479	Kingdom of Ghana	f	120	\N
480	Kingdom of Benin	f	120	\N
481	Great Zimbabwe	t	120	\N
1251	Guns N Roses	f	313	\N
1252	Nirvana	f	313	\N
1253	Red Hot Chili Peppers	t	313	\N
1254	Coachella	f	314	\N
482	Augustus	f	121	\N
483	Nero	t	121	\N
484	Caligula	f	121	\N
485	Tiberius	f	121	\N
486	Songhai Empire	f	122	\N
487	Kingdom of Ghana	f	122	\N
488	Mali Empire	t	122	\N
489	Kingdom of Benin	f	122	\N
490	Han Dynasty	f	123	\N
491	Tang Dynasty	f	123	\N
492	Ming Dynasty	t	123	\N
493	Qing Dynasty	f	123	\N
494	General Douglas MacArthur	f	124	\N
495	General Dwight D. Eisenhower	f	124	\N
496	General Erwin Rommel	f	124	\N
497	General Sir Ian Hamilton	t	124	\N
498	Leonardo da Vinci	f	125	\N
499	Michelangelo	f	125	\N
500	Raphael	f	125	\N
501	Sandro Botticelli	t	125	\N
502	Grigori Rasputin	t	126	\N
503	Ivan the Terrible	f	126	\N
504	Vladimir Lenin	f	126	\N
505	Joseph Stalin	f	126	\N
506	Treaty of Versailles	f	127	\N
507	Congress of Vienna	f	127	\N
508	Treaty of Tordesillas	f	127	\N
509	Berlin Conference	t	127	\N
510	Sun Yat-sen	f	128	\N
511	Mao Zedong	f	128	\N
512	Li Hongzhang	f	128	\N
513	Hong Xiuquan	t	128	\N
514	Mayan Civilization	f	129	\N
515	Egyptian Civilization	f	129	\N
516	Mesopotamian Civilization	f	129	\N
517	Indus Valley Civilization	t	129	\N
518	Ibn Khaldun	f	130	\N
519	Ibn Sina	f	130	\N
520	Ibn Battuta	t	130	\N
521	Ibn Rushd	f	130	\N
522	Marie Curie	f	131	\N
523	Ada Lovelace	f	131	\N
524	Hypatia	f	131	\N
525	Maria Mitchell	t	131	\N
526	Chernobyl Incident	f	132	\N
527	Cuban Missile Crisis	f	132	\N
528	False Alarm of 1983	t	132	\N
529	Three Mile Island Incident	f	132	\N
530	50 years	f	133	\N
531	200 years	t	133	\N
532	500 years	f	133	\N
533	1000 years	f	133	\N
534	Vasco da Gama	f	134	\N
535	Ferdinand Magellan	t	134	\N
536	Christopher Columbus	f	134	\N
537	Hern n Cort‚s	f	134	\N
538	Franco-Prussian War	f	135	\N
539	Seven Years' War	f	135	\N
540	Austro-Prussian War	t	135	\N
541	Napoleonic Wars	f	135	\N
542	Japan	f	136	\N
543	China	t	136	\N
544	India	f	136	\N
545	Korea	f	136	\N
546	Agra Fort	f	137	\N
547	Fatehpur Sikri	f	137	\N
548	Red Fort	f	137	\N
549	Taj Mahal	t	137	\N
550	France	t	138	\N
551	Spain	f	138	\N
552	Germany	f	138	\N
553	Russia	f	138	\N
554	Isaac Newton	t	139	\N
555	Galileo Galilei	f	139	\N
556	Johannes Kepler	f	139	\N
557	Albert Einstein	f	139	\N
558	London	t	140	\N
559	Paris	f	140	\N
560	New York	f	140	\N
561	Rome	f	140	\N
562	Colorado River	t	141	\N
563	Mississippi River	f	141	\N
564	Amazon River	f	141	\N
565	Nile River	f	141	\N
566	Rome	t	142	\N
567	Milan	f	142	\N
568	Florence	f	142	\N
569	Venice	f	142	\N
570	Africa	f	143	\N
571	South America	f	143	\N
572	Asia	t	143	\N
573	Europe	f	143	\N
574	Los Angeles	f	144	\N
575	Washington, D.C.	t	144	\N
576	New York City	f	144	\N
577	Chicago	f	144	\N
578	North	f	145	\N
579	West	f	145	\N
580	East	t	145	\N
581	South	f	145	\N
582	Mars	f	146	\N
583	Mercury	t	146	\N
584	Earth	f	146	\N
585	Venus	f	146	\N
586	Amazon River	f	147	\N
587	Mississippi River	f	147	\N
588	Africa	f	147	\N
589	Nile River	t	147	\N
590	Eiffel Tower	t	148	\N
591	Arc de Triomphe	f	148	\N
592	Notre-Dame Cathedral	f	148	\N
593	Louvre Museum	f	148	\N
594	Arctic Ocean	f	149	\N
595	Pacific Ocean	f	149	\N
596	Indian Ocean	f	149	\N
597	Atlantic Ocean	t	149	\N
598	Mount McKinley (Denali)	f	150	\N
599	Mount Kilimanjaro	f	150	\N
600	Mount Everest	t	150	\N
601	Mount Fuji	f	150	\N
602	Berlin	f	151	\N
603	Paris	t	151	\N
604	Rome	f	151	\N
605	London	f	151	\N
606	Sudan	f	152	\N
607	Mexico	f	152	\N
608	Peru	f	152	\N
609	Egypt	t	152	\N
610	China	t	153	\N
611	South Korea	f	153	\N
612	Japan	f	153	\N
613	India	f	153	\N
614	Asia	f	154	\N
615	North America	f	154	\N
616	South America	t	154	\N
617	Africa	f	154	\N
618	Atacama Desert	f	155	\N
619	Kalahari Desert	f	155	\N
620	Sahara Desert	t	155	\N
621	Gobi Desert	f	155	\N
622	Greece	f	156	\N
623	Turkey	f	156	\N
624	Italy	t	156	\N
625	Spain	f	156	\N
626	China	f	157	\N
627	South Korea	f	157	\N
628	Japan	t	157	\N
629	Vietnam	f	157	\N
630	Himalayas	f	158	\N
631	Andes Mountains	f	158	\N
632	Rocky Mountains	t	158	\N
633	Appalachian Mountains	f	158	\N
634	London	t	159	\N
635	Berlin	f	159	\N
636	Rome	f	159	\N
637	Paris	f	159	\N
638	India	t	160	\N
639	China	f	160	\N
640	Egypt	f	160	\N
641	Italy	f	160	\N
642	Indian Ocean	f	161	\N
643	Pacific Ocean	f	161	\N
644	Arctic Ocean	f	161	\N
645	Atlantic Ocean	t	161	\N
646	Colombia	f	162	\N
647	Brazil	t	162	\N
648	Argentina	f	162	\N
649	Peru	f	162	\N
650	Zion Canyon	f	163	\N
651	Antelope Canyon	f	163	\N
652	Grand Canyon	t	163	\N
653	Bryce Canyon	f	163	\N
654	Europe	f	164	\N
655	Africa	t	164	\N
656	Asia	f	164	\N
657	South America	f	164	\N
658	Madagascar	f	165	\N
659	Australia	t	165	\N
660	Japan	f	165	\N
661	New Zealand	f	165	\N
662	Osaka	f	166	\N
663	Hiroshima	f	166	\N
664	Tokyo	t	166	\N
665	Kyoto	f	166	\N
666	China	f	167	\N
667	Canada	f	167	\N
668	Russia	t	167	\N
669	United States	f	167	\N
670	Montreal	f	168	\N
671	Toronto	f	168	\N
672	Vancouver	f	168	\N
673	Ottawa	t	168	\N
674	Netherlands	f	169	\N
675	France	f	169	\N
676	Spain	f	169	\N
677	Italy	t	169	\N
679	Gobi Desert	f	170	\N
680	Arabian Desert	f	170	\N
681	Atacama Desert	f	170	\N
682	Sydney	f	171	\N
683	Melbourne	f	171	\N
684	Canberra	t	171	\N
685	Brisbane	f	171	\N
686	Rocky Mountains	f	172	\N
687	Andes Mountains	t	172	\N
688	Himalayas	f	172	\N
689	Alps	f	172	\N
690	Australia	t	173	\N
691	Brazil	f	173	\N
692	Indonesia	f	173	\N
693	India	f	173	\N
694	Angel Falls	t	174	\N
695	Victoria Falls	f	174	\N
696	Iguazu Falls	f	174	\N
697	Niagara Falls	f	174	\N
698	Lake Malawi	f	175	\N
699	Lake Tanganyika	f	175	\N
700	Lake Victoria	t	175	\N
701	Lake Turkana	f	175	\N
702	Canada and United States	t	176	\N
703	Russia and China	f	176	\N
704	Brazil and Argentina	f	176	\N
705	India and Nepal	f	176	\N
706	Japan	f	177	\N
707	Iceland	t	177	\N
708	New Zealand	f	177	\N
709	Indonesia	f	177	\N
710	Jordan	t	178	\N
711	Egypt	f	178	\N
712	Turkey	f	178	\N
713	Lebanon	f	178	\N
714	Cyprus	t	179	\N
715	Malta	f	179	\N
716	Crete	f	179	\N
717	Sardinia	f	179	\N
718	Egypt	f	180	\N
719	Tunisia	f	180	\N
720	Algeria	f	180	\N
721	Morocco	t	180	\N
722	Indonesia	t	181	\N
723	Philippines	f	181	\N
724	Maldives	f	181	\N
725	Japan	f	181	\N
726	France	f	182	\N
727	Italy	f	182	\N
728	Netherlands	t	182	\N
729	Switzerland	f	182	\N
730	Monaco	f	183	\N
731	Vatican City	t	183	\N
732	Nauru	f	183	\N
733	Liechtenstein	f	183	\N
734	Africa	t	184	\N
735	Antarctica	f	184	\N
736	South America	f	184	\N
737	Asia	f	184	\N
738	Florida	f	185	\N
739	Texas	f	185	\N
740	Louisiana	t	185	\N
741	Georgia	f	185	\N
742	Mandarin	t	186	\N
743	Cantonese	f	186	\N
744	English	f	186	\N
745	Korean	f	186	\N
746	Turkey	f	187	\N
747	Saudi Arabia	t	187	\N
748	Egypt	f	187	\N
749	Iraq	f	187	\N
750	Sweden	f	188	\N
751	Norway	t	188	\N
752	Denmark	f	188	\N
753	Finland	f	188	\N
754	Kenya	f	189	\N
755	Tanzania	t	189	\N
756	Ethiopia	f	189	\N
757	Uganda	f	189	\N
758	California	t	190	\N
759	New York	f	190	\N
760	Texas	f	190	\N
761	Florida	f	190	\N
762	Ecuador	t	191	\N
763	Peru	f	191	\N
764	Chile	f	191	\N
765	Colombia	f	191	\N
766	Argentina	f	192	\N
767	Brazil	t	192	\N
768	Mexico	f	192	\N
769	Spain	f	192	\N
770	Seoul	t	193	\N
771	Busan	f	193	\N
772	Incheon	f	193	\N
773	Daegu	f	193	\N
774	Yuan	f	194	\N
775	Won	f	194	\N
776	Yen	t	194	\N
777	Peso	f	194	\N
778	Canada	f	195	\N
779	Sweden	f	195	\N
780	Finland	t	195	\N
781	Russia	f	195	\N
782	Mont Blanc	t	196	\N
783	Matterhorn	f	196	\N
784	Eiger	f	196	\N
785	Jungfrau	f	196	\N
786	Japan	f	197	\N
787	Thailand	t	197	\N
788	India	f	197	\N
789	Brazil	f	197	\N
790	Germany	f	198	\N
791	Russia	t	198	\N
792	France	f	198	\N
793	Italy	f	198	\N
794	Thames River	f	199	\N
795	Rhine River	f	199	\N
796	Danube River	f	199	\N
797	Volga River	t	199	\N
798	Egypt	f	200	\N
799	Tunisia	f	200	\N
800	Morocco	t	200	\N
801	Algeria	f	200	\N
802	Buenos Aires	t	201	\N
803	Santiago	f	201	\N
804	Montevideo	f	201	\N
805	Lima	f	201	\N
806	United States	f	202	\N
807	Canada	f	202	\N
808	Australia	t	202	\N
809	South Africa	f	202	\N
810	Turkey	t	203	\N
811	Greece	f	203	\N
812	Egypt	f	203	\N
813	Italy	f	203	\N
814	Rose	f	204	\N
815	Lotus	t	204	\N
816	Sunflower	f	204	\N
817	Jasmine	f	204	\N
818	Egypt and Israel	f	205	\N
819	Jordan and Lebanon	f	205	\N
820	Israel and Jordan	t	205	\N
821	Jordan and Iraq	f	205	\N
822	Ireland	f	206	\N
823	England	f	206	\N
824	Scotland	t	206	\N
825	Wales	f	206	\N
826	Ontario	f	207	\N
827	Quebec	f	207	\N
828	British Columbia	t	207	\N
829	Alberta	f	207	\N
830	Panama	t	208	\N
831	Egypt	f	208	\N
832	United States	f	208	\N
833	Brazil	f	208	\N
834	Peso	f	209	\N
835	Baht	f	209	\N
836	Real	t	209	\N
837	Rupee	f	209	\N
838	California	f	210	\N
839	Texas	f	210	\N
840	Hawaii	t	210	\N
841	Washington	f	210	\N
842	Danube River	t	211	\N
843	Seine River	f	211	\N
844	Thames River	f	211	\N
845	Rhine River	f	211	\N
846	Norway	f	212	\N
847	Sweden	f	212	\N
848	Finland	f	212	\N
849	Iceland	t	212	\N
850	China	t	213	\N
851	India	f	213	\N
852	Japan	f	213	\N
853	Indonesia	f	213	\N
854	California	t	214	\N
855	Texas	f	214	\N
856	Florida	f	214	\N
857	New York	f	214	\N
858	United States	f	215	\N
859	Netherlands	t	215	\N
860	Australia	f	215	\N
861	Canada	f	215	\N
862	Thailand	f	216	\N
863	Cambodia	t	216	\N
864	Vietnam	f	216	\N
865	Laos	f	216	\N
866	Indonesia	t	217	\N
867	Japan	f	217	\N
868	Philippines	f	217	\N
869	United Kingdom	f	217	\N
870	Middle East	t	218	\N
871	South America	f	218	\N
872	Europe	f	218	\N
873	Southeast Asia	f	218	\N
874	Asia	f	219	\N
875	Africa	f	219	\N
876	South America	t	219	\N
877	Australia	f	219	\N
878	Bangkok	t	220	\N
879	Phuket	f	220	\N
880	Chiang Mai	f	220	\N
881	Pattaya	f	220	\N
882	South Africa	t	221	\N
883	Kenya	f	221	\N
884	Nigeria	f	221	\N
885	Egypt	f	221	\N
886	Colorado River	t	222	\N
887	Mississippi River	f	222	\N
888	Columbia River	f	222	\N
889	Missouri River	f	222	\N
890	California	f	223	\N
891	Florida	t	223	\N
892	Texas	f	223	\N
893	Arizona	f	223	\N
894	Peru	t	224	\N
895	Brazil	f	224	\N
896	Argentina	f	224	\N
897	Chile	f	224	\N
898	Thailand	f	225	\N
899	Indonesia	t	225	\N
900	Philippines	f	225	\N
901	Malaysia	f	225	\N
902	Nigeria	f	226	\N
903	South Africa	f	226	\N
904	Kenya	t	226	\N
905	Egypt	f	226	\N
906	Italy	t	227	\N
907	Spain	f	227	\N
908	Greece	f	227	\N
909	Croatia	f	227	\N
910	Afrikaans	f	228	\N
911	Zulu	f	228	\N
912	Xhosa	f	228	\N
913	English	t	228	\N
914	British Columbia	f	229	\N
915	Ontario	f	229	\N
916	Alberta	t	229	\N
917	Quebec	f	229	\N
918	Bahamas	f	230	\N
919	Virgin Islands	f	230	\N
920	Greater Antilles	f	230	\N
921	Lesser Antilles	t	230	\N
922	California	t	231	\N
923	New York	f	231	\N
924	Texas	f	231	\N
925	Florida	f	231	\N
926	Philippines	t	232	\N
927	Malaysia	f	232	\N
928	Indonesia	f	232	\N
929	Vietnam	f	232	\N
930	Asia	f	233	\N
931	Africa	t	233	\N
932	Australia	f	233	\N
933	Europe	f	233	\N
934	France	f	234	\N
935	Germany	t	234	\N
936	Italy	f	234	\N
937	Spain	f	234	\N
938	California	f	235	\N
939	Alaska	t	235	\N
940	Colorado	f	235	\N
941	Florida	f	235	\N
942	Argentina	f	236	\N
943	Brazil	f	236	\N
944	Chile	t	236	\N
945	Peru	f	236	\N
946	Lisbon	f	237	\N
947	Madrid	t	237	\N
948	Rome	f	237	\N
949	Barcelona	f	237	\N
950	Africa	f	238	\N
951	Europe	t	238	\N
952	North America	f	238	\N
953	South America	f	238	\N
954	48	f	239	\N
955	50	t	239	\N
956	52	f	239	\N
957	49	f	239	\N
958	Buenos Aires	f	240	\N
959	Montevideo	t	240	\N
960	Santiago	f	240	\N
961	Asunci¢n	f	240	\N
962	The Pennines	t	241	\N
963	The Cairngorms	f	241	\N
964	The Lake District	f	241	\N
965	The Cheviot Hills	f	241	\N
966	Barcelona	f	242	\N
967	Lisbon	t	242	\N
968	Madrid	f	242	\N
969	Rome	f	242	\N
970	Thailand	f	243	\N
971	Vietnam	t	243	\N
972	Cambodia	f	243	\N
973	Laos	f	243	\N
974	Sweden	f	244	\N
975	Norway	t	244	\N
976	Denmark	f	244	\N
977	Finland	f	244	\N
978	Paris	t	245	\N
979	Rome	f	245	\N
980	Venice	f	245	\N
981	Barcelona	f	245	\N
982	Sicily	t	246	\N
983	Sardinia	f	246	\N
984	Crete	f	246	\N
985	Cyprus	f	246	\N
986	Krona	t	247	\N
987	Euro	f	247	\N
988	Peso	f	247	\N
989	Dollar	f	247	\N
990	Portugal	f	248	\N
991	Spain	t	248	\N
992	Italy	f	248	\N
993	Greece	f	248	\N
994	Rome	f	249	\N
995	Paris	f	249	\N
996	Barcelona	t	249	\N
997	London	f	249	\N
998	Egypt	f	250	\N
999	Tunisia	f	250	\N
1000	Morocco	t	250	\N
1001	Algeria	f	250	\N
1002	Andorra	t	251	\N
1003	San Marino	f	251	\N
1004	Monaco	f	251	\N
1005	Liechtenstein	f	251	\N
1006	Hungary	f	252	\N
1007	Romania	t	252	\N
1008	Bulgaria	f	252	\N
1009	Serbia	f	252	\N
1010	Germany	t	253	\N
1011	United Kingdom	f	253	\N
1012	France	f	253	\N
1013	Japan	f	253	\N
1014	Riga	f	254	\N
1015	Tallinn	t	254	\N
1016	Vilnius	f	254	\N
1017	Helsinki	f	254	\N
1018	Lion	t	255	\N
1019	Elephant	f	255	\N
1020	Peacock	f	255	\N
1021	Tiger	f	255	\N
1022	France	f	256	\N
1023	Spain	t	256	\N
1024	Italy	f	256	\N
1025	Portugal	f	256	\N
1026	Kazakhstan	t	257	\N
1027	Uzbekistan	f	257	\N
1028	Turkmenistan	f	257	\N
1029	Kyrgyzstan	f	257	\N
1030	Egypt	f	258	\N
1031	Mexico	f	258	\N
1032	Sudan	t	258	\N
1033	China	f	258	\N
1034	New York	f	259	\N
1035	Massachusetts	t	259	\N
1036	California	f	259	\N
1037	Texas	f	259	\N
1038	Russia and the United States	t	260	\N
1039	Russia and Canada	f	260	\N
1040	Russia and Japan	f	260	\N
1041	Russia and China	f	260	\N
1042	Pacific Ocean	t	261	\N
1043	North America	f	261	\N
1044	South America	f	261	\N
1045	Asia	f	261	\N
1046	-89.2øC (-128.6øF)	t	262	\N
1047	-75.3øC (-103.5øF)	f	262	\N
1048	-68.0øC (-90.4øF)	f	262	\N
1049	-94.7øC (-138.5øF)	f	262	\N
1050	Colombia and Panama	t	263	\N
1051	Colombia and Venezuela	f	263	\N
1052	Panama and Costa Rica	f	263	\N
1053	Costa Rica and Nicaragua	f	263	\N
1054	Yemen	t	264	\N
1055	Oman	f	264	\N
1056	Madagascar	f	264	\N
1057	Sri Lanka	f	264	\N
1058	Chile	t	265	\N
1059	Argentina	f	265	\N
1060	Brazil	f	265	\N
1061	Peru	f	265	\N
1062	France	t	266	\N
1063	United Kingdom	f	266	\N
1064	Australia	f	266	\N
1065	Norway	f	266	\N
1066	The Maldives	t	267	\N
1067	The Andaman and Nicobar Islands	f	267	\N
1068	The Chagos Archipelago	f	267	\N
1069	The Seychelles	f	267	\N
1070	3,650 meters (11,975 feet)	t	268	\N
1071	2,730 meters (8,957 feet)	f	268	\N
1072	3,900 meters (12,795 feet)	f	268	\N
1073	4,080 meters (13,386 feet)	f	268	\N
1074	Serra de Collserola	t	269	\N
1075	Sierra de Gredos	f	269	\N
1076	Sierra de Culebra	f	269	\N
1077	Sierra Nevada	f	269	\N
1078	India and Sri Lanka	t	270	\N
1079	India and Bangladesh	f	270	\N
1080	India and Myanmar	f	270	\N
1081	India and Thailand	f	270	\N
1082	New Zealand	t	271	\N
1083	Australia	f	271	\N
1084	Japan	f	271	\N
1085	Brazil	f	271	\N
1086	France	t	272	\N
1087	United States	f	272	\N
1088	Australia	f	272	\N
1089	Japan	f	272	\N
1090	Iron ore mining	t	273	\N
1091	Coal mining	f	273	\N
1092	Natural gas drilling	f	273	\N
1093	Copper mining	f	273	\N
1094	Poland	t	274	\N
1095	Germany	f	274	\N
1096	Czech Republic	f	274	\N
1097	Austria	f	274	\N
1098	Pristina	t	275	\N
1099	Tirana	f	275	\N
1100	Skopje	f	275	\N
1101	Belgrade	f	275	\N
1102	Suriname	t	276	\N
1103	Guyana	f	276	\N
1104	French Guiana	f	276	\N
1105	Aruba	f	276	\N
1106	Caspian Sea	t	277	\N
1107	Mediterranean Sea	f	277	\N
1108	Baltic Sea	f	277	\N
1109	Black Sea	f	277	\N
1110	Russia	t	278	\N
1111	Finland	f	278	\N
1112	Sweden	f	278	\N
1113	Estonia	f	278	\N
1114	The Ural Mountains	t	279	\N
1115	The Rocky Mountains	f	279	\N
1116	The Andes Mountains	f	279	\N
1117	The Alps	f	279	\N
1118	United Nations Educational, Scientific and Cultural Organization	t	280	\N
1119	United Nations Environmental and Scientific Organization	f	280	\N
1120	United Nations Economic and Social Organization	f	280	\N
1121	United Nations Environmental and Social Cooperation	f	280	\N
1122	Caspian Sea	t	281	\N
1123	Aegean Sea	f	281	\N
1124	Black Sea	f	281	\N
1125	Mediterranean Sea	f	281	\N
1126	Noumea	t	282	\N
1127	Port Moresby	f	282	\N
1128	Suva	f	282	\N
1129	Apia	f	282	\N
1130	Estonia	t	283	\N
1131	Finland	f	283	\N
1132	Sweden	f	283	\N
1133	Latvia	f	283	\N
1134	Miami	t	284	\N
1135	New Orleans	f	284	\N
1136	Los Angeles	f	284	\N
1137	Chicago	f	284	\N
1138	North American Plate and Eurasian Plate	t	285	\N
1139	North American Plate and African Plate	f	285	\N
1140	Eurasian Plate and South American Plate	f	285	\N
1141	African Plate and Eurasian Plate	f	285	\N
1142	Baltic Sea	t	286	\N
1143	Black Sea	f	286	\N
1144	Caspian Sea	f	286	\N
1145	White Sea	f	286	\N
1148	Canada	f	287	\N
1149	Iceland	f	287	\N
1150	The Rolling Stones	f	288	\N
1151	Coldplay	t	288	\N
1152	Queen	f	288	\N
1153	The Beatles	f	288	\N
1154	Solo	f	289	\N
1155	A cappella	t	289	\N
1156	Chorus	f	289	\N
1157	Falsetto	f	289	\N
1158	Justin Timberlake	f	290	\N
1159	Ed Sheeran	f	290	\N
1160	Bruno Mars	f	290	\N
1161	Justin Bieber	t	290	\N
1162	Composer	f	291	\N
1163	Conductor	t	291	\N
1164	Director	f	291	\N
1165	Pianist	f	291	\N
1166	Pick	t	292	\N
1167	Bow	f	292	\N
1168	Slide	f	292	\N
1169	Stick	f	292	\N
1170	Michael Jackson	t	293	\N
1171	Elvis Presley	f	293	\N
1172	Prince	f	293	\N
1173	Freddie Mercury	f	293	\N
1174	Choir	t	294	\N
1175	Band	f	294	\N
1176	Orchestra	f	294	\N
1177	Ensemble	f	294	\N
1178	The Rolling Stones	f	295	\N
1179	The Beatles	t	295	\N
1180	Queen	f	295	\N
1181	Led Zeppelin	f	295	\N
1182	The Rolling Stones	f	296	\N
1183	The Beatles	t	296	\N
1184	Queen	f	296	\N
1185	Led Zeppelin	f	296	\N
1186	Refrain	f	297	\N
1187	Bridge	f	297	\N
1188	Chorus	t	297	\N
1189	Verse	f	297	\N
1190	The Rolling Stones	t	298	\N
1191	The Beatles	f	298	\N
1192	Queen	f	298	\N
1193	U2	f	298	\N
1194	Mallets	f	299	\N
1195	Sticks	t	299	\N
1196	Hammers	f	299	\N
1197	Batons	f	299	\N
1198	Volume	f	300	\N
1199	Tempo	t	300	\N
1200	Pitch	f	300	\N
1201	Harmony	f	300	\N
1202	Celine Dion	f	301	\N
1203	Whitney Houston	f	301	\N
1204	Madonna	t	301	\N
1205	Mariah Carey	f	301	\N
1218	The Rolling Stones	f	305	\N
1219	The Doors	t	305	\N
1220	Led Zeppelin	f	305	\N
1221	The Who	f	305	\N
1214	Shania Twain	f	304	\N
1215	Avril Lavigne	f	304	\N
1216	Celine Dion	t	304	\N
1217	Alanis Morissette	f	304	\N
1210	Michael Jackson	f	303	\N
1211	Elvis Presley	t	303	\N
1212	Freddie Mercury	f	303	\N
1213	Chuck Berry	f	303	\N
1222	Jamaica	t	306	\N
1223	United States	f	306	\N
1224	Brazil	f	306	\N
1225	Nigeria	f	306	\N
1226	Pop	f	307	\N
1227	Country	f	307	\N
1228	Rock	f	307	\N
1229	Heavy Metal	t	307	\N
1230	Vanilla Ice	t	308	\N
1231	Eminem	f	308	\N
1232	Snoop Dogg	f	308	\N
1233	Jay-Z	f	308	\N
1234	Billie Jean	t	309	\N
1235	Thriller	f	309	\N
1236	Beat It	f	309	\N
1237	Smooth Criminal	f	309	\N
1238	Camila Cabello	t	310	\N
1239	Selena Gomez	f	310	\N
1240	Ariana Grande	f	310	\N
1241	Demi Lovato	f	310	\N
1255	Glastonbury Festival	f	314	\N
1256	Woodstock	t	314	\N
1257	Lollapalooza	f	314	\N
1258	Spain	t	315	\N
1259	Brazil	f	315	\N
1260	Mexico	f	315	\N
1261	Argentina	f	315	\N
1262	Ludwig van Beethoven	t	316	\N
1263	Wolfgang Amadeus Mozart	f	316	\N
1264	Johann Sebastian Bach	f	316	\N
1265	Franz Schubert	f	316	\N
1266	Salsa	f	317	\N
1147	Mongolia	t	287	\N
1267	Reggae	t	317	\N
1268	Flamenco	f	317	\N
1269	Hip-hop	f	317	\N
1270	Katy Perry	f	318	\N
1271	Adele	t	318	\N
1272	Lady Gaga	f	318	\N
1273	Taylor Swift	f	318	\N
1274	Led Zeppelin	t	319	\N
1275	Queen	f	319	\N
1276	The Rolling Stones	f	319	\N
1277	Pink Floyd	f	319	\N
1278	Ritardando	f	320	\N
1279	Crescendo	t	320	\N
1280	Staccato	f	320	\N
1281	Legato	f	320	\N
1282	Jimi Hendrix	t	321	\N
1283	Elvis Presley	f	321	\N
1284	Michael Jackson	f	321	\N
1285	Bob Dylan	f	321	\N
1286	Freddie Mercury	t	322	\N
1287	John Lennon	f	322	\N
1288	Mick Jagger	f	322	\N
1289	David Bowie	f	322	\N
1290	Aladdin	f	323	\N
1291	The Lion King	f	323	\N
1292	Frozen	t	323	\N
1293	Moana	f	323	\N
1294	Banjo	f	324	\N
1295	Ukulele	t	324	\N
1296	Mandolin	f	324	\N
1297	Cello	f	324	\N
1298	Ludwig van Beethoven	f	325	\N
1299	Johann Sebastian Bach	f	325	\N
1300	Pyotr Ilyich Tchaikovsky	t	325	\N
1301	Wolfgang Amadeus Mozart	f	325	\N
1302	Quartet	t	326	\N
1303	Trio	f	326	\N
1304	Ensemble	f	326	\N
1305	Orchestra	f	326	\N
1306	Coachella	t	327	\N
1307	Lollapalooza	f	327	\N
1308	Bonnaroo	f	327	\N
1309	Burning Man	f	327	\N
1310	Scotland	t	328	\N
1311	Ireland	f	328	\N
1312	Wales	f	328	\N
1313	England	f	328	\N
1314	Eric Clapton	f	329	\N
1315	Jimmy Page	t	329	\N
1316	Jimi Hendrix	f	329	\N
1317	Eddie Van Halen	f	329	\N
1318	Vienna	t	330	\N
1319	Paris	f	330	\N
1320	Berlin	f	330	\N
1321	Salzburg	f	330	\N
1322	Fearless	f	331	\N
1323	Speak Now	f	331	\N
1324	Taylor Swift	t	331	\N
1325	1989	f	331	\N
1326	Metallica	f	332	\N
1327	Guns N Roses	t	332	\N
1328	Queen	f	332	\N
1329	The Rolling Stones	f	332	\N
1330	Britney Spears	f	333	\N
1331	Christina Aguilera	t	333	\N
1332	Jennifer Lopez	f	333	\N
1333	Shakira	f	333	\N
1334	Andrew Lloyd Webber	t	334	\N
1335	Stephen Sondheim	f	334	\N
1336	Lin-Manuel Miranda	f	334	\N
1337	Richard Rodgers	f	334	\N
1338	Wolfgang Amadeus Mozart	f	335	\N
1339	Ludwig van Beethoven	t	335	\N
1340	Johann Sebastian Bach	f	335	\N
1341	Pyotr Ilyich Tchaikovsky	f	335	\N
1342	Bob Dylan	t	336	\N
1343	Johnny Cash	f	336	\N
1344	Bruce Springsteen	f	336	\N
1345	Elvis Presley	f	336	\N
1346	One Direction	f	337	\N
1347	Backstreet Boys	f	337	\N
1348	NSYNC	f	337	\N
1349	BTS	t	337	\N
1350	Rolling in the Deep	t	338	\N
1351	Hello	f	338	\N
1352	Someone Like You	f	338	\N
1353	Set Fire to the Rain	f	338	\N
1354	The Chainsmokers	t	339	\N
1355	Daft Punk	f	339	\N
1356	Major Lazer	f	339	\N
1357	Disclosure	f	339	\N
1358	Wicked	f	340	\N
1359	Les Mis‚rables	t	340	\N
1360	The Phantom of the Opera	f	340	\N
1361	Cats	f	340	\N
1362	Pink Floyd	t	341	\N
1363	Led Zeppelin	f	341	\N
1364	The Beatles	f	341	\N
1365	Queen	f	341	\N
1366	Whitney Houston	f	342	\N
1367	Etta James	f	342	\N
1368	Aretha Franklin	t	342	\N
1369	Diana Ross	f	342	\N
1370	Tomorrowland	t	343	\N
1371	Ultra Music Festival	f	343	\N
1372	Coachella	f	343	\N
1373	Electric Daisy Carnival (EDC)	f	343	\N
1374	Ludwig van Beethoven	f	344	\N
1375	Wolfgang Amadeus Mozart	f	344	\N
1376	Johann Sebastian Bach	f	344	\N
1377	Antonio Vivaldi	t	344	\N
1378	Australia	t	345	\N
1379	Brazil	f	345	\N
1380	India	f	345	\N
1381	Japan	f	345	\N
1382	The Rolling Stones	f	346	\N
1383	The Beatles	t	346	\N
1384	The Beach Boys	f	346	\N
1385	The Who	f	346	\N
1386	1970s	t	347	\N
1387	1980s	f	347	\N
1388	1960s	f	347	\N
1389	1990s	f	347	\N
1390	Duncan Laurence	t	348	\N
1391	Netta Barzilai	f	348	\N
1392	Conchita Wurst	f	348	\N
1393	Salvador Sobral	f	348	\N
1394	Yo-Yo Ma	f	349	\N
1395	Pablo Casals	t	349	\N
1396	Jacqueline du Pr‚	f	349	\N
1397	Mstislav Rostropovich	f	349	\N
1398	Jimi Hendrix	t	350	\N
1399	Eric Clapton	f	350	\N
1400	Jimmy Page	f	350	\N
1401	Carlos Santana	f	350	\N
1402	Germany	f	351	\N
1403	Italy	t	351	\N
1404	France	f	351	\N
1405	Austria	f	351	\N
1406	Calvin Harris	f	352	\N
1407	Skrillex	f	352	\N
1408	Diplo	t	352	\N
1409	DJ Snake	f	352	\N
1410	Fleetwood Mac	t	353	\N
1411	The Eagles	f	353	\N
1412	The Rolling Stones	f	353	\N
1413	Queen	f	353	\N
1414	Coachella	f	354	\N
1415	Lollapalooza	f	354	\N
1416	Bonnaroo	t	354	\N
1417	Glastonbury	f	354	\N
1418	Ray Charles	f	355	\N
1419	Marvin Gaye	f	355	\N
1420	James Brown	t	355	\N
1421	Otis Redding	f	355	\N
1422	Adele	t	356	\N
1423	Taylor Swift	f	356	\N
1424	Lady Gaga	f	356	\N
1425	Katy Perry	f	356	\N
1426	Hamilton	f	357	\N
1427	The Phantom of the Opera	f	357	\N
1428	Wicked	t	357	\N
1429	Les Mis‚rables	f	357	\N
1430	1960s	f	358	\N
1431	1970s	t	358	\N
1432	1980s	f	358	\N
1433	1990s	f	358	\N
1434	Mick Jagger	f	359	\N
1435	Steven Tyler	t	359	\N
1436	Jon Bon Jovi	f	359	\N
1437	Freddie Mercury	f	359	\N
1438	Willie Nelson	f	360	\N
1439	Johnny Cash	t	360	\N
1440	Hank Williams	f	360	\N
1441	George Strait	f	360	\N
1442	Piano	f	361	\N
1443	Violin	f	361	\N
1444	Trumpet	f	361	\N
1445	Organ	t	361	\N
1446	Michael Jackson	f	362	\N
1447	Prince	f	362	\N
1448	Stevie Wonder	t	362	\N
1449	Marvin Gaye	f	362	\N
1450	Vienna	t	363	\N
1451	Salzburg	f	363	\N
1452	Berlin	f	363	\N
1453	Prague	f	363	\N
1454	Conchita Wurst	t	364	\N
1455	Loreen	f	364	\N
1456	Mans Zelmerlow	f	364	\N
1457	Eleni Foureira	f	364	\N
1458	The Rolling Stones	f	365	\N
1459	Queen	f	365	\N
1460	The Eagles	t	365	\N
1461	Led Zeppelin	f	365	\N
1462	Germany	f	366	\N
1463	Poland	t	366	\N
1464	Austria	f	366	\N
1465	France	f	366	\N
1466	Apple Music	f	367	\N
1467	Amazon Music	f	367	\N
1468	Spotify	t	367	\N
1469	Tidal	f	367	\N
1470	Cats	t	368	\N
1471	Les Mis‚rables	f	368	\N
1472	The Phantom of the Opera	f	368	\N
1473	Wicked	f	368	\N
1474	Bon Jovi	t	369	\N
1475	Aerosmith	f	369	\N
1476	Guns N Roses	f	369	\N
1477	Journey	f	369	\N
1478	Giacomo Puccini	f	370	\N
1479	Gioachino Rossini	f	370	\N
1480	Giuseppe Verdi	t	370	\N
1481	Wolfgang Amadeus Mozart	f	370	\N
1482	John Deacon	f	371	\N
1483	Roger Taylor	f	371	\N
1484	Brian May	t	371	\N
1485	Freddie Mercury	f	371	\N
1486	Burning Man	t	372	\N
1487	Coachella	f	372	\N
1488	Tomorrowland	f	372	\N
1489	Glastonbury	f	372	\N
1490	Ed Sheeran	t	373	\N
1491	Sam Smith	f	373	\N
1492	Adele	f	373	\N
1493	Harry Styles	f	373	\N
1494	Lynyrd Skynyrd	t	374	\N
1495	ZZ Top	f	374	\N
1496	The Allman Brothers Band	f	374	\N
1497	The Marshall Tucker Band	f	374	\N
1498	Vienna	f	375	\N
1499	Leipzig	t	375	\N
1500	Paris	f	375	\N
1501	London	f	375	\N
1502	Somebody That I Used to Know	t	376	\N
1503	Rolling in the Deep	f	376	\N
1504	Shape of You	f	376	\N
1505	Uptown Funk	f	376	\N
1506	Julie Andrews	t	377	\N
1507	Audrey Hepburn	f	377	\N
1508	Marilyn Monroe	f	377	\N
1509	Elizabeth Taylor	f	377	\N
1510	1960s	f	378	\N
1511	1970s	t	378	\N
1512	1980s	f	378	\N
1513	1990s	f	378	\N
1514	Violin	f	379	\N
1515	Banjo	t	379	\N
1516	Piano	f	379	\N
1517	Flute	f	379	\N
1518	Bob Dylan	f	380	\N
1519	Bruce Springsteen	t	380	\N
1520	Elvis Presley	f	380	\N
1521	Johnny Cash	f	380	\N
1522	Lady Gaga	f	381	\N
1523	Lana Del Rey	f	381	\N
1524	Sia	f	381	\N
1525	Kali Uchis	t	381	\N
1526	1999	f	382	\N
1527	2001	f	382	\N
1528	2003	t	382	\N
1529	2004	f	382	\N
1530	Radiohead	f	383	\N
1531	Coldplay	f	383	\N
1532	Oasis	f	383	\N
1533	The Verve	t	383	\N
1534	David Bowie	f	384	\N
1535	Ozzy Osbourne	t	384	\N
1536	Michael Jackson	f	384	\N
1537	Freddie Mercury	f	384	\N
1538	Bob Dylan	f	385	\N
1539	Elton John	f	385	\N
1540	Simon & Garfunkel	f	385	\N
1541	Don McLean	t	385	\N
1542	Nevermind	t	386	\N
1543	In Utero	f	386	\N
1544	Bleach	f	386	\N
1545	MTV Unplugged in New York	f	386	\N
1546	Jay-Z	f	387	\N
1547	Childish Gambino	t	387	\N
1548	Kendrick Lamar	f	387	\N
1549	Drake	f	387	\N
1550	David Bowie	f	388	\N
1551	Phil Collins	t	388	\N
1552	Elton John	f	388	\N
1553	Sting	f	388	\N
1574	Sergei Rachmaninoff	f	394	\N
1573	Suspended chord	f	393	\N
1572	Seventh chord	t	393	\N
1571	Diminished chord	f	393	\N
1570	Triad	f	393	\N
1569	George Martin	f	392	\N
1568	Phil Spector	f	392	\N
1567	Tony Visconti	f	392	\N
1566	Brian Eno	t	392	\N
1565	12 main playing strings	f	391	\N
1564	15 main playing strings	t	391	\N
1563	20 main playing strings	f	391	\N
1562	18 main playing strings	f	391	\N
1561	4/4	f	390	\N
1560	13/16	t	390	\N
1559	9/8	f	390	\N
1558	7/8	f	390	\N
1557	Johannes Brahms	f	389	\N
1556	Franz Joseph Haydn	f	389	\N
1555	Wolfgang Amadeus Mozart	t	389	\N
1554	Ludwig van Beethoven	f	389	\N
1583	John Cage	f	396	\N
1716	Medieval	t	429	\N
1715	Classical	f	429	\N
1714	Baroque	f	429	\N
1622	Ludwig van Beethoven	t	406	\N
1623	Johannes Brahms	f	406	\N
1713	John Adams	f	428	\N
1712	Terry Riley	t	428	\N
1711	Philip Glass	f	428	\N
1710	Steve Reich	f	428	\N
1709	Santoor	t	427	\N
1708	Sarod	f	427	\N
1707	Tabla	f	427	\N
1706	Sitar	f	427	\N
1705	Etta James	f	426	\N
1704	Billie Holiday	f	426	\N
1703	Ma Rainey	f	426	\N
1702	Bessie Smith	t	426	\N
1701	Nico	t	425	\N
1700	Laurie Anderson	f	425	\N
1699	Yoko Ono	f	425	\N
1698	Patti Smith	f	425	\N
1697	Gustav Mahler	f	424	\N
1696	Alban Berg	f	424	\N
1695	Anton Webern	f	424	\N
1694	Arnold Schoenberg	t	424	\N
1689	Gustav Holst	f	422	\N
1688	Aaron Copland	f	422	\N
1687	Leonard Bernstein	f	422	\N
1686	John Philip Sousa	t	422	\N
1685	Rumba	t	421	\N
1684	Bossa Nova	f	421	\N
1683	Tango	f	421	\N
1682	Salsa	f	421	\N
1681	Howlin Wolf	f	420	\N
1680	Muddy Waters	f	420	\N
1679	Robert Johnson	t	420	\N
1678	B.B. King	f	420	\N
1677	Dmitri Shostakovich	f	419	\N
1676	Igor Stravinsky	t	419	\N
1675	Pyotr Ilyich Tchaikovsky	f	419	\N
1674	Sergei Rachmaninoff	f	419	\N
1673	Georg Philipp Telemann	f	418	\N
1672	Arcangelo Corelli	f	418	\N
1671	Giuseppe Tartini	f	418	\N
1670	Antonio Vivaldi	t	418	\N
1669	Alap	f	417	\N
1668	Sargam	f	417	\N
1667	Raga	f	417	\N
1666	Taal	t	417	\N
1665	Terry Riley	f	416	\N
1664	Steve Reich	f	416	\N
1663	John Adams	t	416	\N
1662	Philip Glass	f	416	\N
1661	Enrique Granados	f	415	\N
1660	Manuel de Falla	f	415	\N
1659	Joaquin Rodrigo	t	415	\N
1658	Isaac Alb‚niz	f	415	\N
1657	Herbie Hancock	t	414	\N
1656	Chick Corea	f	414	\N
1655	Thelonious Monk	f	414	\N
1654	Duke Ellington	f	414	\N
1653	Aria	t	413	\N
1652	Intermezzo	f	413	\N
1651	Recitative	f	413	\N
1650	Overture	f	413	\N
1649	Minor seventh	f	412	\N
1648	Major third	f	412	\N
1647	Tritone	t	412	\N
1646	Perfect fifth	f	412	\N
1645	Terry Riley	f	411	\N
1644	Steve Reich	f	411	\N
1643	Philip Glass	t	411	\N
1642	John Adams	f	411	\N
1641	Domenico Scarlatti	f	410	\N
1640	Antonio Vivaldi	f	410	\N
1639	George Frideric Handel	f	410	\N
1638	Johann Sebastian Bach	t	410	\N
1637	Panpipes (Panflute)	t	409	\N
1636	Oboe	f	409	\N
1635	Trumpet	f	409	\N
1634	Flute	f	409	\N
1633	Steve Reich	f	408	\N
1632	Gy”rgy Ligeti	f	408	\N
1631	Karlheinz Stockhausen	f	408	\N
1630	John Cage	t	408	\N
1629	Nina Simone	f	407	\N
1628	Ella Fitzgerald	f	407	\N
1627	Aretha Franklin	f	407	\N
1626	Mahalia Jackson	t	407	\N
1625	Franz Schubert	f	406	\N
1624	Wolfgang Amadeus Mozart	f	406	\N
1621	Henry Cowell	t	405	\N
1620	Bela Bartok	f	405	\N
1619	Arnold Schoenberg	f	405	\N
1618	Igor Stravinsky	f	405	\N
1617	Johannes Brahms	f	404	\N
1616	Franz Joseph Haydn	f	404	\N
1615	Wolfgang Amadeus Mozart	f	404	\N
1614	Ludwig van Beethoven	t	404	\N
1613	Moderately soft	f	403	\N
1612	Very soft	t	403	\N
1611	Moderately loud	f	403	\N
1610	Very loud	f	403	\N
1609	Absolute Music	t	402	\N
1608	Sonata	f	402	\N
1607	Concerto	f	402	\N
1606	Symphony	f	402	\N
1605	Sonny Rollins	f	401	\N
1604	Lester Young	f	401	\N
1603	Charlie Parker	t	401	\N
1602	John Coltrane	f	401	\N
1601	Domenico Scarlatti	f	400	\N
1600	Antonio Vivaldi	f	400	\N
1599	George Frideric Handel	f	400	\N
1598	Johann Sebastian Bach	t	400	\N
1597	Picado	f	399	\N
1596	Golpe	f	399	\N
1595	Rasgueado	t	399	\N
1594	Tremolo	f	399	\N
1593	Don Basilio	f	398	\N
1592	Cherubino	f	398	\N
1591	Count Almaviva	f	398	\N
1590	Figaro	t	398	\N
1585	Gy”rgy Ligeti	f	396	\N
1584	Harry Partch	f	396	\N
1717	Renaissance	f	429	\N
1582	Karlheinz Stockhausen	t	396	\N
1581	New Jack Swing	t	395	\N
1580	Reggae	f	395	\N
1579	Jazz fusion	f	395	\N
1578	Hip-hop	f	395	\N
1577	Dmitri Shostakovich	f	394	\N
1576	Igor Stravinsky	t	394	\N
1575	Pyotr Ilyich Tchaikovsky	f	394	\N
1718	Magnetism	f	430	\N
1719	Inertia	t	430	\N
1720	Friction	f	430	\N
1721	Electromagnetism	f	430	\N
1722	Oxygen	f	431	\N
1723	Nitrogen	f	431	\N
1724	Carbon Dioxide	t	431	\N
1725	Hydrogen	f	431	\N
1726	Melting	f	432	\N
1727	Freezing	f	432	\N
1728	Condensation	f	432	\N
1729	Evaporation	t	432	\N
1730	Magnetism	f	433	\N
1731	Inertia	f	433	\N
1732	Gravitational Force	t	433	\N
1733	Friction	f	433	\N
1734	Venus	f	434	\N
1735	Mars	t	434	\N
1736	Jupiter	f	434	\N
1737	Mercury	f	434	\N
1738	Carbon Dioxide	f	435	\N
1739	Nitrogen	f	435	\N
1740	Oxygen	t	435	\N
1741	Hydrogen	f	435	\N
1742	Diamond	t	436	\N
1743	Quartz	f	436	\N
1744	Graphite	f	436	\N
1745	Ruby	f	436	\N
1746	Magnetism	f	437	\N
1747	Inertia	f	437	\N
1748	Friction	f	437	\N
1749	Gravity	t	437	\N
1750	Wind Energy	f	438	\N
1751	Nuclear Energy	f	438	\N
1752	Solar Energy	t	438	\N
1753	Geothermal Energy	f	438	\N
1754	Transpiration	t	439	\N
1755	Photosynthesis	f	439	\N
1756	Respiration	f	439	\N
1757	Absorption	f	439	\N
1758	Carnivores	f	440	\N
1759	Herbivores	t	440	\N
1760	Omnivores	f	440	\N
1761	Invertebrates	f	440	\N
1762	Freshwater	f	441	\N
1763	Saltwater	t	441	\N
1764	Brackish water	f	441	\N
1765	Groundwater	f	441	\N
1766	Europa	f	442	\N
1767	Titan	f	442	\N
1768	Luna	t	442	\N
1769	Phobos	f	442	\N
1770	Carbon Dioxide	t	443	\N
1771	Nitrogen	f	443	\N
1772	Oxygen	f	443	\N
1773	Hydrogen	f	443	\N
1774	Respiration	f	444	\N
1775	Photosynthesis	t	444	\N
1776	Transpiration	f	444	\N
1777	Digestion	f	444	\N
1778	Solid	t	445	\N
1779	Liquid	f	445	\N
1780	Gas	f	445	\N
1781	Plasma	f	445	\N
1782	Centripetal Force	f	446	\N
1783	Gravitational Force	t	446	\N
1784	Electromagnetic Force	f	446	\N
1785	Galilean Force	f	446	\N
1786	Carbon Dioxide	f	447	\N
1787	Nitrogen	f	447	\N
1788	Oxygen	t	447	\N
1789	Hydrogen	f	447	\N
1790	Melting	f	448	\N
1791	Freezing	t	448	\N
1792	Condensation	f	448	\N
1793	Evaporation	f	448	\N
1794	Venus	f	449	\N
1795	Mars	f	449	\N
1796	Jupiter	t	449	\N
1797	Saturn	f	449	\N
1798	Melting	f	450	\N
1799	Condensation	t	450	\N
1800	Evaporation	f	450	\N
1801	Sublimation	f	450	\N
1802	Europa	f	451	\N
1803	Titan	f	451	\N
1804	Luna	t	451	\N
1805	Phobos	f	451	\N
1806	Hydrosphere	f	452	\N
1807	Atmosphere	t	452	\N
1808	Biosphere	f	452	\N
1809	Lithosphere	f	452	\N
1810	Magnetism	f	453	\N
1811	Inertia	f	453	\N
1812	Gravitational Force	f	453	\N
1813	Buoyancy	t	453	\N
1814	Melting	f	454	\N
1815	Freezing	f	454	\N
1816	Condensation	f	454	\N
1817	Evaporation	t	454	\N
1818	Mirror	t	455	\N
1819	Glass	f	455	\N
1820	Prism	f	455	\N
1821	Lens	f	455	\N
1822	Eclipse	t	456	\N
1823	Equinox	f	456	\N
1824	Solstice	f	456	\N
1825	Comet	f	456	\N
1826	Comet	f	457	\N
1827	Meteor	f	457	\N
1828	Star	t	457	\N
1829	Nebula	f	457	\N
1830	Gravity	f	458	\N
1831	Friction	f	458	\N
1832	Electromagnetism	f	458	\N
1833	Sound waves	t	458	\N
1834	Isaac Newton	t	459	\N
1835	Albert Einstein	f	459	\N
1836	Galileo Galilei	f	459	\N
1837	Nikola Tesla	f	459	\N
1838	10%	f	460	\N
1839	50%	f	460	\N
1840	70%	f	460	\N
1841	98%	t	460	\N
1842	Carbon Dioxide	f	461	\N
1843	Nitrogen	t	461	\N
1844	Oxygen	f	461	\N
1845	Hydrogen	f	461	\N
1846	Isaac Newton	f	462	\N
1847	Albert Einstein	f	462	\N
1848	Stephen Hawking	t	462	\N
1849	Richard Feynman	f	462	\N
1850	France	f	463	\N
1851	Poland	t	463	\N
1852	Germany	f	463	\N
1853	Russia	f	463	\N
1854	Hubble	f	464	\N
1855	Voyager 1	f	464	\N
1856	Sputnik 1	t	464	\N
1857	Apollo 11	f	464	\N
1858	Bull	t	465	\N
1859	Calf	f	465	\N
1860	Cow	f	465	\N
1861	Steer	f	465	\N
1866	32øF (0øC)	f	467	\N
1867	212øF (100øC)	t	467	\N
1868	98.6øF (37øC)	f	467	\N
1869	68øF (20øC)	f	467	\N
1870	Elephant	t	468	\N
1871	Giraffe	f	468	\N
1872	Rhinoceros	f	468	\N
1873	Hippopotamus	f	468	\N
1874	Mammals	f	469	\N
1875	Birds	f	469	\N
1876	Reptiles	t	469	\N
1877	Amphibians	f	469	\N
1878	Ribs	f	470	\N
1879	Pelvis	f	470	\N
1880	Skull	t	470	\N
1881	Spine	f	470	\N
1882	Isaac Newton	t	471	\N
1883	Albert Einstein	f	471	\N
1884	Galileo Galilei	f	471	\N
1885	Nikola Tesla	f	471	\N
1886	African Elephant	f	472	\N
1887	Blue Whale	t	472	\N
1888	Giraffe	f	472	\N
1889	Giant Squid	f	472	\N
1890	Sight	f	473	\N
1891	Hearing	f	473	\N
1892	Taste	f	473	\N
1893	Smell	t	473	\N
1894	Photosynthesis	t	474	\N
1895	Respiration	f	474	\N
1896	Transpiration	f	474	\N
1897	Digestion	f	474	\N
1898	O2	f	475	\N
1899	CO2	f	475	\N
1900	H2O	t	475	\N
1901	CH4	f	475	\N
1902	Andromeda Galaxy	f	476	\N
1903	Milky Way Galaxy	t	476	\N
1904	Triangulum Galaxy	f	476	\N
1905	Sombrero Galaxy	f	476	\N
1906	Quartz	f	477	\N
1907	Topaz	f	477	\N
1908	Diamond	t	477	\N
1909	Corundum	f	477	\N
1910	Liver	f	478	\N
1911	Lungs	f	478	\N
1912	Kidneys	t	478	\N
1913	Heart	f	478	\N
1914	Insects	f	479	\N
1915	Mammals	f	479	\N
1916	Arachnids	t	479	\N
1917	Reptiles	f	479	\N
1918	Gene	t	480	\N
1919	Chromosome	f	480	\N
1920	Allele	f	480	\N
1921	Nucleotide	f	480	\N
1922	Trachea	f	481	\N
1923	Larynx	t	481	\N
1924	Pharynx	f	481	\N
1925	Epiglottis	f	481	\N
1926	Nitrogen	f	482	\N
1927	Oxygen	f	482	\N
1928	Carbon dioxide	t	482	\N
1929	Methane	f	482	\N
1930	Cerebellum	t	483	\N
1931	Medulla oblongata	f	483	\N
1932	Thalamus	f	483	\N
1933	Hypothalamus	f	483	\N
1934	Bacteria	f	484	\N
1935	Protozoa	f	484	\N
1936	Fungus	f	484	\N
1937	Prokaryote	t	484	\N
1938	Veins	f	485	\N
1939	Arteries	t	485	\N
1940	Capillaries	f	485	\N
1941	Venules	f	485	\N
1942	Newton	t	486	\N
1943	Joule	f	486	\N
1944	Watt	f	486	\N
1945	Pascal	f	486	\N
1946	Fe	t	487	\N
1947	Ir	f	487	\N
1948	In	f	487	\N
1949	Io	f	487	\N
1950	Cell	t	488	\N
1951	Atom	f	488	\N
1952	Molecule	f	488	\N
1953	Organism	f	488	\N
1954	CH3OH	f	489	\N
1955	CH4	t	489	\N
1956	CO2	f	489	\N
1957	C6H12O6	f	489	\N
1958	Volt	f	490	\N
1959	Ampere	t	490	\N
1960	Ohm	f	490	\N
1961	Watt	f	490	\N
1962	Igneous rock	f	491	\N
1963	Metamorphic rock	f	491	\N
1964	Sedimentary rock	t	491	\N
1965	Magma rock	f	491	\N
1966	Cerebellum	f	492	\N
1967	Medulla oblongata	f	492	\N
1968	Hippocampus	t	492	\N
1969	Thalamus	f	492	\N
1970	Helix	f	493	\N
1971	Spiral	f	493	\N
1972	Twisty	f	493	\N
1973	Double helix	t	493	\N
1974	Convergent boundary	f	494	\N
1975	Divergent boundary	t	494	\N
1976	Transform boundary	f	494	\N
1977	Subduction boundary	f	494	\N
1978	Paleozoic Era	f	495	\N
1979	Cenozoic Era	f	495	\N
1980	Mesozoic Era	t	495	\N
1981	Precambrian Era	f	495	\N
1982	Serotonin	f	496	\N
1983	Dopamine	t	496	\N
1984	Acetylcholine	f	496	\N
1985	GABA	f	496	\N
1986	Ecosystem	f	497	\N
1987	Biodiversity	t	497	\N
1988	Ecology	f	497	\N
1989	Biome	f	497	\N
1990	Arteries	f	498	\N
1991	Capillaries	f	498	\N
1992	Veins	t	498	\N
1993	Venules	f	498	\N
1994	Newton Law of Universal Gravitation	f	499	\N
1995	Newton First Law of Motion	f	499	\N
1996	Newton Second Law of Motion	f	499	\N
1997	Newton Third Law of Motion	t	499	\N
1998	Au	t	500	\N
1999	Ag	f	500	\N
2000	Gd	f	500	\N
2001	Go	f	500	\N
2002	Europa	f	501	\N
2003	Titan	f	501	\N
2004	Ganymede	t	501	\N
2005	Callisto	f	501	\N
2006	Volt	f	502	\N
2007	Ampere	f	502	\N
2008	Ohm	t	502	\N
2009	Watt	f	502	\N
2010	Moho	t	503	\N
2011	Crustline	f	503	\N
2012	Lithosphere	f	503	\N
2013	Asthenosphere	f	503	\N
2014	Cornea	f	504	\N
2015	Iris	t	504	\N
2016	Retina	f	504	\N
2017	Lens	f	504	\N
2018	Mammals	f	505	\N
2019	Reptiles	f	505	\N
2020	Birds	t	505	\N
2021	Amphibians	f	505	\N
2022	Hypertension	t	506	\N
2023	Hypotension	f	506	\N
2024	Hyperglycemia	f	506	\N
2025	Hypoglycemia	f	506	\N
2026	Gondwana	f	507	\N
2027	Pangea	t	507	\N
2028	Laurasia	f	507	\N
2029	Rodinia	f	507	\N
2030	Glucose	f	508	\N
2031	Insulin	f	508	\N
2032	Myelin	t	508	\N
2033	Dopamine	f	508	\N
2034	Photosynthesis	f	509	\N
2035	Respiration	f	509	\N
2036	Decomposition	t	509	\N
2037	Transpiration	f	509	\N
2038	Stomach	f	510	\N
2039	Small intestine	t	510	\N
2040	Esophagus	f	510	\N
2041	Large intestine	f	510	\N
2042	So	f	511	\N
2043	Sa	f	511	\N
2044	Sn	f	511	\N
2045	Na	t	511	\N
2046	Earth	f	512	\N
2047	Mars	f	512	\N
2048	Jupiter	t	512	\N
2049	Saturn	f	512	\N
2050	Nucleus	f	513	\N
2051	Mitochondria	t	513	\N
2052	Golgi apparatus	f	513	\N
2053	Endoplasmic reticulum	f	513	\N
2054	Ohm Law	f	514	\N
2055	Coulomb Law	f	514	\N
2056	Kirchhoff Law	f	514	\N
2057	Law of Conservation of Charge	t	514	\N
2058	Troposphere	t	515	\N
2059	Stratosphere	f	515	\N
2060	Mesosphere	f	515	\N
2061	Thermosphere	f	515	\N
2062	Pituitary gland	f	516	\N
2063	Pineal gland	t	516	\N
2064	Thyroid gland	f	516	\N
2065	Adrenal gland	f	516	\N
2066	Stamen	t	517	\N
2067	Pistil	f	517	\N
2068	Sepal	f	517	\N
2069	Petal	f	517	\N
2070	Bats	t	518	\N
2071	Dolphins	f	518	\N
2072	Whales	f	518	\N
2073	Kangaroos	f	518	\N
2074	Femur	f	519	\N
2075	Scapula	f	519	\N
2076	Clavicle	t	519	\N
2077	Humerus	f	519	\N
2078	Big Bang Theory	f	520	\N
2079	Theory of Relativity	f	520	\N
2080	Theory of Evolution	f	520	\N
2081	Alvarez Theory (or Impact Theory)	t	520	\N
2082	Botany	f	521	\N
2083	Mycology	t	521	\N
2084	Entomology	f	521	\N
2085	Zoology	f	521	\N
2086	Filtration	f	522	\N
2087	Distillation	f	522	\N
2088	Desalination	t	522	\N
2089	Evaporation	f	522	\N
2090	Gravity	f	523	\N
2091	Inertia	f	523	\N
2092	Friction	t	523	\N
2093	Buoyancy	f	523	\N
2094	Ne	f	524	\N
2095	Ni	f	524	\N
2096	N	t	524	\N
2097	Na	f	524	\N
2098	Voyager 1	t	525	\N
2099	Voyager 2	f	525	\N
2100	Pioneer 10	f	525	\N
2101	New Horizons	f	525	\N
2102	Diffraction	f	526	\N
2103	Refraction	f	526	\N
2104	Gravitational lensing	t	526	\N
2105	Dispersion	f	526	\N
2106	Nucleus	f	527	\N
2107	Endoplasmic reticulum	f	527	\N
2108	Golgi apparatus	f	527	\N
2109	Mitochondria	t	527	\N
2110	Oxygen	f	528	\N
2111	Fluorine	t	528	\N
2112	Nitrogen	f	528	\N
2113	Carbon	f	528	\N
2114	Black hole	f	529	\N
2115	White dwarf	f	529	\N
2116	Pulsar	t	529	\N
2117	Quasar	f	529	\N
2118	2.71	t	530	\N
2119	2.62	f	530	\N
2120	2.88	f	530	\N
2121	2.36	f	530	\N
2122	Sedimentary rock	f	531	\N
2123	Metamorphic rock	f	531	\N
2124	Igneous rock	t	531	\N
2125	Tectonic rock	f	531	\N
2126	Insulin	f	532	\N
2127	Hemoglobin	t	532	\N
2128	Collagen	f	532	\N
2129	Myoglobin	f	532	\N
2130	Bubble sort	f	533	\N
2131	Insertion sort	f	533	\N
2132	Merge sort	t	533	\N
2133	Selection sort	f	533	\N
2134	Confirmation bias	f	534	\N
2135	Primacy effect	t	534	\N
2136	Recency effect	f	534	\N
2137	Serial position effect	f	534	\N
2138	Methane	f	535	\N
2139	Carbon dioxide	t	535	\N
2140	Nitrous oxide	f	535	\N
2141	Water vapor	f	535	\N
2142	Quantum jump	f	536	\N
2143	Planck constant	f	536	\N
2144	Quantum flux	f	536	\N
2145	Photon energy	t	536	\N
2146	Down syndrome	f	537	\N
2147	Angelman syndrome	t	537	\N
2148	Turner syndrome	f	537	\N
2149	Klinefelter syndrome	f	537	\N
2150	Hydroxyl group	f	538	\N
2151	Carbonyl group	t	538	\N
2152	Carboxyl group	f	538	\N
2153	Amino group	f	538	\N
2154	Event horizon	t	539	\N
2155	Singularity	f	539	\N
2156	Photon sphere	f	539	\N
2157	Ergosphere	f	539	\N
2158	Dopamine	f	540	\N
2159	Serotonin	t	540	\N
2160	Acetylcholine	f	540	\N
2161	GABA	f	540	\N
2162	Higgs boson	f	541	\N
2163	Graviton	f	541	\N
2164	Photon	t	541	\N
2165	Gluon	f	541	\N
2166	Gneiss	f	542	\N
2167	Schist	f	542	\N
2168	Basalt	t	542	\N
2169	Marble	f	542	\N
2170	IgG	f	543	\N
2171	IgA	f	543	\N
2172	IgM	t	543	\N
2173	IgE	f	543	\N
2174	Quantum dots	f	544	\N
2175	Carbon nanotubes	f	544	\N
2176	Gold nanoparticles	t	544	\N
2177	Liposomes	f	544	\N
2178	Newton first law	f	545	\N
2179	Newton second law	t	545	\N
2180	Newton third law	f	545	\N
2181	Newton law of gravitation	f	545	\N
2182	Quantum mechanics	f	546	\N
2183	String theory	t	546	\N
2184	Loop quantum gravity	f	546	\N
2185	General relativity	f	546	\N
2186	Nucleus	f	547	\N
2187	Mitochondria	f	547	\N
2188	Endoplasmic reticulum	f	547	\N
2189	Ribosome	t	547	\N
2190	Geometric isomerism	f	548	\N
2191	Optical isomerism	f	548	\N
2192	Conformational isomerism	t	548	\N
2193	Structural isomerism	f	548	\N
2194	Event horizon	t	549	\N
2195	Ergosphere	f	549	\N
2196	Singularity	f	549	\N
2197	Photon sphere	f	549	\N
2198	Cerebellum	f	550	\N
2199	Hippocampus	f	550	\N
2200	Hypothalamus	t	550	\N
2201	Amygdala	f	550	\N
2202	Pauli exclusion principle	f	551	\N
2203	Heisenberg uncertainty principle	t	551	eeeeeeee
2221	Nitrogen fixation	f	555	eeeeeeee
2220	Denitrification	t	555	eeeeeeee
2219	Ammonification	f	555	eeeeeeee
2218	Nitrification	f	555	eeeeeeee
2217	Genome editing	t	554	eeeeeeee
2216	Gene cloning	f	554	eeeeeeee
2215	DNA sequencing	f	554	eeeeeeee
2214	Polymerase chain reaction (PCR)	f	554	eeeeeeee
2213	Algae	f	553	eeeeeeee
2212	Fungi	f	553	eeeeeeee
2211	Archaea	f	553	eeeeeeee
2210	Bacteria	t	553	eeeeeeee
2209	Tectonism	f	552	eeeeeeee
2208	Metamorphism	t	552	eeeeeeee
2207	Weathering	f	552	eeeeeeee
2206	Erosion	f	552	eeeeeeee
2205	Planck uncertainty principle	f	551	eeeeeeee
2204	Schr”dinger uncertainty principle	f	551	eeeeeeee
678	Antarctic Desert	t	170	\N
1146	Greenland	f	287	\N
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (category_id, category_name) FROM stdin;
1	History
2	Geography
3	Music
4	Science
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (question_id, question_text, difficulty_level, category_id, explanation) FROM stdin;
12	How Many US Presidents Have There Been?	easy	1	There have been 46 Presidents of the United States. The first President was George Washington, who took office in 1789, and the current President at that time was Joe Biden, who took office in January 2021. The United States follows a presidential system, where the President serves as the head of state and government. Each President is elected to a four-year term and can be re-elected for one additional term, as per the 22nd Amendment to the US Constitution. Over the years, the US Presidents have played a crucial role in shaping the nation's history, politics, and policies, leaving a lasting impact on the country and the world.\r\n\r\n\r\n\r\n\r\n\r\n
22	Which Country Did Christopher Columbus Sail For When He Discovered The Americas?	easy	1	\r\nChristopher Columbus sailed for Spain when he discovered the Americas. In 1492, Columbus embarked on a historic expedition across the Atlantic Ocean, seeking a westward route to Asia. Instead, he landed on several Caribbean islands, believing he had reached the eastern shores of Asia. Columbus's voyages opened up a new era of exploration and contact between the Old World (Europe) and the New World (the Americas), leading to significant interactions, trade, and colonization between Europe and the Americas.
57	Who was the principal author of the "Communist Manifesto"?	medium	1	\r\nThe principal author of the "Communist Manifesto" was Karl Marx. The "Communist Manifesto," written in collaboration with Friedrich Engels, was first published in 1848 and became one of the most influential political documents in history. It laid out the principles and goals of the Communist League, advocating for the overthrow of capitalist societies and the establishment of a classless, communist society.
60	Who won four gold medals in the 1936 Olympics, infuriating Adolf Hitler?	medium	1	Jesse Owens, an African-American track and field athlete, won four gold medals in the 1936 Olympics, held in Berlin, Germany. His remarkable achievements infuriated Adolf Hitler, who intended to use the games to showcase Aryan supremacy and Nazi ideologies. Jesse Owens' victories shattered Hitler's propaganda, as he proved that athletic prowess and skill transcended racial boundaries. Owens' success at the Berlin Olympics became a powerful symbol of resistance against racism and a testament to the strength of the human spirit.\r\n\r\n\r\n\r\n\r\n
68	What was the name of the movie that Elvis Presley made his film debut in?	medium	1	Elvis Presley made his film debut in the movie "Love Me Tender." The film was released in 1956 and was originally titled "The Reno Brothers" but was later renamed to capitalize on the popularity of Presley's hit song "Love Me Tender," which he performed in the movie. In "Love Me Tender," Elvis played the role of Clint Reno, the youngest brother of a Confederate soldier returning home after the American Civil War. The film marked the beginning of Elvis Presley's successful career in acting, as he went on to star in many more films during the late 1950s and 1960s.
76	In what year did humans put the first satellite into orbit?	medium	1	Humans put the first artificial satellite into orbit on October 4, 1957. The Soviet Union launched the satellite named "Sputnik 1" into space. It was a significant milestone in the space age and marked the beginning of the space race between the United States and the Soviet Union during the Cold War era. Sputnik 1's successful launch had a profound impact on science, technology, and geopolitics, ushering in a new era of space exploration and satellite-based communication.\r\n\r\n\r\n\r\n\r\n
3	Which war is also known as the "Great War"?	medium	1	The war that is also known as the "Great War" is World War I. It took place from 1914 to 1918 and involved many of the world's major powers at that time. The war's widespread impact and unprecedented scale of destruction earned it the title "Great War" before it was later named World War I, following the outbreak of World War II.\r\n\r\n\r\n\r\n\r\n
24	Who Was The Primary Author Of The Declaration Of Independence?	easy	1	\r\nThe primary author of the Declaration of Independence was Thomas Jefferson. He was a prominent Founding Father of the United States and was selected by the Second Continental Congress to lead the committee responsible for drafting the Declaration. Jefferson's eloquent writing and ideas played a crucial role in shaping the document, which was adopted on July 4, 1776, and declared the thirteen American colonies' independence from British rule.
30	Who Wrote The Plays "Romeo and Juliet" and "Hamlet"?	easy	1	The plays "Romeo and Juliet" and "Hamlet" were both written by William Shakespeare. He was an English playwright and poet who lived during the late 16th and early 17th centuries. Shakespeare is widely regarded as one of the greatest writers in the English language and is often referred to as the "Bard of Avon." His works, including "Romeo and Juliet" and "Hamlet," have had a profound and enduring impact on literature, theater, and culture, making him one of the most celebrated playwrights in history.
35	Who Was The First European To Reach India By Sea?	easy	1	\r\nThe first European to reach India by sea was the Portuguese explorer Vasco da Gama. In 1498, during the Age of Discovery, Vasco da Gama successfully sailed from Europe to India, establishing a direct sea route from Europe to the Indian subcontinent. His voyage was significant as it opened up new trade possibilities and established direct maritime connections between Europe and the wealthy spice markets of India. This expedition played a crucial role in European exploration and trade expansion in the Indian Ocean region and further solidified Portugal's maritime dominance during the Age of Exploration.
42	Which Country Was The First To Legalize Same-Sex Marriage?	easy	1	The first country to legalize same-sex marriage was the Netherlands. On April 1, 2001, the Netherlands passed a law that allowed same-sex couples to marry legally. This historic decision made the Netherlands the first country in the world to grant full marriage equality to same-sex couples, giving them the same legal rights and recognition as opposite-sex couples. Since then, several other countries have followed suit, legalizing same-sex marriage and advancing LGBTQ+ rights around the world.\r\n\r\n\r\n\r\n\r\n
50	What was the purpose of the Berlin Conference in 1884-1885?	medium	1	The purpose of the Berlin Conference in 1884-1885 was to regulate and formalize the European colonization and division of Africa. During the conference, European powers negotiated and agreed on specific rules and guidelines for acquiring territories in Africa to avoid conflict between colonial powers. The conference disregarded the interests and sovereignty of African peoples and led to the "Scramble for Africa," with European colonial powers occupying and controlling vast parts of the continent.
179	Which island country in the Mediterranean is divided into Greek and Turkish regions?	medium	2	The island country in the Mediterranean that is divided into Greek and Turkish regions is Cyprus. Cyprus is located in the eastern Mediterranean Sea, south of Turkey and west of Syria and Lebanon. The island has a complex history, and since 1974, it has been divided into two main parts: the Republic of Cyprus, predominantly inhabited by Greek Cypriots, and the self-declared Turkish Republic of Northern Cyprus, which is recognized only by Turkey. The division of the island is a result of a conflict that occurred in 1974, leading to the establishment of a United Nations buffer zone, known as the "Green Line," that separates the two regions.\r\n\r\n\r\n\r\n\r\n
119	The War of the Triple Alliance (1864-1870) was a devastating conflict involving Paraguay and an alliance of Argentina, Brazil, and Uruguay. What was the other name by which this war was known?	hard	1	The War of the Triple Alliance (1864-1870) was also known as the Paraguayan War. This name derives from the fact that Paraguay was the primary target of the alliance formed by Argentina, Brazil, and Uruguay. The conflict was a devastating and prolonged war that resulted in significant loss of life and destruction, especially for Paraguay, which suffered immense casualties and extensive territorial losses by the end of the war. The War of the Triple Alliance is considered one of the bloodiest and most destructive wars in South American history.\r\n\r\n\r\n\r\n\r\n
123	Which Chinese dynasty, known for its encouragement of arts and technological innovations, was overthrown in 1644 by the Manchu invaders?	hard	1	The Chinese dynasty known for its encouragement of arts and technological innovations, which was overthrown in 1644 by the Manchu invaders, was the Ming Dynasty. The Ming Dynasty ruled China from 1368 to 1644 and is considered one of the most prosperous and culturally significant periods in Chinese history.\r\n\r\nDuring the Ming Dynasty, China experienced significant advancements in art, literature, science, and technology. The dynasty's early reign was marked by a centralized government, economic growth, and the construction of impressive monuments such as the Forbidden City in Beijing. However, by the late Ming period, internal corruption, financial strain, and external pressures led to the weakening of the dynasty.\r\n\r\nIn 1644, the Ming Dynasty fell to the invading forces of the Manchu-led Qing Dynasty, which established its rule over China, marking the end of the Ming Dynasty and the beginning of the Qing Dynasty, which would last until 1912.
127	What was the name of the 1884-1885 conference during which European powers partitioned Africa among themselves?	hard	1	The name of the 1884-1885 conference during which European powers partitioned Africa among themselves was the "Berlin Conference" or the "Congo Conference." The conference was organized by German Chancellor Otto von Bismarck and aimed to regulate European colonization and trade in Africa, resulting in the arbitrary division and colonization of much of the continent without considering the wishes or interests of its indigenous peoples.\r\n\r\n\r\n\r\n\r\n
133	The "Pax Romana" was a period of relative peace and stability in ancient Rome that lasted approximately how many years?	hard	1	The "Pax Romana" was a period of relative peace and stability in ancient Rome that lasted approximately 200 years. It began with the rise of Augustus Caesar as the first Roman Emperor in 27 BCE and lasted until the death of Marcus Aurelius in 180 CE. The Pax Romana marked a time of prosperity, internal order, and expansion of the Roman Empire, during which the Roman world experienced a relative lack of large-scale conflicts and external threats. It allowed for significant cultural, architectural, and economic developments within the empire.\r\n\r\n\r\n\r\n\r\n
83	Which century did the French Revolution take place in?	medium	1	The French Revolution took place in the 18th century. It began on May 5, 1789, with the convening of the Estates-General and continued until the late 1790s. The revolution marked a period of significant political, social, and economic upheaval in France and had far-reaching effects not only in France but also across Europe and the world. The French Revolution brought an end to the absolute monarchy in France and led to the establishment of the First French Republic, a radical shift in the political landscape and the overthrow of the ancien régime.\r\n\r\n\r\n\r\n\r\n
92	Which world leader is famous for his "Little Red Book"?	medium	1	The world leader famous for his "Little Red Book" is Mao Zedong, the founding father of the People's Republic of China and the leader of the Chinese Communist Party. The "Little Red Book" is officially titled "Quotations from Chairman Mao Zedong" and was first published in 1964.\r\n\r\nThe book is a collection of selected speeches, writings, and thoughts of Mao Zedong, and it was widely distributed during the Cultural Revolution in China. It became a symbol of Mao's leadership and Communist ideology, and it was required reading for millions of Chinese citizens during that period. The "Little Red Book" played a significant role in promoting Mao's cult of personality and shaping the political consciousness of the Chinese population at the time.
100	In which year was John F. Kennedy assassinated?	medium	1	\r\nJohn F. Kennedy was assassinated on November 22, 1963. The tragic event occurred in Dallas, Texas, while President Kennedy was riding in a motorcade through Dealey Plaza. He was shot and killed by Lee Harvey Oswald from the sixth floor of the Texas School Book Depository building. The assassination of President Kennedy had a profound impact on the nation and the world, leading to investigations, conspiracy theories, and significant changes in U.S. history and politics.
109	In ancient Rome, what was the significance of the "Lex Canuleia" enacted in 445 BCE?	hard	1	\r\nThe "Lex Canuleia," enacted in 445 BCE in ancient Rome, was a significant law that allowed marriage between patricians (members of the aristocratic class) and plebeians (commoners). Before this law, such marriages were not permitted, and the legal recognition of these unions helped to bridge the social and political divide between the two classes. The law played a crucial role in promoting social cohesion and integrating the plebeians into the political life of the Roman Republic.
112	Who was the primary author of the "Federalist Papers"?	hard	1	The primary author of the "Federalist Papers" was Alexander Hamilton. The "Federalist Papers" were a series of 85 essays written between 1787 and 1788 to promote the ratification of the United States Constitution. Hamilton, along with James Madison and John Jay, played a significant role in writing these essays, with Hamilton being responsible for the majority of them. The "Federalist Papers" are considered one of the most important and influential documents in American political history, offering insights into the ideas and principles behind the formation of the U.S. Constitution and the structure of the new government.
183	What is the smallest country in the world by land area?	medium	2	The smallest country in the world by land area is Vatican City. Vatican City is an independent city-state enclaved within Rome, Italy. It is the spiritual and administrative center of the Roman Catholic Church and is home to the Pope, the leader of the Catholic Church. Vatican City covers an area of approximately 44 hectares (110 acres) and is known for its rich cultural and historical significance.\r\n\r\n\r\n\r\n\r\n
188	Which European country is famous for its fjords, northern lights, and Vikings?	medium	2	The European country famous for its fjords, northern lights, and Vikings is Norway. Norway is renowned for its stunning natural landscapes, including deep, narrow fjords carved by glaciers, such as the famous Geirangerfjord and Nærøyfjord. The northern lights, also known as the Aurora Borealis, are a natural light display that can be observed in Norway's northern regions during certain times of the year.
193	What is the capital city of South Korea?	medium	2	The capital city of South Korea is Seoul. Seoul is the largest city in South Korea and serves as its political, economic, cultural, and social center. It is a vibrant and modern metropolis, known for its rich history, advanced technology, bustling markets, and impressive architecture. The city offers a mix of traditional and contemporary attractions, making it a popular destination for both tourists and business travelers.\r\n\r\n\r\n\r\n\r\n
199	Which river is the longest in Europe?	medium	2	\r\nThe longest river in Europe is the Volga River. The Volga River is approximately 3,531 kilometers (2,194 miles) long and is located in Russia. It flows through the western part of the country, passing through major cities such as Moscow and Volgograd, before emptying into the Caspian Sea.\r\n\r\nThe Volga River plays a significant role in Russian history, culture, and economy. It is an essential transportation route for both commercial shipping and passenger vessels. Additionally, the river's basin is home to diverse ecosystems and supports a wide range of flora and fauna, making it an important natural resource in the region.
204	What is the national flower of India?	medium	2	The national flower of India is the Lotus (Nelumbo nucifera). This sacred flower holds great cultural and religious significance in Indian history and mythology. It symbolizes purity, beauty, wealth, and prosperity. The lotus is often associated with various deities and is prominently featured in art, architecture, and literature throughout the country.\r\n\r\n\r\n\r\n\r\n
140	Which city is famous for its big clock tower called "Big Ben"?	easy	2	London, the capital city of the United Kingdom, is famous for its big clock tower called "Big Ben." Actually, "Big Ben" refers specifically to the large bell inside the clock tower, but the name is often used to refer to the entire clock tower. The tower is an iconic symbol of London and is located at the north end of the Palace of Westminster.\r\n\r\n\r\n\r\n\r\n
141	Which famous river runs through the Grand Canyon in the United States?	easy	2	The famous river that runs through the Grand Canyon in the United States is the Colorado River. The Colorado River is a major river in the southwestern United States and northwestern Mexico. It is one of the primary factors that carved out the breathtaking Grand Canyon over millions of years, creating one of the world's most spectacular natural wonders.\r\n\r\n\r\n\r\n\r\n
146	Which planet is closest to the Sun in our solar system?	easy	2	The planet closest to the Sun in our solar system is Mercury. Mercury is the innermost and smallest planet in the solar system. Due to its proximity to the Sun, it experiences extreme temperature variations, with scorching hot temperatures during the day and freezing cold temperatures at night. Its orbit is the fastest of all the planets, completing one revolution around the Sun in about 88 Earth days.\r\n\r\n\r\n\r\n\r\n
151	What is the capital city of France?	easy	2	The capital city of France is Paris. Paris is not only the largest city in France but also a global center for art, fashion, culture, and cuisine. It is renowned for its iconic landmarks such as the Eiffel Tower, Louvre Museum, Notre-Dame Cathedral, and many more. As a major European capital, Paris holds historical significance and attracts millions of visitors from around the world each year.\r\n\r\n\r\n\r\n\r\n
158	What is the name of the mountain range that stretches across much of North America?	easy	2	The mountain range that stretches across much of North America is the Rocky Mountains, often referred to as the Rockies. The Rocky Mountains extend from the northernmost part of British Columbia in Canada to New Mexico in the United States, covering a vast distance of approximately 4,800 kilometers (3,000 miles). The Rockies are known for their stunning landscapes, diverse ecosystems, and numerous outdoor recreational opportunities, making them a popular destination for hikers, skiers, and nature enthusiasts.\r\n\r\n\r\n\r\n\r\n
165	Which country is both an island and a continent?	easy	2	The country that is both an island and a continent is Australia. Australia is the world's smallest continent and the largest island. It is situated entirely in the Southern Hemisphere and is bordered by the Indian Ocean to the west and the Pacific Ocean to the east. As an island continent, Australia is unique in its vast and diverse landscapes, including deserts, rainforests, mountains, and beautiful coastlines. It is home to a wide range of unique flora and fauna, some of which are found nowhere else in the world. Australia is also a sovereign country and is officially known as the Commonwealth of Australia.\r\n\r\n\r\n\r\n\r\n
173	The Great Barrier Reef is located off the coast of which country?	medium	2	The Great Barrier Reef is located off the coast of Australia. It is the world's largest coral reef system, stretching over 2,300 kilometers and comprising thousands of individual reefs and islands. The reef is home to an incredible diversity of marine life, including various species of corals, fish, sharks, and marine mammals, making it one of the most ecologically significant and biodiverse regions on Earth.\r\n\r\n\r\n\r\n\r\n
178	The ancient city of Petra, known for its rock-cut architecture, is located in which country?	medium	2	The ancient city of Petra, known for its remarkable rock-cut architecture, is located in Jordan. Petra is an archaeological site in the southwestern region of Jordan, near the town of Wadi Musa. It was the capital of the Nabataean Kingdom and is famous for its stunning structures carved into the pink sandstone cliffs, including the iconic Treasury (Al-Khazneh) and the Monastery (Ad Deir). Petra is a UNESCO World Heritage Site and one of the most renowned historical and archaeological sites in the world, attracting visitors with its rich history and breathtaking architecture.\r\n\r\n\r\n\r\n\r\n
434	What planet is known as the "Red Planet"?	easy	4	The planet known as the "Red Planet" is Mars. The distinctive reddish appearance of Mars is due to the presence of iron oxide, commonly known as rust, on its surface. This iron oxide gives the planet's soil and rocks a reddish color, which is why it earned the nickname "Red Planet." Mars is the fourth planet from the Sun in our solar system and has long fascinated astronomers and space enthusiasts due to its similarity to Earth and the potential for supporting life.\r\n\r\n\r\n\r\n\r\n
209	What is the currency of Brazil?	medium	2	The currency of Brazil is the Brazilian Real, abbreviated as BRL. It has been the official currency of Brazil since 1994, replacing the previous currency, the Cruzeiro. The Brazilian Real is denoted by the symbol "R$" and is further divided into 100 smaller units called centavos. 
214	The city of Los Angeles is located in which U.S. state?	medium	2	The city of Los Angeles is located in the U.S. state of California. Los Angeles, often abbreviated as L.A., is the largest city in California and the second-most populous city in the United States after New York City. It is a major center for entertainment, culture, and international trade, with a diverse population and a wide range of attractions, including Hollywood, beautiful beaches, and various iconic landmarks.\r\n\r\n\r\n\r\n\r\n
220	What is the capital city of Thailand?	medium	2	The capital city of Thailand is Bangkok. Bangkok is the largest city in Thailand and serves as the country's political, cultural, and economic center. It is a bustling metropolis known for its vibrant street life, ornate temples, bustling markets, and delicious street food. The city's rich history, modern amenities, and warm hospitality make it a popular destination for tourists from around the world.\r\n\r\n\r\n\r\n\r\n
226	The city of Nairobi is the capital of which African country?	medium	2	The city of Nairobi is the capital of Kenya, an East African country known for its diverse landscapes, wildlife, and cultural heritage. Nairobi is situated in the southern part of Kenya and serves as the country's political, economic, and cultural center. The city is known for its modern skyline, bustling markets, and various national parks and wildlife reserves located nearby. Nairobi is often considered the gateway to Kenya's famous safari destinations, making it a popular starting point for tourists exploring the country's natural beauty and wildlife.\r\n\r\n\r\n\r\n\r\n
231	The city of San Francisco is located in which U.S. state?	medium	2	The city of San Francisco is located in the U.S. state of California. San Francisco is a major city on the western coast of the United States and is known for its iconic landmarks, diverse culture, and progressive atmosphere. It is situated on the northern tip of the San Francisco Peninsula and is surrounded by the Pacific Ocean and San Francisco Bay. The city is famous for attractions such as the Golden Gate Bridge, Alcatraz Island, and its vibrant neighborhoods like Chinatown and Haight-Ashbury.\r\n\r\n\r\n\r\n\r\n
237	What is the capital city of Spain?	medium	2	The capital city of Spain is Madrid. Madrid is located in the central part of the country and is the largest city in Spain. As the capital, it serves as the political, cultural, and economic hub of the nation. Madrid is known for its rich history, beautiful architecture, world-class museums, and vibrant nightlife. The city is also famous for its grand boulevards, historic squares, and numerous parks and gardens, making it a popular destination for tourists from around the world.\r\n\r\n\r\n\r\n\r\n
244	Oslo is the capital of which country?	medium	2	Oslo is the capital city of Norway. It is situated in the southern part of Norway, along the country's southeastern coast, and it is the largest city in Norway. Oslo is known for its beautiful natural surroundings, including the Oslo Fjord and nearby forests, as well as its cultural attractions, such as museums, theaters, and historic landmarks. As the capital, Oslo serves as the political, economic, and cultural center of Norway, and it is a popular destination for tourists seeking to explore the country's history, art, and outdoor activities.\r\n\r\n\r\n\r\n\r\n
253	Which country has the most castles in the world?	medium	2	The country with the most castles in the world is Germany. Germany is renowned for its rich history and medieval architecture, which includes a vast number of well-preserved castles. These castles serve as reminders of the country's cultural heritage, reflecting its historical significance and architectural diversity.\r\n\r\n\r\n\r\n\r\n
254	What is the capital of Estonia?	medium	2	The capital of Estonia is Tallinn. Tallinn is a vibrant and historic city located on the northern coast of Estonia, overlooking the Baltic Sea. It is known for its well-preserved medieval Old Town, which is a UNESCO World Heritage site, and its blend of modern and traditional elements, making it a popular destination for tourists and a cultural hub within the Baltic region.\r\n\r\n\r\n\r\n\r\n
259	In which US state would you find Harvard University?	medium	2	Harvard University is located in Cambridge, Massachusetts. Cambridge is situated in the northeastern United States, and it is part of the Greater Boston area in Massachusetts. Harvard University is one of the most prestigious and well-known Ivy League institutions in the United States and is renowned for its academic excellence and contributions to various fields of study.
264	Which country is the island of Socotra a part of?	hard	2	The island of Socotra is part of Yemen. It is an archipelago located in the Arabian Sea, approximately 380 kilometers (236 miles) south of the Arabian Peninsula. Socotra is the largest island in the archipelago and is known for its unique and diverse flora and fauna. The island's isolation has allowed for the development of many endemic species that can only be found on Socotra, making it a place of significant ecological importance and one of UNESCO's World Heritage Sites.
269	What is the name of the mountain range that runs parallel to the Mediterranean coast in the autonomous community of Catalonia in Spain?	hard	2	The mountain range that runs parallel to the Mediterranean coast in the autonomous community of Catalonia in Spain is called the "Serra de Collserola" or simply "Collserola." It is a natural park and mountain range located near Barcelona, the capital of Catalonia. Collserola serves as a prominent natural boundary between the urban areas of Barcelona and the surrounding countryside, offering opportunities for hiking, nature exploration, and panoramic views of the city and the coastline.\r\n\r\n\r\n\r\n\r\n
274	In which European country can you find The Malbork Castle?	hard	2	The Malbork Castle, also known as the Castle of the Teutonic Order in Malbork, is located in Poland. It is one of the most impressive medieval castles in Europe and is recognized as a UNESCO World Heritage Site. The castle is situated in the town of Malbork in northern Poland, near the Nogat River, and was built by the Teutonic Knights in the 13th century. The Malbork Castle is a remarkable example of medieval brick Gothic architecture and attracts numerous visitors each year for its historical and architectural significance.\r\n\r\n\r\n\r\n\r\n
287	Which country has the lowest number of people per square mile?	hard	2	Mongolia is known to have one of the lowest population densities in the world, with a relatively small number of people per square mile. The vast and sparsely populated landscapes of Mongolia contribute to its low population density. However, it's important to note that population data can change over time, so it's recommended to refer to the latest demographic statistics for the most up-to-date information.\r\n\r\n\r\n\r\n\r\n
293	Which famous singer is known as the "King of Pop"?	easy	3	The famous singer known as the "King of Pop" is Michael Jackson. He was an iconic American singer, songwriter, and dancer who became one of the most influential and celebrated entertainers in the history of music. Michael Jackson's contributions to the music industry, his groundbreaking music videos, and his unparalleled stage performances earned him this esteemed title. Throughout his career, he released numerous chart-topping hits and albums, solidifying his legacy as the "King of Pop."\r\n\r\n\r\n\r\n\r\n
299	What is the name of the wooden sticks that percussionists use to hit drums?	easy	3	The name of the wooden sticks that percussionists use to hit drums is "drumsticks." Drumsticks are essential tools for drummers and are designed to produce various sounds and tones when striking different parts of the drum kit. They are typically made of wood, although there are also drumsticks made from synthetic materials like nylon or plastic. The shape and size of drumsticks can vary, allowing drummers to choose sticks that best suit their playing style and the type of music they perform.\r\n\r\n\r\n\r\n\r\n
306	Where was Bob Marley from?	easy	3	Bob Marley was from Jamaica. He was a Jamaican singer, songwriter, and musician who became an international icon for his contributions to reggae music. Born on February 6, 1945, in Nine Mile, Saint Ann Parish, Jamaica, Bob Marley's music and message of love, unity, and social justice resonated with people all over the world. He is considered one of the pioneers of reggae and is still celebrated as a cultural and musical legend, even long after his passing in 1981.\r\n\r\n\r\n\r\n\r\n
312	Celine Dion had a hit with My Heart Will Go On from the soundtrack of which movie?	easy	3	Celine Dion had a hit with "My Heart Will Go On" from the soundtrack of the movie "Titanic." The song was the theme song for the 1997 epic romance and disaster film "Titanic," directed by James Cameron and starring Leonardo DiCaprio and Kate Winslet. "My Heart Will Go On" became one of Celine Dion's most iconic and beloved songs, winning the Academy Award for Best Original Song and earning immense commercial success worldwide. The song's emotional and powerful vocals, combined with the film's tragic love story, made it a timeless classic and one of the best-selling singles of all time.\r\n\r\n\r\n\r\n\r\n
318	Which female singer is known for hits like "Rolling in the Deep" and "Hello"?	easy	3	The female singer known for hits like "Rolling in the Deep" and "Hello" is Adele. Adele is a British singer and songwriter who gained widespread recognition and critical acclaim for her powerful vocals, emotive lyrics, and soulful sound. "Rolling in the Deep" and "Hello" are two of her most successful and popular songs, both of which achieved massive commercial success and earned her several awards, including multiple Grammy Awards. Adele's remarkable talent and heartfelt performances have made her one of the best-selling music artists of all time.\r\n\r\n\r\n\r\n\r\n
326	What is the term for a group of four musicians playing together, typically in jazz or rock music?	easy	3	The term for a group of four musicians playing together, typically in jazz or rock music, is a "quartet." In jazz, a quartet usually consists of four instrumentalists, such as a saxophonist, pianist, bassist, and drummer. In rock music, a quartet often refers to a band with four members, commonly consisting of a vocalist, guitarist, bassist, and drummer. Quartets are a common and versatile configuration in music, allowing for a balanced and dynamic interplay between the instruments and musicians.\r\n\r\n\r\n\r\n\r\n
329	Which legendary guitarist is known for his iconic "Stairway to Heaven" solo?	medium	3	The legendary guitarist known for his iconic "Stairway to Heaven" solo is Jimmy Page. Jimmy Page was a founding member of the British rock band Led Zeppelin and is widely regarded as one of the greatest guitarists in rock history. His memorable solo in "Stairway to Heaven" showcases his exceptional skill and creativity, making it one of the most recognized and celebrated guitar solos of all time.\r\n\r\n\r\n\r\n\r\n
333	Which female artist sang about being a "Genie in a Bottle" in the late 1990s?	medium	3	The female artist who sang about being a "Genie in a Bottle" in the late 1990s is Christina Aguilera. The song "Genie in a Bottle" was released in 1999 and became a massive hit, catapulting Christina Aguilera to stardom. It was her debut single and showcased her powerful vocals and charismatic presence, making her one of the prominent figures in the pop music scene of that era.\r\n\r\n\r\n\r\n\r\n
338	Which song by Adele won the Grammy Award for Record of the Year in 2012?	medium	3	The song by Adele that won the Grammy Award for Record of the Year in 2012 is "Rolling in the Deep." The song was a massive commercial success and received critical acclaim for Adele's powerful vocals and the emotionally charged lyrics. It was part of her album "21" and played a significant role in establishing Adele as a global superstar in the music industry. "Rolling in the Deep" won multiple Grammy Awards and remains one of Adele's most iconic and beloved songs.\r\n\r\n\r\n\r\n\r\n
343	What is the name of the electronic dance music festival that originated in Belgium and has become a global phenomenon?	medium	3	The name of the electronic dance music festival that originated in Belgium and has become a global phenomenon is Tomorrowland. Tomorrowland is one of the world's largest and most famous music festivals, known for its impressive stage designs, diverse lineup of top EDM artists, and a massive gathering of music enthusiasts from all over the world. The festival takes place annually in Boom, Belgium, and has expanded to host international editions in different countries, making it a highly anticipated event in the EDM community.\r\n\r\n\r\n\r\n\r\n
348	Who won the Eurovision Song Contest in 2019 with the song "Arcade"?	medium	3	Duncan Laurence from the Netherlands won the Eurovision Song Contest in 2019 with the song "Arcade." "Arcade" was a haunting and emotional ballad written and performed by Duncan Laurence. The song resonated with audiences and the Eurovision voting juries, securing the Netherlands' fifth victory in the history of the competition. Duncan Laurence's heartfelt performance and powerful vocals captivated viewers, making "Arcade" a memorable and triumphant song in the Eurovision Song Contest.\r\n\r\n\r\n\r\n\r\n
374	"Sweet Home Alabama" is a classic song by which Southern rock band?	medium	3	"Sweet Home Alabama" is a classic song by the Southern rock band Lynyrd Skynyrd. The song was released in 1974 and has since become one of the band's most famous and enduring hits. It is celebrated for its catchy guitar riffs, memorable lyrics, and its ode to the state of Alabama. Lynyrd Skynyrd's contributions to the Southern rock genre have made them a beloved and influential band in the history of rock music.\r\n\r\n\r\n\r\n\r\n
378	In which decade did the music style of disco gain widespread popularity?	medium	3	The music style of disco gained widespread popularity in the 1970s. Disco music emerged in the early 1970s and quickly became a dominant genre during that decade. Its infectious dance beats, use of synthesizers and electronic instruments, and the influence of soul, funk, and pop elements made it a favorite among party-goers and clubbers of the time. Disco music reached its peak in the mid to late 1970s, with iconic artists and groups like Donna Summer, Bee Gees, ABBA, and Chic making significant contributions to the genre's success. While its popularity declined in the early 1980s, the impact of disco on music and pop culture continues to be felt to this day.\r\n\r\n\r\n\r\n\r\n
384	What singer adopted the nickname "Prince of Darkness"?	medium	3	The singer who adopted the nickname "Prince of Darkness" is Ozzy Osbourne. Ozzy Osbourne, also known as the "Godfather of Heavy Metal," is a British singer, songwriter, and television personality. He rose to fame as the lead vocalist of the iconic heavy metal band Black Sabbath before launching a successful solo career. Throughout his career, Ozzy has been known for his powerful and distinctive vocals, as well as his unique stage presence and persona. The nickname "Prince of Darkness" is a reference to his dark and often theatrical image, as well as his contributions to the heavy metal genre.\r\n\r\n\r\n\r\n\r\n
390	Which complex time signature is commonly associated with Frank Zappa composition "The Black Page"?	hard	3	"The Black Page" by Frank Zappa is indeed commonly associated with the time signature 13/16.\r\n\r\nThe piece primarily features a repeating pattern in 13/16 time, making it highly complex and challenging for both performers and listeners. It is an iconic composition in Zappa's repertoire, known for its intricate rhythms and technical demands, especially for drummers.
396	Which microtonal composer and musical theorist is known for developing the 43-tone scale and composing the piece "Mantra" for two pianos, electronics, and voices?	hard	3	\r\nThe microtonal composer and musical theorist known for developing the 43-tone scale and composing the piece "Mantra" for two pianos, electronics, and voices is Karlheinz Stockhausen.\r\n\r\nKarlheinz Stockhausen was a highly influential and innovative German composer known for his groundbreaking contributions to electronic music and his exploration of new and unconventional musical techniques. "Mantra," composed in 1970, is one of his significant works and is recognized for its complex structure, use of microtonal scales, and incorporation of electronic elements. Stockhausen's exploration of microtonal scales and electronic soundscapes expanded the boundaries of contemporary music and earned him a prominent place in the avant-garde music movement of the 20th century.
401	Which jazz saxophonist is often referred to as the "Bird" and was a central figure in the development of bebop?	hard	3	The jazz saxophonist who is often referred to as the "Bird" and was a central figure in the development of bebop is Charlie Parker. Charlie Parker, also known as "Bird," was an American jazz alto saxophonist and composer. He was a leading figure in the bebop movement during the 1940s, revolutionizing jazz with his innovative improvisation, complex harmonic language, and melodic phrasing. Parker's virtuosic playing and musical ideas had a profound impact on the evolution of jazz, influencing generations of musicians and becoming an enduring legend in the history of jazz music.\r\n\r\n\r\n\r\n\r\n
408	Which avant-garde composer, famous for his prepared piano pieces, composed "Sonatas and Interludes" for prepared piano?	hard	3	The avant-garde composer famous for his prepared piano pieces, including "Sonatas and Interludes," is John Cage. John Cage was an influential American composer, music theorist, writer, and artist, known for his experimental and groundbreaking approach to music composition.\r\n\r\n"Sonatas and Interludes" is one of Cage's most notable works for prepared piano. The piece was composed between 1946 and 1948 and consists of 16 sonatas and four interludes. In a prepared piano, various objects like screws, bolts, and pieces of rubber are strategically placed between the strings to alter the instrument's timbre and create unique and otherworldly sounds. Cage's innovative use of the prepared piano expanded the possibilities of piano music and continues to be a significant contribution to the contemporary classical music repertoire.
405	Which early 20th-century composer is known for his use of "tone clusters," a technique where the pianist plays a group of adjacent notes with the fist or forearm?	hard	3	\N
358	In which decade did the punk rock movement gain popularity?	medium	3	The punk rock movement gained popularity in the 1970s. It emerged as a response to the mainstream music of the time and was characterized by its raw and aggressive sound, anti-establishment ethos, and DIY (do-it-yourself) approach to music production and distribution. Punk rock bands like The Ramones, The Sex Pistols, The Clash, and others were at the forefront of the movement, challenging the norms of the music industry and society at large. Punk rock's impact extended beyond the 1970s, influencing various subgenres and becoming a significant cultural and musical movement that continues to resonate with audiences to this day.\r\n\r\n\r\n\r\n\r\n
362	"Superstition" and "Isnt She Lovely" are famous songs by which iconic musician?	medium	3	"Superstition" and "Isn't She Lovely" are famous songs by the iconic musician Stevie Wonder. Stevie Wonder, a highly influential singer, songwriter, and multi-instrumentalist, is known for his soulful voice, exceptional musical talent, and contributions to the realms of soul, R&B, and pop music. Both "Superstition" and "Isn't She Lovely" are among his many hits that have left a lasting impact on the music industry and continue to be cherished by audiences worldwide.\r\n\r\n\r\n\r\n\r\n
367	What is the name of the music streaming service founded by Daniel Ek and Martin Lorentzon?	medium	3	The music streaming service founded by Daniel Ek and Martin Lorentzon is called Spotify. Spotify is a popular digital music, podcast, and video streaming service that provides users with access to a vast library of songs and other audio content from various artists and genres. It was launched in 2008 and has since become one of the leading music streaming platforms globally, offering both free ad-supported and premium subscription-based services.\r\n\r\n\r\n\r\n\r\n
412	Which musical interval is often referred to as the "diabolus in musica" due to its dissonant and unstable sound?	hard	3	The musical interval often referred to as the "diabolus in musica" is the tritone. It earned this nickname during the medieval period because of its dissonant and unstable sound. The tritone consists of three whole tones, creating a tension that was once considered inappropriate and evil in certain musical contexts.\r\n\r\n\r\n\r\n\r\n
415	"Concierto de Aranjuez," one of the most famous classical guitar concertos, was composed by which Spanish composer?	hard	3	The classical guitar concerto "Concierto de Aranjuez" was composed by the Spanish composer Joaquín Rodrigo. This concerto, completed in 1939, is one of his most renowned and beloved works, capturing the essence of Spanish music and showcasing the expressive capabilities of the guitar within a rich orchestral setting.\r\n\r\n\r\n\r\n\r\n
420	Which influential American blues guitarist and singer was known as the "King of the Delta Blues" and had a significant impact on later rock and roll musicians?	hard	3	The influential American blues guitarist and singer known as the "King of the Delta Blues" and who had a significant impact on later rock and roll musicians is Robert Johnson. Born in the early 20th century, Robert Johnson's virtuoso guitar playing and emotive singing style left a lasting impression on the blues genre. Despite his tragically short life, his recordings and compositions became highly influential, inspiring countless musicians in the decades that followed, including many iconic figures in the rock and roll genre.\r\n\r\n\r\n\r\n\r\n
426	Which African-American blues singer, known as the "Empress of the Blues," recorded songs like "Nobody Knows You When You are Down and Out"?	hard	3	The African-American blues singer known as the "Empress of the Blues," who recorded songs like "Nobody Knows You When You're Down and Out," is Bessie Smith. Born in 1894, Bessie Smith was one of the most popular and influential blues singers of the 1920s and 1930s. Her powerful and emotive voice, combined with her ability to convey deep emotions, made her a celebrated figure in the blues genre. "Nobody Knows You When You're Down and Out" is one of her iconic recordings, showcasing her talent and leaving a lasting impact on the history of blues music.\r\n\r\n\r\n\r\n\r\n
430	What is the opposite force to gravity that keeps us from floating away?	easy	4	The opposite force to gravity that keeps us from floating away is called "gravity" itself. Gravity is a fundamental force of attraction between objects with mass. It pulls everything with mass towards each other, including us towards the Earth. This force counteracts the force of gravity pulling us upward, preventing us from floating away into space.\r\n\r\n\r\n\r\n\r\n
431	What gas do plants absorb from the air to make their own food?	easy	4	Plants absorb carbon dioxide (CO2) from the air to make their own food through a process called photosynthesis. During photosynthesis, plants use sunlight, water, and carbon dioxide to produce glucose (a form of sugar) and oxygen. This vital process sustains the plant's growth and releases oxygen into the atmosphere, which is essential for supporting life on Earth.\r\n\r\n\r\n\r\n\r\n
443	What gas do humans exhale when they breathe out?	easy	4	When humans breathe out, they exhale carbon dioxide (CO2). During the process of respiration, our bodies take in oxygen (O2) from the air, and this oxygen is used by cells to produce energy through metabolism. As a byproduct of this energy production, carbon dioxide is produced as waste. It is then transported back to the lungs and exhaled during the breathing process. Carbon dioxide is released into the atmosphere, where it is used by plants during photosynthesis to produce oxygen, creating a vital cycle that sustains life on Earth.\r\n\r\n\r\n\r\n\r\n
440	What do we call animals that only eat plants?	easy	4	Animals that only eat plants are called herbivores. Herbivores are a type of consumer in the food chain that primarily feed on plant material such as leaves, stems, fruits, seeds, and other plant parts. They have specialized digestive systems adapted to extract nutrients from plant matter and often play a crucial role in ecosystems by influencing plant populations and maintaining ecological balance. Some common examples of herbivores include cows, deer, rabbits, and many species of insects.\r\n\r\n\r\n\r\n\r\n
450	What is the term for the process of water vapor turning back into liquid water?	easy	4	The term for the process of water vapor turning back into liquid water is "condensation." Condensation occurs when water vapor in the atmosphere loses heat energy and transforms into tiny water droplets or ice crystals, depending on the temperature. This process is essential in the water cycle, as it leads to the formation of clouds and plays a significant role in weather patterns. When condensation occurs on surfaces like windows or cold beverage containers, it is commonly referred to as "dew" or "frost," respectively. Condensation is the opposite of evaporation, where liquid water changes into water vapor.\r\n\r\n\r\n\r\n\r\n
457	What do we call the glowing ball of gas in space that planets orbit around?	easy	4	The glowing ball of gas in space that planets orbit around is called a "star." Stars are massive, luminous celestial objects primarily composed of hydrogen and helium, which undergo nuclear fusion in their cores, producing light and heat. The Sun, for example, is the star at the center of our solar system, and planets, including Earth, orbit around it. Stars come in various sizes, colors, and stages of their life cycles, and they play a crucial role in the formation and evolution of galaxies and the universe as a whole.\r\n\r\n\r\n\r\n\r\n
461	What is the most abundant gas in the Earth's atmosphere?	easy	4	The most abundant gas in the Earth's atmosphere is nitrogen (N2). Nitrogen makes up approximately 78 percent of the Earth's atmosphere by volume. The second most abundant gas is oxygen (O2), which accounts for about 21 percent of the atmosphere. The remaining 1 percent is composed of trace gases, such as argon, carbon dioxide, and others. Nitrogen is an essential component of the atmosphere and plays a crucial role in supporting life on Earth. It is involved in various biological processes and is a critical element in the formation of proteins and DNA in living organisms.\r\n\r\n\r\n\r\n\r\n
468	Which is the largest land animal?	easy	4	The largest land animal is the African elephant (Loxodonta africana and Loxodonta cyclotis). These magnificent creatures are known for their incredible size and strength. Adult male elephants, also known as bulls, can weigh up to 6 to 7 tons (12,000 to 14,000 pounds) and stand around 10 to 13 feet (3 to 4 meters) tall at the shoulder. Female elephants, known as cows, are slightly smaller but still very large compared to most other land animals.
217	What is the largest island country in the world by population?	medium	2	The largest island country in the world by population is Indonesia. Indonesia is an archipelago located in Southeast Asia, consisting of more than 17,000 islands, with Java being its most populous island. As of my last update in September 2021, Indonesia had a population of over 270 million people, making it the fourth most populous country in the world after China, India, and the United States. Its diverse culture, rich history, and abundant natural beauty attract visitors from around the globe.\r\n\r\n\r\n\r\n\r\n
481	What is the medical term for the voice box?	medium	4	The medical term for the voice box is the larynx. The larynx is a part of the respiratory system located in the neck region. It plays a crucial role in producing sound and protecting the airway during swallowing. The vocal cords, two folds of mucous membrane within the larynx, vibrate and create sound when air passes over them. By controlling the tension and position of the vocal cords, humans can produce various vocal sounds, enabling speech and singing.\r\n\r\n\r\n\r\n\r\n
485	Which type of blood vessel carries blood away from the heart?	medium	4	The type of blood vessel that carries blood away from the heart is an artery. Arteries are thick-walled and muscular blood vessels that transport oxygenated blood from the heart to various parts of the body. They play a crucial role in maintaining the circulatory system and ensuring proper distribution of oxygen and nutrients to tissues and organs.\r\n\r\n\r\n\r\n\r\n
491	What type of rock is formed from compressed and cemented layers of sediment?	medium	4	The type of rock formed from compressed and cemented layers of sediment is known as "sedimentary rock." Sedimentary rocks are created over time as sediment accumulates and undergoes pressure and cementation, resulting in a solid rock formation. These rocks often contain valuable information about past environments and historical events due to the layers preserving different eras' sedimentary deposits.\r\n\r\n\r\n\r\n\r\n
498	Which blood vessels have valves to prevent the backward flow of blood?	medium	4	Veins are the blood vessels that have valves to prevent the backward flow of blood. These valves are one-way flaps that open and close in response to the blood flow and pressure. Their primary function is to ensure that blood flows in one direction, toward the heart, and prevent it from flowing backward or pooling in the veins.\r\n\r\nValves are particularly important in the veins of the lower extremities, as they help counteract the force of gravity when blood is returning to the heart from the legs. When the muscles surrounding the veins contract (e.g., during walking or exercise), they help squeeze the blood upward, and the valves prevent it from flowing back down, ensuring efficient circulation and preventing venous insufficiency.
505	Which animal group does a penguin belong to?	medium	4	Penguins belong to the animal group "birds." Penguins are a group of flightless birds that are highly adapted to life in the water. They are known for their distinctive black and white plumage, which helps camouflage them in their marine environments. Penguins are excellent swimmers and rely on their flippers to navigate through the water with remarkable agility.
508	What is the fatty substance that insulates and speeds up the transmission of nerve impulses?	medium	4	The fatty substance that insulates and speeds up the transmission of nerve impulses is called "myelin." Myelin is a lipid-rich material that forms a protective sheath around the axons of certain nerve cells in the nervous system. This myelin sheath acts as an electrical insulator, allowing nerve impulses (action potentials) to be transmitted more efficiently and rapidly along the nerve fibers.
511	What is the chemical symbol for sodium?	medium	4	The chemical symbol for sodium is "Na." Sodium is a soft, silvery-white metal that is highly reactive and is an essential element for many biological processes. It is commonly found in salts and plays a crucial role in maintaining fluid balance and transmitting nerve impulses in the human body.\r\n\r\n\r\n\r\n\r\n
517	What term refers to the male reproductive part of a flower, containing the pollen-producing structures?	medium	4	The term that refers to the male reproductive part of a flower, containing the pollen-producing structures, is the "stamen." The stamen is one of the essential components of a flower's reproductive system and is responsible for producing pollen, which contains the male gametes (sperm cells). It typically consists of two main parts: the filament, a slender stalk that supports the anther, and the anther, a sac-like structure where pollen grains are produced and stored. When pollination occurs, the pollen from the stamen may be transferred to the female reproductive part of another flower (the pistil), leading to fertilization and the formation of seeds.\r\n\r\n\r\n\r\n\r\n
524	What is the chemical symbol for nitrogen?	medium	4	The chemical symbol for nitrogen is "N." Nitrogen is a non-metallic element and is the most abundant gas in the Earth's atmosphere, making up about 78 percent of the air we breathe. It is an essential element for life, playing a vital role in the composition of amino acids, proteins, and nucleic acids (DNA and RNA). Nitrogen is also crucial for the growth and development of plants, making it a critical nutrient in agriculture and ecosystem dynamics.
528	Which element has the highest electronegativity value on the Pauling scale?	hard	4	Fluorine (F) has the highest electronegativity value on the Pauling scale. The electronegativity of an element is a measure of its ability to attract and hold electrons when it forms chemical bonds with other atoms. Fluorine, being the most electronegative element, has a Pauling electronegativity value of 3.98. This high electronegativity makes fluorine very reactive and capable of forming strong bonds with other elements, often resulting in compounds with distinct properties, such as fluorides.
532	What is the name of the protein responsible for oxygen transport in red blood cells?	hard	4	\r\nThe name of the protein responsible for oxygen transport in red blood cells is "hemoglobin." Hemoglobin is a complex protein found in red blood cells (erythrocytes) and is essential for the transportation of oxygen from the lungs to various tissues and organs throughout the body.\r\n\r\nHemoglobin has a unique structure that allows it to bind to oxygen in the lungs, where oxygen concentrations are high, and release it in areas with lower oxygen concentrations, such as tissues and muscles
218	The city of Jerusalem is located in which region of the world?	medium	2	The city of Jerusalem is located in the region known as the Middle East. Specifically, it is situated in the eastern part of the Mediterranean, between the Mediterranean Sea and the Dead Sea. Jerusalem is one of the oldest cities in the world and holds great significance in several major religions, including Judaism, Christianity, and Islam. It is a city with a complex history and is considered a holy site and a focal point of religious pilgrimage for many believers.\r\n\r\n\r\n\r\n\r\n
542	What type of rock is formed from the cooling and solidification of lava on the Earths surface?	hard	4	The type of rock that is formed from the cooling and solidification of lava on the Earth's surface is called "extrusive igneous rock." Extrusive igneous rocks are formed when lava, which is molten rock material that reaches the Earth's surface during volcanic eruptions, cools rapidly and solidifies.\r\n\r\nAs lava emerges onto the surface, it is exposed to lower temperatures and atmospheric pressure, leading to relatively quick cooling. This rapid cooling prevents the growth of large mineral crystals, resulting in fine-grained or glassy textures in the extrusive igneous rocks. Examples of extrusive igneous rocks include basalt, andesite, and rhyolite, each with distinctive mineral compositions and appearances.
545	Which of Newtons laws of motion explains the relationship between an object mass, acceleration, and the applied force?	hard	4	Newton's second law of motion explains the relationship between an object's mass, acceleration, and the applied force. It states that the acceleration of an object is directly proportional to the net force acting on it and inversely proportional to its mass. In simpler terms, the greater the force applied to an object, the greater its acceleration, and the heavier the object, the smaller its acceleration for a given force. This law is mathematically expressed as F = ma, where F is the net force, m is the mass of the object, and a is its acceleration.\r\n\r\n\r\n\r\n\r\n
548	Which type of isomerism occurs when two molecules have the same molecular formula and the same connectivity of atoms but differ in the spatial arrangement of their atoms?	hard	4	The type of isomerism that occurs when two molecules have the same molecular formula and the same connectivity of atoms but differ in the spatial arrangement of their atoms is called "stereoisomerism."\r\n\r\nStereoisomers are a specific type of isomers that have identical chemical bonds but differ in how the atoms are arranged in three-dimensional space.
1	What year was the Declaration of Independence signed?	easy	1	The Declaration of Independence was signed on July 4, 1776. This historic document marked the formal separation of the thirteen American colonies from Great Britain and laid the foundation for the United States of America.
2	Which famous leader was known as the "Father of the Nation"?	easy	1	\r\nThe famous leader known as the "Father of the Nation" is Mahatma Gandhi. He was a key figure in India's struggle for independence from British rule and is renowned for his nonviolent civil disobedience and advocacy of peaceful protests. Gandhi's leadership and philosophy inspired many movements for civil rights and freedom across the world.
4	Who was the first President of the United States?	medium	1	The first President of the United States was George Washington. He served as the nation's inaugural president from April 30, 1789, to March 4, 1797. George Washington played a crucial role in the early formation of the United States and is often referred to as the "Father of His Country" for his leadership during the American Revolutionary War and his contributions to the establishment of the new republic.
5	Which river is the longest in the world?	easy	2	The longest river in the world is the Nile River. It stretches approximately 6,650 kilometers (4,130 miles) through northeastern Africa, flowing through multiple countries, including Egypt, Sudan, South Sudan, Ethiopia, Uganda, Congo-Kinshasa, Kenya, Rwanda, Burundi, and Tanzania. The Nile has played a significant role in the history, culture, and livelihood of the people in the region for thousands of years.
6	What is the capital city of Japan?	easy	2	\r\nThe capital city of Japan is Tokyo. It is the largest and most populous city in Japan, serving as the political, economic, and cultural center of the country. Tokyo is renowned for its modern skyline, technological advancements, rich cultural heritage, and vibrant urban life.
7	Which mountain is the highest in Africa?	medium	2	\r\nThe highest mountain in Africa is Mount Kilimanjaro. It is a volcanic mountain located in Tanzania and stands at an impressive height of approximately 5,895 meters (19,341 feet) above sea level. Kilimanjaro is not only the tallest mountain in Africa but also the highest freestanding mountain in the world. Its snow-capped peak and diverse ecosystems make it a popular destination for trekkers and adventurers from around the globe.
8	In which country can you find the ancient city of Machu Picchu?	medium	2	The ancient city of Machu Picchu can be found in Peru. It is one of the most iconic and well-preserved archaeological sites in the world, situated high in the Andes Mountains. Machu Picchu was built by the Inca civilization in the 15th century and is renowned for its remarkable architecture and stunning mountainous backdrop. Today, it is a UNESCO World Heritage Site and a popular tourist destination, attracting visitors from all over the world to marvel at its historical significance and beauty.
20	What Year Did The Second World War End?	easy	1	The Second World War ended on September 2, 1945, with the formal surrender of Japan. This surrender was signed on the deck of the USS Missouri in Tokyo Bay, effectively bringing an end to the war. The war had involved numerous countries and resulted in significant devastation and loss of life, making it one of the deadliest conflicts in history.
552	What term describes the process by which a rock changes form or mineral content due to exposure to high temperature and pressure within the Earth crust?	hard	4	The term that describes the process by which a rock changes form or mineral content due to exposure to high temperature and pressure within the Earth's crust is "metamorphism."\r\n\r\nMetamorphism is a geological process that involves the transformation of pre-existing rocks (igneous, sedimentary, or other metamorphic rocks) into new rocks under the influence of elevated temperature, pressure, and chemically active fluids. These changes typically occur deep within the Earth's crust, usually at depths where the temperature and pressure conditions are significantly different from those at the Earth's surface.
25	Which Ancient City Was Famously Buried Under Volcanic Ash In 79 AD?	easy	1	The ancient city that was famously buried under volcanic ash in 79 AD is Pompeii. Pompeii was an ancient Roman city located near modern-day Naples in Italy. In 79 AD, Mount Vesuvius, a nearby volcano, erupted and unleashed a catastrophic volcanic eruption that buried Pompeii and its neighboring city of Herculaneum under layers of volcanic ash and pumice. The city's destruction preserved it remarkably well, allowing archaeologists to uncover and study the remarkably well-preserved remains, providing valuable insights into the daily life and culture of the ancient Roman civilization.\r\n\r\n\r\n\r\n\r\n
26	Who Was The Leader Of The Nazi Party During World War II?	easy	1	\r\nThe leader of the Nazi Party during World War II was Adolf Hitler. He was born in Austria and rose to power in Germany, becoming Chancellor in 1933 and later the dictator of Nazi Germany. Hitler's leadership and aggressive expansionist policies led to the outbreak of World War II in 1939. During his regime, the Nazi Party implemented horrific acts, including the Holocaust, resulting in the genocide of millions of Jews and other minority groups. After the defeat of Nazi Germany in 1945, Hitler committed suicide in his underground bunker in Berlin.
27	What Was The Name Of The Ancient Greek Philosopher Who Was The Teacher Of Alexander The Great?	easy	1	\r\nThe ancient Greek philosopher who was the teacher of Alexander the Great was Aristotle. Aristotle was a renowned philosopher, scientist, and polymath who founded the Peripatetic school of philosophy. He was born in 384 BCE in Stagira, a city in the kingdom of Macedon. At the age of 17, Aristotle became a student of Plato at Plato's Academy in Athens. Later, he became the tutor of Alexander the Great, who would go on to become one of history's most successful military commanders and conquer much of the known world. Aristotle's teachings had a profound influence on Alexander's education and thinking, shaping his views on various subjects, including philosophy, ethics, and politics.
28	Who Was The Egyptian Queen Famous For Her Beauty And Ruled Around 1300 BC?	easy	1	\r\nThe Egyptian queen famous for her beauty and who ruled around 1300 BC was Queen Nefertiti. She was the wife of Pharaoh Akhenaten and served as the Great Royal Wife of Egypt during the 18th dynasty. Nefertiti is renowned for her stunning beauty and is often depicted in ancient Egyptian art with an elongated neck and a distinct headdress known as the "Nefertiti crown." She played a significant role during her husband's reign and is believed to have wielded considerable influence and power alongside him. Nefertiti's bust, discovered in 1912, has become one of the most iconic symbols of ancient Egypt and is exhibited in the Neues Museum in Berlin, Germany.
29	What Was The Name Of The Event When American Colonists Dumped British Tea Into The Boston Harbor In Protest?	easy	1	\r\nThe event when American colonists dumped British tea into the Boston Harbor in protest was known as the "Boston Tea Party." It occurred on December 16, 1773, as a response to the British Parliament's imposition of the Tea Act, which granted the British East India Company a monopoly on the tea trade and allowed them to sell tea directly to the colonies without paying certain taxes. In defiance of this act and the perceived violation of their rights, a group of American colonists, disguised as Native Americans, boarded three British ships and dumped 342 chests of tea into the harbor. The Boston Tea Party became a significant act of protest and a key event leading up to the American Revolution
31	Which Ancient Civilization Built The Machu Picchu Citadel In Peru?	easy	1	\r\nThe ancient civilization that built the Machu Picchu citadel in Peru was the Inca civilization. Machu Picchu is believed to have been constructed in the 15th century during the reign of the Inca emperor Pachacuti. The site served as a royal estate and religious retreat for the Inca rulers. It is renowned for its remarkable architecture and engineering, as well as its stunning location high in the Andes Mountains. The Inca civilization is known for its impressive stonework and intricate construction techniques, and Machu Picchu stands as a testament to their advanced civilization and cultural achievements.
32	Who Was The Famous Woman Who Refused To Give Up Her Seat On A Bus, Sparking The Civil Rights Movement In The US?	easy	1	The famous woman who refused to give up her seat on a bus, sparking the Civil Rights Movement in the US, was Rosa Parks. On December 1, 1955, Rosa Parks, an African American woman, was arrested in Montgomery, Alabama, for refusing to give up her seat to a white passenger on a segregated city bus. Her act of civil disobedience became a pivotal moment in the Civil Rights Movement, leading to the Montgomery Bus Boycott, a significant protest against racial segregation on public transportation. Rosa Parks' bravery and determination in the face of injustice inspired countless others and brought attention to the fight for civil rights and racial equality in the United States.
33	What Was The Name Of The Famous Ancient Roman Leader Who Was Assassinated On The Ides Of March?	easy	1	\r\nThe famous ancient Roman leader who was assassinated on the Ides of March was Julius Caesar. He was a prominent military general, statesman, and dictator of the Roman Republic. On March 15, 44 BCE, a group of Roman senators, including his close associates, stabbed Julius Caesar to death in a conspiracy to prevent what they perceived as his increasing power and ambitions. The assassination of Julius Caesar marked a turning point in Roman history and eventually led to the downfall of the Roman Republic, paving the way for the rise of the Roman Empire under his adopted heir and grandnephew, Augustus.
34	Which War Saw The United States And The Soviet Union Engaged In A Tense Political And Military Standoff?	easy	1	The war that saw the United States and the Soviet Union engaged in a tense political and military standoff was the Cold War. The Cold War was a period of geopolitical tension and ideological rivalry between the two superpowers that lasted from the aftermath of World War II in the late 1940s until the dissolution of the Soviet Union in 1991. Although it did not involve direct military conflict between the United States and the Soviet Union, the Cold War saw intense competition, arms race, and proxy wars fought in different regions around the world. The term "cold" refers to the absence of open warfare between the two nuclear-armed superpowers, even though there were numerous moments of heightened tension and crisis during the decades-long confrontation.\r\n\r\n\r\n\r\n\r\n
47	In which year did World War I begin?	medium	1	World War I began in 1914. The war started on July 28, 1914, with the assassination of Archduke Franz Ferdinand of Austria-Hungary in Sarajevo. This event triggered a series of diplomatic and military escalations among the European powers and their alliances, ultimately leading to the outbreak of the Great War. The conflict involved many of the world's major powers and lasted until November 11, 1918, when an armistice was signed, bringing an end to the hostilities. World War I had a profound impact on the course of history and set the stage for significant geopolitical changes in the 20th century.\r\n\r\n\r\n\r\n\r\n
36	Which Ancient Emperor Created An Empire Going From Macedonia To Egypt And From Greece To India?	easy	1	\r\nThe ancient emperor who created an empire stretching from Macedonia to Egypt and from Greece to India was Alexander the Great. Born in 356 BC in Pella, the capital of the Kingdom of Macedon, Alexander became king at the age of 20 after the assassination of his father, King Philip II of Macedon. He embarked on a series of military campaigns that are collectively known as the "Alexander's Conquests" or "Alexander's Empire."\r\n\r\nBetween 334 BC and 323 BC, Alexander led his army in a series of successful military campaigns, conquering the Persian Empire, Egypt, and reaching as far east as the borders of India. He is considered one of the most successful military commanders in history and is renowned for his tactical brilliance and ability to inspire his troops. However, Alexander's vast empire began to break apart after his death in 323 BC, leading to the formation of separate Hellenistic kingdoms that emerged in the wake of his conquests.
37	Who Was The First Woman To Win A Nobel Prize?	easy	1	\r\nThe first woman to win a Nobel Prize was Marie Curie. She was a pioneering physicist and chemist who made groundbreaking contributions to the fields of radioactivity and nuclear physics. Marie Curie, born in 1867 in Warsaw (now in Poland), became the first woman to be awarded a Nobel Prize in 1903 when she, along with her husband Pierre Curie and physicist Henri Becquerel, received the Nobel Prize in Physics for their research on radioactivity.
38	Which Nuclear Accident Happened On Saturday 26 April 1986?	easy	1	The nuclear accident that happened on Saturday, April 26, 1986, was the Chernobyl nuclear disaster. It occurred at the Chernobyl Nuclear Power Plant in Pripyat, in the former Soviet Union (now Ukraine). During a late-night safety test, an explosion and subsequent fire in Reactor No. 4 of the power plant released a massive amount of radioactive contamination into the atmosphere.\r\n\r\nThe Chernobyl disaster is considered one of the worst nuclear accidents in history and had severe consequences for the surrounding region and beyond. The immediate area was evacuated, and the disaster resulted in numerous casualties, widespread environmental contamination, and long-term health effects on people living in the affected areas. It also led to significant changes in nuclear safety regulations and practices worldwide.
39	Which Country Was Gandhi From?	easy	1	Mahatma Gandhi was from India. He was born on October 2, 1869, in Porbandar, a town in the present-day state of Gujarat, India. Gandhi was a prominent leader in India's struggle for independence from British rule and is widely regarded as the Father of the Nation in India for his nonviolent civil disobedience and leadership in achieving India's independence in 1947. His principles of nonviolence, civil rights, and social justice have had a profound impact not only in India but also on movements for civil rights and freedom across the world.
40	Which Country Did Hitler Invade On The 1st Of September 1939?	easy	1	\r\nOn the 1st of September 1939, Adolf Hitler's Germany invaded Poland. This invasion marked the beginning of World War II. The German forces launched a coordinated attack on multiple fronts, employing both ground and air forces in what became known as the Blitzkrieg, a rapid and overwhelming military strategy. The invasion of Poland prompted Britain and France to declare war on Germany, leading to the global conflict that lasted until 1945 and involved many nations across the world.
41	Which Country Was Fidel Castro The Leader Of?	easy	1	Fidel Castro was the leader of Cuba. He became the Prime Minister of Cuba in 1959 after the success of the Cuban Revolution, which overthrew the authoritarian regime of Fulgencio Batista. Later, in 1976, Castro became the President of the Council of State and the President of the Council of Ministers, effectively holding both the highest executive and political offices in Cuba.\r\n\r\nCastro's leadership marked a significant period of political and social change in Cuba. His government implemented socialist policies, nationalized industries, and established close ties with the Soviet Union, leading to strained relations with the United States during the Cold War. Fidel Castro remained in power until his retirement in 2008, after which his brother Raul Castro succeeded him as the leader of Cuba. Fidel Castro passed away on November 25, 2016.
43	What Was The First Country To Give Women The Right To Vote?	easy	1	The first country to give women the right to vote was New Zealand. On September 19, 1893, New Zealand passed the Electoral Act of 1893, becoming the first self-governing nation in the world to grant women the right to vote in parliamentary elections. This significant achievement marked a major milestone in the fight for women's suffrage and set an inspiring example for other countries to follow. Over the years, women's suffrage movements around the world gained momentum, leading to the gradual expansion of voting rights for women in many countries.
44	In Which Country Did The Battle Of The Somme Take Place?	easy	1	\r\nThe Battle of the Somme took place in France. It was one of the largest and most infamous battles of World War I and occurred along the banks of the River Somme in the region of Picardy, France. The battle commenced on July 1, 1916, and lasted until November 18, 1916. It was a joint offensive launched by British and French forces against the German Army on the Western Front.\r\n\r\nThe Battle of the Somme resulted in extensive casualties and loss of life on both sides. It is remembered for its intense and protracted fighting, the introduction of new military technologies such as tanks, and the tragic loss of life in futile frontal assaults. The battle had a profound impact on the war's outcome and left a lasting legacy in the collective memory of the nations involved.
45	Who was the legendary founder of Rome?	medium	1	\r\nThe legendary founder of Rome, according to Roman mythology and tradition, was Romulus. Romulus and his twin brother Remus were said to be the sons of the god Mars (or Ares in Greek mythology) and the Vestal Virgin Rhea Silvia. The brothers were abandoned in the wilderness as infants but were found and raised by a she-wolf.\r\n\r\nAs they grew older, Romulus and Remus decided to establish a city on the banks of the Tiber River. However, a dispute arose between them over the city's location, leading to Romulus killing Remus and proceeding to found the city that became Rome. This mythical story of Romulus and Remus is an essential part of Rome's foundation myth and is depicted in various works of art and literature throughout history.
46	Who wrote the "Declaration of Independence" for the United States?	medium	1	\r\nThe "Declaration of Independence" for the United States was primarily written by Thomas Jefferson. He was one of the Founding Fathers of the United States and was selected by the Second Continental Congress to lead the committee responsible for drafting the Declaration.\r\n\r\nThomas Jefferson's eloquent writing and philosophical insights played a crucial role in shaping the document, which was adopted on July 4, 1776. The Declaration of Independence declared the thirteen American colonies' independence from British rule and laid out the principles of individual rights, equality, and self-government that have since become fundamental to the United States' identity and values.
48	Which ancient civilization was known for its contributions to mathematics, including the concept of "zero"?	medium	1	The ancient civilization known for its contributions to mathematics, including the concept of "zero," was the ancient Indian civilization. Indian mathematicians made significant advancements in the field of mathematics, particularly during the classical period between the 5th and 12th centuries CE.\r\n\r\nThe concept of "zero" as a numerical digit was first developed by Indian mathematicians around the 5th century CE. It was initially represented by a dot or a small circle, and its usage revolutionized arithmetic and numeral systems.\r\n\r\nIndian mathematicians also made remarkable progress in algebra, geometry, trigonometry, and arithmetic. Their works, including those by scholars like Aryabhata, Brahmagupta, and Bhaskara, laid the foundation for many mathematical concepts that are still in use today. The knowledge of Indian mathematics spread to other parts of the world, influencing the development of mathematics in the Middle East and Europe during the medieval period.
51	Which treaty officially ended World War I in 1919?	medium	1	\r\nThe treaty that officially ended World War I in 1919 was the Treaty of Versailles. It was signed on June 28, 1919, in the Hall of Mirrors at the Palace of Versailles in France. The treaty was primarily between the Allied Powers (including France, the United Kingdom, the United States, and others) and Germany. It imposed significant penalties and reparations on Germany for its role in the war and led to territorial changes, economic repercussions, and the establishment of the League of Nations, an international organization aimed at promoting peace and cooperation among nations.
52	Which ancient civilization is credited with the invention of paper?	medium	1	The ancient civilization credited with the invention of paper is Ancient China. Papermaking is believed to have originated in China during the Han Dynasty (around 2nd century BCE). The invention of paper revolutionized writing and communication, replacing more cumbersome materials like bamboo and silk scrolls. The Chinese method of papermaking eventually spread to other parts of the world, leading to the widespread use of paper in various cultures and civilizations.
53	In which year did the Berlin Wall fall, leading to the reunification of Germany?	medium	1	\r\nThe Berlin Wall fell on November 9, 1989. This event marked a significant turning point in the history of Germany and the Cold War. The fall of the Berlin Wall led to the eventual reunification of East and West Germany, which took place on October 3, 1990. The reunification brought an end to the division that had separated the two German states since the end of World War II and signified a crucial moment in the collapse of the Eastern Bloc and the end of the Cold War.
9	Which Great Wonder Of The Ancient World Still Stands Today?	easy	1	\r\nThe Great Pyramid of Giza is the only Great Wonder of the Ancient World that still stands today. It is located on the Giza Plateau in Egypt and is part of a complex that includes two other pyramids and the Great Sphinx. The Great Pyramid of Giza was built during the reign of the Pharaoh Khufu (also known as Cheops) in the 26th century BCE and is the oldest and largest of the three pyramids on the Giza Plateau. Despite the passage of thousands of years, the Great Pyramid has remained remarkably intact and continues to be one of the most iconic and enduring symbols of ancient Egypt.
10	Who Was The Famous Actor That Became The Governor Of California In 2003?	easy	1	The famous actor who became the Governor of California in 2003 was Arnold Schwarzenegger. Arnold Schwarzenegger is an Austrian-American actor, bodybuilder, and former professional bodybuilder who achieved worldwide fame for his roles in blockbuster action films such as "The Terminator" series, "Predator," and "Total Recall," among others. He entered politics and was elected as the Governor of California in a special recall election in 2003, replacing Governor Gray Davis. Schwarzenegger served as the Governor of California from November 17, 2003, to January 3, 2011.
11	Jack The Ripper Is The Name Given To An Unidentified Serial Killer That Terrorized What City In 1888?	easy	1	Jack the Ripper is the name given to an unidentified serial killer who terrorized the Whitechapel district of London, England, in 1888. The killer is believed to have been responsible for the brutal murders of at least five women, all of whom were prostitutes. The case remains one of the most infamous and unsolved serial killer mysteries in history, and Jack the Ripper's true identity has never been definitively established. The name "Jack the Ripper" originated from a series of letters sent to the police and media during the time of the murders, signed with that name.
13	What Ship Sank In 1912 And Has A Famous Movie?	easy	1	The ship that sank in 1912 and has a famous movie is the RMS Titanic. The Titanic was a British passenger liner that struck an iceberg and sank on its maiden voyage from Southampton, England, to New York City, USA, on April 15, 1912. The disaster resulted in the loss of over 1,500 lives, making it one of the deadliest peacetime maritime tragedies in history.\r\n\r\nThe sinking of the Titanic has captured the public's imagination for over a century and has been the subject of numerous books, documentaries, and films. One of the most famous movies about the Titanic is James Cameron's 1997 epic romance and disaster film titled "Titanic," which became a massive box office success and won numerous awards, including multiple Oscars.
14	Who Painted The 15th-Century Mural Known As The "Last Supper"?	easy	1	\r\nThe 15th-century mural known as "The Last Supper" was painted by the Italian Renaissance artist Leonardo da Vinci. The painting depicts the final meal that Jesus Christ shared with his apostles before his crucifixion, as described in the New Testament of the Bible. Leonardo da Vinci's masterpiece is renowned for its exquisite detail, composition, and portrayal of emotions, and it remains one of the most famous and iconic works of art in history. The mural is located in the Convent of Santa Maria delle Grazie in Milan, Italy.
15	Who Was The First Man To Set Foot On The Moon?	easy	1	\r\nThe first man to set foot on the Moon was Neil Armstrong. On July 20, 1969, as the commander of the Apollo 11 mission, Neil Armstrong became the first human to step onto the lunar surface, uttering the iconic words, "That's one small step for man, one giant leap for mankind." This historic moment marked a significant achievement in human space exploration and solidified the United States' position in the space race during the Cold War era.
16	Who Was The First African American To Be Elected President Of The United States?	easy	1	The first African American to be elected President of the United States was Barack Obama. He was elected as the 44th President of the United States in the 2008 presidential election and took office on January 20, 2009. Barack Obama's election was a historic milestone in American history, as he became the first Black president and broke barriers in the country's political landscape. He served two terms as President, being re-elected for a second term in the 2012 presidential election, and his presidency is known for several significant policy changes and initiatives during his time in office.
17	What Does The Zip Stand For, In The American Zip Code?	easy	1	In the American ZIP code, "ZIP" stands for "Zone Improvement Plan." The ZIP code system was introduced by the United States Postal Service (USPS) in 1963 to improve the efficiency of mail delivery. It is a numerical code used to identify specific geographic regions in the United States, allowing postal workers to sort and route mail more effectively. ZIP codes typically consist of five digits, with the option to add an additional four digits (ZIP+4) for even more precise location identification.
18	In Which Country Are The Ancient Pyramids Located?	easy	1	\r\nThe ancient pyramids are located in Egypt. The most famous and well-known pyramids are the Egyptian pyramids, which were built during the Old Kingdom period of ancient Egyptian history. These pyramids served as tombs for the pharaohs and were constructed to house their bodies and belongings for the afterlife. The most iconic among them are the Great Pyramid of Giza, the Pyramid of Khafre, and the Pyramid of Menkaure, located on the Giza Plateau near Cairo, Egypt. The Egyptian pyramids are considered some of the most impressive architectural achievements in history and continue to be major tourist attractions and symbols of ancient Egyptian civilization.
19	Where Did The Olympic Games Originate?	easy	1	The Olympic Games originated in ancient Greece. The ancient Olympic Games were held in Olympia, a sanctuary dedicated to the god Zeus, in the western Peloponnese region of Greece. The games are believed to have begun in the 8th century BCE and continued until the 4th century CE, making them one of the longest-running and most significant athletic events in history.\r\n\r\nThe ancient Olympic Games were held every four years and were a major cultural and religious festival for the ancient Greeks. They included various athletic competitions, such as running, wrestling, chariot racing, and discus throwing, among others. The modern Olympic Games, as we know them today, were revived in 1896 and have since become the world's most prominent international sporting event, featuring athletes from all over the globe competing in a wide range of sports.
21	Who Was The Famous Leader Of The Civil Rights Movement In The United States Who Advocated For Nonviolent Protest?	easy	1	The famous leader of the Civil Rights Movement in the United States who advocated for nonviolent protest was Martin Luther King Jr. He was a prominent civil rights activist and a Baptist minister who played a crucial role in advocating for racial equality and justice. Martin Luther King Jr. is best known for his leadership in organizing nonviolent protests, including the Montgomery Bus Boycott, the Birmingham Campaign, and the March on Washington, where he delivered his iconic "I Have a Dream" speech. His tireless efforts and commitment to peaceful civil disobedience significantly contributed to the advancement of civil rights for African Americans and the passage of key legislation, such as the Civil Rights Act of 1964 and the Voting Rights Act of 1965.
23	What Was The Name Of The Conflict Between North And South In The United States That Took Place From 1861 To 1865?	easy	1	The conflict between the North and South in the United States that took place from 1861 to 1865 is known as the American Civil War. The war was fought primarily over issues of slavery, states' rights, and the preservation of the Union. The Northern states, known as the Union, were led by President Abraham Lincoln, while the Southern states, known as the Confederacy, sought to secede and form their own independent nation. The Civil War resulted in immense casualties and destruction, but it also led to the abolition of slavery and the restoration of the Union under a single federal government.
54	Who was the leader of the Mongol Empire during its peak of expansion?	medium	1	\r\nThe leader of the Mongol Empire during its peak of expansion was Genghis Khan. Born as Temüjin in the early 12th century, he united the Mongol tribes through military conquest and strategic alliances, eventually establishing the vast Mongol Empire. Genghis Khan's leadership and military prowess allowed the empire to expand rapidly, conquering a vast territory stretching from present-day China and Korea to parts of Eastern Europe and the Middle East. Under his rule, the Mongol Empire became the largest contiguous empire in history, and his successors continued the expansion even after his death in 1227.
55	In what year did the Black Death (Bubonic Plague) begin its devastating spread across Europe?	medium	1	\r\nThe Black Death, also known as the Bubonic Plague, began its devastating spread across Europe in 1347. The outbreak originated in Asia and reached Europe through trade routes and commerce. It caused one of the deadliest pandemics in human history, resulting in the deaths of tens of millions of people throughout Europe, Asia, and North Africa. The pandemic had profound and long-lasting effects on European society, causing demographic, economic, and social upheavals, and altering the course of history in many regions.
56	What was the significance of the Magna Carta, issued in 1215?	medium	1	\r\nThe Magna Carta, issued in 1215, was a significant historical document that played a crucial role in shaping the development of modern constitutional and legal principles. It was a charter of rights and liberties that King John of England was compelled to sign by a group of rebellious barons who sought to limit the king's powers and protect their own rights and privileges.\r\n\r\nThe Magna Carta established the idea that the king was not above the law and that the monarch's powers were subject to legal restraints. It introduced the principle that even the king had to govern in accordance with established laws and procedures, providing the foundation for the rule of law.\r\n\r\nThe document also safeguarded certain rights and privileges for freemen, including protection against unjust imprisonment, the right to a fair trial, and the limitation of taxation without the consent of the nobility. While the original Magna Carta's immediate impact was limited, its significance grew over time, inspiring later constitutional developments and influencing the formation of democratic principles and the protection of individual liberties around the world.
58	What was the first Nazi concentration camp?	medium	1	The first Nazi concentration camp was Dachau. Established on March 22, 1933, shortly after Adolf Hitler came to power, Dachau was located near Munich, Germany. Initially used to imprison political opponents, it later evolved into a model for other concentration camps in the Nazi regime. Dachau became a site of immense suffering and cruelty, with prisoners subjected to forced labor, torture, and inhumane living conditions during World War II.\r\n\r\n\r\n\r\n\r\n
59	What kind of animal did Cleopatra use to kill herself?	medium	1	Cleopatra, the last Pharaoh of ancient Egypt, is said to have used an asp (a venomous snake) to kill herself. According to historical accounts, in 30 BCE, after her lover Mark Antony's defeat in battle and believing falsely that he was dead, Cleopatra committed suicide rather than being captured and paraded in Rome as a prisoner. Legend has it that she allowed a poisonous asp to bite her, leading to her death. The story of Cleopatra's dramatic end has been depicted in various works of art, literature, and films, contributing to her enduring fascination in history and popular culture.
61	What was the previous name for New York?	medium	1	The previous name for New York was New Amsterdam. The city was originally founded by the Dutch in 1624 as a trading post called New Amsterdam. It served as the capital of the Dutch colony of New Netherland. However, in 1664, the English captured the city during the Second Anglo-Dutch War and renamed it New York in honor of the Duke of York, who later became King James II of England. The English took control of the entire New Netherland colony, leading to the change of the city's name from New Amsterdam to New York.\r\n\r\n\r\n\r\n\r\n
62	Which country did England send convicts to between 1788 and 1868?	medium	1	Between 1788 and 1868, England sent convicts to Australia. The British government used Australia, particularly the eastern regions, as a penal colony to alleviate overcrowding in British prisons and to establish a settlement in the new land discovered by Captain James Cook. The first fleet of convicts arrived in Botany Bay, New South Wales, in 1788, marking the beginning of European colonization in Australia. Over the years, thousands of convicts were transported to various parts of Australia as punishment for their crimes, significantly influencing the country's early history and demographics.\r\n\r\n\r\n\r\n\r\n
63	Which Argentinian became a notable figure in the Cuban Revolution?	medium	1	\r\nThe notable Argentinian figure who became significant in the Cuban Revolution was Ernesto "Che" Guevara. Che Guevara was an Argentine Marxist revolutionary, physician, author, guerrilla leader, and diplomat. He played a crucial role in the Cuban Revolution alongside Fidel Castro and other revolutionaries. Guevara joined Castro's 26th of July Movement and participated in the successful overthrow of the Cuban dictator Fulgencio Batista in 1959.\r\n\r\nAfter the revolution's triumph, Che Guevara held various high-ranking positions in the Cuban government, including serving as Minister of Industry. He became an influential figure in the socialist movement and was involved in revolutionary activities in other parts of the world as well. Che Guevara's iconic image and ideas continue to resonate with people worldwide, making him a lasting symbol of revolutionary ideals and anti-imperialist struggle.
64	Whose assassination led to World War I?	medium	1	\r\nThe assassination that led to World War I was the assassination of Archduke Franz Ferdinand of Austria. On June 28, 1914, Archduke Franz Ferdinand and his wife, Sophie, Duchess of Hohenberg, were assassinated in Sarajevo, Bosnia, by Gavrilo Princip, a member of a nationalist group seeking independence from Austria-Hungary.\r\n\r\nThe assassination triggered a series of diplomatic and military actions among the great powers of Europe due to the complex web of alliances and rivalries. Austria-Hungary declared war on Serbia, and as a result of the alliance systems in place, other nations became involved, leading to a chain reaction of declarations of war. This ultimately culminated in the outbreak of World War I on July 28, 1914.
65	Who invented Penicillin?	medium	1	\r\nPenicillin was discovered by Scottish biologist and pharmacologist Alexander Fleming in 1928. While working at St. Mary's Hospital in London, Fleming noticed that a petri dish containing Staphylococcus bacteria had been contaminated with mold. Upon closer examination, he observed that the bacteria surrounding the mold had been killed, and he identified the mold as a strain of the Penicillium genus.\r\n\r\nFleming's discovery of the antibiotic properties of penicillin marked a significant breakthrough in medicine and revolutionized the treatment of bacterial infections. However, it wasn't until several years later, during the 1940s, that penicillin was further developed into a usable and mass-produced drug by a team of scientists led by Howard Florey and Ernst Boris Chain, which played a crucial role in saving countless lives during World War II and beyond.
66	What was the name of the first computer?	medium	1	\r\nThe first computer was called the "ENIAC," which stands for Electronic Numerical Integrator and Computer. ENIAC was one of the earliest general-purpose electronic digital computers and was developed during World War II to solve complex calculations for the United States Army. It was completed in 1945 and operated at the University of Pennsylvania's Moore School of Electrical Engineering.\r\n\r\nENIAC was a massive machine, occupying a large room and consisting of thousands of vacuum tubes, switches, and other electronic components. It was primarily used for scientific and military purposes, such as performing calculations for artillery trajectory, atomic bomb development, and scientific research. ENIAC's development marked a significant milestone in the history of computing and laid the foundation for further advancements in the field.
67	What was the name given to the laws aimed at enforcing segregation in public places in the United States?	medium	1	\r\nThe laws aimed at enforcing segregation in public places in the United States were collectively known as "Jim Crow laws." These laws were enacted in the late 19th and early 20th centuries and mandated racial segregation, primarily between African Americans and white Americans. The term "Jim Crow" originated from a racist character in 19th-century minstrel shows, and it later came to represent the entire system of racial segregation and discrimination in the Southern states.\r\n\r\nUnder the Jim Crow laws, segregation was enforced in various aspects of public life, including schools, restaurants, public transportation, restrooms, and other public facilities. These laws denied African Americans basic civil rights and perpetuated racial inequality and discrimination until the civil rights movement of the 1950s and 1960s sought to dismantle them. The Supreme Court's landmark decision in Brown v. Board of Education in 1954 declared that racial segregation in public schools was unconstitutional, marking a significant step toward ending Jim Crow laws and promoting desegregation in the United States.\r\n\r\n\r\n\r\n\r\n
69	What famous music festival took place in 1969?	medium	1	The famous music festival that took place in 1969 was Woodstock. Woodstock was a historic music and arts festival held in Bethel, New York, from August 15 to August 18, 1969. It is widely regarded as one of the defining moments of the counterculture movement and the "hippie" era.\r\n\r\nWoodstock attracted an estimated 400,000 people and featured performances from some of the most iconic musicians of the time, including Jimi Hendrix, Janis Joplin, The Who, Jefferson Airplane, Crosby, Stills, Nash & Young, and many others. Despite logistical challenges and adverse weather conditions, the festival became a symbol of peace, love, and music, with attendees coming together in a spirit of unity and celebration.\r\n\r\n
70	The Protestant Reformation was started by whom?	medium	1	The Protestant Reformation was started by Martin Luther, a German theologian, in 1517. Luther's act of nailing his "95 Theses" to the door of the Castle Church in Wittenberg, Germany, challenged certain practices of the Roman Catholic Church and sparked a movement that led to the establishment of Protestantism.\r\n\r\n\r\n\r\n\r\n
71	What category was Hurricane Katrina when it made landfall in 2005?	medium	1	When Hurricane Katrina made landfall in 2005, it was a Category 3 hurricane. It struck the Gulf Coast of the United States, particularly affecting the states of Louisiana, Mississippi, and Alabama, causing widespread destruction and catastrophic flooding. The storm's impact was devastating, resulting in significant loss of life and extensive damage to property and infrastructure in the affected regions.\r\n\r\n\r\n\r\n\r\n
72	Which human ancestor was the first to discover fire?	medium	1	The human ancestor believed to have first discovered and controlled fire is Homo erectus. Homo erectus was an early human species that lived approximately 1.9 million to 200,000 years ago. Evidence suggests that Homo erectus had the cognitive ability and skill to create and control fire, which played a crucial role in their survival and evolution. The use of fire provided warmth, protection from predators, and the ability to cook food, which improved their diet and facilitated the development of their brain and physical capabilities.\r\n\r\n\r\n\r\n\r\n
73	Along with Hiroshima, Japan, which Japanese city was hit by an atomic bomb in 1945?	medium	1	Along with Hiroshima, Japan, the city of Nagasaki was hit by an atomic bomb in 1945. The bombing of Nagasaki occurred on August 9, 1945, just three days after the atomic bomb was dropped on Hiroshima. The bombing of these two cities during World War II was a result of the United States' Manhattan Project, which developed the first nuclear weapons. The devastation caused by the atomic bombs in Hiroshima and Nagasaki led to Japan's surrender and marked the end of World War II.\r\n\r\n\r\n\r\n\r\n
74	The Cuban Revolution led to the rise of what dictator?	medium	1	The Cuban Revolution led to the rise of Fidel Castro as the dictator of Cuba. After the successful overthrow of Cuban dictator Fulgencio Batista in 1959, Fidel Castro, along with other revolutionaries, assumed control of the country. Castro established a communist government and served as the Prime Minister of Cuba from 1959 to 1976 and then as the President from 1976 to 2008.\r\n\r\nDuring his long tenure, Castro implemented socialist policies, nationalized industries, and established close ties with the Soviet Union, leading to strained relations with the United States. His rule was marked by significant social and economic changes, as well as political repression. Fidel Castro's leadership had a profound impact on Cuban history and politics, shaping the country's trajectory for decades.
75	Who was the first Western explorer to reach China?	medium	1	\r\nThe first Western explorer to reach China was Marco Polo, an Italian merchant and explorer. Marco Polo traveled to China along the Silk Road during the 13th century. He embarked on his journey from Venice with his father and uncle, traveling through Central Asia and eventually arriving in the court of Kublai Khan, the Mongol emperor of the Yuan Dynasty in China.\r\n\r\nMarco Polo's detailed accounts of his travels and experiences in China were recorded in his book "The Travels of Marco Polo" and became widely known in Europe. His writings played a crucial role in introducing Europeans to the wonders and riches of China and the Far East, opening up new trade routes and encouraging further exploration and interaction between Europe and Asia.
77	What famous 5th century A.D. conqueror was known as "The Scourge of God"?	medium	1	The famous 5th century A.D. conqueror who was known as "The Scourge of God" was Attila the Hun. Attila was the ruler of the Huns, a nomadic warrior people from Central Asia who posed a formidable threat to the Roman Empire and other surrounding regions during the late Roman period. He led devastating military campaigns across Europe, earning a reputation for his ferocity and ruthlessness, which earned him the title "The Scourge of God." Attila's conquests and invasions instilled fear in many, and he remains a prominent figure in history for his impact on the decline of the Western Roman Empire.\r\n\r\n\r\n\r\n\r\n
78	What group of people discovered Greenland?	medium	1	Greenland was discovered by Norse explorers. Specifically, Erik the Red, a Norse explorer and adventurer, is credited with leading the first known expedition to Greenland around the 10th century. Erik the Red, who had been exiled from Iceland, established the first Norse settlements on the southwestern coast of Greenland. The land was named "Greenland" to attract more settlers, as Erik wanted to make it sound appealing and fertile, despite its icy and harsh conditions. The Norse settlements on Greenland thrived for several centuries before eventually disappearing, likely due to a combination of factors such as climate change, isolation, and interactions with the indigenous peoples of Greenland, known as the Inuit.\r\n\r\n\r\n\r\n\r\n
79	In the 5,000 years of human history, what is the one disease that has been completely eradicated?	medium	1	\r\nThe one disease that has been completely eradicated in human history is smallpox. Smallpox, caused by the variola virus, was a highly contagious and deadly disease that had afflicted humanity for thousands of years. It caused widespread outbreaks and epidemics, resulting in millions of deaths and leaving survivors with severe scarring and sometimes blindness.\r\n\r\nThrough a global vaccination campaign led by the World Health Organization (WHO), smallpox was officially declared eradicated in 1980. The last known naturally occurring case of smallpox was in Somalia in 1977. The successful eradication of smallpox stands as a remarkable achievement in public health and remains the only disease to date that has been completely eradicated through human efforts.
80	Who created the first successful printing press?	medium	1	\r\nThe first successful printing press was created by Johannes Gutenberg, a German inventor and printer, in the mid-15th century. Gutenberg's invention, known as the Gutenberg press, revolutionized the process of printing and played a crucial role in the spread of knowledge and information during the Renaissance and beyond.\r\n\r\nGutenberg's most famous work produced using his printing press was the Gutenberg Bible, completed around 1455. The printing press allowed for the mass production of books and significantly lowered the cost of producing written material, making books more accessible to a broader audience. Gutenberg's invention is often regarded as one of the most important technological advancements in the history of printing and publishing.
81	What nation separated from the United Kingdom in 1921?	medium	1	The nation that separated from the United Kingdom in 1921 was Ireland. The process of separation led to the establishment of two separate political entities: the Irish Free State (later renamed Ireland) and Northern Ireland. The Anglo-Irish Treaty, signed in December 1921, marked the end of the Irish War of Independence and granted Ireland its independence from the United Kingdom. However, six counties in the northeastern part of the island chose to remain part of the United Kingdom, forming Northern Ireland. This partition resulted in the creation of the modern-day Republic of Ireland and Northern Ireland as distinct political entities.\r\n\r\n\r\n\r\n\r\n
82	The Great Fire of London happened in which year?	medium	1	\r\nThe Great Fire of London happened in the year 1666. The fire broke out on September 2, 1666, and continued to rage for three days, until September 5, 1666. It started in a small bakery on Pudding Lane and quickly spread through the tightly packed wooden buildings of London.\r\n\r\nThe Great Fire of London was a catastrophic event that resulted in the destruction of a large part of the city, including approximately 13,200 houses, 87 churches, and numerous other buildings. Despite the extensive damage and displacement of thousands of Londoners, the fire also led to the rebuilding and modernization of the city's infrastructure and architecture, under the direction of Sir Christopher Wren and others, which significantly improved fire safety and urban planning in the aftermath.\r\n\r\n\r\n\r\n\r\n
85	Who is known for running through the streets crying Eureka?	medium	1	The person known for running through the streets crying "Eureka" was the ancient Greek mathematician, physicist, engineer, and inventor Archimedes. According to the historical account, Archimedes made this exclamation when he discovered a solution to a problem while taking a bath. The story goes that he noticed the water level rise as he got into the bath, and this observation inspired him to develop the principle of buoyancy, known as "Archimedes' principle." Overjoyed with his discovery, he ran through the streets of Syracuse, Sicily, shouting "Eureka," which means "I have found it" in Greek. Archimedes' contributions to mathematics and science were significant, and he is considered one of the greatest mathematicians and inventors of the ancient world.\r\n\r\n\r\n\r\n\r\n
84	How many times has the Mona Lisa been stolen?	medium	1	\r\nThe Mona Lisa, one of the most famous and iconic paintings in the world, has been stolen only once. The theft occurred on August 21, 1911, from the Louvre Museum in Paris, France. The thief, Vincenzo Peruggia, an Italian handyman, managed to conceal the painting under his clothing and walked out of the museum with it.\r\n\r\nThe stolen painting was missing for over two years before it was recovered in December 1913. Peruggia had attempted to sell the Mona Lisa to an art dealer in Florence, Italy, but the dealer recognized the painting as stolen and alerted the authorities. The Mona Lisa was returned to the Louvre, where it remains on display to this day, safeguarded and admired by millions of visitors each year.\r\n\r\n\r\n\r\n\r\n
86	What is the name of the first human civilization?	medium	1	The first human civilization is believed to be the Sumerian civilization. It emerged around 4,000 BCE in the region known as Mesopotamia, which is located in present-day Iraq. The Sumerians are credited with several important developments, such as the invention of writing (cuneiform script), the establishment of city-states, and the development of advanced irrigation and agricultural techniques. They built impressive cities like Uruk and Ur and left behind a rich legacy of culture and knowledge that influenced subsequent civilizations in the region and beyond. The Sumerian civilization laid the foundation for the development of complex societies and marked the beginning of recorded history.\r\n\r\n\r\n\r\n\r\n
87	Which English queen reigned for just nine days?	medium	1	\r\nThe English queen who reigned for just nine days was Lady Jane Grey. Lady Jane Grey, also known as the "Nine Days' Queen," ascended to the throne of England on July 10, 1553, following the death of her cousin, King Edward VI. However, her claim to the throne was disputed, and support for her reign was limited.\r\n\r\nLady Jane Grey's rule was short-lived, as Mary I, the daughter of King Henry VIII and Catherine of Aragon, successfully rallied enough support to depose her. Mary I was proclaimed queen on July 19, 1553, and Lady Jane Grey was later imprisoned in the Tower of London. Her reign was a brief and tragic episode in English history, as she was executed on February 12, 1554, at the young age of 16 or 17.
88	Who was the first woman in space?	medium	1	\r\nThe first woman in space was Valentina Tereshkova, a Soviet cosmonaut. She made her historic spaceflight on June 16, 1963, aboard the Vostok 6 spacecraft. Valentina Tereshkova's mission made her not only the first woman in space but also the first and youngest woman to fly into space at the age of 26.\r\n\r\nHer mission lasted for three days, during which she orbited the Earth 48 times. Valentina Tereshkova's achievement marked a significant milestone in the space race between the United States and the Soviet Union during the Cold War era and paved the way for more women to follow in her footsteps as astronauts and cosmonauts in subsequent space missions.
89	Where were the first modern Olympics held?	medium	1	\r\nThe first modern Olympics were held in Athens, Greece. The inaugural modern Olympic Games, officially known as the Games of the I Olympiad, took place from April 6 to April 15, 1896. The revival of the Olympic Games was the idea of Pierre de Coubertin, a French educator and historian, who sought to bring back the ancient Greek tradition of athletic competitions.\r\n\r\nThe first modern Olympics in Athens featured athletes from 14 countries participating in 43 events across various sports, such as track and field, gymnastics, swimming, wrestling, and more. The Games were a resounding success, and they have since become one of the most significant international sporting events, held every four years with athletes from around the world coming together to compete in the spirit of sportsmanship and global unity.
90	Which Russian astronaut was the first man to conduct a spacewalk?	medium	1	\r\nThe Russian astronaut who was the first man to conduct a spacewalk is Alexei Leonov. On March 18, 1965, during the Voskhod 2 mission, Alexei Leonov became the first human to exit a spacecraft and float freely in space. His spacewalk lasted approximately 12 minutes and took place at an altitude of around 500 kilometers (around 311 miles) above the Earth's surface.\r\n\r\nDuring the spacewalk, Leonov faced several challenges, including the expansion of his spacesuit due to the vacuum of space, which made it difficult for him to re-enter the spacecraft. Nevertheless, he successfully re-entered the Voskhod 2 capsule and safely returned to Earth, becoming a trailblazer in space exploration and a symbol of human achievement beyond the Earth's boundaries.
91	What was the name of the first Space Shuttle to go into space?	medium	1	\r\nThe name of the first Space Shuttle to go into space was Space Shuttle Columbia. Columbia was the first orbiter of NASA's Space Shuttle program and was launched on its maiden flight, STS-1 (Space Transportation System-1), on April 12, 1981.\r\n\r\nSTS-1 was a historic mission, as it marked the first time a reusable spacecraft was launched into space and returned to Earth for reuse in subsequent missions. The mission was crewed by astronauts John W. Young and Robert L. Crippen, and it demonstrated the capabilities of the Space Shuttle system, paving the way for many more Shuttle missions over the years. Tragically, the Space Shuttle Columbia was lost during re-entry on its 28th mission (STS-107) on February 1, 2003, resulting in the loss of all seven crew members on board.
93	How many U.S. presidents have been assassinated?	medium	1	Four U.S. presidents have been assassinated in American history. The assassinated presidents are:\r\n\r\nAbraham Lincoln - Assassinated on April 14, 1865, by John Wilkes Booth at Ford's Theatre in Washington, D.C. He died the following day on April 15, 1865.\r\n\r\nJames A. Garfield - Assassinated on July 2, 1881, by Charles J. Guiteau at a train station in Washington, D.C. He died of his wounds on September 19, 1881.\r\n\r\nWilliam McKinley - Assassinated on September 6, 1901, by Leon Czolgosz at the Pan-American Exposition in Buffalo, New York. He died of his wounds on September 14, 1901.\r\n\r\nJohn F. Kennedy - Assassinated on November 22, 1963, by Lee Harvey Oswald in Dallas, Texas. He died shortly after the shooting.
229	The city of Calgary is located in which Canadian province?	medium	2	The city of Calgary is located in the Canadian province of Alberta. Calgary is one of the major cities in Alberta and is known for its strong economy, particularly in the energy sector, as well as its vibrant cultural scene and outdoor recreational opportunities. It is situated in the southern part of the province, near the foothills of the Canadian Rockies, making it a popular gateway for exploring the natural beauty of the region.\r\n\r\n\r\n\r\n\r\n
94	In 1927, who became the first man to fly solo and non-stop across the Atlantic?	medium	1	In 1927, Charles Lindbergh became the first man to fly solo and non-stop across the Atlantic Ocean. Lindbergh, an American aviator and airmail pilot, completed this historic feat on May 20-21, 1927, when he flew his custom-built aircraft, the Spirit of St. Louis, from Roosevelt Field in New York to Le Bourget Field near Paris, France.\r\n\r\nThe solo transatlantic flight covered a distance of approximately 3,600 miles (5,800 kilometers) and took him around 33 and a half hours to complete. Lindbergh's achievement earned him worldwide fame and acclaim, making him an aviation hero and a symbol of innovation and adventure in the early days of flight.
95	One of the ancient world wonders, the "Hanging Gardens," was found in which city?	medium	1	\r\nThe "Hanging Gardens" of the ancient world were believed to have been located in the city of Babylon, which was the capital of the ancient Babylonian Empire. These gardens, also known as the "Hanging Gardens of Babylon," were considered one of the Seven Wonders of the Ancient World.\r\n\r\nAccording to historical accounts and ancient writings, the gardens were a remarkable feat of engineering and horticulture, featuring terraced gardens filled with a variety of plants and trees. The gardens were said to have been built by King Nebuchadnezzar II in the 6th century BCE, as a gift to his wife, Amytis of Media, who missed the green landscapes of her homeland. While the Hanging Gardens' exact location remains uncertain, historical references suggest that they were situated in the vicinity of present-day Hillah, Babil Governorate, Iraq. However, the gardens' existence and true nature have been the subject of debate among historians and archaeologists over the centuries, as there is no direct archaeological evidence to confirm their existence.
96	How many years did the 100 years war last?	medium	1	\r\nThe Hundred Years' War was a series of conflicts between England and France that lasted for 116 years. It began in 1337 and ended in 1453. Despite its name, the war was not a continuous conflict but rather a series of intermittent wars, battles, and truces between the two rival nations.\r\n\r\nThe Hundred Years' War was a complex and significant historical event, marked by shifting alliances, territorial disputes, and military campaigns. It had a profound impact on the political, social, and cultural developments of both England and France and helped to shape the future of European history.
97	Who is the inventor of electric light?	medium	1	\r\nThe invention of the electric light is attributed to Thomas Edison. Thomas Edison, an American inventor and businessman, is most famous for his work on the practical development of the incandescent light bulb. In 1879, he successfully demonstrated a long-lasting and commercially viable incandescent light bulb, which used a carbon filament and provided a practical solution for indoor electric lighting.\r\n\r\nEdison's incandescent light bulb marked a significant advancement in lighting technology, revolutionizing the way people lived and worked by extending the hours of productivity and comfort. While there were other inventors and researchers working on electric light around the same time, Edison's version became the most widely adopted and commercially successful, making him synonymous with the invention of the electric light.
98	Where is the home country of Joan of Arc?	medium	1	The home country of Joan of Arc is France. Joan of Arc, also known as Jeanne d'Arc in French, was born around 1412 in the village of Domrémy in the Duchy of Bar, which is now part of northeastern France. She is one of the most prominent figures in French history and played a crucial role during the Hundred Years' War between England and France.\r\n\r\nJoan of Arc became known for her visionary experiences and her leadership in the military campaigns against the English during the later stages of the Hundred Years' War. She claimed to have received divine guidance and was instrumental in the French victory at the Siege of Orléans in 1429. However, she was later captured by the English, tried for heresy, and eventually executed by burning at the stake in 1431 at the age of 19. Joan of Arc was canonized as a saint by the Catholic Church in 1920 and remains a symbol of courage and inspiration in France and around the world.
99	The Aztec civilization originated from which country?	medium	1	\r\nThe Aztec civilization originated in what is now present-day Mexico. The Aztecs, also known as the Mexica, were a Mesoamerican civilization that flourished in central Mexico from the 14th to the early 16th century. They established their capital city, Tenochtitlan, on an island in Lake Texcoco, which is now the location of modern-day Mexico City.\r\n\r\nThe Aztecs built a vast and powerful empire through military conquest, alliance building, and the establishment of tribute systems. They were known for their advanced agricultural practices, engineering, art, and religious beliefs. However, their civilization came to an end with the arrival of Spanish conquistadors, led by Hernán Cortés, who conquered Tenochtitlan in 1521, marking the downfall of the Aztec civilization and the beginning of Spanish colonization in the region.
101	Which is the last dynasty in China?	medium	1	The last dynasty in China was the Qing Dynasty. The Qing Dynasty ruled China from 1644 to 1912. It was the final imperial dynasty and the last period of traditional Chinese monarchy. The Qing Dynasty was established by the Manchus, a non-Han ethnic group from Manchuria, who overthrew the Ming Dynasty and established their rule over China.\r\n\r\nDuring its reign, the Qing Dynasty expanded its territory and witnessed both prosperity and challenges. However, in the late 19th and early 20th centuries, China faced internal rebellions, foreign invasions, and social unrest, leading to the decline of the imperial system. The Qing Dynasty was overthrown in the Xinhai Revolution in 1911, which marked the end of over two millennia of imperial rule in China and the establishment of the Republic of China.
102	The Byzantine Empire was a continuation of which powerful ancient empire?	medium	1	The Byzantine Empire was a continuation of the Roman Empire. After the western half of the Roman Empire fell in 476 AD, the eastern half, with its capital at Constantinople (modern-day Istanbul, Turkey), continued to exist for nearly a thousand years until its final fall in 1453.\r\n\r\nThe Byzantine Empire, also known as the Eastern Roman Empire, preserved many aspects of Roman culture, government, and administration. It became a center of trade, culture, and learning in the medieval world and played a significant role in the transmission of ancient Greek and Roman knowledge to the West during the Middle Ages. The Byzantine Empire's legacy is evident in various aspects of art, architecture, religion, and law, making it a crucial bridge between the ancient and medieval periods of history.
156	Which country is shaped like a boot and is located in southern Europe?	easy	2	The country that is shaped like a boot and is located in southern Europe is Italy. Italy is known for its distinctive boot-shaped geography, with the Mediterranean Sea surrounding it on three sides—specifically the Tyrrhenian Sea to the west, the Ionian Sea to the south, and the Adriatic Sea to the east. Italy is renowned for its rich history, art, culture, and cuisine, and it is home to numerous iconic landmarks such as the Colosseum, the Leaning Tower of Pisa, and the canals of Venice.\r\n\r\n\r\n\r\n\r\n
103	Where is the Pyramid of the Sun located?	medium	1	The Pyramid of the Sun is located in Teotihuacan, an ancient Mesoamerican city in modern-day Mexico. Teotihuacan is situated in the Valley of Mexico, about 30 miles (48 kilometers) northeast of present-day Mexico City. The Pyramid of the Sun is one of the most significant and impressive structures in the city.\r\n\r\nTeotihuacan was one of the largest and most influential cities in pre-Columbian America, flourishing between the 1st and 7th centuries AD. The Pyramid of the Sun is the largest pyramid in Teotihuacan and one of the largest in the world. It was built as a religious and ceremonial center and was dedicated to the worship of deities associated with the sun.\r\n\r\nToday, Teotihuacan is a UNESCO World Heritage Site and a major archaeological and tourist attraction in Mexico, drawing visitors from around the world to marvel at its ancient pyramids, temples, and impressive urban planning.
104	What was the name of the ancient trade route that connected the East with the West?	medium	1	The ancient trade route that connected the East with the West was called the "Silk Road." The Silk Road was an extensive network of interconnected trade routes that spanned from the eastern Mediterranean Sea to East Asia, facilitating the exchange of goods, ideas, cultures, and technologies between the East (including China, India, and the Middle East) and the West (including Central Asia, the Roman Empire, and later, Europe).\r\n\r\nThe Silk Road was not a single, defined route but rather a complex web of land and sea routes that allowed merchants, travelers, and explorers to transport valuable commodities such as silk, spices, precious metals, ceramics, and other goods over vast distances. The trade along the Silk Road played a crucial role in the development of civilizations, fostering cultural exchange and economic prosperity between diverse regions of the ancient world.
105	Who established the Xia Dynasty in China?	medium	1	\r\nAccording to traditional Chinese historical accounts, the Xia Dynasty in China was established by Yu the Great. Yu was a legendary figure and one of the early rulers of ancient China. He is credited with successfully controlling the flooding of the Yellow River and implementing flood control measures to protect agricultural lands.\r\n\r\nThe Xia Dynasty is considered the first dynasty in Chinese history, preceding the Shang Dynasty. While there is ongoing debate among historians about the accuracy of the historical accounts related to the Xia Dynasty, it holds significant cultural and symbolic importance in Chinese history and mythology. The Xia Dynasty is believed to have ruled China from around 2070 BCE to 1600 BCE.
106	Which Greek goddess was the Parthenon dedicated to?	medium	1	\r\nThe Parthenon, an ancient Greek temple located on the Acropolis of Athens, was dedicated to the Greek goddess Athena. The temple was built in the 5th century BCE and was part of the Periclean building program to honor and worship Athena, the patron goddess of the city of Athens and the goddess of wisdom, courage, civilization, and warfare.\r\n\r\nThe Parthenon was designed and constructed as a Doric temple and housed a massive chryselephantine (made of gold and ivory) statue of Athena created by the sculptor Phidias. The temple's name, "Parthenon," is derived from the Greek word "parthenos," which means "virgin" or "maiden," symbolizing Athena's virginity and purity. The Parthenon remains one of the most iconic and well-preserved examples of ancient Greek architecture and is recognized as a symbol of classical art and civilization.
108	Modern-day Istanbul, Turkey, used to be called what when it was the capital of the Byzantine Empire?	medium	1	When it was the capital of the Byzantine Empire, modern-day Istanbul, Turkey, used to be called Constantinople. The name "Constantinople" was given to the city by the Roman Emperor Constantine the Great in AD 330 when he made it the new capital of the Roman Empire. The city was named after Constantine himself and became known as "Constantinopolis" in Latin, which translates to "City of Constantine."\r\n\r\nConstantinople served as the capital of the Eastern Roman Empire (Byzantine Empire) for over a thousand years until its fall to the Ottoman Empire in 1453. After the Ottoman conquest, the city was renamed Istanbul, a name derived from the Greek phrase "εἰς τὴν Πόλιν" (pronounced "eis tin polin"), meaning "to the city." Istanbul remained the capital of the Ottoman Empire until the establishment of the Republic of Turkey in 1923 when Ankara became the new capital.
110	What was the name of the secret society involved in the assassination of Archduke Franz Ferdinand, which triggered World War I?	hard	1	The secret society involved in the assassination of Archduke Franz Ferdinand, which triggered World War I, was called the "Black Hand." The Black Hand was a nationalist and revolutionary organization based in Serbia, which sought to promote the unification of all South Slavs in the Balkans and opposed Austro-Hungarian rule over Bosnia and Herzegovina.\r\n\r\nOn June 28, 1914, Archduke Franz Ferdinand, the heir to the Austro-Hungarian throne, and his wife, Sophie, were assassinated in Sarajevo, Bosnia, by Gavrilo Princip, a member of the Black Hand. The assassination served as a catalyst for the outbreak of World War I, as Austria-Hungary declared war on Serbia, leading to a series of cascading alliances and conflicts among major European powers. The assassination of the Archduke is considered one of the main triggers that led to the global conflict of World War I.
111	During the American Revolution, which foreign military leader played a crucial role in helping the Continental Army achieve victory at the Battle of Saratoga?	hard	1	During the American Revolution, the foreign military leader who played a crucial role in helping the Continental Army achieve victory at the Battle of Saratoga was General Friedrich Wilhelm von Steuben. Von Steuben, a Prussian military officer, provided valuable training and discipline to the American forces, contributing significantly to their success in the battle. His expertise in drill and tactics boosted the Continental Army's performance and morale, ultimately leading to the decisive American victory at Saratoga in 1777.\r\n\r\n\r\n\r\n\r\n
113	Which famous medieval figure led the Cathar Crusade against the Cathar heretics in the Languedoc region of France during the early 13th century?	hard	1	The famous medieval figure who led the Cathar Crusade against the Cathar heretics in the Languedoc region of France during the early 13th century was Simon de Montfort. Simon de Montfort was a French nobleman and military leader who was appointed by the Catholic Church to lead the Albigensian Crusade, also known as the Cathar Crusade, against the Cathars and other dissident groups in the southern region of France.\r\n\r\nThe Cathars were considered heretics by the Catholic Church, and the Crusade was launched to suppress their beliefs and gain control over the Languedoc region. Simon de Montfort's military campaigns led to significant bloodshed and the persecution of the Cathars, contributing to the decline of their influence in the area and the eventual consolidation of royal power in the region.
275	What is the capital of Kosovo?	hard	2	The capital of Kosovo is Pristina. Pristina is the largest city in Kosovo and serves as its political, cultural, and economic center. It is located in the northeastern part of the country and has a diverse population with a rich history and vibrant atmosphere. Pristina became the capital of Kosovo in 1947 and has since played a significant role in the country's development and growth as an independent nation.\r\n\r\n\r\n\r\n\r\n
115	During the Peloponnesian War, which Spartan commander led the devastating invasion of Attica, culminating in the burning of Athens in 404 BCE?	hard	1	During the Peloponnesian War, the Spartan commander who led the devastating invasion of Attica, culminating in the burning of Athens in 404 BCE, was Lysander. Lysander was a prominent Spartan military leader and admiral who played a crucial role in the final stages of the war. Under his command, the Spartan fleet achieved a decisive victory over the Athenian fleet at the Battle of Aegospotami in 405 BCE, which led to the fall of Athens and the end of the Peloponnesian War. After the defeat at Aegospotami, Athens was besieged, and eventually, the city surrendered to the Spartan forces, leading to the destruction of its long walls and fortifications, and the imposition of Spartan control over the city.\r\n\r\n\r\n\r\n\r\n
116	What renowned Venetian merchant and explorer served as an ambassador to the Khan's court during the 13th century?	hard	1	The renowned Venetian merchant and explorer who served as an ambassador to the Khan's court during the 13th century was Marco Polo. Marco Polo, along with his father Niccolò and uncle Maffeo, embarked on a journey from Venice to the court of Kublai Khan, the Mongol ruler of the Yuan Dynasty in China.\r\n\r\nFrom 1271 to 1295, Marco Polo traveled extensively throughout Asia, exploring various regions of China, Central Asia, India, and Southeast Asia. His detailed accounts of his travels, compiled in the book "The Travels of Marco Polo," provided Europeans with valuable information about the riches and wonders of the East, contributing to the European Age of Exploration and increasing trade and cultural exchange between Europe and Asia. Marco Polo's adventures and writings made him one of the most famous explorers of his time and left a lasting impact on world history.
117	The "Dancing Plague" or "Dance Epidemic" of 1518 occurred in which city?	hard	1	\r\nThe "Dancing Plague" or "Dance Epidemic" of 1518 occurred in the city of Strasbourg, which was then part of the Holy Roman Empire (now located in modern-day France). During the summer of 1518, a mysterious and bizarre phenomenon unfolded in Strasbourg, where a large number of people inexplicably started dancing uncontrollably and involuntarily for extended periods, sometimes for days or even weeks.\r\n\r\nHistorical records indicate that the "dancing plague" affected hundreds of people, leading to exhaustion, injury, and even death in some cases. To this day, the exact cause of the strange event remains unclear, and various theories, ranging from mass hysteria and psychological stress to physiological and environmental factors, have been proposed to explain the unusual occurrence. The "Dancing Plague" of 1518 remains one of history's most perplexing and intriguing instances of mass hysteria and collective behavior.
118	Which ancient wonder was described by the Greek historian Herodotus as a labyrinthine structure with 3,000 rooms, located in the city of Memphis, Egypt?	hard	1	The ancient wonder described by the Greek historian Herodotus as a labyrinthine structure with 3,000 rooms, located in the city of Memphis, Egypt, is the "Labyrinth of Egypt." According to Herodotus, the Labyrinth was an elaborate and colossal complex built by the ancient Egyptian pharaoh Amenemhat III during the Middle Kingdom period.\r\n\r\nHerodotus' description of the Labyrinth, which he visited during his travels in Egypt, portrays it as a massive and awe-inspiring architectural marvel. However, no physical remains of the Labyrinth have been conclusively identified, and its exact location and nature remain subjects of speculation and mystery among historians and archaeologists. Nevertheless, the Labyrinth of Egypt has fascinated scholars and captured the imagination of people for centuries, contributing to the allure of ancient Egypt and its mysterious wonders.
120	Which African kingdom, known for its impressive stone ruins, was the center of a thriving civilization from approximately the 11th to the 15th century?	hard	1	The African kingdom known for its impressive stone ruins and the center of a thriving civilization from approximately the 11th to the 15th century was the Kingdom of Great Zimbabwe. Great Zimbabwe was a powerful medieval kingdom located in present-day southeastern Zimbabwe. The kingdom's capital, also called Great Zimbabwe, was a significant political, economic, and cultural center of its time.\r\n\r\nThe ruins of Great Zimbabwe include massive stone structures, such as the Great Enclosure and the Hill Complex, which are remarkable examples of ancient African architecture and engineering. The city's prominence as a trade and religious center enabled the kingdom to prosper through long-distance trade routes, particularly in gold and other valuable commodities. Great Zimbabwe declined around the 15th century for various reasons, including political instability, shifts in trade routes, and environmental changes. Today, the ruins of Great Zimbabwe are a UNESCO World Heritage Site and stand as a testament to the rich history and accomplishments of this once-thriving African kingdom.
121	Who was the Roman Emperor responsible for ordering the execution of the philosopher and statesman Seneca during the infamous "Great Fire of Rome" incident in 64 AD?	hard	1	The Roman Emperor responsible for ordering the execution of the philosopher and statesman Seneca during the infamous "Great Fire of Rome" incident in 64 AD was Emperor Nero. Seneca was a prominent Stoic philosopher and advisor to Emperor Nero. However, in the aftermath of the Great Fire of Rome, which destroyed much of the city, Seneca was accused of conspiracy and involvement in the fire.\r\n\r\nFacing pressure and fearing for his life, Seneca was forced to commit suicide at Nero's behest. Despite their earlier close relationship, Nero turned against Seneca during his reign, which was marked by increasing tyranny and cruelty. The execution of Seneca is one of the many dark episodes in the history of Nero's rule, which eventually led to his downfall and the end of the Julio-Claudian dynasty.
122	What powerful West African empire, known for its wealth and military strength, was ruled by Mansa Musa during the 14th century?	hard	1	\r\nThe powerful West African empire known for its wealth and military strength, and ruled by Mansa Musa during the 14th century, was the Mali Empire. Mansa Musa, also known as Musa I of Mali, was one of the most famous and influential rulers of the Mali Empire. He ascended to the throne around 1312 and reigned until his death in 1337.\r\n\r\nUnder Mansa Musa's rule, the Mali Empire reached its height of prosperity and power. The empire was renowned for its vast wealth, particularly from the gold and salt trade routes, which contributed to Mali becoming one of the richest and most significant empires in the world at the time. Mansa Musa is well-remembered for his famous pilgrimage to Mecca in 1324, during which he brought significant amounts of gold, showcasing the wealth and magnificence of the Mali Empire to the wider world. His reign left a lasting legacy in West African history and culture.
157	Which country is known as the Land of the Rising Sun?	easy	2	The country that is known as the "Land of the Rising Sun" is Japan. The nickname "Land of the Rising Sun" comes from the country's name in Japanese, which is "Nihon" (日本), and the characters can be translated as "origin of the sun" or "sun's origin." This name refers to Japan's location to the east of the Asian continent, where the sun appears to rise from the Pacific Ocean. The phrase is also symbolic of the country's rich cultural heritage, traditions, and historical significance as a major civilization in East Asia.\r\n\r\n\r\n\r\n\r\n
124	During the Gallipoli Campaign, which military commander led the Allied forces in an unsuccessful attempt to seize the Dardanelles Strait and gain control of Constantinople?	hard	1	During the Gallipoli Campaign, the military commander who led the Allied forces in the unsuccessful attempt to seize the Dardanelles Strait and gain control of Constantinople was British General Sir Ian Hamilton. The Gallipoli Campaign took place during World War I and aimed to secure the Dardanelles Strait, a strategic waterway that would allow the Allies to establish a supply route to Russia and potentially knock the Ottoman Empire out of the war.\r\n\r\nThe campaign began on April 25, 1915, with landings at several locations on the Gallipoli Peninsula. However, the Allied forces faced strong resistance from the well-prepared Ottoman troops and the difficult terrain. Despite fierce fighting and enduring harsh conditions, the campaign proved to be a costly failure for the Allies. The campaign was eventually abandoned, and the last Allied troops were evacuated from the Gallipoli Peninsula in January 1916. The defeat at Gallipoli had significant repercussions and shaped the course of the war in the Middle East during World War I.
125	Which Italian painter, known for his work "Primavera" and "The Birth of Venus," was a prominent figure of the Early Renaissance?	hard	1	\r\nThe Italian painter known for his work "Primavera" and "The Birth of Venus," and a prominent figure of the Early Renaissance, was Sandro Botticelli. Sandro Botticelli, whose real name was Alessandro di Mariano di Vanni Filipepi, was active during the 15th century in Florence, Italy.\r\n\r\nBotticelli's paintings, including "Primavera" and "The Birth of Venus," are celebrated for their exquisite beauty, graceful figures, and mythological themes. His style was influenced by the Humanist ideas of the time, and his works often depicted classical myths and allegories. Botticelli's artistry contributed significantly to the development of Renaissance art in Italy and has left an enduring impact on Western art history.
126	Who was the controversial monk and advisor to the Russian Tsarina Alexandra, whose influence on the royal family contributed to the downfall of the Romanov dynasty?	hard	1	The controversial monk and advisor to the Russian Tsarina Alexandra, whose influence on the royal family contributed to the downfall of the Romanov dynasty, was Grigori Rasputin. Grigori Rasputin gained significant influence in the court of Tsar Nicholas II and Tsarina Alexandra due to his claims of mystical and healing powers. He became a close confidant and spiritual advisor to the Tsarina, and his sway over her decisions and political appointments created resentment and suspicion among the Russian nobility and officials.\r\n\r\nRasputin's involvement in political affairs and rumors of his influence on the Tsarina and the government led to opposition and hostility, which further weakened the credibility and stability of the Romanov rule. On December 30, 1916, Rasputin was assassinated by a group of nobles who feared his influence and believed his removal would save the monarchy. However, the damage had been done, and Rasputin's association with the Romanovs contributed to the already growing discontent in Russia, leading to the Russian Revolution in 1917 and the eventual downfall of the Romanov dynasty.
128	Who was the leader of the Taiping Rebellion?	hard	1	The leader of the Taiping Rebellion was Hong Xiuquan. Hong Xiuquan was a Chinese religious visionary and political leader who believed he was the younger brother of Jesus Christ. In the mid-19th century, he founded the Taiping Heavenly Kingdom and led the massive Taiping Rebellion against the ruling Qing Dynasty. The rebellion, which lasted from 1850 to 1864, was one of the largest and bloodiest civil wars in history, resulting in millions of deaths and significant social and political upheaval in China. Although the Taiping Rebellion ultimately failed, it left a profound impact on Chinese history and contributed to the weakening of the Qing Dynasty.\r\n\r\n\r\n\r\n\r\n
129	What was the name of the mysterious ancient civilization that existed in the Indus Valley and had a script that remains undeciphered to this day?	hard	1	\r\nThe mysterious ancient civilization that existed in the Indus Valley and had a script that remains undeciphered to this day is known as the Indus Valley Civilization. Also referred to as the Harappan Civilization, it was one of the world's earliest urban civilizations and flourished around 2600 to 1900 BCE in what is now modern-day Pakistan and western India.\r\n\r\nThe Indus Valley Civilization is known for its well-planned cities, advanced sanitation systems, and sophisticated urban architecture. Archaeological excavations have uncovered thousands of inscriptions in the Indus script on various artifacts, but to date, linguists and historians have not been able to fully decipher the script, leaving many aspects of this ancient civilization's language and written communication shrouded in mystery. Despite the script's undeciphered nature, the Indus Valley Civilization's influence and contributions to early human civilization remain significant and continue to be a subject of fascination and research for scholars worldwide.
130	Which famous medieval explorer from the Islamic world traveled extensively, visiting places like China, India, and the Volga River region, and authored the travelogue "Rihla"?	hard	1	\r\nThe famous medieval explorer from the Islamic world who traveled extensively, visiting places like China, India, and the Volga River region, and authored the travelogue "Rihla" was Ibn Battuta. Ibn Battuta was a Moroccan scholar and explorer who embarked on a remarkable journey that lasted for around 30 years in the 14th century.\r\n\r\nHis travels took him through the Islamic world, North Africa, the Middle East, Central Asia, South Asia, Southeast Asia, and China. He documented his experiences and observations in his travelogue "Rihla," which provides valuable insights into the diverse cultures, societies, and landscapes he encountered during his extraordinary journey. Ibn Battuta's travels remain one of the most extensive and detailed accounts of the medieval world and have left a lasting impact on the understanding of the historical connections between different regions and civilizations.
131	Who was the African-American mathematician and astronomer who calculated the orbit of Halley's Comet in the early 19th century, becoming the first woman to receive a doctorate in the United States?	hard	1	\r\nThe African-American mathematician and astronomer who calculated the orbit of Halley's Comet in the early 19th century and became the first woman to receive a doctorate in the United States was Maria Mitchell. Maria Mitchell was a pioneering astronomer and educator who made significant contributions to the field of astronomy.\r\n\r\nIn 1847, Mitchell discovered a telescopic comet, later known as "Miss Mitchell's Comet," for which she received international recognition and acclaim. Her achievements in the field of astronomy and her dedication to promoting education for women paved the way for future generations of women in science. In 1865, she became the first woman to be elected to the American Academy of Arts and Sciences. Maria Mitchell's pioneering work continues to inspire and influence the scientific community and serves as a symbol of women's accomplishments in the field of science.
132	What is the term used for the incident when an amateur radio operator transmitted a false nuclear attack warning in Russia, almost triggering a nuclear response?	hard	1	The term used for the incident when an amateur radio operator transmitted a false nuclear attack warning in Russia, almost triggering a nuclear response, is the "1983 Soviet nuclear false alarm incident" or the "1983 Soviet nuclear scare."\r\n\r\nOn September 26, 1983, a Soviet early warning system detected what appeared to be incoming nuclear missiles from the United States. Stanislav Petrov, a duty officer at the Soviet nuclear early warning facility, was faced with the critical decision of whether to report the apparent attack to his superiors, which could have led to a retaliatory nuclear strike. However, Petrov, suspecting it was a false alarm due to the limited number of missiles detected and the lack of corroborating evidence, chose not to report the warning.\r\n\r\nHis decision proved to be correct, as it was later determined that the system had malfunctioned, and there were no actual missiles heading towards the Soviet Union. Stanislav Petrov's actions that night are credited with preventing a catastrophic escalation in the midst of the Cold War. He was hailed as a hero for his judgment and restraint in the face of immense pressure and tension.
134	During the Age of Exploration, which Portuguese explorer led the first expedition to circumnavigate the globe, though he died during the journey?	hard	1	\r\nDuring the Age of Exploration, the Portuguese explorer who led the first expedition to circumnavigate the globe, though he died during the journey, was Ferdinand Magellan. Magellan's expedition, which began in 1519, aimed to find a westward route to the Spice Islands (modern-day Indonesia) by sailing around the southern tip of South America. The journey was perilous and faced numerous challenges, including storms, mutinies, and scarcity of supplies.\r\n\r\nAlthough Ferdinand Magellan did not live to complete the entire voyage, dying in the Philippines in 1521 during a local conflict, his expedition continued under the command of Juan Sebastián Elcano. The expedition finally returned to Spain in 1522, completing the first documented circumnavigation of the Earth. Despite his death during the journey, Magellan's exploration significantly advanced the understanding of the world's geography and opened up new trade routes and possibilities for further exploration.
135	In the 19th century, Otto von Bismarck led the unification of Germany. In which war did Prussia, under Bismarck's leadership, defeat Austria to solidify its position?	hard	1	\r\nIn the 19th century, Otto von Bismarck led the unification of Germany, and Prussia, under his leadership, defeated Austria in the Austro-Prussian War of 1866. This war, also known as the Seven Weeks' War, was a crucial step in Bismarck's plan to unify the German states under Prussian dominance and exclude Austria from the German Confederation.\r\n\r\nThe Austro-Prussian War resulted in a swift and decisive victory for Prussia and its allies over Austria, largely due to Prussia's superior military and the effective leadership of Bismarck and his military commanders, particularly Helmuth von Moltke. The defeat of Austria led to the dissolution of the German Confederation and the formation of the North German Confederation, with Prussia at its core. The successful outcome of the war further solidified Prussia's position in the process of German unification, paving the way for the eventual creation of the German Empire in 1871, with King Wilhelm I of Prussia becoming the Emperor of Germany.
136	The "An Lushan Rebellion" was a devastating conflict that occurred during the Tang Dynasty in which country?	hard	1	\r\nThe "An Lushan Rebellion" was a devastating conflict that occurred during the Tang Dynasty in China. The rebellion was a major uprising against the Tang Dynasty's rule and took place between 755 and 763 CE.\r\n\r\nThe rebellion was led by the military general An Lushan, who was of non-Chinese origin (part Sogdian, part Turkic). An Lushan had been appointed by the Tang government to govern the northeastern region of the empire. However, he rebelled against the Tang Dynasty and launched a large-scale revolt, capturing the Tang capital of Chang'an (present-day Xi'an) and establishing his own short-lived regime, the Yan Dynasty.\r\n\r\nThe rebellion resulted in widespread destruction, loss of life, and political instability. The Tang Dynasty eventually suppressed the rebellion with the help of regional forces and foreign mercenaries, but the conflict had severe and long-lasting effects on the dynasty, weakening its power and contributing to its eventual decline in the later years. The An Lushan Rebellion remains one of the most significant and tumultuous events in Chinese history.
137	The Mughal Emperor Shah Jahan commissioned the construction of which iconic monument as a mausoleum for his wife Mumtaz Mahal?	hard	1	\r\nThe Mughal Emperor Shah Jahan commissioned the construction of the iconic monument known as the Taj Mahal as a mausoleum for his wife Mumtaz Mahal. Mumtaz Mahal was Shah Jahan's favorite wife, and she passed away during childbirth in 1631. In her memory and as a symbol of his love for her, Shah Jahan ordered the construction of the Taj Mahal, which is located in Agra, India.\r\n\r\nThe construction of the Taj Mahal began in 1632 and was completed in 1653. It is renowned for its exquisite Mughal architecture, including its white marble exterior adorned with intricate inlays and delicate carvings. The Taj Mahal is recognized as one of the most beautiful and iconic buildings in the world and is a UNESCO World Heritage Site. It stands as a testament to the timeless love and devotion of Shah Jahan for Mumtaz Mahal and remains a symbol of India's rich cultural heritage and architectural achievements.
138	During the American Revolutionary War, which European country provided crucial military and financial assistance to the American colonies in their fight against Great Britain?	hard	1	During the American Revolutionary War, the European country that provided crucial military and financial assistance to the American colonies in their fight against Great Britain was France. The alliance between France and the American colonies was formalized in 1778, and France played a significant role in supporting the American cause throughout the war.\r\n\r\nThe French provided military aid, including troops, naval support, and supplies, which proved instrumental in several key American victories, such as the Battle of Saratoga in 1777. Additionally, France's financial assistance, loans, and trade support helped the American colonies sustain their war effort and gain independence from Great Britain.\r\n\r\nThe alliance with France had a profound impact on the outcome of the American Revolutionary War and demonstrated the importance of international support and cooperation in achieving victory for the American colonies.
159	What is the capital city of England?	easy	2	The capital city of England is London. London is the largest city in the United Kingdom and serves as the political, cultural, and economic center of the country. It is a global city with a rich history, world-renowned landmarks, and a diverse and vibrant population. Some of the famous landmarks in London include the Buckingham Palace, the Tower of London, the British Museum, and the Houses of Parliament with the iconic Big Ben clock tower.\r\n\r\n\r\n\r\n\r\n
139	Which famous scientist and mathematician wrote the book "Mathematical Principles of Natural Philosophy," commonly known as the "Principia," which laid the foundations for classical mechanics?	hard	1	The famous scientist and mathematician who wrote the book "Mathematical Principles of Natural Philosophy," commonly known as the "Principia," which laid the foundations for classical mechanics, was Sir Isaac Newton. The "Principia" was first published in 1687 and is one of the most important scientific works in history.\r\n\r\nIn the "Principia," Newton formulated his three laws of motion and the law of universal gravitation, which provided a comprehensive explanation of how objects move and interact with each other under the influence of gravitational forces. Newton's groundbreaking ideas revolutionized the understanding of physics and mechanics and established the framework for modern classical physics. His work in the "Principia" laid the foundation for many subsequent developments in science and greatly influenced the scientific and philosophical thinking of the Enlightenment period.
142	What is the capital city of Italy?	easy	2	The capital city of Italy is Rome. Rome is a historic and culturally rich city that has played a significant role in shaping the world's history. It is home to iconic landmarks such as the Colosseum, the Roman Forum, and the Vatican City, making it a popular destination for tourists from around the globe.\r\n\r\n\r\n\r\n\r\n
143	What is the largest continent on Earth?	easy	2	The largest continent on Earth is Asia. It spans a vast area, stretching from the easternmost parts of Russia to the westernmost areas of Turkey. Asia is known for its diverse landscapes, cultures, and history, with numerous countries and regions that offer a wide range of experiences for travelers and explorers.\r\n\r\n\r\n\r\n\r\n
144	What is the capital city of the United States?	easy	2	The capital city of the United States is Washington, D.C. (District of Columbia). Washington, D.C. is a unique city, not part of any state, and it serves as the political and administrative center of the country. It is home to many important government buildings, including the White House, the U.S. Capitol, and the Supreme Court, making it the heart of the United States' federal government.\r\n\r\n\r\n\r\n\r\n
145	Which direction does the sun rise: East or West?	easy	2	The sun rises in the East. In most parts of the world, the sun rises in the east and sets in the west due to the Earth's rotation on its axis from west to east. This is a natural phenomenon that occurs every day, with the sun appearing on the eastern horizon during the early morning and moving across the sky to set on the western horizon during the evening.\r\n\r\n\r\n\r\n\r\n
147	What is the worlds longest river?	easy	2	The world's longest river is the Nile River. It is located in northeastern Africa and is approximately 6,650 kilometers (4,130 miles) long. The Nile River is of great historical and cultural significance, being a lifeline for several ancient civilizations and playing a vital role in the development of human societies in the region. It remains an essential water source for the countries it passes through, including Egypt, Sudan, Ethiopia, Uganda, and others.\r\n\r\n\r\n\r\n\r\n
148	What is the name of the famous structure in Paris, France, known for its iron lattice design?	easy	2	The famous structure in Paris, France, known for its iron lattice design is the Eiffel Tower. The Eiffel Tower is an iconic landmark and one of the most recognizable structures in the world. It was constructed as the entrance arch to the 1889 World's Fair and was initially met with some controversy. However, it has since become a symbol of Paris and a beloved tourist attraction, drawing millions of visitors from around the globe each year.\r\n\r\n\r\n\r\n\r\n
149	Which ocean is found between North America and Europe?	easy	2	The ocean that is found between North America and Europe is the Atlantic Ocean. The Atlantic Ocean is the second-largest ocean in the world and serves as a major pathway for maritime trade and travel between the two continents. It separates North America to the west from Europe and Africa to the east. The Atlantic Ocean plays a significant role in shaping the climates and ecosystems of the regions it surrounds and connects.\r\n\r\n\r\n\r\n\r\n
150	What is the worlds tallest mountain, located in the Himalayas?	easy	2	The world's tallest mountain, located in the Himalayas, is Mount Everest. Mount Everest is the highest point on Earth above sea level, with its peak reaching an elevation of 8,848.86 meters (29,031.7 feet). It is part of the Mahalangur Himal sub-range of the Himalayas and straddles the border between Nepal and the Tibet Autonomous Region of China. Mount Everest has captivated the imagination of climbers and adventurers for generations and remains one of the most challenging and sought-after mountaineering destinations in the world.\r\n\r\n\r\n\r\n\r\n
152	Name the country known for its pyramids and the Nile River.	easy	2	The country known for its pyramids and the Nile River is Egypt. Egypt is located in northeastern Africa and is famous for its ancient civilization and historical wonders. The Nile River, the longest river in the world, flows through Egypt, providing water and fertile land for agriculture. The pyramids, particularly the Great Pyramid of Giza, are among the most iconic structures in Egypt and are some of the most recognizable symbols of ancient Egyptian civilization.\r\n\r\n\r\n\r\n\r\n
153	Which country is famous for the Great Wall?	easy	2	\r\nThe country famous for the Great Wall is China. The Great Wall of China is an ancient series of fortifications made of stone, brick, tamped earth, wood, and other materials. It stretches across northern China, mainly built to protect the Chinese states and empires against invasions and raids by various nomadic groups and military incursions from other civilizations.\r\n\r\nThe Great Wall of China is a UNESCO World Heritage Site and a symbol of Chinese history and culture. It is one of the most impressive and iconic architectural feats in the world, attracting millions of visitors each year.
154	Which continent is home to the Amazon Rainforest?	easy	2	The continent that is home to the Amazon Rainforest is South America. The Amazon Rainforest is the largest tropical rainforest on Earth and covers a vast area across several South American countries, including Brazil, Peru, Colombia, Venezuela, Ecuador, Bolivia, Guyana, Suriname, and French Guiana. It is renowned for its incredible biodiversity, housing a vast array of plant and animal species, many of which are found nowhere else on the planet. The Amazon Rainforest plays a crucial role in regulating the global climate and is often referred to as the "lungs of the Earth" because of its role in producing oxygen and absorbing carbon dioxide.\r\n\r\n\r\n\r\n\r\n
155	Name the desert that spans across North Africa.	easy	2	The desert that spans across North Africa is the Sahara Desert. The Sahara is the largest hot desert in the world, covering an area of approximately 9.2 million square kilometers (3.6 million square miles). It stretches across several countries in North Africa, including Algeria, Chad, Egypt, Libya, Mali, Mauritania, Morocco, Niger, Western Sahara, Sudan, and Tunisia. The Sahara is known for its vast sand dunes, extreme temperatures, and arid conditions, making it one of the harshest and most challenging environments on the planet.\r\n\r\n\r\n\r\n\r\n
160	In which country would you find the famous Taj Mahal?	easy	2	The famous Taj Mahal is located in India. The Taj Mahal is a stunning white marble mausoleum situated in the city of Agra, in the northern state of Uttar Pradesh, India. It was commissioned by the Mughal emperor Shah Jahan in memory of his favorite wife, Mumtaz Mahal, and was completed in the mid-17th century. The Taj Mahal is considered one of the most beautiful and iconic architectural masterpieces in the world, and it is recognized as a UNESCO World Heritage Site. It attracts millions of visitors from around the globe who come to admire its exquisite design and rich historical significance.\r\n\r\n\r\n\r\n\r\n
161	Which ocean is located to the west of Europe?	easy	2	The ocean located to the west of Europe is the Atlantic Ocean. The Atlantic Ocean borders the western coastline of Europe, stretching from the northernmost regions of Norway and Iceland to the southernmost parts of Portugal and Spain. The Atlantic Ocean is the second-largest ocean on Earth and serves as a vital waterway for maritime trade, travel, and commerce between Europe, the Americas, and Africa. It has played a significant role in shaping the history and cultures of the countries that surround it.\r\n\r\n\r\n\r\n\r\n
162	What is the largest country in South America?	easy	2	The largest country in South America is Brazil. Brazil is not only the largest country in South America but also the fifth-largest country in the world by land area. It covers a vast area of approximately 8.5 million square kilometers (3.3 million square miles) and is bordered by every South American country except for Chile and Ecuador. Brazil is known for its diverse landscapes, including the Amazon Rainforest, the Pantanal wetlands, the Atlantic coastline, and the central plateau. It is also home to a rich cultural heritage, vibrant cities, and a variety of ecosystems that support a wide range of plant and animal species.\r\n\r\n\r\n\r\n\r\n
163	What is the name of the famous canyon in the United States known for its red rocks?	easy	2	The name of the famous canyon in the United States known for its red rocks is the Grand Canyon. The Grand Canyon is located in northern Arizona and is one of the most iconic natural wonders in the world. It was carved by the Colorado River over millions of years, exposing layers of vibrant red, orange, and brown rocks, creating a breathtaking and awe-inspiring landscape. The Grand Canyon attracts millions of visitors each year who come to marvel at its immense size and stunning geological formations. It is a UNESCO World Heritage Site and a popular destination for hiking, sightseeing, and photography.\r\n\r\n\r\n\r\n\r\n
164	Which continent is known as the "birthplace of civilization" and home to ancient civilizations like Mesopotamia and Egypt?	easy	2	The continent known as the "birthplace of civilization" and home to ancient civilizations like Mesopotamia and Egypt is Africa. Africa is often regarded as the cradle of human civilization, where some of the earliest human societies and civilizations emerged. Ancient civilizations like Mesopotamia (located in present-day Iraq and parts of Syria and Turkey) and Egypt (located in northeastern Africa) are among the most notable and influential civilizations that developed in Africa. These early societies made significant advancements in various fields, including agriculture, architecture, writing, mathematics, and governance, laying the foundations for human progress and development.\r\n\r\n\r\n\r\n\r\n
166	What is the capital city of Japan?	easy	2	The capital city of Japan is Tokyo. Tokyo is not only the capital of Japan but also the largest city in the country. It is a bustling metropolis known for its modernity, technological advancements, and vibrant culture. Tokyo serves as the political, economic, and cultural center of Japan and is a major global city. It is famous for its skyscrapers, shopping districts, historical landmarks, and diverse culinary scene, making it a popular destination for tourists from around the world.\r\n\r\n\r\n\r\n\r\n
167	What is the largest country in the world by land area?	easy	2	The largest country in the world by land area is Russia. Russia is a transcontinental country that spans both Eastern Europe and Northern Asia. It covers a vast land area of approximately 17.1 million square kilometers (6.6 million square miles). Russia's extensive territory includes diverse landscapes, ranging from arctic tundra in the north to vast forests, plains, and mountain ranges in the south. With its enormous landmass, Russia is home to a wide variety of cultures, languages, and natural resources.\r\n\r\n\r\n\r\n\r\n
168	What is the capital city of Canada?	easy	2	The capital city of Canada is Ottawa. Ottawa is located in the province of Ontario, in the southeastern part of Canada. It serves as the political and administrative center of the country and is home to important government institutions, including the Parliament of Canada. Ottawa is known for its rich history, beautiful architecture, and numerous cultural attractions, making it a popular destination for both Canadians and international visitors.\r\n\r\n\r\n\r\n\r\n
169	Which European country is famous for its romantic canals in Venice?	easy	2	The European country that is famous for its romantic canals in Venice is Italy. Venice is a city in northeastern Italy and is renowned for its intricate network of canals, which crisscross the city's 118 small islands. The canals serve as the main means of transportation within the city, and they are lined with beautiful historic buildings, bridges, and gondolas. Venice is often called the "City of Canals" and is a popular destination for tourists seeking a romantic and unique experience, making it one of Italy's most iconic and picturesque cities.\r\n\r\n\r\n\r\n\r\n
170	What is the largest desert in the world?	medium	2	The largest desert in the world is the Antarctic Desert. Yes, the Antarctic Desert is classified as a desert due to its extremely low precipitation levels. It covers the entire continent of Antarctica and has an area of approximately 14 million square kilometers (5.5 million square miles). Despite its icy appearance, the Antarctic Desert is a cold desert, with very little precipitation in the form of snowfall. It is also the coldest desert on Earth, with temperatures dropping to as low as -80 degrees Celsius (-112 degrees Fahrenheit) during the winter.\r\n\r\n\r\n\r\n\r\n
171	What is the capital city of Australia?	medium	2	The capital city of Australia is Canberra. Canberra is located in the southeastern part of the country and is situated in the Australian Capital Territory (ACT). It was purpose-built as the capital of Australia and was selected as the capital in 1908, replacing Melbourne and Sydney, which had been competing for the honor.\r\n\r\nCanberra is home to important government institutions, including the Australian Parliament House, the High Court of Australia, and various government departments. It is a planned city with well-designed urban spaces, parks, and a significant amount of greenery. Canberra's location was chosen to be between the major cities of Sydney and Melbourne to promote national unity and to avoid favoring one state over the other.
276	Which country used to be known as Dutch Guiana?	hard	2	The country that used to be known as Dutch Guiana is Suriname. Dutch Guiana was the name given to the territory when it was a Dutch colony in South America. However, in 1975, Suriname gained independence from the Netherlands and became a sovereign nation. It is located on the northeastern coast of South America and is known for its diverse cultural heritage, natural beauty, and rich history.\r\n\r\n\r\n\r\n\r\n
172	Which mountain range stretches across seven countries in South America?	medium	2	The mountain range that stretches across seven countries in South America is the Andes. The Andes is the longest mountain range in the world, extending over approximately 7,000 kilometers (4,300 miles) from north to south. It runs along the western edge of South America, passing through Venezuela, Colombia, Ecuador, Peru, Bolivia, Chile, and Argentina.\r\n\r\nThe Andes is home to numerous towering peaks, volcanoes, and diverse ecosystems. It plays a vital role in shaping the climate and geography of the countries it crosses, and it has had a significant influence on the cultures and histories of the people living in the region. The Andes is not only a popular destination for mountain climbers and adventurers but also a critical water source and habitat for a variety of plant and animal species
174	What is the tallest waterfall in the world?	medium	2	The tallest waterfall in the world is Angel Falls, also known as "Salto Ángel" in Spanish. It is located in Venezuela's Canaima National Park, in the Gran Sabana region. Angel Falls has an uninterrupted drop of about 979 meters (3,212 feet) and a total height of 979 meters (3,212 feet). The water plunges from the Auyán-tepui, a tabletop mountain, creating a stunning and majestic natural spectacle that attracts visitors from around the globe.\r\n\r\n\r\n\r\n\r\n
175	What is the largest lake in Africa?	medium	2	The largest lake in Africa is Lake Victoria. It is one of the African Great Lakes and is located in East Africa, bordered by Tanzania, Uganda, and Kenya. Lake Victoria covers an area of approximately 68,800 square kilometers (26,600 square miles) and has a maximum depth of about 84 meters (276 feet). The lake is not only important for its size but also for its ecological significance and the communities that depend on it for various resources, including fishing and transportation.\r\n\r\n\r\n\r\n\r\n
176	Which two countries share the longest international border in the world?	medium	2	The two countries that share the longest international border in the world are Canada and the United States. The border between Canada and the United States stretches over 8,891 kilometers (5,525 miles) and is the longest undefended border in the world. It spans across various landscapes and terrains, from densely populated urban areas to vast wilderness regions, and has historically maintained a peaceful and cooperative relationship between the two neighboring nations.\r\n\r\n\r\n\r\n\r\n
177	Which country is known as the "Land of Fire and Ice" due to its volcanic activity and glaciers?	medium	2	The country known as the "Land of Fire and Ice" due to its volcanic activity and glaciers is Iceland. Iceland is a Nordic island nation located in the North Atlantic Ocean. The name "Land of Fire and Ice" reflects its unique geological features, where active volcanoes and geothermal activity coexist with massive glaciers and ice fields. This combination creates a captivating and contrasting landscape, attracting tourists from all over the world to witness the stunning natural beauty and experience its hot springs, geysers, and other geothermal wonders.\r\n\r\n\r\n\r\n\r\n
180	The city of Marrakech is a major cultural and trading hub in which North African country?	medium	2	The city of Marrakech is a major cultural and trading hub in the North African country of Morocco. Marrakech, also spelled as "Marrakesh," is one of the four imperial cities of Morocco and is located in the western part of the country. It has a rich history and is renowned for its vibrant markets (souks), historic palaces, and iconic landmarks such as the Koutoubia Mosque and the Bahia Palace. Marrakech attracts numerous tourists with its distinct architecture, bustling Medina (old town), and a diverse blend of cultural influences from Berber, Arab, and African traditions.\r\n\r\n\r\n\r\n\r\n
181	Which country is famous for having the most number of islands?	medium	2	The country famous for having the most number of islands is Sweden. Sweden is located in Northern Europe and is known for its vast archipelagos that comprise thousands of islands along its coastline. The exact number of islands in Sweden is not precisely defined, as it depends on the criteria used to count them (e.g., size, land area, permanent inhabitants). However, estimates range from around 30,000 to over 200,000 islands. The Swedish archipelagos offer stunning natural beauty, recreational opportunities, and unique cultural experiences, making them popular destinations for both locals and tourists.\r\n\r\n\r\n\r\n\r\n
182	Which European country is known for its tulip fields and windmills?	medium	2	The European country known for its tulip fields and windmills is the Netherlands. The Netherlands, often referred to as Holland, is famous for its colorful tulip fields, particularly during the spring season when the tulips are in full bloom. The Keukenhof Gardens, located near Lisse, is one of the most popular places to see these vibrant tulip displays.\r\n\r\nAdditionally, the country is also known for its iconic windmills. While there are windmills found in other countries, the Netherlands is famous for its well-preserved historic windmills, some of which are still in operation today. These windmills have played a significant role in draining the land and managing water levels in the low-lying areas of the country.\r\n\r\nThe combination of tulip fields and windmills creates a picturesque and quintessentially Dutch landscape that attracts tourists from all over the world.
184	Which continent is known as the "Dark Continent"?	medium	2	The continent known as the "Dark Continent" is Africa. This nickname originated from the European explorers and travelers during the 19th century, a time when much of Africa remained unexplored and mysterious to outsiders. The term "Dark" was not related to the skin color of its inhabitants, but rather to the lack of knowledge about the interior regions of the continent. Over time, the phrase has been criticized for its negative connotations, and it is now considered outdated and inappropriate. Today, Africa is recognized for its diverse cultures, rich history, and abundant natural resources.\r\n\r\n\r\n\r\n\r\n
185	The city of New Orleans is located in which U.S. state?	medium	2	The city of New Orleans is located in the U.S. state of Louisiana. New Orleans is a major port city and is famous for its vibrant culture, music, cuisine, and annual Mardi Gras celebrations. It is situated along the Mississippi River in the southeastern part of Louisiana and holds a significant historical and cultural importance in the United States.\r\n\r\n\r\n\r\n\r\n
186	What is the official language of China?	medium	2	The official language of China is Standard Mandarin, also known as Modern Standard Chinese or Putonghua. Mandarin is the most widely spoken language in China and serves as the lingua franca, allowing people from different regions to communicate with each other. It is based on the Beijing dialect and is used in government, education, media, and daily life throughout the country. While Mandarin is the official language, China is linguistically diverse, with several other major regional languages and dialects spoken by various ethnic groups across the nation.\r\n\r\n\r\n\r\n\r\n
288	Which famous British band is known for hits like "Yellow" and "Viva la Vida"?	easy	3	The famous British band known for hits like "Yellow" and "Viva la Vida" is Coldplay. They are a renowned rock band that achieved international success with their unique sound and emotionally resonant lyrics. Coldplay has been one of the most influential and beloved bands in the modern music industry.\r\n\r\n\r\n\r\n\r\n
187	The city of Mecca, one of the holiest sites in Islam, is located in which country?	medium	2	The city of Mecca, one of the holiest sites in Islam, is located in the Kingdom of Saudi Arabia. It is the birthplace of the Prophet Muhammad and is considered the holiest city in Islam. Every year, millions of Muslim pilgrims from around the world visit Mecca to perform the Hajj pilgrimage, one of the Five Pillars of Islam. Mecca is home to the Kaaba, a cube-shaped building at the center of the Masjid al-Haram (the Grand Mosque), which Muslims face during their daily prayers. Non-Muslims are generally not allowed to enter the city of Mecca, as it is a sacred place exclusively for followers of Islam.\r\n\r\n\r\n\r\n\r\n
189	Mount Kilimanjaro, the highest peak in Africa, is located in which country?	medium	2	Mount Kilimanjaro, the highest peak in Africa, is located in Tanzania. It is a free-standing volcanic mountain and is one of the most iconic landmarks on the continent. Kilimanjaro is renowned for its snow-capped summit, which stands at an elevation of approximately 5,895 meters (19,341 feet) above sea level. The mountain is a popular destination for trekkers and climbers from around the world, seeking to reach its summit and witness breathtaking views of the surrounding landscapes.\r\n\r\n\r\n\r\n\r\n
190	Which U.S. state is known as the "Golden State"?	medium	2	The U.S. state known as the "Golden State" is California. California earned this nickname due to the discovery of gold in the state in 1848, which led to the famous California Gold Rush. The Gold Rush brought a massive influx of people to California in search of gold and wealth, shaping the state's history and economy.
191	The Galapagos Islands, known for their unique wildlife, are part of which South American country?	medium	2	The Galapagos Islands, known for their unique and diverse wildlife, are part of Ecuador, a South American country. The Galapagos Islands are located in the Pacific Ocean, approximately 906 kilometers (563 miles) west of mainland Ecuador. They are a UNESCO World Heritage Site and a popular destination for ecotourism and scientific research due to their extraordinary biodiversity and the famous observations made by Charles Darwin during his voyage on the HMS Beagle, which contributed to the development of his theory of evolution by natural selection.\r\n\r\n\r\n\r\n\r\n
192	The city of Rio de Janeiro is famous for its iconic statue of Christ the Redeemer. In which country is it located?	medium	2	The city of Rio de Janeiro, famous for its iconic statue of Christ the Redeemer, is located in Brazil. Christ the Redeemer is one of the most recognized landmarks in the world and is situated atop the Corcovado Mountain, overlooking the city of Rio de Janeiro. The statue, standing at approximately 30 meters (98 feet) tall, is a symbol of Brazilian culture and a significant religious monument, attracting millions of visitors from around the globe each year.\r\n\r\n\r\n\r\n\r\n
194	What is the currency of Japan?	medium	2	The currency of Japan is the Japanese yen, denoted by the symbol "¥" and the currency code "JPY." The yen is used throughout Japan for all financial transactions and is one of the major currencies in the global financial market. Banknotes and coins of various denominations are issued by the Bank of Japan, the country's central bank, and are widely accepted for everyday purchases, as well as in international trade and tourism.\r\n\r\n\r\n\r\n\r\n
195	Which country is known as "The Land of a Thousand Lakes"?	medium	2	The country known as "The Land of a Thousand Lakes" is Finland. Finland is located in Northern Europe and is famous for its numerous lakes, which are estimated to be around 188,000 in total, though the exact count may vary depending on the size and criteria used to define a lake. The largest and most well-known lake in Finland is Lake Saimaa. The abundance of lakes and beautiful natural landscapes make Finland a popular destination for outdoor activities like fishing, boating, and hiking.\r\n\r\n\r\n\r\n\r\n
196	What is the tallest mountain in the European Alps?	medium	2	The tallest mountain in the European Alps is Mont Blanc. It is also known as Monte Bianco in Italian. Mont Blanc is situated on the border between France and Italy and stands at an impressive height of approximately 4,809 meters (15,777 feet) above sea level. It is a popular destination for mountaineers and outdoor enthusiasts, attracting climbers from around the world to conquer its challenging summit. Mont Blanc is surrounded by breathtaking alpine scenery and is part of the Mont Blanc Massif, a significant mountain range in the Alps.\r\n\r\n\r\n\r\n\r\n
197	Which country is known as the "Land of Smiles"?	medium	2	The country known as the "Land of Smiles" is Thailand. Thailand is located in Southeast Asia and is renowned for its warm and welcoming hospitality, which is symbolized by the friendly smiles of its people. The nickname "Land of Smiles" reflects the Thai culture's emphasis on being courteous, polite, and approachable, making it a popular destination for tourists seeking a friendly and enjoyable experience. Thailand is also celebrated for its rich history, stunning beaches, vibrant cities, and delicious cuisine.\r\n\r\n\r\n\r\n\r\n
198	The city of St. Petersburg is a major cultural and historical hub in which country?	medium	2	The city of St. Petersburg is a major cultural and historical hub in Russia. It is located on the eastern tip of the Gulf of Finland, and it was founded by Tsar Peter the Great in 1703. St. Petersburg served as the imperial capital of Russia for over two centuries until the capital was moved back to Moscow in 1918.\r\n\r\nSt. Petersburg is renowned for its grand architecture, historical landmarks, and rich cultural heritage. The city is home to numerous world-class museums, theaters, and art galleries, including the State Hermitage Museum, one of the largest and most prestigious art museums in the world. The city's architectural beauty is exemplified by landmarks such as the Winter Palace, the Church of the Savior on Spilled Blood, and the Peter and Paul Fortress.
200	The city of Casablanca, famous for its movie and vibrant culture, is located in which country?	medium	2	The city of Casablanca is located in Morocco. It is the largest city in Morocco and serves as one of the country's major economic and cultural hubs. Casablanca is situated along the western coast of Morocco, overlooking the Atlantic Ocean.\r\n\r\nThe city gained international fame through the classic film "Casablanca," released in 1942, which starred Humphrey Bogart and Ingrid Bergman. The movie, set during World War II, portrayed the romantic and dramatic experiences of people at a nightclub in the city.
201	What is the capital city of Argentina?	medium	2	\r\nThe capital city of Argentina is Buenos Aires. Buenos Aires is the largest city in Argentina and serves as the political, cultural, and economic capital of the country. It is located in the eastern part of Argentina, near the southeastern coast, along the shores of the Rio de la Plata.\r\n\r\nBuenos Aires is known for its rich history, stunning architecture, vibrant arts scene, and tango music and dance. The city offers a mix of European and Latin American influences, reflecting its diverse cultural heritage. It is a popular destination for tourists and is often referred to as the "Paris of South America" due to its elegant boulevards, impressive landmarks, and lively atmosphere.
202	The Great Dividing Range is a major mountain range in which country?	medium	2	\r\nThe Great Dividing Range is a major mountain range in Australia. It stretches along the eastern coast of the country for over 3,500 kilometers (2,175 miles), from the northernmost point of Queensland to the southern state of Victoria.\r\n\r\nThe Great Dividing Range is one of Australia's most significant geographical features and forms a natural barrier between the coastal regions and the vast inland areas of the continent. It plays a crucial role in shaping the climate and hydrology of Australia, influencing rainfall patterns and creating distinct ecosystems on either side of the range.
203	The city of Istanbul was formerly known as Byzantium and Constantinople. In which country is it located?	medium	2	\r\nThe city of Istanbul, formerly known as Byzantium and Constantinople, is located in Turkey. Istanbul is a major city that straddles both Europe and Asia, making it a transcontinental city. The city is divided by the Bosphorus Strait, with the European side to the west and the Asian side to the east.\r\n\r\nIstanbul has a rich and fascinating history, serving as the capital of the Byzantine Empire under the name of Byzantium and later becoming the capital of the Roman Empire as Constantinople. It was also the capital of the Ottoman Empire before becoming part of modern-day Turkey.
205	The Dead Sea, known for its high salt content, is bordered by which two countries?	medium	2	The Dead Sea is bordered by Jordan to the east and Israel to the west. This unique saltwater lake is famous for its exceptionally high salt concentration, making it one of the saltiest bodies of water in the world. The high salinity levels create an environment where traditional aquatic life cannot thrive, leading to its name, the "Dead" Sea. However, the Dead Sea's mineral-rich waters are also renowned for their therapeutic and healing properties, attracting visitors from around the globe.\r\n\r\n\r\n\r\n\r\n
206	The city of Edinburgh is the capital of which country?	medium	2	The city of Edinburgh is the capital of Scotland. Located in the southeastern part of the country, Edinburgh is renowned for its rich history, stunning architecture, and vibrant cultural scene. It is a major center for arts, education, and tourism, attracting visitors from all over the world to explore its historic landmarks, including the Edinburgh Castle, the Royal Mile, and the Palace of Holyroodhouse.\r\n\r\n\r\n\r\n\r\n
207	The city of Vancouver is located in which Canadian province?	medium	2	The city of Vancouver is located in the Canadian province of British Columbia. Vancouver is a major city in western Canada and is known for its stunning natural surroundings, including mountains, forests, and the Pacific Ocean. It is a vibrant and diverse city, famous for its outdoor recreational opportunities, multicultural population, and thriving arts and culinary scenes.\r\n\r\n\r\n\r\n\r\n
208	Which country is known for having a famous canal that connects the Atlantic and Pacific Oceans?	medium	2	The country known for having a famous canal that connects the Atlantic and Pacific Oceans is Panama. The canal, commonly referred to as the Panama Canal, is a critical waterway that allows ships to pass between the Atlantic and Pacific Oceans without having to sail around the southern tip of South America. It is one of the most significant engineering feats in history and plays a crucial role in global trade, facilitating the passage of various goods and commodities between the two oceans and reducing maritime travel distances significantly.\r\n\r\n\r\n\r\n\r\n
210	Which U.S. state is known for its volcano, Mauna Loa, and its observatories on Mauna Kea?	medium	2	\r\nThe U.S. state known for its volcano, Mauna Loa, and its observatories on Mauna Kea is Hawaii. Mauna Loa is one of the five volcanoes that form the Big Island of Hawaii and is considered one of the most active volcanoes on Earth. It has frequent eruptions and is renowned for its immense size and volume.\r\n\r\nMauna Kea, also located on the Big Island, is the tallest volcano in Hawaii and is famous for hosting some of the world's leading astronomical observatories. Its high elevation, clear skies, and minimal light pollution make it an ideal location for stargazing and conducting cutting-edge astronomical research.
211	The city of Budapest is divided into two parts by which major river?	medium	2	The city of Budapest is divided into two parts by the major river called the Danube River. The Danube is one of Europe's most significant rivers, flowing through several countries and serving as a natural boundary between Buda and Pest, the two historical cities that merged to form the modern-day Budapest. Buda is located on the western bank, known for its hills and historic landmarks, while Pest is situated on the flatter eastern bank, housing the city's commercial and cultural centers. The iconic Chain Bridge connects the two parts of the city, making it a prominent symbol of Budapest.\r\n\r\n\r\n\r\n\r\n
212	The city of Reykjavik is the capital of which country?	medium	2	The city of Reykjavik is the capital of Iceland. Located on the southwestern coast of the island nation, Reykjavik is not only the capital but also the largest city in Iceland. It is known for its stunning natural surroundings, geothermal springs, and vibrant cultural scene. The city is a popular destination for tourists, offering a mix of modern amenities and the opportunity to explore Iceland's unique landscapes, including geysers, glaciers, and volcanic terrains.\r\n\r\n\r\n\r\n\r\n
213	The Yangtze River is the longest river in Asia and flows through which country?	medium	2	The Yangtze River, also known as the Chang Jiang, is the longest river in Asia and flows through China. It is the third-longest river in the world, with a total length of about 6,300 kilometers (3,915 miles). The Yangtze River plays a crucial role in Chinese history, culture, and economy, serving as a major transportation route and providing water resources for agriculture and industrial activities in the region. It passes through several major cities, including Chongqing and Shanghai, before emptying into the East China Sea.\r\n\r\n\r\n\r\n\r\n
215	Which country is known for having a significant portion of its territory lying below sea level?	medium	2	The Netherlands is known for having a significant portion of its territory lying below sea level. Approximately one-third of the country's land area is below sea level, and the Dutch have employed an extensive system of dikes, levees, and polders to reclaim and protect their land from the sea. The Netherlands' unique geography has led to its reputation for expertise in water management and engineering, making it a world leader in innovative flood control and land reclamation techniques.\r\n\r\n\r\n\r\n\r\n
216	The ancient city of Angkor Wat is a UNESCO World Heritage Site located in which country?	medium	2	The ancient city of Angkor Wat is a UNESCO World Heritage Site located in Cambodia. Angkor Wat is one of the most significant archaeological and cultural sites in Southeast Asia, and it is a symbol of national pride for Cambodia. Built during the Khmer Empire's peak in the 12th century, Angkor Wat is a sprawling temple complex with stunning architecture and intricate carvings, representing the pinnacle of Khmer art and culture. Today, it is a major tourist attraction and a cherished historical landmark in Cambodia.\r\n\r\n\r\n\r\n\r\n
219	The Atacama Desert, one of the driest places on Earth, is located in which continent?	medium	2	The Atacama Desert, one of the driest places on Earth, is located in the continent of South America. It stretches along the western coast of the continent, covering parts of Chile, Peru, Bolivia, and Argentina. The Atacama Desert is known for its extremely arid conditions, with some areas experiencing years without rainfall. It is a unique and otherworldly landscape, characterized by vast salt flats, sand dunes, and rocky terrain, making it a fascinating destination for travelers and researchers interested in extreme environments.\r\n\r\n\r\n\r\n\r\n
221	The city of Johannesburg is located in which African country?	medium	2	The city of Johannesburg is located in the African country of South Africa. Johannesburg, often referred to as Joburg or Jozi, is the largest city in South Africa and serves as the provincial capital of Gauteng province. It is a major economic and cultural hub in the region, known for its diverse population, rich history, and vibrant urban atmosphere. Johannesburg is also a prominent center for finance, business, and industry in Africa.\r\n\r\n\r\n\r\n\r\n
222	Which river flows through the Grand Canyon in the United States?	medium	2	The river that flows through the Grand Canyon in the United States is the Colorado River. The Colorado River is one of the most iconic and significant rivers in North America. It carved the Grand Canyon over millions of years, creating one of the world's most breathtaking natural wonders. The Grand Canyon is a vast and majestic gorge, attracting millions of visitors each year who come to witness its stunning beauty and explore its unique geology and landscapes.\r\n\r\n\r\n\r\n\r\n
223	Which U.S. state is known as the "Sunshine State"?	medium	2	The U.S. state known as the "Sunshine State" is Florida. Florida earned this nickname due to its generally sunny and warm climate throughout much of the year. With its beautiful beaches, diverse wildlife, and numerous attractions, Florida is a popular destination for tourists and residents alike who seek to enjoy outdoor activities and bask in the sunshine. Additionally, Florida is home to several renowned theme parks, including Walt Disney World Resort and Universal Studios, making it a top choice for family vacations.\r\n\r\n\r\n\r\n\r\n
224	The city of Lima is the capital of which South American country?	medium	2	The city of Lima is the capital of Peru, a South American country known for its rich history, diverse culture, and stunning landscapes. Lima is situated along the central coast of Peru, overlooking the Pacific Ocean. As the capital and largest city of Peru, Lima serves as the country's political, cultural, and economic center. It is a city of contrasts, blending historic colonial architecture with modern skyscrapers and offering a wide range of culinary delights that showcase the country's diverse cuisine.\r\n\r\n\r\n\r\n\r\n
225	The island of Bali, known for its stunning beaches and rich culture, is part of which country?	medium	2	The island of Bali is part of Indonesia. Bali is one of the 17,508 islands that make up the Indonesian archipelago, located in Southeast Asia. It is one of the most famous and popular tourist destinations in the world, renowned for its beautiful beaches, lush landscapes, vibrant culture, and unique Hindu temples. Bali attracts millions of visitors each year who come to experience its serene atmosphere, indulge in water sports, explore its rice terraces and volcanoes, and immerse themselves in the island's rich arts and traditions.\r\n\r\n\r\n\r\n\r\n
227	The island of Sicily is part of which European country?	medium	2	The island of Sicily is part of Italy, a European country located in the southern part of the continent. Sicily is the largest island in the Mediterranean Sea and is situated just off the "toe" of Italy's boot-shaped peninsula. It is known for its rich history, diverse culture, and beautiful landscapes, including ancient ruins, stunning coastlines, and Mount Etna, one of Europe's most active volcanoes. Sicily has been influenced by various civilizations throughout history, leaving behind a fascinating blend of architecture, cuisine, and traditions.\r\n\r\n\r\n\r\n\r\n
228	What is the official language of South Africa?	medium	2	The Republic of South Africa has 11 official languages, which reflect its diverse cultural heritage. These official languages are:\r\n\r\nAfrikaans\r\nEnglish\r\nisiNdebele\r\nisiXhosa\r\nisiZulu\r\nSesotho\r\nSetswana\r\nsiSwati\r\nTshivenda\r\nXitsonga\r\nSepedi\r\nBoth Afrikaans and English are widely used as lingua francas for communication among people from different linguistic backgrounds and in various formal settings. English, however, is the most commonly used language in business, government, and education.
372	What is the name of the annual music and arts festival held in the Black Rock Desert of Nevada?	medium	3	The name of the annual music and arts festival held in the Black Rock Desert of Nevada is Burning Man. Burning Man is a unique event that takes place in late August and early September, attracting thousands of participants from around the world. It is known for its focus on self-expression, art installations, music performances, and the creation of a temporary community based on principles like radical self-reliance, communal participation, and leaving no trace. The festival culminates with the symbolic burning of a large wooden effigy, known as "The Man."\r\n\r\n\r\n\r\n\r\n
373	Which English singer-songwriter released the albums "+," "x," and "ö"?	medium	3	The English singer-songwriter who released the albums "+," "x," and "÷" is Ed Sheeran. Ed Sheeran gained widespread fame with the release of his debut studio album "+," also known as "Plus," in 2011, which featured hit songs like "The A Team" and "Lego House." He followed it up with his second studio album "x," pronounced "multiply," in 2014, which included chart-topping singles like "Sing" and "Thinking Out Loud." His third studio album "÷," pronounced "divide," was released in 2017 and featured massive hits such as "Shape of You" and "Castle on the Hill." Ed Sheeran's albums have been commercial successes, solidifying his position as one of the leading artists in the music industry.\r\n\r\n\r\n\r\n\r\n
375	In which city did the famous composer Johann Sebastian Bach spend a significant portion of his life?	medium	3	The famous composer Johann Sebastian Bach spent a significant portion of his life in the city of Leipzig, Germany. Bach was appointed as the Cantor of the Thomasschule (St. Thomas School) and Director musices (Music Director) at the Thomaskirche (St. Thomas Church) in Leipzig in 1723. He remained in this position until his death in 1750. During his time in Leipzig, Bach composed many of his most famous works, including numerous cantatas, oratorios, motets, and instrumental compositions. Leipzig became a vital center of music and culture during Bach's tenure, and his contributions to the city's musical heritage are still celebrated today.\r\n\r\n\r\n\r\n\r\n
376	Which song by Gotye featuring Kimbra was a massive international hit in 2011?	medium	3	The song by Gotye featuring Kimbra that was a massive international hit in 2011 is "Somebody That I Used to Know." The song was released as a single from Gotye's album "Making Mirrors" and quickly became a global sensation. "Somebody That I Used to Know" topped the charts in numerous countries and received widespread critical acclaim for its unique sound, captivating vocals, and emotionally charged lyrics. Both Gotye and Kimbra's performances contributed to the song's success, making it one of the most memorable and influential tracks of that year.\r\n\r\n\r\n\r\n\r\n
230	What is the largest archipelago in the Caribbean?	medium	2	\r\nThe largest archipelago in the Caribbean is the Greater Antilles. The Greater Antilles is a group of islands in the northern part of the Caribbean Sea and consists of four main islands:\r\n\r\nCuba\r\nHispaniola (shared by Haiti and the Dominican Republic)\r\nJamaica\r\nPuerto Rico\r\nThese four large islands, along with several smaller ones, make up the Greater Antilles, which is a significant geographical and cultural region in the Caribbean. 
232	The city of Manila is the capital of which country?	medium	2	The city of Manila is the capital of the Philippines. It is one of the oldest cities in the country and is situated on the western side of Luzon, the largest island in the Philippines. As the capital city, Manila serves as the political, economic, cultural, and educational center of the Philippines. The city is known for its historical landmarks, bustling markets, and diverse urban landscape, making it a significant destination for both locals and tourists exploring the rich culture and history of the Philippines.\r\n\r\n\r\n\r\n\r\n
233	The island of Madagascar is located off the east coast of which continent?	medium	2	The island of Madagascar is located off the east coast of the African continent. It is the fourth-largest island in the world and is situated in the Indian Ocean, approximately 400 kilometers (250 miles) off the southeastern coast of Africa. Madagascar is known for its unique biodiversity, with a wide variety of plants and animals found nowhere else on Earth. The island's isolation from the mainland has allowed for the evolution of many endemic species, making it a fascinating destination for nature enthusiasts and researchers alike.\r\n\r\n\r\n\r\n\r\n
234	The city of Berlin is the capital of which European country?	medium	2	The city of Berlin is the capital of Germany. Located in the northeastern part of the country, Berlin is not only the capital but also the largest city in Germany. It is known for its rich history, vibrant cultural scene, and diverse architecture, reflecting its past as a city with a significant impact on European history and politics. Berlin is home to numerous historical landmarks, museums, art galleries, and modern infrastructure, making it a popular destination for tourists and a thriving hub for arts, technology, and innovation.\r\n\r\n\r\n\r\n\r\n
235	Which U.S. state is known for its abundant wildlife in places like Denali National Park?	medium	2	The U.S. state known for its abundant wildlife in places like Denali National Park is Alaska. Denali National Park and Preserve, located in the interior of Alaska, is renowned for its diverse and thriving wildlife, including grizzly bears, moose, caribou, wolves, and Dall sheep, among others. The vast wilderness and protected areas in Alaska provide a natural habitat for a wide range of animal species, making it a prime destination for wildlife enthusiasts and nature lovers.\r\n\r\n\r\n\r\n\r\n
236	The city of Santiago is the capital of which South American country?	medium	2	The city of Santiago is the capital of Chile, a South American country known for its stunning landscapes, diverse geography, and rich culture. Santiago is located in the central part of Chile's long and narrow territory, nestled in the Santiago Metropolitan Area surrounded by the Andes Mountains. As the capital and largest city of Chile, Santiago serves as the country's political, cultural, and economic center. It is a bustling and modern metropolis with a mix of historical and contemporary architecture, making it a popular destination for both tourists and business travelers.\r\n\r\n\r\n\r\n\r\n
238	Which continent is the second most populous in the world after Asia?	medium	2	\r\nThe continent that is the second most populous in the world after Asia is Africa. Africa is home to over 1.3 billion people and has a diverse population representing various ethnicities, cultures, and languages. With its large land area and a fast-growing population, Africa is projected to play a significant role in global demographics and development in the coming years.
239	How many US states are there?	medium	2	There are 50 U.S. states in the United States of America. Each state has its own government, and together they form the United States, a federal republic. The states are diverse in geography, culture, and economy, and they play a significant role in the country's political landscape and governance.
240	What is the capital city of Uruguay?	medium	2	The capital city of Uruguay is Montevideo. Montevideo is the largest city in Uruguay and serves as its political, economic, and cultural center. It is located on the southern coast of the country, along the northeastern bank of the Rio de la Plata, a large estuary that separates Uruguay from Argentina. Montevideo is known for its beautiful beaches, historic architecture, vibrant street life, and rich cultural heritage, making it a popular destination for both locals and tourists visiting Uruguay.\r\n\r\n\r\n\r\n\r\n
241	What mountain range is known as the "spine" of England?	medium	2	The mountain range known as the "spine" of England is the Pennines. The Pennines is a range of hills and mountains that runs through the central and northern parts of England, stretching from the Peak District in the Midlands up to the Scottish Borders. The range is characterized by its rolling hills, rugged landscapes, and beautiful moorlands. It serves as a natural boundary between several regions and has played a significant historical and cultural role in the development of the country. The Pennines are popular among hikers, nature enthusiasts, and tourists seeking to explore the picturesque countryside of England.\r\n\r\n\r\n\r\n\r\n
242	What is the capital city of Portugal?	medium	2	The capital city of Portugal is Lisbon (Lisboa in Portuguese). Lisbon is the largest city in Portugal and is located on the western coast of the country, along the Tagus River. It is a historic city with a rich cultural heritage, offering a blend of ancient history, stunning architecture, and modern amenities. Lisbon is known for its beautiful squares, historic neighborhoods, delicious cuisine, and vibrant nightlife. As the capital, Lisbon serves as the political, economic, and cultural center of Portugal.\r\n\r\n\r\n\r\n\r\n
243	Hanoi is the capital city of which country?	medium	2	Hanoi is the capital city of Vietnam. It is located in the northern part of the country and is the second-largest city in Vietnam after Ho Chi Minh City (formerly Saigon). Hanoi has a long and rich history, dating back over a thousand years, and it has served as the political and cultural center of Vietnam for many centuries. The city is known for its historic temples, French colonial architecture, bustling markets, and vibrant street life. Hanoi is a popular destination for tourists seeking to experience Vietnam's unique culture and heritage.\r\n\r\n\r\n\r\n\r\n
245	What capital city is known as the "city of love"?	medium	2	The capital city that is known as the "city of love" is Paris. Paris is the capital of France and is often referred to as the "City of Love" due to its romantic ambiance, iconic landmarks, and reputation as a destination for couples and romantics. The city is renowned for its beautiful architecture, charming streets, world-class museums, and picturesque locations, making it a popular spot for romantic getaways and proposals. The Eiffel Tower, in particular, has become a symbol of love and is a popular spot for couples to visit and enjoy breathtaking views of the city.\r\n\r\n\r\n\r\n\r\n
246	What is the largest island in The Mediterranean?	medium	2	The largest island in the Mediterranean Sea is Sicily. Sicily is an autonomous region of Italy and is located just off the southern tip of the Italian mainland. It is a diverse and historically rich island, known for its beautiful landscapes, ancient ruins, and unique cultural heritage. With its strategic location at the center of the Mediterranean, Sicily has been a crossroads of various civilizations throughout history, leaving behind a fascinating blend of influences from ancient Greek, Roman, Arab, and Norman cultures.\r\n\r\n\r\n\r\n\r\n
247	What is the currency of Sweden?	medium	2	The currency of Sweden is the Swedish Krona, abbreviated as SEK (Swedish Krona). It is the official currency of Sweden and is used in everyday transactions throughout the country. The symbol for the Swedish Krona is "kr." The currency is further divided into 100 smaller units called "öre," although öre coins are no longer in circulation since 2010, and all payments are now rounded to the nearest whole Krona.\r\n\r\n\r\n\r\n\r\n
248	To which country do the Canary Islands belong?	medium	2	The Canary Islands belong to Spain. The Canary Islands are an archipelago located off the northwest coast of Africa, in the Atlantic Ocean. They are an autonomous community of Spain and are composed of seven main islands: Tenerife, Gran Canaria, Lanzarote, Fuerteventura, La Palma, La Gomera, and El Hierro. The Canary Islands are known for their beautiful beaches, volcanic landscapes, and mild climate, making them a popular tourist destination for travelers from around the world.\r\n\r\n\r\n\r\n\r\n
249	In which city would you find La Sagrada Familia?	medium	2	La Sagrada Família is located in the city of Barcelona, Spain. It is a famous basilica designed by the renowned architect Antoni Gaudí. La Sagrada Família is one of the most iconic landmarks in Barcelona and is known for its unique and intricate architectural style, blending Gothic and Art Nouveau elements. Construction of the basilica began in 1882 and is still ongoing, making it one of the longest-running construction projects in history. La Sagrada Família is a UNESCO World Heritage Site and attracts millions of visitors each year who come to admire its breathtaking beauty and Gaudí's visionary design.\r\n\r\n\r\n\r\n\r\n
250	The Strait of Gibraltar separates the Iberian Peninsula from which African country?	medium	2	The Strait of Gibraltar separates the Iberian Peninsula from the African country of Morocco. The strait is a narrow waterway that connects the Atlantic Ocean to the Mediterranean Sea, and it serves as a natural boundary between Europe and Africa. On one side of the strait, you have Spain and the Iberian Peninsula, and on the other side, you have Morocco and the northernmost tip of Africa. The strait is a crucial maritime passage, and its location has made it historically significant for trade and cultural exchange between the two continents.\r\n\r\n\r\n\r\n\r\n
251	What is the name of the microstate located between Spain and France?	medium	2	The name of the microstate located between Spain and France is Andorra. Andorra is a small, landlocked country in the eastern Pyrenees mountains, sharing borders with both Spain and France. It is one of the smallest countries in Europe and is known for its stunning mountainous landscapes, skiing resorts, and duty-free shopping. Andorra has a unique political system with a co-principality, where the President of France and the Bishop of Urgell in Spain serve as co-princes of the country. Andorra is a popular destination for tourists, particularly those interested in outdoor activities and nature.\r\n\r\n\r\n\r\n\r\n
252	Dracula famously lived in the historical region of Transylvania - but in what country would you now find his castle?	medium	2	The legendary character of Dracula was inspired by the real-life figure of Vlad the Impaler, a ruler of Wallachia (now part of modern-day Romania) in the 15th century. While Transylvania is often associated with the fictional Dracula, the castle that is commonly linked to the character is Bran Castle.\r\n\r\nBran Castle, also known as "Dracula's Castle," is located in Bran, a small town in Transylvania, Romania. It is a popular tourist attraction due to its association with the Dracula legend. Although there is no historical evidence linking Vlad the Impaler to Bran Castle, it is often depicted as the residence of the fictional vampire Count Dracula in Bram Stoker's novel, "Dracula." Today, the castle serves as a museum, and visitors can explore its Gothic architecture and the myth surrounding the Dracula tale.
255	Which animal appears on the flag of Sri Lanka?	medium	2	The animal that appears on the flag of Sri Lanka is the lion. The Sri Lankan flag features a gold lion holding a sword on a maroon background, surrounded by four bo leaves in each corner. The lion symbolizes bravery and strength, while the bo leaves represent Buddhism, which holds significant importance in the country's culture and history.\r\n\r\n\r\n\r\n\r\n
256	Which European country uses .es at the end of their internet addresses?	medium	2	The European country that uses ".es" at the end of their internet addresses is Spain. Websites that belong to entities or individuals based in Spain typically have domain names ending with ".es." This domain extension is specific to Spain and is commonly used for websites related to businesses, organizations, and individuals within the country.\r\n\r\n\r\n\r\n\r\n
257	Astana was the capital city of which country?	medium	2	Astana was the former capital city of Kazakhstan. In 2019, the capital was officially changed to Nursultan in honor of Nursultan Nazarbayev, who served as the President of Kazakhstan for almost three decades. Before the name change, Astana was the capital city from 1997 to 2019 and played a significant role in the country's political, economic, and cultural landscape.\r\n\r\n\r\n\r\n\r\n
377	Which American singer and actress starred in the musical film "The Sound of Music"?	medium	3	The American singer and actress who starred in the musical film "The Sound of Music" is Julie Andrews. Julie Andrews played the lead role of Maria von Trapp in the 1965 film adaptation of the Broadway musical "The Sound of Music." Her portrayal of Maria, a free-spirited governess who brings music and love to the von Trapp family, was widely praised and contributed to the film's immense success. "The Sound of Music" is considered one of the most beloved and iconic musical films of all time, and Julie Andrews' performance remains a cherished part of its legacy.\r\n\r\n\r\n\r\n\r\n
260	The Bering Strait separates two countries by only 2.4 miles (3.8 kilometers) at their closest points. Name these two countries.	hard	2	The Bering Strait separates the United States and Russia at their closest points. On the Russian side, you have the Chukotka Autonomous Okrug, and on the U.S. side, you have the state of Alaska. The narrow strait plays a crucial role in the geography of the region, serving as a natural bridge between the continents of Asia and North America.\r\n\r\n\r\n\r\n\r\n
277	In which sea does the Volga discharge?	hard	2	The Volga River discharges into the Caspian Sea. The Caspian Sea is the largest enclosed inland body of water on Earth and is bordered by several countries, including Russia, Iran, Kazakhstan, Turkmenistan, and Azerbaijan. The Volga River is the longest river in Europe and plays a crucial role in the region's economy and transportation, as it serves as a major waterway for trade and travel.\r\n\r\n\r\n\r\n\r\n
261	In which region of the world can you find the "Ring of Fire"?	hard	2	The "Ring of Fire" is a region in the world where a large number of earthquakes and volcanic eruptions occur. It is a horseshoe-shaped area encircling the Pacific Ocean, encompassing several countries from the Americas to Asia. The countries that are part of the Ring of Fire include the western coasts of North America (such as the United States, Canada, and Mexico), countries along the western coast of South America (such as Chile and Peru), countries in East Asia (such as Japan, Indonesia, and the Philippines), and several islands in the Pacific Ocean.\r\n\r\nThis region is highly geologically active due to the movement of tectonic plates, making it prone to seismic activity and volcanic eruptions. The "Ring of Fire" is known for its frequent earthquakes, numerous active volcanoes, and frequent tsunamis, making it one of the most geologically active and potentially hazardous regions on Earth.
262	What is the lowest recorded temperature ever recorded on the surface of Antarctica?	hard	2	The lowest recorded temperature ever recorded on the surface of Antarctica was minus 128.6 degrees Fahrenheit (minus 89.2 degrees Celsius). This extreme low temperature was recorded at the Soviet Union's Vostok Station on July 21, 1983. Vostok Station is located near the center of the East Antarctic Ice Sheet and experiences some of the most frigid temperatures on Earth due to its high elevation, clear skies, and isolation from maritime influences.\r\n\r\n\r\n\r\n\r\n
263	Which two countries does the Darien Gap span across?	hard	2	The Darien Gap is a geographical region located between two countries: Panama and Colombia. It is a dense and treacherous swathe of jungle and marshland that forms an impassable barrier for vehicles traveling between Central and South America. The absence of a continuous road or established transportation route through the Darien Gap makes it a challenging and dangerous area to navigate, contributing to the division between North and South America's road networks. As a result, travelers typically need to use alternative means of transportation, such as boats or planes, to cross this region.\r\n\r\n\r\n\r\n\r\n
265	In which South American country will you find the Atacama Desert?	hard	2	The Atacama Desert is located in Chile, a South American country. It is one of the driest deserts in the world and stretches along the Pacific coast of northern Chile. The Atacama Desert is known for its otherworldly landscapes, vast salt flats, and unique geological formations. Due to its extremely arid conditions, some areas of the desert have reported to have not received rainfall for decades. The region's extreme dryness and clear skies also make it an ideal location for astronomical observatories.\r\n\r\n\r\n\r\n\r\n
266	Which country claims sovereignty over the Kerguelen Islands?	hard	2	France claims sovereignty over the Kerguelen Islands. The Kerguelen Islands, also known as the Desolation Islands, are a group of remote and uninhabited islands in the southern Indian Ocean. They are part of the French Southern and Antarctic Lands (TAAF), which is a French overseas territory. Despite their isolation and harsh climate, the islands are of scientific interest and serve as a research base for various scientific studies, particularly in the fields of biology, geology, and meteorology.\r\n\r\n\r\n\r\n\r\n
267	The island of Socotra belongs to which larger archipelago in the Indian Ocean?	hard	2	The island of Socotra does not belong to any larger archipelago in the Indian Ocean. It is an archipelago itself, located in the Arabian Sea, approximately 380 kilometers (236 miles) south of the Arabian Peninsula. The Socotra archipelago consists of several islands, with Socotra being the largest and most well-known among them. The islands are part of Yemen and are known for their unique and diverse flora and fauna, with many endemic species found nowhere else on Earth.\r\n\r\n\r\n\r\n\r\n
268	The city of La Paz in Bolivia holds a record for being the highest capital city in the world. What is the exact elevation of La Paz?	hard	2	The city of La Paz in Bolivia is indeed the highest capital city in the world. The exact elevation of La Paz varies depending on the specific area within the city, as it is situated in a deep valley surrounded by high mountains. However, the average elevation of the city center is approximately 3,650 meters (11,975 feet) above sea level. This high altitude contributes to the city's unique climate and stunning views, making La Paz a popular destination for travelers interested in experiencing high-altitude environments.\r\n\r\n\r\n\r\n\r\n
270	Name the two countries connected by the Palk Strait.	hard	2	The two countries connected by the Palk Strait are India and Sri Lanka. The Palk Strait is a narrow strip of water that separates the southeastern coast of India (Tamil Nadu) from the northern coast of Sri Lanka. It serves as a significant maritime route between the two countries and has historical and cultural importance due to the close proximity and interactions between India and Sri Lanka.\r\n\r\n\r\n\r\n\r\n
271	In which country can you find the Tane Mahuta?	hard	2	Tāne Mahuta, also known as the Lord of the Forest, is located in New Zealand. It is a giant kauri tree and is one of the largest living trees in the world. Tāne Mahuta is situated in the Waipoua Forest, which is part of the Northland region on the North Island of New Zealand. This magnificent tree holds great cultural and spiritual significance for the Māori people and attracts visitors from around the world who come to witness its awe-inspiring presence and learn about its cultural importance.\r\n\r\n\r\n\r\n\r\n
272	The Disappointment Islands, a remote group of coral atolls in the Pacific Ocean, are claimed to be a part of:	hard	2	The Disappointment Islands, also known as the Tuamotus, are a remote group of coral atolls in the Pacific Ocean. They are a part of French Polynesia, which is an overseas collectivity of France. French Polynesia is located in the southern Pacific Ocean and comprises multiple archipelagos, with the Tuamotus being one of the most notable groups of islands in the region. The Disappointment Islands are renowned for their stunning coral reefs, crystal-clear waters, and unique marine life, making them a popular destination for diving and snorkeling enthusiasts.\r\n\r\n\r\n\r\n\r\n
273	What natural resource extraction industry has contributed to the relocation of some buildings in Kiruna, Sweden?	hard	2	The natural resource extraction industry that has contributed to the relocation of some buildings in Kiruna, Sweden, is mining. Kiruna is a town located in the far north of Sweden, within the Arctic Circle, and it is known for its iron ore mining activities. The presence of extensive iron ore deposits has led to significant mining operations in the area.\r\n\r\nOver the years, the underground mining activities have caused subsidence, or ground sinking, in certain parts of Kiruna, including the town center. To ensure the safety and stability of the town, certain buildings and infrastructure have been relocated to new areas further from the active mining areas. This relocation process is a part of a long-term plan to adapt to the impacts of mining and maintain the town's functionality and sustainability.
278	In which country is Lake Ladoga?	hard	2	Lake Ladoga is located in Russia. It is the largest lake in Europe by surface area and is situated in the northwestern part of Russia, near the city of St. Petersburg. Lake Ladoga is known for its stunning natural beauty and is an important freshwater resource for the region. It has historical and cultural significance as well, being a part of the landscape where ancient settlements and civilizations once thrived. Today, the lake attracts tourists and nature enthusiasts from around the world who come to explore its shores and enjoy its serene environment.\r\n\r\n\r\n\r\n\r\n
279	Which chain of mountains would you find between Europe and Asia?	hard	2	The chain of mountains that you would find between Europe and Asia is the Ural Mountains. The Ural Mountains form a natural boundary between the continents of Europe and Asia, extending for about 2,500 kilometers (1,500 miles) from the Arctic Ocean to the Ural River. They pass through Russia and Kazakhstan and are considered one of the traditional boundaries that separate the two continents. The Ural Mountains are of significant geographical and historical importance, and they have influenced the cultural and economic development of the regions on both sides.\r\n\r\n\r\n\r\n\r\n
280	What does UNESCO stand for?	hard	2	UNESCO stands for the United Nations Educational, Scientific, and Cultural Organization. It is a specialized agency of the United Nations (UN) established in 1945, with the primary mission of promoting international cooperation in education, science, culture, and communication. UNESCO works to protect and preserve cultural and natural heritage, promote education for all, support scientific research, and foster intercultural dialogue to build peace and understanding among nations. It is headquartered in Paris, France, and has numerous programs and initiatives that contribute to global development and cooperation in its areas of expertise.\r\n\r\n\r\n\r\n\r\n
281	Which sea can you find in Azerbaijan?	hard	2	In Azerbaijan, you can find the Caspian Sea. The Caspian Sea is the world's largest enclosed inland body of water and is bordered by several countries, including Azerbaijan, Russia, Iran, Kazakhstan, and Turkmenistan. Azerbaijan's eastern coastline stretches along the Caspian Sea, and the country has significant economic and strategic interests related to the sea, including fishing, oil and gas exploration, and transportation. The Caspian Sea holds great ecological importance and serves as a crucial water resource for the countries that surround it.\r\n\r\n\r\n\r\n\r\n
282	What is the capital of New Caledonia?	hard	2	The capital of New Caledonia is Nouméa. Nouméa is the largest city in New Caledonia, which is a French overseas territory located in the southwestern Pacific Ocean. Nouméa is situated on the main island of Grande Terre and serves as the political, economic, and cultural center of the territory. The city is known for its beautiful beaches, vibrant cultural scene, and French-influenced architecture and cuisine.\r\n\r\n\r\n\r\n\r\n
283	In which country can you find the islands of Saaremaa and Hiiumaa?	hard	2	The islands of Saaremaa and Hiiumaa can be found in Estonia. Estonia is a country located in Northern Europe, and it has a coastline along the Baltic Sea. Saaremaa and Hiiumaa are two of the largest islands in Estonia, situated in the Baltic Sea off the western coast of the mainland. They are known for their picturesque landscapes, cultural heritage, and historical landmarks, making them popular destinations for tourists and locals alike.\r\n\r\n\r\n\r\n\r\n
284	Little Havana and Little Haiti are districts of which city?	hard	2	Little Havana and Little Haiti are districts of the city of Miami, Florida, United States. Miami is known for its diverse cultural neighborhoods, and these two districts are vibrant examples of the city's multicultural character.\r\n\r\nLittle Havana is a neighborhood located west of downtown Miami, and it is primarily known for its Cuban community. It offers a taste of Cuban culture, with its authentic Cuban restaurants, cafes, and cultural events.\r\n\r\nLittle Haiti is situated just north of Little Havana and is home to a large Haitian population. It is known for its Haitian Creole-speaking community, Haitian art, music, and cuisine. The neighborhood is a hub of Haitian cultural identity within Miami.\r\n\r\nBoth Little Havana and Little Haiti contribute to Miami's cultural richness and are popular spots for visitors to experience the unique flavors and traditions of their respective communities.
258	Which country has the most pyramids in the world?	medium	2	Sudan actually has the most pyramids in the world. Sudan is home to a vast number of pyramids, particularly in the ancient city of Meroë, which was the capital of the Kingdom of Kush. These pyramids, while less famous than their Egyptian counterparts, are significant historical and archaeological sites, providing valuable insights into the history and culture of ancient civilizations in the region. 
285	In Iceland, you can walk across two tectonic plates, side by side. Which ones, exactly?	hard	2	In Iceland, you can walk across the two tectonic plates, the Eurasian Plate, and the North American Plate. These two plates meet at the Mid-Atlantic Ridge, a massive underwater mountain range that extends through the Atlantic Ocean. The Mid-Atlantic Ridge runs through Iceland from southwest to northeast, effectively splitting the island between the Eurasian Plate to the east and the North American Plate to the west.\r\n\r\nThe fissure created by the diverging tectonic plates is known as the Silfra Fissure and is located in Þingvellir National Park, a popular tourist destination in Iceland. This unique geological feature allows visitors to experience walking or snorkeling directly between the two tectonic plates, offering an incredible opportunity to witness the forces of plate tectonics in action.
286	The Kaliningrad Oblast borders which body of water?	hard	2	The Kaliningrad Oblast borders the Baltic Sea. Kaliningrad Oblast is a Russian exclave located between Poland and Lithuania, with its coastline along the southeastern shore of the Baltic Sea. It is the westernmost part of Russia and is separated from the rest of the country by the territory of Lithuania and Belarus. The Baltic Sea serves as a significant maritime boundary for the Kaliningrad Oblast and has strategic importance for trade, transportation, and naval activities in the region.\r\n\r\n\r\n\r\n\r\n
379	Which musical instrument has six strings and is often associated with country and bluegrass music?	medium	3	The musical instrument that has six strings and is often associated with country and bluegrass music is the acoustic guitar. The acoustic guitar is a versatile and popular instrument in various music genres, but it particularly stands out in country and bluegrass due to its ability to provide rhythm, melody, and accompaniment in these styles of music. In country and bluegrass music, the acoustic guitar often plays a crucial role in defining the sound and setting the rhythm for the songs. Its warm and twangy tones make it a perfect fit for the expressive and storytelling nature of these genres.\r\n\r\n\r\n\r\n\r\n
289	What is the term for singing without any instrumental accompaniment?	easy	3	The term for singing without any instrumental accompaniment is "a cappella." A cappella music relies solely on vocal harmonies and melodies without the use of musical instruments. It often involves multiple singers harmonizing together to create a full and rich musical experience, showcasing the beauty and versatility of the human voice.\r\n\r\n\r\n\r\n\r\n
290	Which famous male singer is known for his hit "Sorry" and "Love Yourself"?	easy	3	The famous male singer known for his hit songs "Sorry" and "Love Yourself" is Justin Bieber. He is a Canadian pop and R&B artist who gained immense popularity at a young age and has since become one of the best-selling music artists in the world. Justin Bieber's catchy melodies and soulful voice have won him a massive global fanbase and critical acclaim in the music industry.\r\n\r\n\r\n\r\n\r\n
291	What do you call the person who conducts an orchestra?	easy	3	The person who conducts an orchestra is called a "conductor." The conductor plays a vital role in leading and guiding the musicians of the orchestra during rehearsals and performances. They use a baton or their hands to indicate the tempo, dynamics, and phrasing of the music, ensuring that all the musicians play together in harmony and follow their interpretation of the musical piece. The conductor's role is crucial in shaping the overall performance and bringing out the best in the orchestra's collective musical talents.\r\n\r\n\r\n\r\n\r\n
292	What is the name of the thin piece of wood that guitarists use to strum the strings?	easy	3	The thin piece of wood that guitarists use to strum the strings is called a "guitar pick" or simply a "pick." Guitar picks come in various shapes, sizes, and materials, and they are held between the fingers or thumb of the guitarist to pluck or strum the strings of the guitar. Using a pick allows guitarists to achieve a consistent and precise sound while playing, and it is a popular accessory for both beginner and experienced guitar players.\r\n\r\n\r\n\r\n\r\n
294	What do you call a group of singers who perform together?	easy	3	A group of singers who perform together is typically called a "choir" or a "chorus." Choirs can be composed of various types of singers, such as sopranos, altos, tenors, and basses, and they often sing in harmony, creating a beautiful blend of voices. Choirs can be found in various settings, including religious institutions, schools, community organizations, and professional musical ensembles. They perform a wide range of music, from classical choral works to contemporary and popular songs, showcasing the power and beauty of collective vocal performances.\r\n\r\n\r\n\r\n\r\n
295	Which band had hits with songs like "Yellow Submarine" and "Hey Jude"?	easy	3	The band that had hits with songs like "Yellow Submarine" and "Hey Jude" is The Beatles. They were a legendary British rock band that gained worldwide fame and success during the 1960s and early 1970s. The Beatles are widely regarded as one of the most influential and iconic music groups in history. Their innovative songwriting, harmonies, and musical experimentation revolutionized the music industry and left a lasting impact on popular culture. "Yellow Submarine" and "Hey Jude" are just a few of the many timeless classics that The Beatles produced during their prolific career.\r\n\r\n\r\n\r\n\r\n
296	Which famous music band had members named John Lennon, Paul McCartney, George Harrison, and Ringo Starr?	easy	3	The famous music band that had members named John Lennon, Paul McCartney, George Harrison, and Ringo Starr is The Beatles. They were a British rock band that rose to international fame and became one of the most influential and successful musical acts in history. With their innovative sound, songwriting, and cultural impact, The Beatles have left a profound and lasting legacy in the world of music. Each member played a crucial role in the band's success, and their individual talents combined to create an extraordinary musical journey that continues to be celebrated by fans worldwide.\r\n\r\n\r\n\r\n\r\n
297	What is the word for a songs main part, often repeated in music?	easy	3	The word for a song's main part, often repeated in music, is "chorus." The chorus is a section of a song that typically contains the main theme or hook, and it is usually repeated several times throughout the song. It serves as a memorable and catchy part of the composition that listeners can easily sing along to and often contains the song's title or key message. The chorus provides a sense of unity and familiarity within the song, making it a central and essential element in many musical compositions.\r\n\r\n\r\n\r\n\r\n
298	Which famous music band has Mick Jagger as its lead singer?	easy	3	The famous music band that has Mick Jagger as its lead singer is The Rolling Stones. The Rolling Stones are a British rock band formed in 1962 and have been one of the most enduring and influential bands in the history of rock music. Mick Jagger's charismatic and energetic stage presence, along with his distinctive voice, has been a defining feature of the band's sound and performances. With hits like "Paint It Black," "Sympathy for the Devil," and "Start Me Up," The Rolling Stones have solidified their place as one of the greatest rock bands of all time.\r\n\r\n\r\n\r\n\r\n
300	What is the word for the speed at which music is played, like "fast" or "slow"?	easy	3	The word for the speed at which music is played is "tempo." Tempo refers to the pace or speed of the musical performance and is usually indicated at the beginning of a musical piece with specific terms or markings. Some common tempo markings include "allegro" for a fast tempo, "andante" for a moderately slow tempo, and "adagio" for a slow and leisurely tempo. The tempo of a piece greatly influences its mood and overall feel, and musicians use tempo as a fundamental aspect of musical interpretation and expression.\r\n\r\n\r\n\r\n\r\n
301	Which famous female singer is known for her hit song "Like a Virgin"?	easy	3	The famous female singer known for her hit song "Like a Virgin" is Madonna. Madonna is an American singer, songwriter, and actress who became a prominent figure in the music industry during the 1980s and has remained a cultural icon ever since. "Like a Virgin" was one of her breakthrough hits and played a significant role in establishing her as a pop superstar. Madonna's career has been marked by numerous chart-topping songs, reinventions of her image, and her influence on pop culture and fashion.\r\n\r\n\r\n\r\n\r\n
303	Who was nicknamed the "king of the Rock and Roll"?	easy	3	Elvis Presley was nicknamed the "king of Rock and Roll." He was an American singer, musician, and actor who became one of the most significant and influential cultural icons in the history of popular music. With his unique style, powerful voice, and energetic performances, Elvis Presley helped popularize rock and roll music during the 1950s and 1960s. His impact on the music industry and his enduring popularity have earned him the title "the king of Rock and Roll," and he remains a beloved figure in the hearts of fans around the world.\r\n\r\n\r\n\r\n\r\n
436	What is the hardest natural substance found on Earth?	easy	4	The hardest natural substance found on Earth is diamond. Diamonds are formed deep within the Earth's mantle under intense pressure and high temperatures. Their exceptional hardness is a result of their unique atomic structure, with carbon atoms arranged in a strong crystal lattice. This hardness makes diamonds highly valued and widely used in various industrial applications, as well as in jewelry and other ornamental items.\r\n\r\n\r\n\r\n\r\n
304	Which Canadian artist sang the love theme in Titanic, My heart will go on?	easy	3	The Canadian artist who sang the love theme "My Heart Will Go On" in the movie Titanic is Céline Dion. The song, composed by James Horner with lyrics by Will Jennings, became an iconic ballad and one of Céline Dion's most well-known and beloved hits. "My Heart Will Go On" was featured in the 1997 film Titanic, directed by James Cameron, and it won the Academy Award for Best Original Song, further cementing its place as a timeless classic in the realm of movie soundtracks.\r\n\r\n\r\n\r\n\r\n
305	Jim Morrison was the lead singer of which band?	easy	3	Jim Morrison was the lead singer of the band "The Doors." The Doors were an American rock band formed in 1965, known for their unique and psychedelic sound, as well as the poetic and enigmatic lyrics of Jim Morrison. As the frontman of The Doors, Morrison became an iconic figure in the 1960s counterculture and a symbol of rebellion and freedom. The band's hits include songs like "Light My Fire," "Riders on the Storm," and "Break On Through (To the Other Side)." Jim Morrison's charisma and distinctive voice contributed to the band's lasting impact on the rock music landscape.\r\n\r\n\r\n\r\n\r\n
307	What type of music is Metallica known for?	easy	3	Metallica is known for playing heavy metal music. They are an American heavy metal band formed in 1981 in Los Angeles, California. Metallica is one of the most influential and commercially successful bands in the history of heavy metal, and they are credited with popularizing the genre to a global audience.\r\n\r\nTheir music often features aggressive guitar riffs, fast-paced drumming, powerful vocals, and intense themes. Metallica's style has evolved over the years, incorporating elements of thrash metal, hard rock, and even orchestral arrangements in some of their later works. With iconic albums like "Master of Puppets," "Ride the Lightning," and their self-titled album commonly known as "The Black Album," Metallica's impact on the heavy metal genre is profound and enduring.
308	Who had a No.1 hit with "Ice Ice Baby"?	easy	3	"Ice Ice Baby" was a No.1 hit for the American rapper Vanilla Ice. The song was released in 1990 and became a massive success, reaching the top of the charts in multiple countries, including the United States, the United Kingdom, and Australia. It was the first hip-hop single to top the Billboard Hot 100 chart, and Vanilla Ice's catchy rap and the memorable sample of Queen and David Bowie's "Under Pressure" contributed to its widespread popularity. "Ice Ice Baby" remains one of the most recognizable and iconic songs from the early 1990s and has since become a nostalgic classic.\r\n\r\n\r\n\r\n\r\n
309	In which video did Michael Jackson first perform his famous moonwalk in 1983?	easy	3	Michael Jackson first performed his famous moonwalk during a performance of "Billie Jean" at the Motown 25: Yesterday, Today, Forever television special on March 25, 1983. The moonwalk, also known as the "backslide," is a dance move in which the dancer appears to be moving backward while sliding their foot forward. Michael Jackson's electrifying performance of the moonwalk during "Billie Jean" became an iconic moment in music and dance history, further solidifying his status as the "King of Pop." The moonwalk became synonymous with Michael Jackson's legendary talent and stage presence.\r\n\r\n\r\n\r\n\r\n
310	With which Cuban-American singer did Shawn Mendes team up with on the track "Senorita"?	easy	3	Shawn Mendes teamed up with Cuban-American singer Camila Cabello on the track "Señorita." The song was released in 2019 and became a massive hit, topping charts in several countries and receiving critical acclaim for the chemistry between the two artists and the catchy Latin-pop sound. "Señorita" was a collaboration that captivated audiences worldwide and showcased the vocal talents of both Shawn Mendes and Camila Cabello.\r\n\r\n\r\n\r\n\r\n
311	Beyonce rose to stardom as part of which girl band?	easy	3	\r\nBeyoncé rose to stardom as part of the girl group Destiny's Child. Destiny's Child was an American R&B and pop group formed in 1990, and it originally featured Beyoncé Knowles, Kelly Rowland, LaTavia Roberson, and LeToya Luckett. Over the years, the group went through various lineup changes, but Beyoncé and Kelly Rowland remained constant members and became the core of the group's success.\r\n\r\nDestiny's Child achieved significant commercial success and popularity in the late 1990s and early 2000s with hits like "Say My Name," "Survivor," and "Bootylicious." Beyoncé's talent and charisma as the lead singer of the group quickly made her a standout, and she later went on to establish a highly successful solo career, becoming one of the most influential and acclaimed artists in the world.
313	Anthony Kiedis, Flea, Chad Smith, and John Frusciante founded which American rock band?	easy	3	\r\nAnthony Kiedis, Flea, Chad Smith, and John Frusciante founded the American rock band Red Hot Chili Peppers. Formed in Los Angeles, California, in 1983, Red Hot Chili Peppers became one of the most successful and influential bands in the alternative rock genre. Their unique fusion of funk, punk rock, and other musical styles contributed to their distinctive sound and energetic performances.\r\n\r\nThe band has released numerous hit albums and singles, including "Under the Bridge," "Californication," and "Give It Away." Over the years, Red Hot Chili Peppers has undergone several lineup changes, but the combination of Anthony Kiedis as the lead vocalist, Flea on bass, Chad Smith on drums, and John Frusciante on guitar became one of their most celebrated lineups, and they produced some of the band's most iconic music.
314	What famous music festival took place in 1969, attracting hundreds of thousands of attendees?	easy	3	The famous music festival that took place in 1969, attracting hundreds of thousands of attendees, was Woodstock. Woodstock Music & Art Fair, often simply referred to as Woodstock, was a historic music festival held from August 15 to August 18, 1969, in Bethel, New York. It was a defining moment of the counterculture movement of the 1960s and became a symbol of peace, love, and music.\r\n\r\nThe festival featured iconic performances from legendary artists of the era, including Jimi Hendrix, Janis Joplin, The Who, Santana, Jefferson Airplane, and many more. Despite facing logistical challenges and an unexpectedly large crowd, Woodstock became a peaceful and legendary gathering, leaving an indelible mark on music and cultural history.
315	In which country did the flamenco music and dance originate?	easy	3	\r\nFlamenco music and dance originated in Spain. Specifically, it developed in the Andalusian region of southern Spain, particularly in the areas of Andalusia, Extremadura, and Murcia. Flamenco is a vibrant and expressive art form that encompasses singing (cante), dancing (baile), guitar playing (toque), and handclaps (palmas) as essential elements of its performance.\r\n\r\nOver the centuries, flamenco has evolved through a rich blend of various cultural influences, including the Romani people, Moorish, Jewish, and Andalusian traditions. It reflects the passion, emotions, and cultural heritage of the people of Andalusia, making it an integral part of Spain's cultural identity. Flamenco is renowned worldwide for its captivating performances and profound expression of human emotions through music and dance.
316	Which classical composer wrote the famous piece "Fur Elise"?	easy	3	\r\nThe famous piece "Für Elise" was written by the classical composer Ludwig van Beethoven. It is one of Beethoven's most well-known and beloved compositions and is often taught to piano students around the world. "Für Elise" is a bagatelle, which is a short, light piece of music, and it was composed around 1810.\r\n\r\nThough the identity of the actual "Elise" for whom the piece was written remains a mystery, "Für Elise" has become a timeless classic and a staple in the piano repertoire. Its graceful and charming melody has captured the hearts of listeners for generations, making it one of Beethoven's most enduring and popular works.
317	Which music genre originated in Jamaica and features offbeat rhythms and prominent basslines?	easy	3	\r\nThe music genre that originated in Jamaica and features offbeat rhythms and prominent basslines is "Reggae." Reggae music developed in the late 1960s and is influenced by various musical styles, including ska, rocksteady, rhythm and blues, and traditional Jamaican folk music.\r\n\r\nThe distinctive sound of reggae is characterized by its emphasis on the "skank" rhythm, which places the emphasis on the second and fourth beats of each measure, creating a syncopated feel. The bassline plays a crucial role in reggae music, providing a deep and driving groove, while the lyrics often address social and political issues, love, and spirituality.\r\n\r\nReggae music gained international popularity in the 1970s, thanks to artists like Bob Marley and The Wailers, and it has since become a globally recognized and beloved genre, spreading its messages of unity and positivity around the world.
319	Which rock band is famous for their hit song "Stairway to Heaven"?	easy	3	The rock band famous for their hit song "Stairway to Heaven" is Led Zeppelin. Led Zeppelin was a British rock band formed in 1968 and is considered one of the greatest and most influential bands in the history of rock music. "Stairway to Heaven" is one of their most iconic and beloved songs, known for its epic length, intricate guitar solos, and powerful vocals.\r\n\r\nReleased in 1971, "Stairway to Heaven" quickly became a classic and a staple of classic rock radio. The song's dynamic shifts and poetic lyrics contributed to its enduring popularity, and it remains one of the most requested and recognized songs in rock music. Led Zeppelin's unique blend of blues, folk, and hard rock elements, along with their legendary live performances, have solidified their place as legends in the rock music genre.
320	What musical term refers to gradually getting louder in volume?	easy	3	The musical term that refers to gradually getting louder in volume is "crescendo." Crescendo is indicated in sheet music by the symbol "<" or "cresc." It instructs the performer to gradually increase the volume of the music over a specific passage or section. The opposite of crescendo is "decrescendo" or "diminuendo," which instructs the performer to gradually decrease the volume of the music. Both crescendo and decrescendo are essential dynamic markings that add expressiveness and emotion to the performance of a piece of music.\r\n\r\n\r\n\r\n\r\n
321	Which famous singer had a hit with the song "Purple Haze"?	easy	3	The famous singer who had a hit with the song "Purple Haze" is Jimi Hendrix. "Purple Haze" is one of Jimi Hendrix's most iconic songs and is considered a classic in the realm of rock music. Released in 1967, the song features Hendrix's innovative guitar playing and psychedelic sound, making it a groundbreaking and influential piece in the rock genre. Jimi Hendrix's unique style and innovative approach to the guitar have solidified his place as one of the greatest guitarists and music artists of all time.\r\n\r\n\r\n\r\n\r\n
322	Who was the lead singer of the band Queen?	easy	3	The lead singer of the band Queen was Freddie Mercury. Freddie Mercury, born Farrokh Bulsara, was a British singer, songwriter, and musician known for his powerful vocals, dynamic stage presence, and exceptional songwriting abilities. As the frontman of Queen, he became one of the most celebrated and influential rock singers in history.\r\n\r\nFreddie Mercury's talent and charisma, along with the musical prowess of his bandmates Brian May, Roger Taylor, and John Deacon, contributed to Queen's massive success. With hits like "Bohemian Rhapsody," "We Will Rock You," and "Somebody to Love," Queen became one of the world's most iconic and beloved rock bands. Even after Freddie Mercury's untimely death in 1991, his legacy and music continue to inspire and resonate with fans worldwide.
323	Which animated Disney movie features the song "Let It Go"?	easy	3	The animated Disney movie that features the song "Let It Go" is "Frozen." "Frozen" was released in 2013 and became a massive hit, captivating audiences of all ages with its heartwarming story, memorable characters, and enchanting music.\r\n\r\n"Let It Go" is one of the film's most popular and iconic songs, sung by the character Elsa, voiced by Idina Menzel. The song showcases Elsa's journey of self-discovery and embracing her powers as she breaks free from societal constraints and embraces her true self. "Let It Go" won the Academy Award for Best Original Song and has become a cultural phenomenon, loved by fans worldwide. The song's powerful message and captivating melody have made it a favorite among Disney fans and a significant part of the movie's enduring popularity.
324	What is the name of the stringed instrument that originated in Hawaii and is played using the fingers?	easy	3	The name of the stringed instrument that originated in Hawaii and is played using the fingers is the "ukulele." The ukulele is a small, four-stringed instrument that is a member of the guitar family. It was introduced to Hawaii by Portuguese immigrants in the late 19th century and quickly became an integral part of Hawaiian music and culture.\r\n\r\nThe ukulele is known for its bright and cheerful sound, and it is played by plucking or strumming the strings with the fingers. It is widely used in various styles of music, from traditional Hawaiian songs to pop, rock, and folk music. The ukulele's compact size and ease of playing have made it a popular instrument for beginners and experienced musicians alike, and it continues to bring joy to players and listeners around the world.
325	Which famous composer wrote the piece "Swan Lake"?	easy	3	The famous composer who wrote the piece "Swan Lake" is Pyotr Ilyich Tchaikovsky. "Swan Lake" is a ballet composed by Tchaikovsky in 1875-1876. The ballet's hauntingly beautiful and evocative music has made it one of the most beloved and frequently performed ballets in the classical repertoire.\r\n\r\n"Swan Lake" tells the story of a princess, Odette, who is transformed into a swan by an evil sorcerer's curse and can only be saved by true love. The ballet's music captures the enchanting and melancholic atmosphere of the story, and Tchaikovsky's compositions for "Swan Lake" have become some of his most iconic and enduring works. The ballet's music, along with its captivating storyline and stunning choreography, continues to captivate audiences in theaters worldwide.
437	What is the name of the force that pulls objects towards the center of the Earth?	easy	4	The force that pulls objects towards the center of the Earth is called gravity. Gravity is a fundamental force of nature that exists between any two objects with mass. The larger the mass of an object, the stronger its gravitational pull. This force keeps everything on the Earth's surface and is responsible for the motion of planets in the solar system, the formation of galaxies, and many other celestial phenomena.\r\n\r\n\r\n\r\n\r\n
327	What is the name of the music festival held annually in the California desert, known for its diverse lineup?	easy	3	The music festival held annually in the California desert, known for its diverse lineup, is called "Coachella Valley Music and Arts Festival," commonly known as "Coachella." Coachella is one of the largest and most famous music festivals in the world, featuring a wide range of musical genres, including rock, pop, hip-hop, electronic dance music, and more.\r\n\r\nFounded in 1999, Coachella takes place in the Coachella Valley near Indio, California, over two weekends in April. The festival attracts thousands of attendees from around the globe and has become a cultural phenomenon, known not only for its music but also for its art installations, fashion, and celebrity sightings. Coachella has hosted some of the biggest names in the music industry and continues to be a highly anticipated event for music lovers and festival-goers worldwide.
328	Which country is known for originating the musical instrument called the "bagpipes"?	easy	3	The musical instrument called the "bagpipes" is known to have originated in Scotland. Bagpipes are a type of wind instrument that consists of an airbag, which is filled by blowing through a blowpipe, and several melody pipes, played by the fingers. Bagpipes have a long history and have been played in various forms throughout many cultures, but they have become particularly associated with Scotland.\r\n\r\nIn Scotland, bagpipes have been an integral part of traditional music and cultural events for centuries. They are often played at various celebrations, gatherings, and military ceremonies, and they have become a symbol of Scottish heritage and identity. Today, bagpipes remain an iconic and beloved instrument in Scottish music and are also appreciated and played in various other countries and musical traditions.
330	In which city did the famous composer Ludwig van Beethoven spend most of his life?	medium	3	The famous composer Ludwig van Beethoven spent most of his life in the city of Vienna, Austria. Vienna was a vibrant musical center during Beethoven's time, and he moved there in his early twenties to study with renowned composers like Haydn. Throughout his career, Beethoven composed some of his most iconic and groundbreaking works while living and working in Vienna, leaving an indelible mark on the world of classical music.\r\n\r\n\r\n\r\n\r\n
331	What is the name of Taylor Swift debut album, released in 2006?	medium	3	Taylor Swift's debut album, released in 2006, is simply titled "Taylor Swift." The album marked the beginning of Taylor Swift's successful music career and introduced her to the country music scene. It featured songs like "Tim McGraw," "Teardrops on My Guitar," and "Our Song," which garnered significant attention and helped Taylor Swift establish herself as a rising star in the music industry.\r\n\r\n\r\n\r\n\r\n
332	Which rock band is famous for hits like "Sweet Child o Mine" and "November Rain"?	medium	3	The rock band famous for hits like "Sweet Child o' Mine" and "November Rain" is Guns N' Roses. These songs are some of the band's most iconic and commercially successful tracks, and they helped propel Guns N' Roses to international fame during the late 1980s and early 1990s. The band's unique blend of hard rock, heavy metal, and classic rock elements, coupled with the distinctive vocals of Axl Rose and the guitar prowess of Slash, solidified their status as one of the most influential and celebrated rock bands in history.\r\n\r\n\r\n\r\n\r\n
334	Who wrote the musical "The Phantom of the Opera"?	medium	3	The musical "The Phantom of the Opera" was written by Andrew Lloyd Webber. The show's music was composed by Andrew Lloyd Webber, with lyrics by Charles Hart and additional lyrics by Richard Stilgoe. "The Phantom of the Opera" is based on the French novel of the same name by Gaston Leroux and has become one of the most successful and beloved musicals in the world since its premiere in 1986. Its captivating story, memorable music, and stunning production have made it a timeless classic in the world of musical theater.\r\n\r\n\r\n\r\n\r\n
335	Which famous composer was deaf during the later years of his life but continued to compose masterpieces?	medium	3	The famous composer who was deaf during the later years of his life but continued to compose masterpieces is Ludwig van Beethoven. Despite losing his hearing in the late 18th and early 19th centuries, Beethoven's remarkable determination and passion for music allowed him to overcome this significant challenge. He continued to create extraordinary works, including symphonies, piano sonatas, and string quartets, during his "late period." Beethoven's ability to compose while deaf is a testament to his genius and remains an inspiring story in the history of classical music.\r\n\r\n\r\n\r\n\r\n
336	"Like a Rolling Stone" is a classic song by which influential singer-songwriter?	medium	3	"Like a Rolling Stone" is a classic song by the influential singer-songwriter Bob Dylan. Released in 1965, the song is considered one of Dylan's most iconic and groundbreaking works. Its poetic and introspective lyrics, combined with Dylan's distinctive voice, helped redefine the landscape of popular music and cemented his status as a leading figure in the folk and rock music movements of the 1960s. "Like a Rolling Stone" remains a timeless and influential piece in the history of music.\r\n\r\n\r\n\r\n\r\n
337	Which popular boy band was formed in South Korea and is known for hits like "DNA" and "Boy With Luv"?	medium	3	The popular boy band formed in South Korea, known for hits like "DNA" and "Boy With Luv," is BTS (Bangtan Sonyeondan). BTS is a globally renowned K-pop group that has achieved immense success and a massive fan following worldwide. "DNA" and "Boy With Luv" are some of their chart-topping songs that have contributed to their widespread popularity and influence in the music industry. BTS's music, performances, and positive messages have earned them a dedicated fanbase and numerous accolades, making them one of the biggest and most influential boy bands in the world.\r\n\r\n\r\n\r\n\r\n
339	What is the name of the electronic dance music (EDM) duo consisting of Alex Pall and Andrew Taggart?	medium	3	The electronic dance music (EDM) duo consisting of Alex Pall and Andrew Taggart is called "The Chainsmokers." The Chainsmokers gained widespread popularity with their hit singles like "Closer," "Don't Let Me Down," and "Roses." Their music blends elements of pop, electronic, and dance genres, and they have achieved significant success and recognition in the music industry since their debut. The duo's energetic performances and catchy melodies have earned them a dedicated fanbase and numerous awards and accolades.\r\n\r\n\r\n\r\n\r\n
340	Which musical features characters such as Jean Valjean, Javert, and Fantine?	medium	3	The musical that features characters such as Jean Valjean, Javert, and Fantine is "Les Misérables." Based on the novel of the same name by Victor Hugo, "Les Misérables" is a critically acclaimed and beloved musical that first premiered in 1980. The story follows the struggles and redemption of characters during the French Revolution, with Jean Valjean as the central protagonist, Javert as his relentless pursuer, and Fantine as a tragic figure. The musical's powerful music and emotional storytelling have made it one of the most enduring and popular productions in the history of musical theater.\r\n\r\n\r\n\r\n\r\n
341	"The Dark Side of the Moon" is a critically acclaimed album by which progressive rock band?	medium	3	"The Dark Side of the Moon" is a critically acclaimed album by the progressive rock band Pink Floyd. Released in 1973, the album is considered one of the greatest and most influential records in the history of music. It features a seamless blend of progressive rock, psychedelic, and experimental elements, and its themes explore topics such as life, death, mental illness, and the human experience. "The Dark Side of the Moon" has received widespread acclaim for its innovative sound, concept, and production, solidifying Pink Floyd's reputation as one of the most important and iconic bands in the rock genre.\r\n\r\n\r\n\r\n\r\n
342	Which legendary soul singer was known for hits like "Respect" and "Natural Woman"?	medium	3	The legendary soul singer known for hits like "Respect" and "Natural Woman" is Aretha Franklin. Aretha Franklin, often referred to as the "Queen of Soul," was one of the most influential and celebrated vocalists in the history of music. Her powerful and soulful voice, coupled with her passionate delivery, made her a prominent figure in the soul and R&B genres. Songs like "Respect" and "Natural Woman" are some of her signature hits and have become timeless classics, contributing to her enduring legacy as a music icon.\r\n\r\n\r\n\r\n\r\n
344	Who composed the famous classical piece "The Four Seasons"?	medium	3	The famous classical piece "The Four Seasons" was composed by Antonio Vivaldi. "The Four Seasons" is a set of four violin concertos, each representing one of the seasons—Spring, Summer, Autumn, and Winter. It is one of Vivaldi's most well-known and beloved works, showcasing his mastery of Baroque music and his ability to vividly evoke the characteristics of each season through music. "The Four Seasons" remains a popular and frequently performed piece in the classical repertoire and continues to captivate audiences with its beauty and brilliance.\r\n\r\n\r\n\r\n\r\n
345	Which country is known for originating the musical instrument called the "didgeridoo"?	medium	3	The musical instrument called the "didgeridoo" originates from Australia. The didgeridoo is a traditional wind instrument created by the Indigenous Australians, particularly the Aboriginal peoples, who have been playing it for thousands of years. It is made from hollowed-out tree trunks or branches and produces a distinctive deep and resonant sound. The didgeridoo has significant cultural and ceremonial importance in Aboriginal Australian traditions and is now recognized and appreciated worldwide as a unique and intriguing musical instrument.\r\n\r\n\r\n\r\n\r\n
346	"I Want to Hold Your Hand" was a breakthrough hit for which iconic band in the 1960s?	medium	3	"I Want to Hold Your Hand" was a breakthrough hit for the iconic band The Beatles in the 1960s. The song was released in 1963 and became one of the band's most successful and best-known songs. It played a significant role in launching The Beatles' international fame, particularly in the United States, where it topped the charts and ignited the "British Invasion" of the American music scene. The success of "I Want to Hold Your Hand" marked the beginning of The Beatles' global dominance and cemented their status as one of the most influential and beloved bands in the history of popular music.\r\n\r\n\r\n\r\n\r\n
347	In which decade did hip-hop music originate?	medium	3	Hip-hop music originated in the 1970s. It emerged in the South Bronx, New York City, during the early 1970s as a cultural movement encompassing music, dance, art, and fashion. Hip-hop music was pioneered by artists like DJ Kool Herc, Grandmaster Flash, and Afrika Bambaataa, who played a significant role in shaping the genre's early sound and style. Over the years, hip-hop has grown into a global cultural phenomenon, becoming one of the most dominant and influential music genres in the world. Its impact on popular culture, as well as its ability to reflect social issues and tell diverse stories, has made hip-hop a powerful and enduring artistic expression.\r\n\r\n\r\n\r\n\r\n
349	Which famous cellist wrote the composition "The Cello Suites"?	medium	3	The composition "The Cello Suites" was written by the famous German composer and cellist Johann Sebastian Bach. The Cello Suites, also known as the Six Suites for Unaccompanied Cello, are a collection of six solo cello pieces composed by Bach. These suites are some of the most significant and well-known works in the cello repertoire and are highly regarded for their technical and musical challenges. Bach's Cello Suites continue to be a source of inspiration for cellists and music lovers worldwide and are considered masterpieces of the Baroque era.\r\n\r\n\r\n\r\n\r\n
350	Which legendary guitarist is known for his rendition of "The Star-Spangled Banner" at the Woodstock Festival in 1969?	medium	3	The legendary guitarist known for his iconic rendition of "The Star-Spangled Banner" at the Woodstock Festival in 1969 is Jimi Hendrix. Jimi Hendrix was a pioneering and influential guitarist, known for his innovative playing style and use of feedback and distortion effects. His performance of the U.S. national anthem during the Woodstock Festival is considered one of the most memorable and influential renditions of the song. Hendrix's version was known for its experimental and improvisational nature, incorporating elements of psychedelic rock and showcasing his exceptional guitar skills. It became an iconic moment in music history and solidified Jimi Hendrix's legacy as one of the greatest guitarists of all time.\r\n\r\n\r\n\r\n\r\n
351	In which country did the famous opera composer Giuseppe Verdi hail from?	medium	3	The famous opera composer Giuseppe Verdi hailed from Italy. Giuseppe Verdi (1813-1901) was one of the most prominent and influential opera composers of the 19th century. He is best known for his numerous operas, which include masterpieces such as "La Traviata," "Rigoletto," "Aida," and "Il Trovatore," among others. Verdi's works have had a profound impact on the world of opera, and his compositions continue to be performed and cherished by audiences worldwide.\r\n\r\n\r\n\r\n\r\n
352	What is the name of the American DJ and record producer known for his collaborations with artists like Usher, Ludacris, and Justin Bieber?	medium	3	The American DJ and record producer known for his collaborations with artists like Usher, Ludacris, and Justin Bieber is DJ Khaled. DJ Khaled, whose real name is Khaled Mohamed Khaled, is a prominent figure in the music industry and is recognized for his work in the hip-hop and R&B genres. He is known for producing hit singles and albums, as well as for his energetic and charismatic personality. DJ Khaled's collaborations with various artists have resulted in several chart-topping songs and have solidified his status as one of the leading producers in the music scene.\r\n\r\n\r\n\r\n\r\n
353	Which band released the album "Rumours," featuring hits like "Go Your Own Way" and "Dont Stop"?	medium	3	The band that released the album "Rumours," featuring hits like "Go Your Own Way" and "Don't Stop," is Fleetwood Mac. "Rumours" is the 11th studio album by the British-American rock band Fleetwood Mac, released in 1977. The album was a massive commercial success and remains one of the best-selling albums of all time. "Go Your Own Way" and "Don't Stop" are two of the most famous and enduring tracks from the album, showcasing the band's signature sound and intricate harmonies. Fleetwood Mac's "Rumours" is considered a classic in the history of rock music and has left a lasting impact on the music industry.\r\n\r\n\r\n\r\n\r\n
354	What is the name of the music festival held annually in Tennessee, known for its diverse lineup and iconic Bonnaroo arch?	medium	3	The music festival held annually in Tennessee, known for its diverse lineup and iconic Bonnaroo arch, is called "Bonnaroo Music and Arts Festival." Bonnaroo takes place in Manchester, Tennessee, and is one of the most popular and renowned music festivals in the United States. The festival features a wide range of music genres, including rock, pop, hip-hop, electronic, and more, attracting music lovers from all over the world. The iconic Bonnaroo arch serves as a symbol of the festival and is a popular spot for photos among attendees.\r\n\r\n\r\n\r\n\r\n
355	Who is known as the "Godfather of Soul" and is famous for songs like "I Got You (I Feel Good)"?	medium	3	The "Godfather of Soul" is James Brown. He was an American singer, songwriter, dancer, and bandleader who became one of the most influential and iconic figures in the history of popular music. James Brown was known for his electrifying performances, dynamic stage presence, and powerful vocals. He was a pioneer of funk music and soul, and his innovative style and energetic stage shows earned him the title "Godfather of Soul." "I Got You (I Feel Good)" is one of his most famous and recognizable songs, showcasing his unique musical talent and charisma. James Brown's contributions to music continue to be celebrated and his impact on the industry is immeasurable.\r\n\r\n\r\n\r\n\r\n
356	What is the name of the British singer-songwriter who released the albums "19," "21," and "25"?	medium	3	The British singer-songwriter who released the albums "19," "21," and "25" is Adele. Adele Laurie Blue Adkins, known professionally as Adele, gained international fame with her powerful and soulful voice, earning her numerous accolades and a massive global fanbase. "19," "21," and "25" are her first three studio albums, released in 2008, 2011, and 2015, respectively. These albums were hugely successful, featuring chart-topping singles like "Chasing Pavements," "Rolling in the Deep," "Someone Like You," and "Hello." Adele's emotive and heartfelt songwriting, coupled with her exceptional vocal range, have made her one of the most celebrated and best-selling artists of her generation.\r\n\r\n\r\n\r\n\r\n
357	Which musical features characters such as Elphaba, Glinda, and the Wizard of Oz?	medium	3	The musical that features characters such as Elphaba, Glinda, and the Wizard of Oz is "Wicked." "Wicked" is a popular and critically acclaimed Broadway musical based on the novel "Wicked: The Life and Times of the Wicked Witch of the West" by Gregory Maguire. It reimagines the story of "The Wizard of Oz" from the perspective of the witches, Elphaba (the Wicked Witch of the West) and Glinda (the Good Witch of the North). The musical delves into their complex relationship, friendship, and the events that lead to their contrasting fates. "Wicked" has captivated audiences with its enchanting music, compelling story, and stunning stage production, making it one of the most successful and beloved musicals of all time.\r\n\r\n\r\n\r\n\r\n
359	Who is the lead vocalist of the rock band Aerosmith?	medium	3	The lead vocalist of the rock band Aerosmith is Steven Tyler. Steven Tyler is known for his powerful and distinctive voice, charismatic stage presence, and iconic performances that have contributed to Aerosmith's success and enduring popularity in the rock music industry.\r\n\r\n\r\n\r\n\r\n
360	Which country music legend is known for hits like "Ring of Fire" and "Folsom Prison Blues"?	medium	3	The country music legend known for hits like "Ring of Fire" and "Folsom Prison Blues" is Johnny Cash. Johnny Cash, also known as "The Man in Black," was a prolific singer-songwriter and one of the most influential figures in country music history. His deep, resonant voice and emotionally charged performances made him a beloved icon in the genre and beyond.\r\n\r\n\r\n\r\n\r\n
361	Which musical instrument is nicknamed the "king of instruments"?	medium	3	The musical instrument that is nicknamed the "king of instruments" is the pipe organ. The pipe organ earned this title due to its grandeur, versatility, and the commanding presence it holds in a wide range of musical settings. Its ability to produce a vast array of sounds through pipes of different shapes and sizes, along with its majestic sound, has earned it a reputation as one of the most impressive and majestic musical instruments.\r\n\r\n\r\n\r\n\r\n
363	In which city did the famous composer Wolfgang Amadeus Mozart live during most of his career?	medium	3	The famous composer Wolfgang Amadeus Mozart lived in the city of Vienna during most of his career. Vienna, Austria's capital, was a significant center of music and culture during the 18th century, and it was in this vibrant city that Mozart composed and premiered many of his greatest works. He spent a considerable portion of his life in Vienna, where he gained recognition as one of the most brilliant and prolific composers in history.\r\n\r\n\r\n\r\n\r\n
364	Who won the Eurovision Song Contest in 2014 with the song "Rise Like a Phoenix"?	medium	3	In 2014, the Eurovision Song Contest was won by Conchita Wurst with the song "Rise Like a Phoenix." Conchita Wurst, the stage persona of Austrian singer Thomas Neuwirth, delivered a powerful and memorable performance that captivated the audience and secured a victory for Austria in the prestigious singing competition. The song's message of resilience and empowerment, combined with Conchita Wurst's stunning vocals and stage presence, made it a standout performance in the competition.\r\n\r\n\r\n\r\n\r\n
365	Which iconic rock band is known for their hit "Hotel California"?	medium	3	The iconic rock band known for their hit "Hotel California" is the Eagles. "Hotel California" is one of the Eagles' most popular and enduring songs, released in 1977 as the title track of their album of the same name. The song's captivating guitar melodies, evocative lyrics, and unique musical arrangement have made it a classic in the rock music genre and a favorite among music enthusiasts around the world.\r\n\r\n\r\n\r\n\r\n
366	In which country did the famous composer Frederic Chopin originate?	medium	3	The famous composer Frédéric Chopin originated from Poland. He was born on March 1, 1810, in Żelazowa Wola, which was part of the Duchy of Warsaw, a client state of the French Empire at that time. Chopin is widely regarded as one of the greatest composers of the Romantic era and is particularly renowned for his exceptional piano compositions and virtuosic performances.\r\n\r\n\r\n\r\n\r\n
368	Which musical features the songs "Memory" and "Mr. Mistoffelees"?	medium	3	The musical that features the songs "Memory" and "Mr. Mistoffelees" is "Cats." "Cats" is a popular musical composed by Andrew Lloyd Webber, based on T.S. Eliot's poetry collection "Old Possum's Book of Practical Cats." The song "Memory" is one of the most well-known and iconic songs from the show, while "Mr. Mistoffelees" is also a memorable and beloved tune. "Cats" first premiered in 1981 and has been a significant success, captivating audiences with its unique storytelling and memorable songs.\r\n\r\n\r\n\r\n\r\n
369	"Livin on a Prayer" and "You Give Love a Bad Name" are popular songs by which rock band?	medium	3	"Livin' on a Prayer" and "You Give Love a Bad Name" are popular songs by the rock band Bon Jovi. Bon Jovi, led by frontman Jon Bon Jovi, achieved significant success in the 1980s and 1990s, becoming one of the most successful rock bands of that era. Both "Livin' on a Prayer" and "You Give Love a Bad Name" are signature hits that have become anthems for the band and are still widely celebrated by fans today.\r\n\r\n\r\n\r\n\r\n
370	Which Italian opera composer is known for works like "La Traviata" and "Rigoletto"?	medium	3	The Italian opera composer known for works like "La Traviata" and "Rigoletto" is Giuseppe Verdi. Verdi, one of the most prominent and influential composers of the 19th century, was a master in the world of opera. His compositions are renowned for their emotional depth, beautiful melodies, and powerful storytelling. "La Traviata" and "Rigoletto" are among his most celebrated and enduring works, and they continue to be performed and cherished by opera enthusiasts worldwide.\r\n\r\n\r\n\r\n\r\n
371	Who was the lead guitarist of the rock band Queen?	medium	3	The lead guitarist of the rock band Queen was Brian May. Brian May is not only a skilled guitarist but also a songwriter, vocalist, and astrophysicist. He co-founded Queen in 1970 with Freddie Mercury and Roger Taylor, and the band went on to become one of the most successful and beloved rock bands in history. Brian May's distinctive guitar style and iconic guitar solos are an integral part of Queen's sound and have left a lasting impact on the world of rock music.\r\n\r\n\r\n\r\n\r\n
380	"Dancing in the Dark" and "Born to Run" are famous songs by which legendary American musician?	medium	3	"Dancing in the Dark" and "Born to Run" are famous songs by the legendary American musician Bruce Springsteen. Bruce Springsteen, often referred to as "The Boss," is a highly influential singer-songwriter and rock musician known for his distinctive voice, energetic performances, and heartfelt songwriting. "Dancing in the Dark" was released in 1984 and became one of Springsteen's biggest hits, while "Born to Run," released in 1975, is considered one of his signature songs and a classic in the rock music canon. Bruce Springsteen's contributions to music have earned him a dedicated fan base and numerous accolades throughout his career.\r\n\r\n\r\n\r\n\r\n
381	What is the stage name for the artist whose real name is Karly-Marina Loaiza?	medium	3	The stage name for the artist whose real name is Karly-Marina Loaiza is "Kali Uchis." Kali Uchis is a Colombian-American singer, songwriter, and record producer. She gained recognition for her unique blend of R&B, soul, reggae, and pop influences, as well as her captivating vocal style and visually distinctive music videos. Kali Uchis has been praised for her artistry and has collaborated with various artists across different genres, solidifying her position as a prominent figure in the contemporary music scene.\r\n\r\n\r\n\r\n\r\n
382	What year did Britney Spears release her hit song "Toxic"?	medium	3	Britney Spears released her hit song "Toxic" in the year 2003. "Toxic" is one of Britney Spears' most successful and iconic songs, known for its catchy melody, alluring vocals, and edgy pop sound. The song received critical acclaim and became a commercial success, reaching the top of the charts in several countries. It is widely regarded as one of Britney Spears' signature songs and remains a popular and beloved track in her discography.\r\n\r\n\r\n\r\n\r\n
383	Which band's signature song is "Bittersweet Symphony"?	medium	3	The band whose signature song is "Bittersweet Symphony" is The Verve. "Bittersweet Symphony" was released in 1997 as the lead single from their album "Urban Hymns." The song features a memorable orchestral arrangement, accompanied by poignant lyrics, and became a massive hit, earning critical acclaim and commercial success. Despite its popularity, the song faced legal controversies due to its use of a sample from an orchestral recording of The Rolling Stones' song "The Last Time." Nonetheless, "Bittersweet Symphony" remains one of the most recognizable and beloved songs by The Verve and in the realm of British alternative rock.\r\n\r\n\r\n\r\n\r\n
385	Whose signature song is "American Pie"?	medium	3	The signature song "American Pie" belongs to the American singer-songwriter Don McLean. Released in 1971 as the title track of his album, "American Pie" is a folk-rock classic that has become one of the most celebrated and enduring songs in music history. The song's poetic lyrics, poignant storytelling, and references to significant events and figures in American culture have made it a beloved anthem, often regarded as one of the greatest songs of all time. Don McLean's "American Pie" continues to resonate with audiences and remains a powerful symbol of American music and nostalgia.\r\n\r\n\r\n\r\n\r\n
386	What was the 1991 album released by Nirvana called?	medium	3	The 1991 album released by Nirvana was called "Nevermind." "Nevermind" was the second studio album by the American rock band Nirvana and became a pivotal release in the history of alternative rock and grunge music. The album featured some of Nirvana's most iconic and influential songs, including "Smells Like Teen Spirit," "Come as You Are," and "Lithium." "Nevermind" propelled Nirvana to worldwide fame and is often credited with bringing grunge and alternative rock into the mainstream during the early 1990s.\r\n\r\n\r\n\r\n\r\n
387	What is Donald Glover's stage name?	medium	3	Donald Glover's stage name is "Childish Gambino." Childish Gambino is the musical alias of Donald Glover, who is a multi-talented artist known for his work as an actor, comedian, writer, producer, and musician. As Childish Gambino, he has released several critically acclaimed albums and has won multiple Grammy Awards for his music. Glover's music under the name Childish Gambino often explores a wide range of themes and musical styles, showcasing his versatility as an artist.\r\n\r\n\r\n\r\n\r\n
388	"In the Air Tonight" is one of the signature songs of which artist?	medium	3	"In the Air Tonight" is one of the signature songs of the British musician Phil Collins. Phil Collins is a highly successful singer, songwriter, and drummer, known for his solo career as well as his work as the lead vocalist of the rock band Genesis. "In the Air Tonight" was released as a single from his debut solo album, "Face Value," in 1981. The song's haunting and atmospheric sound, along with its iconic drum fill, have made it one of Phil Collins' most recognizable and enduring hits. "In the Air Tonight" remains a beloved classic and a significant part of Phil Collins' musical legacy.\r\n\r\n\r\n\r\n\r\n
389	In the classical music era, the composer whose last symphony is often referred to as the "Jupiter Symphony" is:	hard	3	In the classical music era, the composer whose last symphony is often referred to as the "Jupiter Symphony" is Wolfgang Amadeus Mozart. The "Jupiter Symphony" is the nickname given to Mozart's Symphony No. 41 in C major, K. 551. This symphony is widely regarded as one of Mozart's greatest works and is a pinnacle of the classical symphonic form. The nickname "Jupiter" was not given by Mozart himself but is believed to have been added later due to the grandeur and brilliance of the composition, evoking associations with the king of the gods in Roman mythology, Jupiter.\r\n\r\n\r\n\r\n\r\n
391	The traditional Indian stringed instrument known as the sitar has how many main playing strings?	hard	3	The traditional Indian stringed instrument known as the sitar has typically 7 main playing strings. These strings are plucked or strummed with a wire pick, and they run over curved, raised frets. The sitar is a significant instrument in classical Indian music and has a distinct sound that is characterized by its resonant and melodic qualities. The 7 main strings, along with sympathetic strings and a gourd resonator, contribute to the unique and rich timbre of the sitar.\r\n\r\n\r\n\r\n\r\n
392	Who was the influential producer and musician behind albums like "Low," "Heroes," and "Lodger," working with artists like David Bowie and Iggy Pop?	hard	3	The influential producer and musician behind albums like "Low," "Heroes," and "Lodger," working with artists like David Bowie and Iggy Pop, was Brian Eno. Brian Eno is a renowned English musician, composer, and record producer who made significant contributions to the music industry. His work with David Bowie on the "Berlin Trilogy" (consisting of the albums "Low," "Heroes," and "Lodger") and his collaborations with Iggy Pop played a crucial role in shaping the sound and direction of both artists' careers during the 1970s. Eno's innovative and experimental approach to music production and his incorporation of ambient and electronic elements have earned him widespread acclaim and have left a lasting impact on the music world.\r\n\r\n\r\n\r\n\r\n
393	In music theory, what is the term for a chord consisting of four notes, typically made up of the root, third, fifth, and seventh?	hard	3	In music theory, the term for a chord consisting of four notes, typically made up of the root, third, fifth, and seventh, is a "seventh chord." Seventh chords are an essential part of harmony and are widely used in various music genres, including jazz, blues, and classical music. The seventh chord adds an additional layer of complexity and richness to the harmony, making it a common choice for creating tension and resolving to other chords in a musical progression. Depending on the type of seventh chord, it can have different qualities, such as major seventh, minor seventh, dominant seventh, and diminished seventh.\r\n\r\n\r\n\r\n\r\n
394	Which Russian composers work "The Rite of Spring" famously caused a riot during its premiere in Paris in 1913?	hard	3	The Russian composer whose work "The Rite of Spring" famously caused a riot during its premiere in Paris in 1913 was Igor Stravinsky. "The Rite of Spring," or "Le Sacre du printemps" in French, is a groundbreaking ballet and orchestral work that pushed the boundaries of music and dance during its time. The avant-garde and unconventional nature of the music, combined with the innovative choreography by Vaslav Nijinsky, provoked a strong reaction from the audience at the Théâtre des Champs-Élysées in Paris on May 29, 1913. The performance resulted in a notorious riot, with disagreements and disturbances among the audience members, but the work went on to become a pivotal and influential piece in the history of music and the performing arts.\r\n\r\n\r\n\r\n\r\n
395	What is the name of the style of African-American music that emerged in the 1980s and features elements of funk, soul, and R&B, often characterized by its use of drum machines and synthesizers?	hard	3	The name of the style of African-American music that emerged in the 1980s, featuring elements of funk, soul, and R&B, often characterized by its use of drum machines and synthesizers, is "New Jack Swing."\r\n\r\nNew Jack Swing was a popular music genre that integrated traditional R&B and soul sounds with modern hip-hop elements, including the use of drum machines, synthesizers, and rap-style vocals. It was a significant part of the urban music landscape during the late 1980s and early 1990s, with artists like Teddy Riley, Keith Sweat, Bobby Brown, and Janet Jackson being some of the prominent figures associated with the genre. New Jack Swing brought a fresh and danceable sound to the music scene, influencing subsequent styles of R&B and hip-hop.
398	In the opera "The Marriage of Figaro" by Mozart, which character sings the famous aria "Non pi— andrai" in Act 1?	hard	3	In the opera "The Marriage of Figaro" by Mozart, the character who sings the famous aria "Non più andrai" in Act 1 is Figaro himself. "Non più andrai" is an aria sung by Figaro, the witty and clever servant, in which he teases his master, Count Almaviva's page, Cherubino. In the aria, Figaro tells Cherubino that his carefree days as a young page are over, and he will now serve in the military, leaving behind his flirtatious escapades. The lively and humorous aria is one of the highlights of the opera and showcases Mozart's skill in capturing the characters' personalities through music.\r\n\r\n\r\n\r\n\r\n
399	What is the name of the technique used in flamenco guitar playing, where the player rapidly taps the fingers against the guitar strings to produce a percussive sound?	hard	3	The technique used in flamenco guitar playing, where the player rapidly taps the fingers against the guitar strings to produce a percussive sound, is called "rasgueado" or "rasgueo." Rasgueado is an essential and distinctive flamenco guitar technique, characterized by its rapid and rhythmic strumming or flicking motion of the fingers. It allows the guitarist to create a vibrant and expressive percussive effect, adding to the rhythmic complexity and intensity of flamenco music. The rasgueado technique is a challenging skill to master, but it is fundamental to capturing the authentic flamenco guitar sound.\r\n\r\n\r\n\r\n\r\n
400	The "Well-Tempered Clavier" is a collection of solo keyboard music composed by which Baroque composer?	hard	3	The "Well-Tempered Clavier" is a collection of solo keyboard music composed by Johann Sebastian Bach, the renowned Baroque composer and musician. The work is known as "Das Wohltemperierte Klavier" in German. It consists of two volumes, each containing 24 preludes and fugues, written in all major and minor keys, showcasing Bach's mastery of counterpoint and keyboard composition. The "Well-Tempered Clavier" is not only a remarkable musical achievement but also a valuable pedagogical resource for keyboard students and performers, serving as a testament to Bach's profound influence on the development of Western classical music.\r\n\r\n\r\n\r\n\r\n
402	What is the term for a musical composition designed to be performed by an orchestra but not accompanied by a stage action, scenery, or costume?	hard	3	The term for a musical composition designed to be performed by an orchestra but not accompanied by a stage action, scenery, or costume is "symphonic music" or "symphonic work." Symphonic music is a form of classical music that is written for and performed by a symphony orchestra, typically consisting of multiple movements or sections. Unlike an opera or ballet, symphonic music is purely instrumental and does not have any associated stage performance or theatrical elements. It is focused solely on the music and allows the orchestra to showcase its full range of instruments and musical capabilities. Examples of symphonic works include symphonies, overtures, suites, and tone poems.\r\n\r\n\r\n\r\n\r\n
403	In traditional musical notation, what does "ppp" indicate?	hard	3	In traditional musical notation, "ppp" indicates a dynamic marking for extremely soft or pianississimo. The dynamic markings in music are used to indicate the volume or intensity at which a particular section or passage should be played.\r\n\r\nThe standard dynamic markings, from softest to loudest, are:\r\n\r\nppp: pianississimo (very, very soft)\r\npp: pianissimo (very soft)\r\np: piano (soft)\r\nmp: mezzo-piano (moderately soft)\r\nmf: mezzo-forte (moderately loud)\r\nf: forte (loud)\r\nff: fortissimo (very loud)\r\nfff: fortississimo (very, very loud)\r\nSo, when you see "ppp" in the music, it instructs the performers to play the passage or section extremely softly, creating a delicate and intimate sound.
404	Which composers last symphony, known as the "Ninth Symphony," features the famous "Ode to Joy" chorus?	hard	3	The composer whose last symphony, known as the "Ninth Symphony," features the famous "Ode to Joy" chorus is Ludwig van Beethoven. The "Ninth Symphony" is one of Beethoven's most celebrated and iconic works, and it is often regarded as one of the greatest compositions in the history of classical music.\r\n\r\nThe final movement of the "Ninth Symphony" includes the choral setting of Friedrich Schiller's poem "An die Freude" ("Ode to Joy"). The chorus, along with vocal soloists, join the orchestra in a powerful and uplifting expression of joy, unity, and brotherhood. "Ode to Joy" has become a symbol of hope and universal harmony, and it continues to be frequently performed and cherished worldwide.
406	The "Grosse Fuge" is a monumental and complex work composed by which famous German composer as the final movement of his string quartet Op. 130?	hard	3	The "Grosse Fuge" is a monumental and complex work composed by the famous German composer Ludwig van Beethoven as the final movement of his string quartet Op. 130. Beethoven composed this intense and innovative piece in 1825, and it stands as one of his most remarkable and challenging compositions.\r\n\r\nThe "Grosse Fuge" is known for its intricate counterpoint, dramatic shifts in mood, and powerful expression. Initially, it was intended to be the final movement of his String Quartet No. 13 in B-flat major, Op. 130. However, it was so unconventional and demanding that it was later published separately as its own work. Today, the "Grosse Fuge" is considered a masterwork of Beethoven's late period and a significant contribution to the chamber music repertoire.
407	Which African-American singer is often referred to as the "Queen of Gospel" and is known for her powerful and soulful rendition of spirituals like "Strange Fruit"?	hard	3	The African-American singer often referred to as the "Queen of Gospel" and known for her powerful and soulful rendition of spirituals like "Strange Fruit" is Mahalia Jackson. Mahalia Jackson was a legendary gospel singer and civil rights activist, widely recognized for her rich and emotive vocal style. She played a significant role in popularizing gospel music and bringing it to a global audience.\r\n\r\nWhile Mahalia Jackson was primarily known for her gospel repertoire, "Strange Fruit" is not a gospel song. It is a haunting and powerful song that originated as a protest song against racism and the horrors of lynching in the United States. The song was famously performed by Billie Holiday, who is also remembered for her distinctive vocal style and her contributions to jazz and blues music.
409	Which ancient musical instrument, often associated with shepherds, is one of the oldest known wind instruments and is typically made of reed or wood?	hard	3	The ancient musical instrument often associated with shepherds, one of the oldest known wind instruments, and typically made of reed or wood is the "pan flute." The pan flute, also known as the panpipes, is an ancient aerophone instrument consisting of a series of pipes of varying lengths, bound together side by side. Each pipe produces a different pitch when blown into, allowing the player to create melodies by covering and uncovering the open ends with their fingers.
410	The "Vater unser im Himmelreich" is an organ composition attributed to which iconic Baroque composer known for his intricate and virtuosic works?	hard	3	The organ composition "Vater unser im Himmelreich" is attributed to Johann Sebastian Bach, the iconic Baroque composer known for his intricate and virtuosic works. "Vater unser im Himmelreich" is a chorale prelude based on the hymn "Our Father in Heaven," and it is one of Bach's many organ compositions that showcase his exceptional skill as a composer and organist.\r\n\r\nBach's organ works are highly regarded for their complexity, technical brilliance, and deep emotional expression. His contributions to the organ repertoire have left a lasting impact on classical music, and his works continue to be performed and celebrated by organists and music enthusiasts worldwide.
411	Which American composer is known for his minimalist compositions, such as "Music for 18 Musicians" and "Einstein on the Beach"?	hard	3	The American composer known for his minimalist compositions, including "Music for 18 Musicians" and "Einstein on the Beach," is Philip Glass. Philip Glass is one of the most influential and prominent composers in the minimalist music movement, which emerged in the late 20th century. His music is characterized by repetitive patterns, gradual transformations, and a focus on the hypnotic and meditative qualities of sound.\r\n\r\n"Music for 18 Musicians" is one of Glass's most acclaimed and celebrated works, featuring a large ensemble of musicians performing on a variety of instruments. "Einstein on the Beach" is an opera that he collaborated on with Robert Wilson and is renowned for its avant-garde and groundbreaking approach to storytelling and music. Philip Glass's minimalist compositions have had a profound impact on the contemporary classical music scene and have earned him widespread recognition as a leading figure in modern music.
413	In the context of opera, what is the term for a brief musical passage or aria performed by a solo singer reflecting on their emotions and feelings?	hard	3	In the context of opera, the term for a brief musical passage or aria performed by a solo singer reflecting on their emotions and feelings is called a "recitative." Recitatives serve as a bridge between spoken dialogue and formal arias, allowing characters to express their thoughts and emotions in a more speech-like manner while still being accompanied by the orchestra.\r\n\r\n\r\n\r\n\r\n
414	Which famous jazz pianist and composer is known for his improvisational skills and groundbreaking works such as "Maiden Voyage" and "Chameleon"?	hard	3	The famous jazz pianist and composer known for his improvisational skills and groundbreaking works such as "Maiden Voyage" and "Chameleon" is Herbie Hancock. Throughout his illustrious career, Herbie Hancock has been a key figure in the jazz world, pushing musical boundaries and exploring various genres and styles, making him a highly influential and celebrated musician in the history of jazz.\r\n\r\n\r\n\r\n\r\n
416	Which American composers work "Short Ride in a Fast Machine" is known for its energetic and propulsive rhythm?	hard	3	The American composer known for the work "Short Ride in a Fast Machine," which is renowned for its energetic and propulsive rhythm, is John Adams. Written in 1986, this piece has become a popular and frequently performed contemporary orchestral composition, reflecting Adams' distinctive style that often combines minimalism with dynamic and rhythmic intensity.\r\n\r\n\r\n\r\n\r\n
417	In traditional Indian classical music, what is the term for the rhythmic pattern or cycle?	hard	3	In traditional Indian classical music, the term for the rhythmic pattern or cycle is "Tala." Tala is a crucial aspect of Indian classical music and provides the framework for organizing the rhythm and time structure of a musical composition. Each Tala is characterized by a specific number of beats, which are subdivided into different rhythmic patterns. The Tala acts as a guide for the musicians and allows them to maintain a cohesive and structured performance during improvisation and composition.\r\n\r\n\r\n\r\n\r\n
418	Which Italian composer and violinist, known for "The Four Seasons," was a prominent figure in the Baroque period?	hard	3	The Italian composer and violinist known for "The Four Seasons" and a prominent figure in the Baroque period is Antonio Vivaldi. Born in 1678, Vivaldi was a prolific composer, and his most famous work, "The Four Seasons," is a set of four violin concertos that vividly depict different seasons of the year. Vivaldi's contributions to Baroque music, particularly his innovative use of the violin, have had a lasting impact on the world of classical music.\r\n\r\n\r\n\r\n\r\n
419	The "Symphony of Psalms" is a notable choral work by which Russian composer, famous for his ballets "The Firebird" and "The Rite of Spring"?	hard	3	The "Symphony of Psalms" is a notable choral work by the Russian composer Igor Stravinsky. He is famous for his innovative and influential compositions, including the ballets "The Firebird" and "The Rite of Spring." Stravinsky's works often challenged traditional musical conventions and are considered groundbreaking in the realm of 20th-century classical music. The "Symphony of Psalms" is one of his significant compositions, incorporating powerful choral writing and a unique blend of sacred and secular elements.\r\n\r\n\r\n\r\n\r\n
421	Which complex polyrhythmic style of music originated in Cuba and is characterized by its intricate percussion patterns?	hard	3	The complex polyrhythmic style of music that originated in Cuba and is characterized by its intricate percussion patterns is called "Afro-Cuban music" or "Cuban music." This genre blends African and Spanish musical elements, creating a rich and diverse rhythmic tapestry. Some prominent Afro-Cuban musical styles include Rumba, Son, Mambo, and Cha-Cha-Chá. The percussion instruments like congas, bongos, timbales, and clave play a central role in driving the rhythmic complexities and infectious grooves that define this vibrant genre. Afro-Cuban music has had a profound influence on various other genres, including jazz, salsa, and Latin jazz.\r\n\r\n\r\n\r\n\r\n
422	"The Stars and Stripes Forever" is a patriotic American march composed by which influential conductor known as "The March King"?	hard	3	"The Stars and Stripes Forever" is a patriotic American march composed by John Philip Sousa, who is widely known as "The March King." Born in 1854, Sousa was a highly influential conductor, composer, and bandleader in the late 19th and early 20th centuries. He is best remembered for his numerous marches, including "The Stars and Stripes Forever," which has become an enduring symbol of American patriotism and is often regarded as one of the greatest marches ever composed. Sousa's contributions to American music and the military band tradition have left a lasting legacy in the country's musical history.\r\n\r\n\r\n\r\n\r\n
424	Which early 20th-century Austrian composer is known for his expressionistic atonal works, such as "Pierrot Lunaire"?	hard	3	The early 20th-century Austrian composer known for his expressionistic atonal works, including "Pierrot Lunaire," is Arnold Schoenberg. Born in 1874, Schoenberg was a pivotal figure in the development of atonal and twelve-tone music. "Pierrot Lunaire," composed in 1912, is one of his most famous works, combining spoken words with a unique vocal style called Sprechstimme and a dissonant, atonal musical language. Schoenberg's innovative approaches to composition and his significant contributions to the Second Viennese School have had a profound impact on the course of Western classical music.\r\n\r\n\r\n\r\n\r\n
425	The influential rock band "The Velvet Underground" was formed by Lou Reed and which avant-garde artist known for her work in various artistic fields?	hard	3	The influential rock band "The Velvet Underground" was formed by Lou Reed and the avant-garde artist known for her work in various artistic fields is Nico (born Christa Päffgen). Nico was a German singer, songwriter, model, and actress who became associated with the band in the mid-1960s. She contributed vocals and played the harmonium on some of their early recordings, making significant contributions to their unique sound. Nico's collaboration with The Velvet Underground added a distinctive element to their music and contributed to the band's artistic and experimental reputation during the 1960s.\r\n\r\n\r\n\r\n\r\n
427	Which Indian musical instrument, similar to a zither, is commonly used in the Hindustani classical music tradition?	hard	3	The Indian musical instrument, similar to a zither, that is commonly used in the Hindustani classical music tradition is the "Santoor." The Santoor is a trapezoid-shaped hammered dulcimer, and it has a set of strings that are struck with small mallets, creating beautiful and intricate melodies. It has its origins in the ancient Persian santur and was adapted and popularized in Indian classical music, adding a distinctive and enchanting sound to the musical repertoire.\r\n\r\n\r\n\r\n\r\n
428	Which American composer is known for his minimalist masterpiece "In C," where musicians play short musical phrases repeatedly with some flexibility in tempo?	hard	3	The American composer known for his minimalist masterpiece "In C," where musicians play short musical phrases repeatedly with some flexibility in tempo, is Terry Riley. Composed in 1964, "In C" is considered one of the seminal works of minimalist music. The piece consists of 53 short musical phrases in the key of C, and the performers are instructed to repeat these phrases with some degree of freedom in tempo, leading to a constantly shifting and evolving musical landscape. Terry Riley's innovative approach to composition in "In C" had a profound influence on the development of minimalist music and contemporary classical music as a whole.\r\n\r\n\r\n\r\n\r\n
429	The "Dies irae" is a famous medieval chant often used in requiem masses. To which musical era does this chant belong?	hard	3	The "Dies irae" is a famous medieval chant that belongs to the musical era of Gregorian chant. Gregorian chant, also known as plainchant or plainsong, developed during the medieval period and was primarily used in Christian liturgical settings. The "Dies irae" is a sequence—a type of liturgical chant—that was traditionally used in Catholic requiem masses for the dead. Its text speaks of the Day of Judgment and has been set to music by various composers throughout history, becoming a notable part of the requiem mass tradition. The "Dies irae" is recognized for its haunting and solemn melody, evoking a sense of reverence and contemplation.\r\n\r\n\r\n\r\n\r\n
432	What is the process called when a liquid changes into a gas?	easy	4	The process when a liquid changes into a gas is called "vaporization" or "evaporation." During this process, the molecules of the liquid gain enough energy to overcome the forces of attraction between them and transform into a gaseous state. This can happen at any temperature, but it occurs more rapidly at the liquid's surface when it is exposed to heat or an increase in energy, leading to the formation of gas molecules that escape into the surrounding environment.\r\n\r\n\r\n\r\n\r\n
433	What is the name of the force that makes objects fall to the ground?	easy	4	The force that makes objects fall to the ground is called "gravity." Gravity is a natural force of attraction that exists between any two objects with mass. It pulls objects towards each other and is responsible for keeping us firmly grounded on the Earth's surface. The force of gravity is what causes objects to fall when dropped or released from a higher position, following a path towards the center of the Earth.\r\n\r\n\r\n\r\n\r\n
438	What type of energy do we get from the sun?	easy	4	We get solar energy from the sun. Solar energy is a renewable and abundant form of energy that is harnessed from the sun's rays. It is a type of radiant energy in the form of electromagnetic waves, primarily in the form of visible light and ultraviolet (UV) radiation. Solar energy is essential for life on Earth as it drives various natural processes and is also converted into usable electricity through solar panels and other solar technologies.\r\n\r\n\r\n\r\n\r\n
439	What is the process called when plants lose water through tiny holes in their leaves?	easy	4	The process when plants lose water through tiny holes in their leaves is called transpiration. Transpiration is a crucial part of the water cycle in plants. It involves the movement of water from the roots, up through the plant's stems and leaves, and eventually, it is released into the atmosphere as water vapor through small pores called stomata. This process not only facilitates the transport of water and nutrients within the plant but also helps in regulating its temperature and maintaining its structure.\r\n\r\n\r\n\r\n\r\n
441	What is the liquid that fills most of the Earth's oceans?	easy	4	The liquid that fills most of the Earth's oceans is water. Water covers approximately 71 percent of the Earth's surface and is essential for supporting life on our planet. Oceans are vast bodies of saltwater that play a vital role in regulating the Earth's climate, weather patterns, and providing habitat for a diverse range of marine species. Additionally, water is a critical resource for human activities, agriculture, and various industries, making it one of the most precious and valuable substances on Earth.\r\n\r\n\r\n\r\n\r\n
435	What is the main gas that makes up the air we breathe?	easy	4	The main gas that makes up the air we breathe is nitrogen. It constitutes approximately 78 percent of Earth's atmosphere. Nitrogen is crucial for supporting life as it plays a vital role in various biological processes and is a fundamental component of proteins and DNA.\r\n\r\n\r\n\r\n\r\n
442	What is the name of the closest natural satellite to Earth?	easy	4	The closest natural satellite to Earth is the Moon. The Moon is Earth's only natural satellite, and it orbits our planet at an average distance of about 238,855 miles (384,400 kilometers). It is the fifth-largest satellite in the solar system and has been a subject of fascination and study for humans for millennia. The Moon's gravitational influence is responsible for various phenomena on Earth, such as tides, and it has also played a significant role in the cultural and scientific development of human civilizations.\r\n\r\n\r\n\r\n\r\n
444	What is the name of the process that plants use to make their own food using sunlight?	easy	4	The name of the process that plants use to make their own food using sunlight is called photosynthesis. Photosynthesis is a complex biochemical process that takes place in the chloroplasts of plant cells, primarily in the leaves. During photosynthesis, plants use sunlight, carbon dioxide (CO2), and water (H2O) to produce glucose (a type of sugar) and oxygen (O2). The chlorophyll, a pigment found in chloroplasts, absorbs sunlight and facilitates the conversion of light energy into chemical energy, which is used to synthesize glucose. This process is crucial as it forms the basis of the food chain, providing energy for plants and serving as the primary source of sustenance for all organisms that directly or indirectly depend on plants for nutrition.\r\n\r\n\r\n\r\n\r\n
445	What is the term for the state of matter that has a definite shape and volume?	easy	4	The term for the state of matter that has a definite shape and volume is "solid." In the solid state, the atoms or molecules are closely packed together and arranged in a specific pattern, which gives solids their fixed shape and volume. The intermolecular forces are strong enough to maintain the structural integrity of the material, preventing it from flowing and conforming to the shape of its container. Common examples of solids include ice, wood, metal, and rocks.\r\n\r\n\r\n\r\n\r\n
446	What is the name of the force that makes objects fall at the same rate regardless of their weight?	easy	4	The name of the force that makes objects fall at the same rate regardless of their weight is "gravity." According to Isaac Newton's law of universal gravitation, all objects with mass experience the force of gravity, which pulls them towards each other. Near the surface of the Earth, gravity causes all objects to fall towards the center of the Earth at the same rate, regardless of their weight. This phenomenon is often referred to as "acceleration due to gravity" and is approximately 9.81 meters per second squared (9.81 m/s²) on the Earth's surface. As a result, a feather and a heavy rock, when dropped from the same height, will accelerate and hit the ground at the same time under the influence of gravity alone (assuming no air resistance).\r\n\r\n\r\n\r\n\r\n
447	What gas do we need to breathe in to survive?	easy	4	To survive, we need to breathe in oxygen (O2). Oxygen is essential for the process of respiration in our bodies. During respiration, oxygen is taken in through the lungs and transported by the bloodstream to the cells, where it is used to produce energy through metabolic processes. This energy is required for various bodily functions and activities, allowing us to stay alive and thrive. In addition to oxygen, our exhaled breath contains carbon dioxide, which is a waste product of cellular metabolism and is released from the body during exhalation. Oxygen is crucial for supporting life and is the most critical gas we need to breathe in to sustain ourselves.\r\n\r\n\r\n\r\n\r\n
448	What is the process called when a liquid changes into a solid?	easy	4	The process when a liquid changes into a solid is called "solidification" or "freezing." Solidification occurs when a liquid loses energy (usually in the form of heat) and its particles slow down, coming together in a more ordered and structured arrangement. As a result, the liquid transforms into a solid with a fixed shape and volume. This phase change is the reverse of the process of melting, where a solid changes into a liquid when it gains enough energy to break its ordered structure. Freezing is a common phenomenon observed in nature, such as water freezing into ice at low temperatures.\r\n\r\n\r\n\r\n\r\n
449	What is the name of the largest planet in our solar system?	easy	4	The name of the largest planet in our solar system is "Jupiter." Jupiter is a gas giant and the fifth planet from the Sun. It is known for its massive size and is the largest planet in both mass and volume in our solar system. Jupiter's diameter is approximately 11 times that of Earth, and it has a strong gravitational pull. It is primarily composed of hydrogen and helium and is famous for its Great Red Spot, a giant storm that has been observed for centuries. Jupiter plays a significant role in the dynamics of the solar system and has numerous moons, including four large ones known as the Galilean moons: Io, Europa, Ganymede, and Callisto.\r\n\r\n\r\n\r\n\r\n
490	What is the SI unit of electric current?	medium	4	The SI (International System of Units) unit of electric current is the "ampere," abbreviated as "A." One ampere is defined as the amount of electric charge passing through a given point in a circuit per unit time. It is a fundamental unit in electromagnetism and is used to measure the flow of electric charges in electrical circuits.\r\n\r\n\r\n\r\n\r\n
451	What is the name of the natural satellite that orbits Earth and causes ocean tides?	easy	4	The natural satellite that orbits Earth and causes ocean tides is the Moon. The gravitational pull of the Moon on Earth's oceans creates the phenomenon of tides. As the Moon orbits around the Earth, its gravitational force creates a bulge of water on the side of the Earth facing the Moon and another bulge on the opposite side. These bulges result in the rise and fall of ocean water levels, known as high tides and low tides, respectively. The gravitational influence of the Moon on tides is also complemented by the Sun's gravitational pull, leading to more pronounced spring tides during full moon and new moon phases and neap tides during the first and third quarter moon phases.\r\n\r\n\r\n\r\n\r\n
452	What is the term for the mixture of gases that surrounds the Earth and is essential for supporting life?	easy	4	The term for the mixture of gases that surrounds the Earth and is essential for supporting life is "atmosphere." Earth's atmosphere is a layer of gases that envelops the planet, extending from its surface up into space. It is composed mainly of nitrogen (about 78 percent) and oxygen (about 21 percent), with trace amounts of other gases such as carbon dioxide, water vapor, and argon, among others. The atmosphere plays a vital role in regulating the Earth's temperature, protecting it from harmful radiation, and facilitating various atmospheric processes that are crucial for sustaining life on our planet.\r\n\r\n\r\n\r\n\r\n
453	What is the name of the force that causes objects to float in water?	easy	4	The name of the force that causes objects to float in water is "buoyancy." Buoyancy is an upward force exerted by a fluid (such as water) on an object immersed in it. It opposes the force of gravity, and if the buoyant force is greater than the gravitational force acting on the object, the object will float.\r\n\r\nWhen an object is submerged in a fluid, the fluid exerts pressure on all sides of the object. The pressure is greater at deeper levels due to the weight of the fluid above. The object displaces an amount of fluid equal to its volume, and the buoyant force is equal to the weight of the displaced fluid. If the object is less dense than the fluid, the buoyant force is greater than the gravitational force, causing the object to float. If the object is denser than the fluid, it will sink. This principle explains why objects with lower density, like most boats and swimmers, float in water.
454	What do we call the process of a liquid turning into a gas at temperatures below its boiling point?	easy	4	The process of a liquid turning into a gas at temperatures below its boiling point is called "evaporation." Evaporation occurs when the molecules of the liquid gain enough energy to escape from the surface and form a vapor or gas phase. It is a fundamental part of the water cycle and plays a crucial role in various natural processes, such as the formation of clouds and precipitation.\r\n\r\n\r\n\r\n\r\n
455	What is the name of the shiny, reflective surface that allows you to see your reflection?	easy	4	The shiny, reflective surface that allows you to see your reflection is called a "mirror." Mirrors are typically made of glass with a thin coating of metal, such as aluminum or silver, on one side. When light hits the smooth surface of a mirror, it undergoes reflection, bouncing back at an angle equal to the angle of incidence, which allows you to see an accurate representation of yourself or objects in front of the mirror. Mirrors have various applications in everyday life, from personal grooming to scientific and technological uses.\r\n\r\n\r\n\r\n\r\n
456	What do we call the event that occurs when the Moon passes between the Earth and the Sun, blocking the Sun's light?	easy	4	The event that occurs when the Moon passes between the Earth and the Sun, blocking the Sun's light, is called a "solar eclipse." During a solar eclipse, the Moon's shadow is cast on the Earth's surface, causing a temporary darkening of the sky as the Sun's light is obscured. There are different types of solar eclipses, including total solar eclipses, where the Sun is completely covered by the Moon, and partial solar eclipses, where only a portion of the Sun is obscured. Solar eclipses are remarkable celestial events and have fascinated people throughout history. Remember to use proper eye protection when observing a solar eclipse directly, as looking at the Sun without protection can cause serious eye damage.\r\n\r\n\r\n\r\n\r\n
458	What is the name of the force that allows us to hear sounds?	easy	4	The name of the force that allows us to hear sounds is "sound waves." Sound waves are a type of mechanical wave created by the vibration of objects. When an object, such as a guitar string or a vocal cord, vibrates, it creates a disturbance in the surrounding air molecules. These disturbances propagate through the air as pressure waves, which our ears can detect and interpret as sound.\r\n\r\nThe process of hearing involves the sound waves entering our ears and causing the eardrum to vibrate. These vibrations are then transmitted through the middle ear to the inner ear, where tiny hair cells convert the mechanical vibrations into electrical signals that are sent to the brain. The brain then interprets these signals as sound, allowing us to perceive and understand the sounds around us. Sound is an essential part of communication, music, and our perception of the world.
459	The concept of gravity was discovered by which famous physicist?	easy	4	The concept of gravity was famously described by Sir Isaac Newton, an English physicist, mathematician, and astronomer. Newton formulated the laws of motion and universal gravitation in his seminal work "Philosophiæ Naturalis Principia Mathematica" (Mathematical Principles of Natural Philosophy), often simply referred to as the "Principia," published in 1687. Newton's law of universal gravitation states that every particle in the universe attracts every other particle with a force that is directly proportional to the product of their masses and inversely proportional to the square of the distance between them. This law laid the foundation for our understanding of gravity and became a fundamental principle of classical mechanics. Newton's work has had a profound impact on the field of physics and remains one of the most significant contributions to science in history.\r\n\r\n\r\n\r\n\r\n
460	Humans and chimpanzees share roughly how much DNA?	easy	4	Humans and chimpanzees are very closely related, and they share approximately 98 percent of their DNA. This high degree of genetic similarity is due to the fact that humans and chimpanzees both belong to the same family of great apes (Hominidae) and share a common ancestor that lived several million years ago. Despite the relatively small percentage of genetic differences, these variations have significant effects, leading to the distinct physical and behavioral differences between the two species. The study of the genetic similarities and differences between humans and chimpanzees provides valuable insights into human evolution and the biology of these fascinating primates.\r\n\r\n\r\n\r\n\r\n
462	Which famous British physicist wrote A Brief History of Time?	easy	4	A Brief History of Time was written by the renowned British theoretical physicist, Stephen Hawking. The book, first published in 1988, explores complex scientific concepts, including cosmology, black holes, the nature of time, and the origins of the universe, in a way that is accessible to a general audience. Stephen Hawking was one of the most brilliant minds in theoretical physics, known for his groundbreaking work on black holes, singularities, and the theory of general relativity. A Brief History of Time became an international bestseller and remains one of the most popular science books of all time, making complex scientific ideas more understandable to a wide readership.\r\n\r\n\r\n\r\n\r\n
463	What modern-day country was Marie Curie born in?	easy	4	Marie Curie was born in Poland. Specifically, she was born in Warsaw, which was part of the Russian Empire at the time of her birth in 1867. Marie Curie, whose birth name was Maria Skłodowska, became one of the most influential scientists in history and is best known for her groundbreaking research on radioactivity. She was the first woman to win a Nobel Prize and remains the only person to have received Nobel Prizes in two different scientific fields (Physics and Chemistry). Despite facing significant challenges and discrimination as a woman in the scientific community, her contributions to science and her pioneering work with radioactive elements have left a lasting impact on the field of physics and medicine.\r\n\r\n\r\n\r\n\r\n
464	What was the name of the first man-made satellite launched by the Soviet Union in 1957?	easy	4	The name of the first man-made satellite launched by the Soviet Union in 1957 was "Sputnik 1." Sputnik 1 was a historic achievement and marked the beginning of the space age. It was launched on October 4, 1957, and became the first artificial satellite to orbit the Earth. Sputnik 1 was a small, spherical satellite equipped with four long antennas and transmitted radio signals that were detectable on Earth. Its successful launch and orbiting around the Earth were significant milestones in space exploration and triggered the space race between the United States and the Soviet Union during the Cold War era.\r\n\r\n\r\n\r\n\r\n
465	A male cow is called?	easy	4	A male cow is called a "bull." Bulls are mature male cattle, typically used for breeding purposes or in some agricultural activities like bullfighting (though this practice is controversial and banned in many places). Bulls are generally larger and more muscular than female cows (adult females are commonly referred to as cows) and are known for their distinctive horns, which are present in many cattle breeds. They play a crucial role in cattle farming for maintaining and improving the livestock population.\r\n\r\n\r\n\r\n\r\n
467	What is the boiling point of water?	easy	4	The boiling point of water is 100 degrees Celsius (212 degrees Fahrenheit) at standard atmospheric pressure, which is sea level pressure. At this temperature, water changes from its liquid state to a gaseous state (water vapor) as the vapor pressure equals the atmospheric pressure. However, it's important to note that the boiling point of water can vary with changes in atmospheric pressure. For instance, at higher elevations where the atmospheric pressure is lower, water will boil at temperatures lower than 100 degrees Celsius.\r\n\r\n\r\n\r\n\r\n
469	Which group of animals have scales?	easy	4	The group of animals that have scales is reptiles. Reptiles are a diverse class of cold-blooded vertebrates that include various species of snakes, lizards, turtles, crocodiles, and alligators. Scales are characteristic features of reptiles and serve various functions, including providing protection, reducing water loss, and aiding in locomotion. These scales can vary in size, shape, and texture, depending on the species. Reptiles are found in a wide range of habitats around the world, and their scales are one of the key features that distinguish them from other groups of animals.\r\n\r\n\r\n\r\n\r\n
470	What part of the skeletal system protects the brain?	easy	4	The part of the skeletal system that protects the brain is the "skull." The skull is a bony structure that forms the head and face of vertebrates, including humans. It is made up of several bones that are fused together to create a protective enclosure for the brain and sensory organs, such as the eyes and ears.\r\n\r\nThe brain is one of the most vital organs in the human body, and its protection is of utmost importance. The skull's strong and rigid structure acts as a natural helmet, shielding the brain from external impacts and potential injuries. Additionally, the skull also provides attachment points for muscles and serves as a framework for the facial features.
471	Which scientist proposed the three laws of motion?	easy	4	The three laws of motion were proposed by Sir Isaac Newton, the renowned British physicist and mathematician. These laws are collectively known as "Newton's Laws of Motion" and were first published in his monumental work "Philosophiæ Naturalis Principia Mathematica" (Mathematical Principles of Natural Philosophy) in 1687. Newton's laws laid the foundation for classical mechanics and revolutionized our understanding of how objects move and interact with each other under the influence of forces. The laws describe the relationship between an object's motion and the forces acting upon it and have become fundamental principles in the study of physics. Newton's contributions to science have had a profound and lasting impact on various fields of study.\r\n\r\n\r\n\r\n\r\n
472	Which is the largest animal on earth?	easy	4	\r\nThe largest animal on Earth is the blue whale (Balaenoptera musculus). Blue whales are the largest known animal to have ever existed on our planet. They are magnificent marine mammals belonging to the baleen whale family.\r\n\r\nAdult blue whales can reach lengths of up to 82 to 105 feet (25 to 32 meters) and can weigh as much as 100 to 200 tons (200,000 to 400,000 pounds). Despite their massive size, blue whales are filter feeders and primarily consume tiny shrimp-like animals called krill by taking in large mouthfuls of water and then using their baleen plates to filter out the krill as they expel the water.\r\n\r\nBlue whales are found in oceans worldwide and are known for their distinct blue-gray coloration and mottled appearance. Despite their enormous size, blue whales are not aggressive towards humans and are a protected species due to their vulnerable conservation status. They are truly awe-inspiring creatures and a testament to the wonders of the natural world.
473	Which is the strongest sense in a dog?	easy	4	\r\nThe sense of smell is the strongest sense in a dog. Dogs have an incredibly powerful and acute sense of smell, far superior to that of humans. Their olfactory abilities are estimated to be anywhere from 10,000 to 100,000 times more sensitive than ours.\r\n\r\nDogs' highly developed sense of smell allows them to detect and distinguish a wide range of scents, making them excellent trackers and sniffers. They use their sense of smell to explore the world, locate food, identify other animals and people, and even detect changes in human health, such as detecting certain diseases or conditions.\r\n\r\nBecause of their exceptional olfactory capabilities, dogs are often trained and employed in various roles such as search and rescue operations, drug detection, bomb detection, and as service dogs for individuals with certain medical conditions. Their sense of smell is truly a remarkable and invaluable trait.
474	What is the process by which plants convert light energy into chemical energy?	medium	4	The process by which plants convert light energy into chemical energy is called photosynthesis. During photosynthesis, plants use chlorophyll, a pigment found in their cells, to capture light energy from the sun. This energy is then used to convert carbon dioxide and water into glucose (a type of sugar) and oxygen. The glucose serves as the primary source of energy for the plant, while oxygen is released into the atmosphere as a byproduct. Photosynthesis is a crucial biological process that sustains life on Earth and is the foundation of the food chain as it provides energy for other organisms.\r\n\r\n\r\n\r\n\r\n
475	What is the chemical symbol for water?	medium	4	The chemical symbol for water is H2O. It represents the molecular composition of water, indicating that each water molecule consists of two hydrogen atoms (H) covalently bonded to one oxygen atom (O). Water is a fundamental compound for life, and its unique properties make it essential for various biological and physical processes.\r\n\r\n\r\n\r\n\r\n
476	What is the name of the galaxy that contains our solar system?	medium	4	The name of the galaxy that contains our solar system is the Milky Way Galaxy. The Milky Way is a barred spiral galaxy, and it is estimated to be about 100,000 to 120,000 light-years in diameter. Our solar system is located within one of the spiral arms of the Milky Way, known as the Orion Arm or Local Spur. The Milky Way is home to billions of stars, including our sun, and it also contains various other celestial objects such as planets, moons, comets, and asteroids.\r\n\r\n\r\n\r\n\r\n
477	What is the hardest known mineral on the Mohs scale?	medium	4	The hardest known mineral on the Mohs scale is diamond. Diamond has a Mohs hardness of 10, making it the top-ranking mineral in terms of hardness. The Mohs scale is a system that measures the scratch resistance of various minerals and assigns a value from 1 (softest) to 10 (hardest). Diamond's exceptional hardness and durability make it ideal for industrial uses, cutting tools, and, of course, as a precious gemstone in jewelry.\r\n\r\n\r\n\r\n\r\n
478	Which organ is responsible for filtering waste from the blood in the human body?	medium	4	The organ responsible for filtering waste from the blood in the human body is the kidneys. The kidneys are vital organs located on either side of the spine, below the ribcage. They perform the crucial function of filtering waste products, excess salts, and toxins from the blood to form urine. The urine is then transported to the bladder through the ureters, where it is stored until it is expelled from the body during urination. Additionally, the kidneys play a significant role in maintaining the body's fluid balance, regulating blood pressure, and producing hormones that contribute to various bodily functions.\r\n\r\n\r\n\r\n\r\n
479	Which class of animals does a spider belong to?	medium	4	Spiders belong to the class Arachnida. Arachnids are a diverse group of joint-legged invertebrates that include spiders, scorpions, ticks, mites, and harvestmen (also known as daddy longlegs). Unlike insects, which belong to the class Insecta, arachnids have eight legs and generally have two main body segments—the cephalothorax and the abdomen. Spiders, as part of the Arachnida class, are known for their silk-spinning ability, venomous fangs, and unique predatory behavior.\r\n\r\n\r\n\r\n\r\n
480	What is the basic unit of heredity called?	medium	4	The basic unit of heredity is called a gene. Genes are segments of DNA (deoxyribonucleic acid) that contain the instructions for building and maintaining living organisms. They are responsible for transmitting traits from parents to offspring during reproduction. Genes determine various characteristics, such as physical traits, biochemical processes, and susceptibility to certain diseases. Each gene represents a specific sequence of nucleotides along the DNA molecule, and the combination of genes inherited from both parents contributes to the unique genetic makeup of an individual.\r\n\r\n\r\n\r\n\r\n
482	What gas is primarily responsible for the greenhouse effect on Earth?	medium	4	The gas primarily responsible for the greenhouse effect on Earth is carbon dioxide (CO2). The greenhouse effect is a natural phenomenon that helps to regulate the Earth's temperature and make it suitable for life. When solar radiation reaches the Earth, some of it is absorbed and warms the planet's surface. As the Earth's surface becomes warmer, it emits infrared radiation.\r\n\r\nGreenhouse gases, like carbon dioxide, water vapor, methane, nitrous oxide, and others, trap a portion of this outgoing infrared radiation in the atmosphere. This trapped heat acts like a blanket, keeping the Earth's surface warmer than it would be without the greenhouse effect. This phenomenon is essential for maintaining a relatively stable and habitable climate on our planet. However, human activities, such as burning fossil fuels, deforestation, and industrial processes, have significantly increased the concentration of greenhouse gases in the atmosphere, leading to an enhanced greenhouse effect, global warming, and climate change.
483	Which part of the brain is responsible for regulating balance and coordination?	medium	4	The part of the brain that is primarily responsible for regulating balance and coordination is the cerebellum. The cerebellum is a highly specialized structure located at the back of the brain, beneath the cerebrum. Although it constitutes only a small portion of the brain's total volume, it contains an immense number of neurons.\r\n\r\nThe cerebellum plays a crucial role in coordinating voluntary movements, maintaining posture, and ensuring smooth and balanced muscle actions. It receives sensory information from various parts of the body, including the inner ear (responsible for detecting changes in head position), muscles, and joints. By processing this information and sending precise instructions to the motor cortex, the cerebellum assists in the fine-tuning and synchronization of movements, allowing us to move with accuracy and stability. Damage or dysfunction of the cerebellum can result in difficulties with balance, coordination, and muscle control.
484	What is the term for a single-celled organism with no distinct nucleus?	medium	4	The term for a single-celled organism with no distinct nucleus is "prokaryote." Prokaryotes are a group of simple organisms that lack a membrane-bound nucleus and other membrane-bound organelles found in eukaryotic cells. Instead, their genetic material is located in a region called the nucleoid, which is not enclosed by a membrane.\r\n\r\nBacteria and archaea are the two main domains of life that comprise prokaryotic organisms. These microorganisms are diverse and abundant, playing crucial roles in various ecological processes and environments. In contrast, eukaryotic organisms, including plants, animals, fungi, and protists, possess complex cells with a true nucleus and other membrane-bound organelles.
486	What is the SI unit of force?	medium	4	The SI (International System of Units) unit of force is the Newton, abbreviated as "N." It is named after Sir Isaac Newton, a renowned physicist and mathematician, and is defined as the amount of force required to accelerate a one-kilogram mass at a rate of one meter per second squared (1 m/s²). The Newton is widely used in physics and engineering to measure various forces, such as gravitational force, frictional force, and applied forces.\r\n\r\n\r\n\r\n\r\n
487	What is the chemical symbol for iron?	medium	4	The chemical symbol for iron is "Fe." It comes from the Latin word "ferrum," which refers to the element. Iron is a metallic element with atomic number 26 and is one of the most abundant elements on Earth. It has various important applications in industries, including construction, manufacturing, and transportation, due to its strength and versatility. Additionally, iron plays a crucial role in biological systems, being a vital component of hemoglobin, the protein responsible for transporting oxygen in our blood.\r\n\r\n\r\n\r\n\r\n
488	What is the smallest unit of life that can replicate independently?	medium	4	The smallest unit of life that can replicate independently is the "cell." Cells are the basic building blocks of all living organisms, and they are considered the fundamental unit of life. Each cell is capable of carrying out essential life processes, such as growth, metabolism, and reproduction. They can replicate independently through a process called cell division, where one cell divides into two identical daughter cells. Whether it's a single-celled organism like bacteria or a complex multicellular organism like plants and animals, all life forms are composed of one or more cells.\r\n\r\n\r\n\r\n\r\n
489	What is the chemical formula for methane?	medium	4	The chemical formula for methane is CH₄. Methane is the simplest hydrocarbon and the primary component of natural gas. It consists of one carbon atom bonded to four hydrogen atoms, arranged in a tetrahedral shape. Methane is a colorless, odorless gas at room temperature and is highly flammable. It is a vital greenhouse gas and plays a significant role in the Earth's carbon cycle and climate. Methane is also used as a fuel source for heating, cooking, and electricity generation.\r\n\r\n\r\n\r\n\r\n
492	Which part of the human brain is associated with emotions and long-term memory?	medium	4	The part of the human brain that is associated with emotions and long-term memory is the "limbic system." The limbic system is a group of interconnected brain structures that play a crucial role in regulating emotions, memory, learning, and motivation. One of its key components is the hippocampus, which is responsible for the formation and retrieval of long-term memories. Additionally, other structures within the limbic system, such as the amygdala, are involved in processing emotions and emotional responses. Together, these regions work in coordination to influence our emotional experiences and store important memories throughout our lives.\r\n\r\n\r\n\r\n\r\n
493	What is the name of the twisted-ladder shape that describes the structure of DNA?	medium	4	The twisted-ladder shape that describes the structure of DNA is called the "double helix." The double helix is a well-known and fundamental concept in molecular biology, describing the three-dimensional shape of the DNA molecule. It consists of two long strands of nucleotides (adenine, thymine, cytosine, and guanine) that are twisted around each other in a spiral fashion. The discovery of the DNA double helix by James Watson and Francis Crick in 1953 was a groundbreaking milestone in understanding the mechanism of heredity and the basis of life's genetic code.\r\n\r\n\r\n\r\n\r\n
494	What is the term for the boundary where two tectonic plates are moving away from each other?	medium	4	The term for the boundary where two tectonic plates are moving away from each other is called a "divergent boundary." At divergent boundaries, the plates are pulling apart, and new crust is being created as magma rises from the mantle to fill the gap. These boundaries are typically characterized by mid-ocean ridges on the ocean floor, where new oceanic crust is formed, and by rift valleys on land, where continents may be slowly splitting apart. Divergent boundaries are one of the three main types of plate boundaries, the other two being convergent boundaries (where plates collide) and transform boundaries (where plates slide past each other horizontally).\r\n\r\n\r\n\r\n\r\n
495	Which era is known as the "Age of Dinosaurs"?	medium	4	The era known as the "Age of Dinosaurs" is the "Mesozoic Era." The Mesozoic Era is a geological era that spanned from approximately 252 million years ago to 66 million years ago. It is often referred to as the "Age of Reptiles" because it was a time when dinosaurs, a diverse group of reptiles, dominated the terrestrial ecosystems. The Mesozoic Era is divided into three periods: the Triassic, Jurassic, and Cretaceous periods, during which various groups of dinosaurs thrived and evolved. The era came to an end with the mass extinction event known as the Cretaceous-Paleogene (K-Pg) extinction event, which also led to the extinction of the non-avian dinosaurs and allowed mammals to diversify and become more prominent in the following Cenozoic Era.\r\n\r\n\r\n\r\n\r\n
496	Which neurotransmitter is associated with pleasure and reward in the brain?	medium	4	The neurotransmitter associated with pleasure and reward in the brain is "dopamine." Dopamine is a chemical messenger that plays a crucial role in the brain's reward system and is involved in various functions, including motivation, pleasure, reinforcement learning, and mood regulation. When we experience something pleasurable or rewarding, such as eating good food or receiving praise, dopamine is released in specific brain regions, reinforcing positive behaviors and encouraging us to repeat those actions. This dopamine-mediated reward system is essential for survival and plays a significant role in motivation and shaping our behavior. However, it's important to note that dopamine is just one of many neurotransmitters involved in complex brain functions and is part of a broader network of neural circuits that regulate various aspects of our cognition and emotions.\r\n\r\n\r\n\r\n\r\n
497	What term refers to the variety of life forms in a particular habitat or on Earth as a whole?	medium	4	The term that refers to the variety of life forms in a particular habitat or on Earth as a whole is "biodiversity." Biodiversity encompasses the diversity of all living organisms, including plants, animals, fungi, bacteria, and other microorganisms, along with the ecosystems they inhabit. It is a measure of the richness and variety of life on Earth, both at the species level and within ecosystems. Biodiversity is essential for maintaining ecological balance, sustaining ecosystems, providing ecosystem services, and ensuring the resilience and adaptability of life on our planet. It is a critical component of Earth's natural heritage and plays a significant role in supporting human well-being and the health of the planet as a whole.\r\n\r\n\r\n\r\n\r\n
499	What law states that every action has an equal and opposite reaction?	medium	4	The law that states that every action has an equal and opposite reaction is Newton's third law of motion. This fundamental principle of classical mechanics was formulated by Sir Isaac Newton in the late 17th century. According to Newton's third law, if an object exerts a force on another object, the second object exerts an equal and opposite force back on the first object.\r\n\r\nIn other words, for every action force, there is a reaction force of the same magnitude but in the opposite direction. This law is an essential concept in understanding how forces interact in the physical world, and it has applications in various fields, from engineering to space travel.
500	What is the chemical symbol for gold?	medium	4	The chemical symbol for gold is "Au." The symbol "Au" comes from the Latin word "aurum," which means gold. Gold is a precious metal known for its lustrous yellow color and has been highly valued throughout history for its rarity and beauty. It is widely used in jewelry, coins, and other decorative items, as well as in various industrial applications, electronics, and dentistry.\r\n\r\n\r\n\r\n\r\n
501	What is the largest moon in the solar system?	medium	4	\r\nThe largest moon in the solar system is "Ganymede," which is one of Jupiter's moons. Ganymede is not only the largest moon of Jupiter but also the largest moon in the entire solar system. It is even larger than the planet Mercury. Ganymede's diameter is approximately 5,268 kilometers (3,273 miles), making it even larger than the planet Pluto.\r\n\r\nGanymede is a fascinating moon with a diverse and complex surface, consisting of both heavily cratered regions and more smooth, younger terrains. It also has a subsurface ocean beneath its icy crust, which makes it a significant object of interest for planetary scientists and astrobiologists in the search for potential extraterrestrial life.
502	What is the unit of measurement for electrical resistance?	medium	4	The unit of measurement for electrical resistance is the "ohm," represented by the symbol "Ω" (the Greek letter omega). Electrical resistance is a measure of how much a material or device opposes the flow of electric current through it. One ohm is defined as the amount of resistance that allows one ampere of current to flow through a circuit when one volt of electrical potential difference is applied across it. The ohm is a fundamental unit in electrical engineering and is used to quantify the resistance of various components, such as resistors and conductors, in electrical and electronic circuits.\r\n\r\n\r\n\r\n\r\n
503	What is the name of the boundary between the Earth crust and the mantle?	medium	4	The boundary between the Earth's crust and the mantle is known as the "Mohorovičić discontinuity," often abbreviated as the "Moho." It is named after the Croatian seismologist Andrija Mohorovičić, who discovered the discontinuity in 1909.\r\n\r\nThe Moho is a significant interface that marks the transition from the Earth's outermost layer, the crust, to the underlying mantle. It is characterized by a sudden increase in seismic wave velocities, indicating a change in the composition and physical properties of the rocks between the crust and mantle. The depth of the Moho varies beneath different regions of the Earth, typically ranging from about 5 to 70 kilometers (3 to 43 miles) below the ocean floor and around 20 to 90 kilometers (12 to 56 miles) below the continents.
504	Which part of the human eye is responsible for controlling the amount of light entering the eye?	medium	4	The part of the human eye that is responsible for controlling the amount of light entering the eye is the "iris." The iris is the colored part of the eye that surrounds the pupil, and it functions like a diaphragm of a camera lens. It can contract or dilate the pupil's size, regulating the amount of light that reaches the retina at the back of the eye.\r\n\r\nIn bright conditions, the iris contracts the pupil, reducing its size to limit the amount of light entering the eye. Conversely, in low-light conditions, the iris dilates the pupil, making it larger to allow more light into the eye, thus improving visibility. This dynamic control of the pupil size by the iris is essential for maintaining clear vision under varying light conditions.
506	What is the medical term for high blood pressure?	medium	4	The medical term for high blood pressure is "hypertension." Hypertension is a condition in which the force of blood against the walls of the arteries is consistently too high. It is a significant risk factor for various cardiovascular diseases, including heart attacks, strokes, and kidney problems. Hypertension is often referred to as the "silent killer" because it may not cause noticeable symptoms in the early stages, but if left uncontrolled, it can lead to serious health complications. 
507	What is the name of the prehistoric supercontinent that existed before the continents drifted apart?	medium	4	\r\nThe name of the prehistoric supercontinent that existed before the continents drifted apart is "Pangaea." Pangaea is believed to have formed during the late Paleozoic Era and existed roughly 335 to 175 million years ago.\r\n\r\nThe concept of Pangaea was proposed by Alfred Wegener, a German meteorologist and geophysicist, in the early 20th century as part of his theory of continental drift. According to this theory, Earth's continents were once joined together as a single landmass (Pangaea) and have since drifted apart to their current positions due to the movement of tectonic plates on the Earth's surface. The breakup of Pangaea led to the formation of the modern continents and the arrangement of the continents as we see them today.
509	What term refers to the process of breaking down waste materials by living organisms?	medium	4	The term that refers to the process of breaking down waste materials by living organisms is "decomposition." Decomposition is a natural biological process in which organic matter, such as dead plants, animals, and other organic materials, is broken down by microorganisms like bacteria, fungi, and other detritivores (organisms that feed on dead and decaying matter).\r\n\r\nDuring decomposition, the organic matter is broken down into simpler substances like carbon dioxide, water, and various nutrients, which can then be recycled back into the ecosystem. This process is crucial for nutrient cycling and the recycling of essential elements, making them available for new plant growth and supporting the overall health and balance of ecosystems.
510	Which part of the human digestive system is primarily responsible for nutrient absorption?	medium	4	\r\nThe part of the human digestive system that is primarily responsible for nutrient absorption is the "small intestine." The small intestine is the longest part of the digestive tract and is where most of the digestion and absorption of nutrients from the ingested food takes place.\r\n\r\nAfter food passes through the stomach and enters the small intestine, it mixes with digestive enzymes and bile produced by the liver and pancreas. These enzymes break down carbohydrates, proteins, and fats into smaller molecules that can be absorbed through the walls of the small intestine and into the bloodstream. The inner surface of the small intestine is lined with millions of tiny finger-like projections called villi, which increase the surface area for nutrient absorption.\r\n\r\n
512	Which planet has the Great Red Spot, a massive storm that has been raging for centuries?	medium	4	The planet that has the Great Red Spot is Jupiter. Jupiter is the largest planet in our solar system, and the Great Red Spot is a gigantic storm that has been observed for over 300 years. It is a high-pressure system with winds swirling around it at great speeds, creating its distinctive reddish appearance. Despite its vast size, the exact cause of its longevity and its vivid red coloration is still not completely understood by scientists.\r\n\r\n\r\n\r\n\r\n
513	What is the powerhouse of the cell, responsible for producing energy in the form of ATP?	medium	4	The powerhouse of the cell, responsible for producing energy in the form of ATP (adenosine triphosphate), is the mitochondrion (plural: mitochondria). Mitochondria are double-membraned organelles found in most eukaryotic cells. They play a crucial role in cellular respiration, converting nutrients and oxygen into ATP, which is the primary source of energy that cells use to carry out various functions and processes. This process is known as oxidative phosphorylation and occurs within the inner mitochondrial membrane.
514	What law states that the total electric charge in a closed system remains constant over time?	medium	4	The law that states that the total electric charge in a closed system remains constant over time is known as the "law of conservation of charge." According to this law, electric charge cannot be created or destroyed; it can only be transferred from one object to another or redistributed within a closed system. This principle is a fundamental concept in electromagnetism and is an important aspect of understanding the behavior of electrical systems and interactions between charged particles.\r\n\r\n\r\n\r\n\r\n
515	What is the layer of Earths atmosphere where weather occurs?	medium	4	The layer of Earth's atmosphere where weather occurs is the "troposphere." The troposphere is the lowest layer of the atmosphere, extending from the Earth's surface up to an average height of about 7 to 17 kilometers (4 to 11 miles) depending on the location. It is the layer where most of the Earth's weather phenomena, such as clouds, rain, snow, thunderstorms, and winds, take place. The temperature generally decreases with altitude in the troposphere, making it a dynamic region where various atmospheric processes interact to create our everyday weather patterns.\r\n\r\n\r\n\r\n\r\n
516	Which gland in the human brain regulates sleep-wake cycles and produces melatonin?	medium	4	The gland in the human brain that regulates sleep-wake cycles and produces melatonin is the "pineal gland." The pineal gland is a small, pinecone-shaped gland located deep within the brain, in the center of the head. It plays a crucial role in the body's internal clock and the regulation of circadian rhythms, which control our sleep-wake cycles and various biological processes. The production of the hormone melatonin by the pineal gland is influenced by the amount of light received by the eyes, with melatonin levels typically rising in the evening and remaining high during the night, promoting sleep and helping to regulate our sleep patterns.\r\n\r\n\r\n\r\n\r\n
518	Which mammal species can fly and navigate using echolocation?	medium	4	The mammal species that can fly and navigate using echolocation is the "bat." Bats are unique among mammals as they are the only ones capable of sustained flight. They have specialized wings formed by elongated fingers covered in a thin membrane, which allows them to fly with agility and precision.\r\n\r\nEcholocation is a remarkable adaptation that many bat species possess. They emit high-frequency sound waves, usually through their mouths or noses, and then listen for the echoes that bounce back from surrounding objects. By interpreting these echoes, bats can effectively navigate in complete darkness, locate prey, and avoid obstacles during flight. This extraordinary sensory ability makes bats highly successful nocturnal hunters and allows them to occupy diverse habitats worldwide.
519	What is the medical term for the collarbone?	medium	4	The medical term for the collarbone is the "clavicle." The clavicle is a long, slender bone that connects the sternum (breastbone) to the shoulder blade (scapula) on each side of the body. It is easily palpable and can be felt as a prominent bony structure just below the skin in the front part of the neck, near the base of the throat. The clavicle serves as an important structural component of the shoulder girdle, providing support and stability to the upper limb and allowing for a wide range of arm movements.\r\n\r\n\r\n\r\n\r\n
520	What is the name of the theory that explains the sudden mass extinction of dinosaurs?	medium	4	The theory that explains the sudden mass extinction of dinosaurs and many other species at the end of the Cretaceous period is known as the "asteroid impact theory" or the "impact hypothesis." This theory proposes that a massive asteroid or comet impact on the Earth, around 66 million years ago, was the primary cause of the Cretaceous-Paleogene (K-Pg) extinction event.\r\n\r\nAccording to this theory, the impact of the asteroid or comet would have caused catastrophic changes in the Earth's environment, leading to widespread fires, climate disruption, and a "nuclear winter" effect due to the release of dust and debris into the atmosphere. These dramatic environmental changes are believed to have significantly affected ecosystems worldwide, resulting in the extinction of approximately 75 percent of all species on Earth, including the non-avian dinosaurs. Evidence supporting this theory includes the discovery of a large impact crater called the Chicxulub crater in the Yucatán Peninsula, Mexico, which is dated to the same time as the mass extinction event.
521	What is the study of fungi called?	medium	4	The study of fungi is called "mycology." Mycology is a branch of biology that focuses on the scientific study of fungi, which are a diverse group of organisms separate from plants, animals, and bacteria. Fungi play crucial roles in various ecosystems as decomposers, symbionts, and pathogens. Mycologists study their taxonomy, anatomy, physiology, ecology, and genetics to understand their diversity, evolutionary history, and ecological importance. Additionally, mycology has practical applications in areas such as medicine (e.g., antifungal drugs), agriculture (e.g., biocontrol agents), and food production (e.g., fermentation processes).\r\n\r\n\r\n\r\n\r\n
522	What term refers to the process of converting saltwater into freshwater?	medium	4	The term that refers to the process of converting saltwater into freshwater is "desalination." Desalination is a method used to remove salt and other minerals from seawater, making it suitable for various purposes, including drinking, irrigation, and industrial use. The most common desalination techniques include distillation (such as multi-stage flash distillation and reverse osmosis). As freshwater resources become increasingly scarce in some regions, desalination has become an essential technology to meet the growing demand for clean water.\r\n\r\n\r\n\r\n\r\n
523	What is the force that opposes the motion of objects through a fluid (liquid or gas)?	medium	4	The force that opposes the motion of objects through a fluid (liquid or gas) is called "drag" or "fluid resistance." Drag is a frictional force that acts in the opposite direction to the motion of the object. When an object moves through a fluid, it has to push aside the fluid particles, and this interaction results in the generation of drag.\r\n\r\nThe amount of drag experienced by an object depends on several factors, such as the shape and size of the object, the speed at which it moves through the fluid, and the properties of the fluid itself (e.g., viscosity and density). For example, streamlined and aerodynamic shapes experience less drag compared to objects with irregular shapes.
525	Which spacecraft was launched by NASA in 1977 and has now left the solar system?	medium	4	\r\nThe spacecraft launched by NASA in 1977 and has now left the solar system is the "Voyager 1" probe. Voyager 1 was launched on September 5, 1977, and its primary mission was to study the outer planets of our solar system, including Jupiter and Saturn. After completing its mission objectives, Voyager 1 continued its journey outward, venturing beyond the heliosphere, which is the region dominated by the solar wind and magnetic field from the Sun.\r\n\r\nOn August 25, 2012, Voyager 1 officially became the first human-made object to enter interstellar space, marking its departure from the influence of the Sun and the solar system. Despite its great distance from Earth, Voyager 1 continues to communicate with NASA and send valuable scientific data back to us. It remains one of the most remarkable and enduring space exploration missions in history.
526	What phenomenon describes the bending of light around massive objects due to gravity?	hard	4	The phenomenon that describes the bending of light around massive objects due to gravity is called "gravitational lensing." Gravitational lensing occurs when a massive object, such as a galaxy or a black hole, warps the spacetime around it, creating a gravitational field that can bend the path of light rays passing nearby.\r\n\r\nThis effect was first predicted by Albert Einstein's theory of general relativity in 1915. According to the theory, the presence of mass causes spacetime to curve, and light traveling through this curved spacetime follows a curved path. When a distant light source is perfectly aligned with a massive object and an observer on Earth, the light from the source appears distorted, magnified, or even multiplied, creating multiple images of the same object.
527	Which of the following organelles is responsible for the synthesis of ATP and is often referred to as the "powerhouse" of the cell?	hard	4	ATP (adenosine triphosphate) is the primary source of energy that cells use to carry out various functions and processes. Mitochondria are often referred to as the "powerhouses" of the cell because they produce the majority of ATP needed to fuel cellular activities. This process occurs within the inner mitochondrial membrane, and the ATP generated is then used as an energy currency to drive various cellular functions, including muscle contraction, active transport, and synthesis of molecules.
529	What type of celestial object is a rapidly rotating neutron star that emits beams of radiation from its magnetic poles?	hard	4	A pulsar is a rapidly rotating neutron star, which is the collapsed core of a massive star that underwent a supernova explosion. As the neutron star spins, it emits beams of radiation (including radio waves, X-rays, and gamma rays) from its magnetic poles. These beams are not always aligned with the rotation axis, so as the pulsar rotates, the beams sweep across space, much like a lighthouse beacon.\r\n\r\nWhen one of these beams points towards Earth, we detect regular pulses of radiation at precise intervals, typically ranging from milliseconds to seconds, depending on the pulsar's rotational period. Pulsars are incredibly dense and have extremely strong magnetic fields, making them some of the most exotic and energetic objects in the universe. They were first discovered in 1967 and have since been studied extensively to gain insights into extreme physics, general relativity, and the properties of matter under extreme conditions.
530	What is the value of the mathematical constant "e" (Eulers number) rounded to two decimal places?	hard	4	The value of the mathematical constant "e" (Euler's number) rounded to two decimal places is approximately 2.72. The exact value of "e" is an irrational number and is approximately 2.718281828459045... but when rounded to two decimal places, it becomes 2.72. Euler's number is a fundamental constant in mathematics and has many important applications in various fields, including calculus, number theory, and complex analysis.
531	Which type of rock is formed by the solidification of molten magma?	hard	4	The type of rock that is formed by the solidification of molten magma is called "igneous rock." Igneous rocks are one of the three main types of rocks, along with sedimentary and metamorphic rocks. When magma, which is molten rock material found beneath the Earth's surface, cools and solidifies, it forms igneous rocks.\r\n\r\nThe cooling process can occur either beneath the surface, resulting in intrusive or plutonic igneous rocks, or on the Earth's surface, leading to extrusive or volcanic igneous rocks. 
533	Which sorting algorithm has an average and worst-case time complexity of O(n log n)?	hard	4	\r\nThe sorting algorithm that has an average and worst-case time complexity of O(n log n) is "Merge Sort." Merge Sort is an efficient and stable comparison-based sorting algorithm that divides the input array into smaller sub-arrays, sorts them individually, and then merges the sorted sub-arrays to produce the final sorted output.\r\n\r\nThe key characteristic of Merge Sort is that it consistently divides the input array into halves until the sub-arrays have a single element (which are already sorted by definition), and then it merges them back in a way that maintains the sorted order. Due to this divide-and-conquer approach, Merge Sort achieves an average and worst-case time complexity of O(n log n), making it suitable for large datasets and more efficient than many other sorting algorithms with higher complexities like O(n^2) (e.g., Bubble Sort, Insertion Sort). However, Merge Sort does require additional memory for merging the sub-arrays, which is known as the "auxiliary space" or "buffer," and this can be a consideration when working with constrained memory resources.
534	What concept describes the tendency to remember items at the beginning and end of a list better than those in the middle?	hard	4	The concept that describes the tendency to remember items at the beginning and end of a list better than those in the middle is called the "serial position effect." The serial position effect is a psychological phenomenon observed in memory recall tasks, where participants are asked to remember a list of items in a specific order.\r\n\r\nAccording to this effect, items presented at the beginning of the list are better remembered due to "primacy," which allows more time for these items to be encoded and transferred to long-term memory. Items presented at the end of the list are better remembered due to "recency," as they are still in short-term memory when recall is requested.\r\n\r\nIn contrast, items in the middle of the list tend to be less well remembered because they do not benefit from the primacy and recency effects. The serial position effect is a fundamental aspect of human memory and has been extensively studied in cognitive psychology to understand how information is stored and retrieved from memory.
535	What is the primary greenhouse gas responsible for trapping heat in the Earths atmosphere?	hard	4	The primary greenhouse gas responsible for trapping heat in the Earth's atmosphere is "carbon dioxide" (CO2). Carbon dioxide is a naturally occurring gas that is released into the atmosphere through various natural processes, such as respiration and volcanic activity, as well as human activities, including burning fossil fuels (such as coal, oil, and natural gas) and deforestation.\r\n\r\nGreenhouse gases like carbon dioxide have the ability to absorb and re-emit infrared radiation, which is emitted by the Earth's surface as it absorbs solar energy. These gases trap the heat in the atmosphere, preventing it from escaping into space, a process known as the greenhouse effect. 
536	What is the term used to describe the minimum amount of energy that an atom can gain or lose when transitioning between energy levels?	hard	4	The term used to describe the minimum amount of energy that an atom can gain or lose when transitioning between energy levels is "quantum." In the context of atomic and molecular systems, energy levels are quantized, meaning they can only take on specific discrete values, and transitions between these levels occur in discrete steps.\r\n\r\nThe minimum amount of energy that an atom can gain or lose during these transitions is known as a "quantum of energy" or "quantum of action." This concept is a fundamental aspect of quantum mechanics, a branch of physics that describes the behavior of matter and energy at atomic and subatomic scales. 
537	Which of the following genetic disorders is caused by the deletion of a small portion of chromosome 15 and is characterized by developmental delays and behavioral problems?	hard	4	Angelman syndrome is a rare neurogenetic disorder that primarily affects the nervous system. It is typically caused by the absence or deletion of a segment of the maternal chromosome 15.\r\n\r\nIndividuals with Angelman syndrome often experience developmental delays, intellectual disabilities, speech impairments, and a characteristic happy and excitable demeanor. They may also have motor coordination difficulties, seizures, and sleep disturbances. Behavioral features of Angelman syndrome may include hyperactivity, hand-flapping movements, and a short attention span.
538	Which of the following functional groups is responsible for the unique properties of aldehydes and ketones?	hard	4	In aldehydes, the carbonyl group is located at the end of a carbon chain, and in ketones, it is found within the carbon chain. The presence of the carbonyl group gives aldehydes and ketones several distinctive chemical and physical properties, such as their reactivity in various chemical reactions, their ability to form hydrogen bonds, and their characteristic odor in some cases.\r\n\r\nThe carbonyl group is essential for the formation of many organic compounds, and aldehydes and ketones are widely used in various industrial processes and serve as important building blocks in organic synthesis.
539	What is the name of the hypothetical "surface" beyond which the gravitational pull of a black hole becomes so strong that nothing, not even light, can escape?	hard	4	The hypothetical "surface" beyond which the gravitational pull of a black hole becomes so strong that nothing, not even light, can escape is called the "event horizon." The event horizon is a defining characteristic of black holes and marks the boundary beyond which the escape velocity exceeds the speed of light.\r\n\r\nOnce an object or light passes through the event horizon, it is no longer possible for it to return to the outside universe. This property of the event horizon is why black holes are known as "black" since they do not emit or reflect any light or electromagnetic radiation.\r\n\r\nThe size of the event horizon is directly related to the mass of the black hole. For larger black holes, the event horizon is farther from the singularity (the central point of infinite density), and for smaller black holes, the event horizon is closer to the singularity. The event horizon plays a crucial role in our understanding of the behavior and properties of black holes, as it defines the region from which no information or matter can escape.
540	Which neurotransmitter is associated with mood regulation, sleep, and appetite, and is commonly targeted by antidepressant medications?	hard	4	 Serotonin is a chemical messenger in the brain and the central nervous system that plays a crucial role in various physiological and behavioral processes.\r\n\r\nIn terms of mood regulation, serotonin is involved in modulating emotions and is often referred to as the "feel-good" neurotransmitter. It is associated with feelings of happiness, well-being, and relaxation.\r\n\r\nAdditionally, serotonin is involved in regulating sleep cycles and patterns. It plays a role in the sleep-wake cycle and influences the timing and quality of sleep.\r\n\r\nIn terms of appetite, serotonin is involved in regulating hunger and satiety signals, impacting food intake and metabolism.
541	What elementary particle is responsible for mediating the electromagnetic force and is exchanged in interactions involving electrically charged particles?	hard	4	Photons are fundamental particles of light and electromagnetic radiation. They carry the electromagnetic force, which includes interactions between electrically charged particles, such as electrons and protons.\r\n\r\nWhen charged particles interact, they exchange photons as carriers of the electromagnetic force. For example, when two electrons repel each other due to their like charges, they do so by exchanging virtual photons between them. Similarly, photons are involved in the absorption and emission of light, which is an electromagnetic phenomenon.\r\n\r\nIn quantum field theory, which describes the behavior of particles and forces at the subatomic level, photons are considered force-carrying gauge bosons for the electromagnetic force. They play a crucial role in the interactions between charged particles and are essential for understanding electromagnetism at the quantum level.
543	Which class of antibodies is the first to be produced during an immune response and plays a crucial role in the activation of other immune cells?	hard	4	\r\nThe class of antibodies that is the first to be produced during an immune response and plays a crucial role in the activation of other immune cells is "IgM" (Immunoglobulin M). IgM is one of the five main classes of immunoglobulins (antibodies) present in the human immune system.\r\n\r\nWhen the body encounters a new pathogen or foreign substance, such as a virus or bacterium, B cells in the immune system produce IgM antibodies as the initial response. IgM antibodies are characterized by their pentameric structure, meaning they consist of five antibody units linked together. This pentameric arrangement allows IgM to be efficient in agglutinating (clumping together) and neutralizing pathogens, helping to contain the infection.
544	Which nanomaterial exhibits the phenomenon of plasmon resonance, making it useful in applications like nanoscale imaging and sensing?	hard	4	The nanomaterial that exhibits the phenomenon of plasmon resonance, making it useful in applications like nanoscale imaging and sensing, is "nanoparticles of noble metals," such as gold and silver nanoparticles.\r\n\r\nPlasmon resonance occurs when the free electrons in noble metal nanoparticles collectively oscillate in response to incident light of a specific wavelength. This phenomenon leads to the enhancement of the electric field around the nanoparticles, resulting in intense localized electromagnetic fields, known as "surface plasmon resonance."\r\n\r\nThe strong interaction of light with noble metal nanoparticles during plasmon resonance makes them highly efficient in scattering and absorbing light. This unique property has enabled various applications in nanotechnology, including nanoscale imaging techniques like surface-enhanced Raman spectroscopy (SERS) and surface plasmon resonance spectroscopy (SPR).
546	What is the name of the theoretical framework that seeks to reconcile gravity with the other fundamental forces and is based on the exchange of gravitons?	hard	4	The name of the theoretical framework that seeks to reconcile gravity with the other fundamental forces and is based on the exchange of gravitons is "Quantum Gravity." Quantum Gravity is a branch of theoretical physics that aims to unify the principles of quantum mechanics, which govern the behavior of particles at the smallest scales, with the theory of general relativity, which describes the force of gravity and the curvature of spacetime. Gravitons are hypothetical elementary particles that are postulated to be the carriers of the gravitational force in a quantum theory of gravity.
547	Which organelle is responsible for the synthesis of proteins and is composed of two subunits, large and small, made up of RNA molecules and proteins?	hard	4	The organelle responsible for the synthesis of proteins is the "ribosome." Ribosomes are complex molecular machines found in the cells of all living organisms. They consist of two subunits, a larger one and a smaller one, each composed of both RNA molecules (called ribosomal RNA or rRNA) and proteins. Ribosomes play a crucial role in protein synthesis by decoding the information encoded in messenger RNA (mRNA) and using it to assemble the appropriate sequence of amino acids, which form the primary structure of proteins. This process is called translation and is essential for the functioning and maintenance of all living organisms. Ribosomes can be found free in the cytoplasm or attached to the endoplasmic reticulum in eukaryotic cells.\r\n\r\n\r\n\r\n\r\n
549	What is the name of the region around a black hole where the gravitational pull is so strong that anything entering it is pulled irreversibly toward the singularity?	hard	4	The region around a black hole where the gravitational pull is so strong that anything entering it is pulled irreversibly toward the singularity is called the "event horizon."\r\n\r\nThe event horizon is a theoretical boundary surrounding a black hole beyond which escape becomes impossible, even for light. Once an object crosses the event horizon, it is effectively trapped within the black hole, and no information or signal from inside the event horizon can ever reach an outside observer. The event horizon marks the point of no return, where the gravitational force becomes so intense that not even light can escape from it, giving black holes their characteristic "black" appearance. Any matter or radiation that crosses the event horizon is destined to be drawn inexorably towards the singularity at the center of the black hole, where the gravitational forces are infinitely strong.
550	Which area of the brain plays a vital role in regulating vital functions like breathing, heart rate, and blood pressure?	hard	4	The area of the brain that plays a vital role in regulating vital functions like breathing, heart rate, and blood pressure is called the "medulla oblongata."\r\n\r\nThe medulla oblongata is located in the brainstem, at the base of the brain, just above the spinal cord. It is a critical part of the central nervous system and serves as a control center for many automatic or involuntary processes that are essential for maintaining life. These functions include controlling the rhythm and depth of breathing, regulating heart rate and blood pressure, as well as other reflex actions such as coughing, sneezing, and swallowing.
551	Which principle states that it is impossible to know both the exact position and exact momentum of a particle simultaneously with arbitrary precision?	hard	4	The principle that states that it is impossible to know both the exact position and exact momentum of a particle simultaneously with arbitrary precision is called the "Heisenberg Uncertainty Principle."\r\n\r\nThe Heisenberg Uncertainty Principle is a fundamental concept in quantum mechanics, introduced by the German physicist Werner Heisenberg in 1927. It asserts that there is a fundamental limit to the precision with which certain pairs of physical properties of a particle can be known. In the case of position and momentum, the more precisely we know the position of a particle, the less precisely we can know its momentum, and vice versa.\r\n\r\nMathematically, the Heisenberg Uncertainty Principle is expressed as follows:\r\n\r\nΔx * Δp ≥ ħ / 2\r\n\r\nwhere Δx represents the uncertainty in the particle's position, Δp represents the uncertainty in its momentum, and ħ (pronounced "h-bar") is the reduced Planck constant, a fundamental constant in quantum mechanics.
553	Which of the following types of microorganisms are responsible for converting atmospheric nitrogen into a form that plants can use?	hard	4	The type of microorganisms that are responsible for converting atmospheric nitrogen into a form that plants can use are "Bacteria." Specifically, certain groups of bacteria, known as "nitrogen-fixing bacteria," have the ability to convert nitrogen gas (N2) from the atmosphere into a usable form called "ammonia" (NH3) through a process called "nitrogen fixation."\r\n\r\nNitrogen fixation is a critical step in the nitrogen cycle, as nitrogen gas in the atmosphere is relatively inert and cannot be directly utilized by most living organisms. Plants, in particular, require nitrogen in a more accessible form, such as ammonia, to synthesize essential molecules like proteins and nucleic acids.
554	What is the name of the genetic engineering technique that involves the direct manipulation of an organisms genes using molecular scissors like CRISPR-Cas9?	hard	4	\r\nThe name of the genetic engineering technique that involves the direct manipulation of an organism's genes using molecular scissors like CRISPR-Cas9 is simply referred to as "CRISPR-Cas9" or "CRISPR gene editing."\r\n\r\nCRISPR-Cas9 is a revolutionary and highly efficient gene-editing tool derived from a bacterial defense mechanism against viral infections. It allows scientists to precisely target and modify specific DNA sequences within the genome of an organism. The CRISPR-Cas9 system consists of two main components: the Cas9 enzyme (molecular scissors) and a guide RNA (gRNA).\r\n\r\nThe gRNA is engineered to be complementary to the target DNA sequence of interest. When the gRNA-Cas9 complex encounters the targeted DNA, Cas9 cuts the DNA at the specific site. This cut triggers the cell's natural repair mechanisms, which can lead to the introduction of desired genetic changes, such as gene insertions, deletions, or replacements.
555	Which process refers to the conversion of nitrogen compounds in soil into gaseous nitrogen, releasing it back into the atmosphere?	hard	4	\r\nThe process that refers to the conversion of nitrogen compounds in soil into gaseous nitrogen, releasing it back into the atmosphere, is called "denitrification."\r\n\r\nDenitrification is a microbial-driven process that occurs in soil and other environments with low oxygen levels. It involves the reduction of nitrate (NO3-) and nitrite (NO2-) ions, which are forms of inorganic nitrogen present in the soil, into gaseous nitrogen compounds like nitrous oxide (N2O) and dinitrogen gas (N2). These gaseous nitrogen compounds are then released into the atmosphere.\r\n\r\nThe denitrification process is part of the nitrogen cycle, which plays a crucial role in cycling and balancing nitrogen in ecosystems. Denitrification helps to regulate the amount of available nitrogen in the soil, prevents nitrogen accumulation, and contributes to the return of nitrogen back to the atmosphere. In agricultural settings, excessive denitrification can be a concern because it can lead to nitrogen loss from the soil, affecting soil fertility and contributing to environmental issues such as greenhouse gas emissions and water pollution.
\.


--
-- Data for Name: quiz_results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quiz_results (result_id, user_id, difficulty_level, score, category_name) FROM stdin;
57	14	easy	90	History
58	14	easy	70	History
59	14	hard	80	Geography
60	14	hard	90	Geography
61	14	hard	60	Science
62	14	easy	40	History
63	908	easy	40	History
64	14	easy	30	Science
65	742	medium	30	Geography
66	742	easy	10	History
67	742	medium	0	Geography
68	742	easy	30	Science
69	742	easy	20	Science
70	742	easy	20	Science
71	742	easy	80	Geography
72	742	easy	10	Geography
73	14	hard	20	Music
74	14	easy	40	Science
75	14	easy	100	Music
76	14	hard	40	Science
77	14	hard	90	Geography
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, email, password) FROM stdin;
14	Garanhao	mail@mail.com	$2b$10$0MvgUNc8xcgZiUX5w4nokuOD9nwlJBB2/qHLM.a..iJCQAa/X2DiK
15	testuser	some@gmail.com	$2b$10$TPYVpnxL2hFYoi6aHRB6helX8c8iufYQPaTKWsN30KbGIrlusreZ2
16	gugudada	mail@mail.com	$2b$10$BVIWuL.ixzSimQnDR8N4jONrikkeL0rGvM2HXYX63/Gy7QZpZIQgW
17	eeeeeeee	mail@mail.com	$2b$10$KlUN7AfZq9EXq/X3r.ejnODd7/4OUQv3c2uRwjzHQL.Ul8ZEIj7n6
18	eerreee	mail@mail.com	$2b$10$EBuQcdO6ECPh.R1N/0wqEu0w7QT5Y2YT5b5AF1JlX2jn6kfKEpB/e
19	Cagalhao	mail@mail.com	$2b$10$FegdrklB5JxanU/Lc.nA1OiFqRkdGT4BEcA.FAKpJsm9acvo0hkTe
20	mumumumu	mail@mail.com	$2b$10$Z8I87MGh5i4YOSBVf50Mbewz7vzgFDLyhEaEwthVenOg7S8EsyvIS
908	nunununu	mail@mail.com	$2b$10$/iD9gk2iEr1u3qLLUS8aNeFt7GnwghamutaA9F08.KMJ4mtqLFcz2
839	mangalho	mail@mail.com	$2b$10$KCm3xlZQj0mrWb6HfABZTOPiaCL6JjsXRZJWoI2zPtTlmBnLzb9my
742	mangalhu	mail@mail.com	$2b$10$nEROTs6CQoAYQ25DLst3j.vjGBc6o8OJMGMZ1axEqUABX3DBnMfMy
5012	mangalhuuu	mail@mail.com	$2b$10$g3Xy2t7BBqQGRDmxzi5p5uH4i2jSjxdLx6Ltg6/tCYquh1/Dssu6a
7665	mangalhuuuuuuuuuu	mail@mail.com	$2b$10$0S4mJBVuDHZSm3SRq31P/OBA9m33Tj5wL1JPdJ0/iZAPFADNhozQO
7898	mangalhi	mail@mail.com	$2b$10$Wf7S1uiQcB5EuWJPkJiYb.mjAFfBbHA30c0MG9qzlPnZuOwXdgRjy
9164	mangalhiui	mail@mail.com	$2b$10$1tz2Iaeia6namxlXQU2gneTgv5YG6Aflv4VAooR.h7SqhsELezgBy
4401	mangalhrt	mail@mail.com	$2b$10$sGV1JnTFmJFCRDYpmdfzceLAYrIyQNx0sQ1Ap4w5Y3uV5oZxmid3e
9855	mangalhrrr	mail@mail.com	$2b$10$Gi/fUk67uh.1up/jxabg9OWJHqGN6nRKOWoCs49RUqto4rr0pNhB6
8463	mangalhrrrrr	mail@mail.com	$2b$10$n./D0BSmV194ibuqaViJlOvvKhkfc.V3CF1mV2EMESS4VFUg/7y6W
4496	fernandu	mail@mail.com	$2b$10$JoE3WPSu.96oWfspVKI3VeuvbTbRNTwZS0D1IboaS6Hj9QIGG4ka2
9227	seila	mail@mail.com	$2b$10$a2FD4bj5m/9eqdAJGXLkLunhQdYxPKaIU8YhyfOGSonFSPgtvHh16
42157957	titititi	mail@mail.com	$2b$10$0ZUWjRn8GxCeT02T/3mx4.C5VYSZJieszs0Pbciq7.npFunDI.Kgu
\.


--
-- Name: quiz_results_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quiz_results_result_id_seq', 77, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (answer_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (question_id);


--
-- Name: quiz_results quiz_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_results
    ADD CONSTRAINT quiz_results_pkey PRIMARY KEY (result_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: answers answers_question_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_question_id_fkey FOREIGN KEY (question_id) REFERENCES public.questions(question_id);


--
-- Name: questions questions_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- Name: quiz_results quiz_results_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quiz_results
    ADD CONSTRAINT quiz_results_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

