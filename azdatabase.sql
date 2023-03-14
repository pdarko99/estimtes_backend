--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2kl,m 

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: industry_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.industry_type AS ENUM (
    'industry_1',
    'industry_2',
    'industry_3'
);


ALTER TYPE public.industry_type OWNER TO postgres;

--
-- Name: service_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.service_type AS ENUM (
    'service_1',
    'service_2',
    'service_3'
);


ALTER TYPE public.service_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    question uuid,
    option character varying(100) NOT NULL,
    price character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying(100),
    updates_by character varying(100),
    next_qtn character varying(100),
    currency character varying(100),
    symbol character varying(100)
);


ALTER TABLE public.options OWNER TO postgres;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    service uuid,
    question character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying(100),
    updates_by character varying(100)
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    service character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying(100),
    updates_by character varying(100)
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: userinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userinfo (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100) NOT NULL,
    business_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    number character varying(100) NOT NULL,
    industry public.industry_type NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying(100),
    updates_by character varying(100),
    service uuid
);


ALTER TABLE public.userinfo OWNER TO postgres;

--
-- Name: userinput; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userinput (
    id uuid DEFAULT public.uuid_generate_v4(),
    userid uuid,
    inputs json,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_by character varying(100),
    updates_by character varying(100)
);


ALTER TABLE public.userinput OWNER TO postgres;

--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.options (id, question, option, price, created_at, updated_at, created_by, updates_by, next_qtn, currency, symbol) FROM stdin;
daf335af-a455-4f03-a5cf-51ae1451b80b	75924dee-0b68-4691-b9c5-0c0588ed9fbd	No	0	2022-12-28 08:37:52.186833-08	2022-12-28 08:37:52.186833-08	\N	\N		usd	$
f6052008-4aee-4c16-8e54-49fc5df21f6e	75924dee-0b68-4691-b9c5-0c0588ed9fbd	Yes	10	2022-12-28 08:37:59.104843-08	2022-12-28 08:37:59.104843-08	\N	\N		usd	$
79ea9adf-1b79-492d-9da4-9d64dfa92d9b	864badac-a2b8-4ab8-910b-e77ded4ddff7	yes I love football	3000	2022-12-23 08:59:35.202799-08	2022-12-23 08:59:35.202799-08	\N	\N	810772cf-f97e-478c-8939-c1631e8f1c70	$	\N
e9a4e2f1-6f13-4689-903a-ac6e57f6a014	864badac-a2b8-4ab8-910b-e77ded4ddff7	No I dont love football	3000	2022-12-23 09:04:39.509036-08	2022-12-23 09:04:39.509036-08	\N	\N	7867aa5e-995e-47c8-b296-1b7390e7d383	$	\N
97453765-eac7-4693-96fc-213a151c1c4d	864badac-a2b8-4ab8-910b-e77ded4ddff7	Yes try again	3000	2022-12-23 13:45:58.025005-08	2022-12-23 13:45:58.025005-08	\N	\N	\N	$	\N
b78303c6-0a38-40bf-9738-578b7ed5709b	864badac-a2b8-4ab8-910b-e77ded4ddff7	Yes try again hello	3000	2022-12-23 13:47:57.976623-08	2022-12-23 13:47:57.976623-08	\N	\N	\N	$	\N
d31adbde-7295-40b5-b011-697b214064c2	810772cf-f97e-478c-8939-c1631e8f1c70	Yes try again in body	3000	2022-12-23 13:49:50.521468-08	2022-12-23 13:49:50.521468-08	\N	\N	\N	$	\N
32d05c82-3de0-4ab2-b9ff-17fb9b2b0f4c	810772cf-f97e-478c-8939-c1631e8f1c70	Yes try again in body	3000	2022-12-23 13:50:59.449473-08	2022-12-23 13:50:59.449473-08	\N	\N	\N	$	\N
2d473230-c5a9-4572-8a1c-240f63a0bfe4	a6d1774a-bf34-40e7-b9a5-7011775efb4f	Yes try again in body this time hard	3000	2022-12-23 13:54:25.261813-08	2022-12-23 13:54:25.261813-08	\N	\N	\N	$	\N
7267404c-3648-461c-b472-a6ae1a577ee3	a6d1774a-bf34-40e7-b9a5-7011775efb4f	No Go home again hardereeerrrr	3000	2022-12-23 13:57:32.719123-08	2022-12-23 13:57:32.719123-08	\N	\N	\N	$	\N
33ecf772-d80f-4e89-9c99-000d3dbc4984	c95f391f-d94a-45f7-b2b5-a6260f8bec04	Yes our last try	3000	2022-12-23 13:59:20.108366-08	2022-12-23 13:59:20.108366-08	\N	\N	\N	$	\N
3dafd3b1-b909-43cf-9116-193db1cc68ba	56894bc4-65d9-4317-b12f-0dca73caa3f4	Yes we doint for the last time innit	5000	2022-12-26 10:38:42.729104-08	2022-12-26 10:38:42.729104-08	\N	\N	7d94e4ec-aa21-4a6a-9a61-8dbc6faed95a	usd	$
e91d41a5-5100-4130-875a-6a1bc4e3aa98	83432b72-70f7-4975-bf06-50c893f2e3a6	yes hello	5000	2022-12-26 10:55:24.420963-08	2022-12-26 10:55:24.420963-08	\N	\N	08d266ee-4223-44d8-9ade-b381b413dd8d	usd	$
f023580f-646a-4b66-97c8-19d20eaec4ee	08d266ee-4223-44d8-9ade-b381b413dd8d	yes hello agian	5000	2022-12-26 11:01:09.673135-08	2022-12-26 11:01:09.673135-08	\N	\N		usd	$
7e8f08da-9e07-4359-bb28-a75b84642aa5	9ca52a96-54c9-451a-aea6-6b2bdfb41369	for updateing	5000	2022-12-26 12:49:22.064565-08	2022-12-26 12:49:22.064565-08	\N	\N	f36adc06-4c60-4ef5-ad96-6188f854bee5	usd	$
050d34d0-9bb9-4714-8f02-33f492f702c0	f36adc06-4c60-4ef5-ad96-6188f854bee5	for updateing again	5000	2022-12-26 12:52:32.239462-08	2022-12-26 12:52:32.239462-08	\N	\N	f950c06b-1dd5-4f6a-a2a6-9c18cc4f1352	usd	$
38657289-667f-4c93-888a-41f3f1865b1f	c1f40177-1975-4df3-ad83-ab04679001b3	for init init init init	5000	2022-12-26 12:57:48.266134-08	2022-12-26 12:57:48.266134-08	\N	\N	7d94e4ec-aa21-4a6a-9a61-8dbc6faed95a	usd	$
c550a355-3c69-4d1e-8cad-3257b9f40c48	c1f40177-1975-4df3-ad83-ab04679001b3	for init init init init again again again	5000	2022-12-26 13:02:20.573024-08	2022-12-26 13:02:20.573024-08	\N	\N	54967e48-1f2a-48b6-b910-2788598f4c4d	usd	$
d313343e-f0de-4908-89cf-ce56ecfd1893	5f945bdf-542c-4b98-9f96-1f095c0f08f4	4 pages	4000	2022-12-28 08:17:50.462138-08	2022-12-28 08:17:50.462138-08	\N	\N		usd	$
7a5791ab-9432-4ad0-b38f-cc2bc0d554c5	5f945bdf-542c-4b98-9f96-1f095c0f08f4	7 pages	7000	2022-12-28 08:18:04.558068-08	2022-12-28 08:18:04.558068-08	\N	\N		usd	$
2ce88b12-1b89-401f-b7fd-6908526d1854	5f945bdf-542c-4b98-9f96-1f095c0f08f4	12 pages	12000	2022-12-28 08:18:11.927737-08	2022-12-28 08:18:11.927737-08	\N	\N		usd	$
0179cba2-896d-4c58-8e65-8a59a84ec8ee	891d331d-9392-43a2-9071-49c467c23e9c	No	0	2022-12-28 08:19:12.022378-08	2022-12-28 08:19:12.022378-08	\N	\N		usd	$
4139bdb6-5521-4af7-ae1c-5e2e8995031f	891d331d-9392-43a2-9071-49c467c23e9c	Yes	100	2022-12-28 08:19:24.250062-08	2022-12-28 08:19:24.250062-08	\N	\N		usd	$
0ef415a3-f1fc-41d0-9021-73aa714c1fdc	a5ca7a00-f816-422a-bed7-854c5819d06d	No	0	2022-12-28 08:20:54.075867-08	2022-12-28 08:20:54.075867-08	\N	\N		usd	$
7460a034-0465-4d84-b824-e943cbd12941	a5ca7a00-f816-422a-bed7-854c5819d06d	Yes	100	2022-12-28 08:21:03.731681-08	2022-12-28 08:21:03.731681-08	\N	\N		usd	$
181b1338-636c-4819-af4b-1d3ebd450920	66830599-79fb-4be0-a2ac-1d9412631a24	No	0	2022-12-28 08:22:57.867954-08	2022-12-28 08:22:57.867954-08	\N	\N		usd	$
a369003f-5243-42c2-8ca1-d26f302ca011	66830599-79fb-4be0-a2ac-1d9412631a24	Basic	100	2022-12-28 08:23:10.212937-08	2022-12-28 08:23:10.212937-08	\N	\N		usd	$
2b9db18f-a62d-418f-b129-356fe967f7ea	66830599-79fb-4be0-a2ac-1d9412631a24	SEO Optimized	200	2022-12-28 08:23:33.804676-08	2022-12-28 08:23:33.804676-08	\N	\N		usd	$
421c0f84-5da3-42ca-ba2c-8c16ca74e306	c4278375-b6bb-4fa2-84d0-30047ad42400	No	0	2022-12-28 08:24:19.801421-08	2022-12-28 08:24:19.801421-08	\N	\N		usd	$
9fe61f8b-bd14-44af-919e-e8c0c16bafdf	c4278375-b6bb-4fa2-84d0-30047ad42400	Yes	100	2022-12-28 08:24:34.679633-08	2022-12-28 08:24:34.679633-08	\N	\N		usd	$
cfa03499-d518-4325-9f73-2bcdbd5376e7	559b2a71-05cc-4372-85e3-c6aa63eaa6e3	None	0	2022-12-28 08:26:07.734471-08	2022-12-28 08:26:07.734471-08	\N	\N		usd	$
38e85bbd-a232-4278-b422-1ee3816e8576	559b2a71-05cc-4372-85e3-c6aa63eaa6e3	1 Banner	10	2022-12-28 08:26:25.315153-08	2022-12-28 08:26:25.315153-08	\N	\N		usd	$
771cbab1-6477-4b95-b38a-70115637dfac	559b2a71-05cc-4372-85e3-c6aa63eaa6e3	5 Banner	50	2022-12-28 08:26:35.004916-08	2022-12-28 08:26:35.004916-08	\N	\N		usd	$
e62445dc-2691-4adf-90c8-c00e9d4686c9	559b2a71-05cc-4372-85e3-c6aa63eaa6e3	10 Banner	100	2022-12-28 08:26:43.309258-08	2022-12-28 08:26:43.309258-08	\N	\N		usd	$
a0ea53d4-9777-4fff-ae5c-236ac6bde802	892141e1-5141-4b4f-b501-fe394333344b	No	0	2022-12-28 08:27:49.11347-08	2022-12-28 08:27:49.11347-08	\N	\N		usd	$
540533cb-9a4d-4179-b3f4-6a5407efa266	892141e1-5141-4b4f-b501-fe394333344b	Yes	10	2022-12-28 08:27:59.127547-08	2022-12-28 08:27:59.127547-08	\N	\N		usd	$
0f401647-ab78-4018-8543-d73209d82479	f4421d9f-2bbc-491b-b78e-d1547a994ce1	No	0	2022-12-28 08:28:36.540812-08	2022-12-28 08:28:36.540812-08	\N	\N		usd	$
21027570-9807-4d06-b1f0-c41a167007dd	f4421d9f-2bbc-491b-b78e-d1547a994ce1	Yes	10	2022-12-28 08:28:43.847657-08	2022-12-28 08:28:43.847657-08	\N	\N		usd	$
fb1da75e-1b8c-44a0-9db8-efd38e15c9d7	402d230b-08cb-4db3-a311-409d3969a2e8	No	0	2022-12-28 08:32:11.635297-08	2022-12-28 08:32:11.635297-08	\N	\N		usd	$
093440bb-9e73-4731-97a6-de68e266100f	402d230b-08cb-4db3-a311-409d3969a2e8	Yes	10	2022-12-28 08:32:22.450984-08	2022-12-28 08:32:22.450984-08	\N	\N		usd	$
2b5dd5f9-970c-48e3-ab1d-fb7852816e41	82b9793f-a002-4af7-ac68-09cf8f431105	Build New	5000	2022-12-28 08:15:45.347605-08	2022-12-28 08:15:45.347605-08	\N	\N	402d230b-08cb-4db3-a311-409d3969a2e8	usd	\N
2e88e718-4596-43dc-9ea5-888791d636d2	82b9793f-a002-4af7-ac68-09cf8f431105	Business Website	4000	2022-12-28 08:16:41.912839-08	2022-12-28 08:16:41.912839-08	\N	\N	75924dee-0b68-4691-b9c5-0c0588ed9fbd	usd	\N
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (id, service, question, created_at, updated_at, created_by, updates_by) FROM stdin;
dd4fab5d-562f-474f-8020-b73478df97dd	9d9f0e7e-5e01-44af-a736-cea29040b3d1	good in english?	2022-12-20 23:16:53.818498-08	2022-12-20 23:16:53.818498-08	\N	\N
864badac-a2b8-4ab8-910b-e77ded4ddff7	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	Do you love football?	2022-12-23 08:46:15.483325-08	2022-12-23 08:46:15.483325-08	\N	\N
810772cf-f97e-478c-8939-c1631e8f1c70	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	What team do you support?	2022-12-23 08:48:34.691453-08	2022-12-23 08:48:34.691453-08	\N	\N
7867aa5e-995e-47c8-b296-1b7390e7d383	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	Okay you sleep then?	2022-12-23 09:02:37.748258-08	2022-12-23 09:02:37.748258-08	\N	\N
a6d1774a-bf34-40e7-b9a5-7011775efb4f	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	Seems its becoming challenging?	2022-12-23 13:53:31.720712-08	2022-12-23 13:53:31.720712-08	\N	\N
c95f391f-d94a-45f7-b2b5-a6260f8bec04	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	Our last try we hope so?	2022-12-23 13:58:53.156989-08	2022-12-23 13:58:53.156989-08	\N	\N
89ef3a8e-7417-4d15-80ae-4d8a91077247	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	for documentaion abi?	2022-12-23 14:31:50.729683-08	2022-12-23 14:31:50.729683-08	\N	\N
fba69c51-85ed-419d-bd29-1956930a572d	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	for documentaion again again abi	2022-12-23 14:35:14.310787-08	2022-12-23 14:35:14.310787-08	\N	\N
c1f40177-1975-4df3-ad83-ab04679001b3	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	we doing this for the lastime innit?	2022-12-26 09:00:29.343802-08	2022-12-26 09:00:29.343802-08	\N	\N
7d94e4ec-aa21-4a6a-9a61-8dbc6faed95a	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	sub qtn for we doing this again right innit?	2022-12-26 10:36:13.851351-08	2022-12-26 10:36:13.851351-08	\N	\N
56894bc4-65d9-4317-b12f-0dca73caa3f4	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	sub qtn for we doing this for the lastime innit? updated updated	2022-12-26 10:35:53.854413-08	2022-12-26 10:35:53.854413-08	\N	\N
83432b72-70f7-4975-bf06-50c893f2e3a6	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	hello one	2022-12-26 10:53:55.881808-08	2022-12-26 10:53:55.881808-08	\N	\N
08d266ee-4223-44d8-9ade-b381b413dd8d	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	hello two	2022-12-26 10:54:05.157688-08	2022-12-26 10:54:05.157688-08	\N	\N
9ca52a96-54c9-451a-aea6-6b2bdfb41369	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	after updating	2022-12-26 12:48:07.20003-08	2022-12-26 12:48:07.20003-08	\N	\N
f36adc06-4c60-4ef5-ad96-6188f854bee5	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	after updating two	2022-12-26 12:48:12.671198-08	2022-12-26 12:48:12.671198-08	\N	\N
f950c06b-1dd5-4f6a-a2a6-9c18cc4f1352	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	after updating three	2022-12-26 12:51:22.805948-08	2022-12-26 12:51:22.805948-08	\N	\N
54967e48-1f2a-48b6-b910-2788598f4c4d	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	after updating fotuh	2022-12-26 13:01:09.777725-08	2022-12-26 13:01:09.777725-08	\N	\N
82b9793f-a002-4af7-ac68-09cf8f431105	bc022627-5133-4834-942e-8496cd614ddf	Would you like to build new website or redesign your existing website?	2022-12-28 08:06:18.031121-08	2022-12-28 08:06:18.031121-08	\N	\N
5f945bdf-542c-4b98-9f96-1f095c0f08f4	bc022627-5133-4834-942e-8496cd614ddf	How many pages you need in a website?	2022-12-28 08:06:44.992647-08	2022-12-28 08:06:44.992647-08	\N	\N
891d331d-9392-43a2-9071-49c467c23e9c	bc022627-5133-4834-942e-8496cd614ddf	Would you like to get domain name and hosting? (i.e. www.businessname.com)	2022-12-28 08:07:04.887894-08	2022-12-28 08:07:04.887894-08	\N	\N
a5ca7a00-f816-422a-bed7-854c5819d06d	bc022627-5133-4834-942e-8496cd614ddf	Would you like to get company email address? (i.e. contact@businessname.com)	2022-12-28 08:07:23.953107-08	2022-12-28 08:07:23.953107-08	\N	\N
66830599-79fb-4be0-a2ac-1d9412631a24	bc022627-5133-4834-942e-8496cd614ddf	Would you like us to write website content?	2022-12-28 08:07:49.972713-08	2022-12-28 08:07:49.972713-08	\N	\N
c4278375-b6bb-4fa2-84d0-30047ad42400	bc022627-5133-4834-942e-8496cd614ddf	Would you like to design new logo for your brand?	2022-12-28 08:08:09.034099-08	2022-12-28 08:08:09.034099-08	\N	\N
559b2a71-05cc-4372-85e3-c6aa63eaa6e3	bc022627-5133-4834-942e-8496cd614ddf	How many custom banners would you like to make for the website?	2022-12-28 08:09:15.807174-08	2022-12-28 08:09:15.807174-08	\N	\N
892141e1-5141-4b4f-b501-fe394333344b	bc022627-5133-4834-942e-8496cd614ddf	Would you like to register your business on Google? (Google MyBusiness)	2022-12-28 08:09:30.284656-08	2022-12-28 08:09:30.284656-08	\N	\N
f4421d9f-2bbc-491b-b78e-d1547a994ce1	bc022627-5133-4834-942e-8496cd614ddf	Would you like to integrate Google Analytics to traffic on your website?	2022-12-28 08:09:53.725329-08	2022-12-28 08:09:53.725329-08	\N	\N
402d230b-08cb-4db3-a311-409d3969a2e8	bc022627-5133-4834-942e-8496cd614ddf	Are you sure you want to build new?	2022-12-28 08:30:41.395135-08	2022-12-28 08:30:41.395135-08	\N	\N
75924dee-0b68-4691-b9c5-0c0588ed9fbd	bc022627-5133-4834-942e-8496cd614ddf	Are you sure you want to build new Business Website?	2022-12-28 08:33:17.585515-08	2022-12-28 08:33:17.585515-08	\N	\N
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, service, description, created_at, updated_at, created_by, updates_by) FROM stdin;
9d9f0e7e-5e01-44af-a736-cea29040b3d1	felicity three	for felecity	2022-12-20 22:15:35.286971-08	2022-12-20 22:15:35.286971-08	\N	\N
bec9e57e-85eb-4b6d-87ff-9d1628f36d3d	ecommerce	an updated ecommerce thing	2022-12-20 23:08:13.127797-08	2022-12-20 23:08:13.127797-08	\N	\N
f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	about football	the love of the game	2022-12-23 08:44:28.612485-08	2022-12-23 08:44:28.612485-08	\N	\N
b5db11b8-fd56-41ec-be37-dbf738032bd0	for demo again	for_demo_again_with_underscores	2022-12-26 08:49:57.937169-08	2022-12-26 08:49:57.937169-08	\N	\N
cf53e57b-93ef-4827-b1b3-697992c09c36	we creating a sevice 	we_creating_service_with_underscores	2022-12-26 10:28:04.358497-08	2022-12-26 10:28:04.358497-08	\N	\N
bc022627-5133-4834-942e-8496cd614ddf	real_qtns	for our real questions now	2022-12-28 07:57:09.738943-08	2022-12-28 07:57:09.738943-08	\N	\N
\.


--
-- Data for Name: userinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userinfo (id, name, business_name, email, number, industry, created_at, updated_at, created_by, updates_by, service) FROM stdin;
8495ba18-cd4c-4279-a336-ec69a651d5e8	Prince	ama1	ad@gmail.com	1452345	industry_2	2022-12-20 22:09:27.398976-08	2022-12-20 22:09:27.398976-08	Prince	\N	\N
d37c78a6-8a42-4134-a5b1-03fd1234556d	Prince	ama1	ad@gmail.com	1452345	industry_2	2022-12-20 22:10:25.952829-08	2022-12-20 22:10:25.952829-08	Prince	\N	\N
c5ecde7c-6ffe-461d-8890-99b1e31559e7	Prince	hello	info@gmail.com	42542345234,	industry_1	2022-12-20 23:04:08.693024-08	2022-12-20 23:04:08.693024-08	Prince	\N	\N
e95bd4b6-68e8-4eda-b9cb-86e3f087db1c	mY name	my_business	ouremail@gmail.com	503458-23498-59	industry_1	2022-12-22 11:46:55.12944-08	2022-12-22 11:46:55.12944-08	mY name	\N	\N
34f57bf0-4b5e-4072-bb2a-8eef6c76db29	Prince 2	ama2	ad@gmail.com	1452345	industry_2	2022-12-23 07:53:46.970617-08	2022-12-23 07:53:46.970617-08	\N	\N	\N
c1f49f18-da4f-423b-83a3-050684911c34	Prince 3	ama3	ad@gmail.com	1452345	industry_2	2022-12-23 07:56:01.160509-08	2022-12-23 07:56:01.160509-08	\N	\N	\N
16e8bff9-923c-4d96-b8b6-454194cb737d	new user name	hallon	newE@gmail.com	3452345235	industry_1	2022-12-23 14:12:00.46447-08	2022-12-23 14:12:00.46447-08	\N	\N	\N
a7769363-ea17-4439-b662-e9ac12d467c8	new user name	hallon	newE@gmail.com	3452345235	industry_1	2022-12-23 14:12:15.853051-08	2022-12-23 14:12:15.853051-08	\N	\N	\N
3ebbab55-c7dd-4f81-aff3-6f59ed1f4c69	our day	our business_name	em@gmail.com	5465465465	industry_1	2022-12-23 15:37:57.393018-08	2022-12-23 15:37:57.393018-08	\N	\N	\N
6e91ba69-bb5c-4055-9257-f1a679c1f262	our day one	our business_name	em@gmail.com	5465465465	industry_1	2022-12-26 10:01:53.942519-08	2022-12-26 10:01:53.942519-08	\N	\N	\N
ad737ca9-1e39-4d1f-8eeb-3b1b1f7716ec	ACQUAH SAM	we serious this time around	gospeldarko333@gmail.com	4554564	industry_1	2022-12-27 12:03:47.15549-08	2022-12-27 12:03:47.15549-08	\N	\N	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc
2989f495-c23f-42d7-91f4-5c1e457a0f03	prince	my own business	padarko898@gmail.com	46545645647897	industry_1	2022-12-27 12:05:10.276878-08	2022-12-27 12:05:10.276878-08	\N	\N	bec9e57e-85eb-4b6d-87ff-9d1628f36d3d
34eb66a1-539d-4d21-a5b2-85a7d2245835	Kwame	My_business	infw@gmail.com	589645821528	industry_1	2022-12-27 12:09:45.190255-08	2022-12-27 12:09:45.190255-08	\N	\N	bec9e57e-85eb-4b6d-87ff-9d1628f36d3d
9dc9f8c8-3040-420b-b668-6c472054a1a6	kwame	MyPbsadf	afsdj@gmail.com	654564564564	industry_2	2022-12-28 07:32:10.769159-08	2022-12-28 07:32:10.769159-08	\N	\N	bec9e57e-85eb-4b6d-87ff-9d1628f36d3d
9bd79830-49f6-46fb-9cb1-1bfc299d86c5	We serious	We_serious  business	dsa@gmail.com	545488778	industry_1	2022-12-28 09:42:29.725392-08	2022-12-28 09:42:29.725392-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
df03c604-8208-4bf5-a8af-397a557bfba6	AZ	AZ_BUSINESS	asidf@gmail.com	566565626595	industry_2	2022-12-28 14:09:42.789418-08	2022-12-28 14:09:42.789418-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
\.


--
-- Data for Name: userinput; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.userinput (id, userid, inputs, created_at, updated_at, created_by, updates_by) FROM stdin;
676ce1d2-3dfd-4e43-a5a4-11a7deead0d1	\N	{"question_name":"option_value"}	2022-12-26 10:19:25.317306-08	2022-12-26 10:19:25.317306-08	\N	\N
51903a0b-b769-4dc4-94f4-d344614361b3	\N	{"864badac-a2b8-4ab8-910b-e77ded4ddff7":"79ea9adf-1b79-492d-9da4-9d64dfa92d9b","810772cf-f97e-478c-8939-c1631e8f1c70":"d31adbde-7295-40b5-b011-697b214064c2","a6d1774a-bf34-40e7-b9a5-7011775efb4f":"2d473230-c5a9-4572-8a1c-240f63a0bfe4"}	2022-12-26 13:09:35.812888-08	2022-12-26 13:09:35.812888-08	\N	\N
b95f5235-01f2-4e9b-8591-fe3a92ea4dd4	\N	{"864badac-a2b8-4ab8-910b-e77ded4ddff7":"79ea9adf-1b79-492d-9da4-9d64dfa92d9b","810772cf-f97e-478c-8939-c1631e8f1c70":"d31adbde-7295-40b5-b011-697b214064c2","a6d1774a-bf34-40e7-b9a5-7011775efb4f":"2d473230-c5a9-4572-8a1c-240f63a0bfe4"}	2022-12-26 15:06:34.27498-08	2022-12-26 15:06:34.27498-08	\N	\N
6bb08f85-d080-4b5b-b63b-1f41ab902261	\N	{"864badac-a2b8-4ab8-910b-e77ded4ddff7":"79ea9adf-1b79-492d-9da4-9d64dfa92d9b","810772cf-f97e-478c-8939-c1631e8f1c70":"d31adbde-7295-40b5-b011-697b214064c2","a6d1774a-bf34-40e7-b9a5-7011775efb4f":"2d473230-c5a9-4572-8a1c-240f63a0bfe4"}	2022-12-26 15:15:58.962522-08	2022-12-26 15:15:58.962522-08	\N	\N
b3e56266-c5d8-4158-a86e-858e29e32ca4	9bd79830-49f6-46fb-9cb1-1bfc299d86c5	\N	2022-12-28 13:17:42.317248-08	2022-12-28 13:17:42.317248-08	\N	\N
e8a018a1-4a65-48a9-82aa-01ad6ead87d0	9bd79830-49f6-46fb-9cb1-1bfc299d86c5	\N	2022-12-28 13:21:44.322419-08	2022-12-28 13:21:44.322419-08	\N	\N
8254e867-6792-4557-95cd-3e6369150443	9bd79830-49f6-46fb-9cb1-1bfc299d86c5	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"093440bb-9e73-4731-97a6-de68e266100f","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"421c0f84-5da3-42ca-ba2c-8c16ca74e306","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"e62445dc-2691-4adf-90c8-c00e9d4686c9","892141e1-5141-4b4f-b501-fe394333344b":"a0ea53d4-9777-4fff-ae5c-236ac6bde802","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2022-12-28 13:22:53.034534-08	2022-12-28 13:22:53.034534-08	\N	\N
1d6505e2-a17c-4979-aa31-cc57c82bbd73	9bd79830-49f6-46fb-9cb1-1bfc299d86c5	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"093440bb-9e73-4731-97a6-de68e266100f","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"0179cba2-896d-4c58-8e65-8a59a84ec8ee","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"421c0f84-5da3-42ca-ba2c-8c16ca74e306","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"cfa03499-d518-4325-9f73-2bcdbd5376e7","892141e1-5141-4b4f-b501-fe394333344b":"a0ea53d4-9777-4fff-ae5c-236ac6bde802","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"0f401647-ab78-4018-8543-d73209d82479"}	2022-12-28 13:45:10.117251-08	2022-12-28 13:45:10.117251-08	\N	\N
bc7e92cd-9c25-454e-9891-c1782a6ee868	9bd79830-49f6-46fb-9cb1-1bfc299d86c5	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"0f401647-ab78-4018-8543-d73209d82479"}	2022-12-28 14:11:39.291879-08	2022-12-28 14:11:39.291879-08	\N	\N
0e0bac65-6072-4391-ab1f-6f954f9c7080	9bd79830-49f6-46fb-9cb1-1bfc299d86c5	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"093440bb-9e73-4731-97a6-de68e266100f","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"0179cba2-896d-4c58-8e65-8a59a84ec8ee","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"421c0f84-5da3-42ca-ba2c-8c16ca74e306","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"0f401647-ab78-4018-8543-d73209d82479"}	2022-12-29 08:44:56.428975-08	2022-12-29 08:44:56.428975-08	\N	\N
d5e1712e-39c6-4729-a6e4-3352c521227c	9bd79830-49f6-46fb-9cb1-1bfc299d86c5	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"093440bb-9e73-4731-97a6-de68e266100f","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"0179cba2-896d-4c58-8e65-8a59a84ec8ee","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"a0ea53d4-9777-4fff-ae5c-236ac6bde802","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"0f401647-ab78-4018-8543-d73209d82479"}	2022-12-29 08:49:20.784401-08	2022-12-29 08:49:20.784401-08	\N	\N
\.


--
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: userinfo userinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT userinfo_pkey PRIMARY KEY (id);


--
-- Name: options options_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_fk FOREIGN KEY (question) REFERENCES public.questions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: questions question_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT question_fk FOREIGN KEY (service) REFERENCES public.services(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: userinput user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userinput
    ADD CONSTRAINT user_fk FOREIGN KEY (userid) REFERENCES public.userinfo(id);


--
-- Name: userinfo userinfo_service_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userinfo
    ADD CONSTRAINT userinfo_service_fkey FOREIGN KEY (service) REFERENCES public.services(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

