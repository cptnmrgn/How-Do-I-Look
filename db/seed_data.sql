--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: nicholasmorgan; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    body text,
    user_id integer,
    photo_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.comments OWNER TO nicholasmorgan;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: nicholasmorgan
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO nicholasmorgan;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicholasmorgan
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: nicholasmorgan; Tablespace: 
--

CREATE TABLE photos (
    id integer NOT NULL,
    title character varying(255),
    image text,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.photos OWNER TO nicholasmorgan;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: nicholasmorgan
--

CREATE SEQUENCE photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO nicholasmorgan;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicholasmorgan
--

ALTER SEQUENCE photos_id_seq OWNED BY photos.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: nicholasmorgan; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO nicholasmorgan;

--
-- Name: users; Type: TABLE; Schema: public; Owner: nicholasmorgan; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    picture text,
    blurb text,
    location character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    tagline character varying(255)
);


ALTER TABLE public.users OWNER TO nicholasmorgan;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: nicholasmorgan
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO nicholasmorgan;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicholasmorgan
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nicholasmorgan
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nicholasmorgan
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nicholasmorgan
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: nicholasmorgan
--

COPY comments (id, body, user_id, photo_id, created_at, updated_at) FROM stdin;
9	yo	1	3	2014-02-04 03:24:11.427186	2014-02-04 03:24:11.427186
10	hello	1	3	2014-02-04 03:43:29.309192	2014-02-04 03:43:29.309192
11	that's great!	1	8	2014-02-04 03:56:00.652449	2014-02-04 03:56:00.652449
12	awwww	3	14	2014-02-04 03:57:04.860153	2014-02-04 03:57:04.860153
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicholasmorgan
--

SELECT pg_catalog.setval('comments_id_seq', 12, true);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: nicholasmorgan
--

COPY photos (id, title, image, user_id, created_at, updated_at) FROM stdin;
3	Hotttnessss	http://www.thenamesponyboy.com/wp-content/uploads/2013/11/P-Selfies-Pugs.jpg	1	2014-02-03 06:49:20.499832	2014-02-03 06:49:20.499832
8	Trekkie	http://www.thenamesponyboy.com/wp-content/uploads/2013/11/T-Selfies-Pugs.jpg	1	2014-02-03 10:07:08.706499	2014-02-03 10:07:08.706499
9	Gandy	http://www.thenamesponyboy.com/wp-content/uploads/2013/11/W-Selfies-Pugs.jpg	1	2014-02-03 10:42:29.263876	2014-02-03 10:42:29.263876
10	Tinny	http://www.thenamesponyboy.com/wp-content/uploads/2013/11/L-Selfies-Pugs.jpg	1	2014-02-03 10:44:01.783215	2014-02-03 10:44:01.783215
11	Jus drivin'	http://cdnl.complex.com/mp/620/400/80/0/bb/1/ffffff/d8b7341e02574e3ad40f25433c2bcc60/images_/assets/CHANNEL_IMAGES/TECH/2013/10/the-15-types-of-selfies/nydvp_duckfaceresize_745281.jpg	2	2014-02-03 10:46:47.85086	2014-02-03 10:46:47.85086
12	meeeeee <3333	http://www.dailyhiit.com/hiit-blog/wp-content/uploads/2013/11/duck-lips-e1383783102563.jpg	2	2014-02-03 10:47:59.764889	2014-02-03 10:47:59.764889
14	whaaaa???	http://files.mom.me/photos/2013/12/06/6-57960-baby-selfie-12-1386356776.jpg	3	2014-02-03 11:01:04.364319	2014-02-03 11:01:04.364319
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicholasmorgan
--

SELECT pg_catalog.setval('photos_id_seq', 14, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: nicholasmorgan
--

COPY schema_migrations (version) FROM stdin;
20140203041641
20140203042239
20140203042626
20140203042952
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nicholasmorgan
--

COPY users (id, name, picture, blurb, location, created_at, updated_at, tagline) FROM stdin;
1	Pug2fab4lyfe	http://www.thenamesponyboy.com/wp-content/uploads/2013/11/L-Selfies-Pugs.jpg	2 fab 4 u 2 handle	Cleveland, Ohio	2014-02-03 05:39:56.07318	2014-02-03 05:39:56.07318	\N
2	Lips	http://www.dailyhiit.com/hiit-blog/wp-content/uploads/2013/11/duck-lips-e1383783102563.jpg	Can't handle these lipsssssss 	whereva	2014-02-03 10:45:52.910666	2014-02-03 10:45:52.910666	\N
3	Badass Baby	http://i.imgur.com/0wkZYWv.jpg	2young2badass	yo mom's crib	2014-02-03 11:00:29.925015	2014-02-03 11:00:29.925015	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicholasmorgan
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: nicholasmorgan; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: photos_pkey; Type: CONSTRAINT; Schema: public; Owner: nicholasmorgan; Tablespace: 
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: nicholasmorgan; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_photo_id; Type: INDEX; Schema: public; Owner: nicholasmorgan; Tablespace: 
--

CREATE INDEX index_comments_on_photo_id ON comments USING btree (photo_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: nicholasmorgan; Tablespace: 
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_photos_on_user_id; Type: INDEX; Schema: public; Owner: nicholasmorgan; Tablespace: 
--

CREATE INDEX index_photos_on_user_id ON photos USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: nicholasmorgan; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: nicholasmorgan
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM nicholasmorgan;
GRANT ALL ON SCHEMA public TO nicholasmorgan;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

