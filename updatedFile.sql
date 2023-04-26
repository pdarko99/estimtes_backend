--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
--/.

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
    updates_by character varying(100),
    percentage character varying(100),
    minimum_value character varying(100),
    multiple boolean
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
    updates_by character varying(100),
    dynamicinfo json
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
    industry character varying(255) NOT NULL,
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
861b3d2e-6c28-4b36-b269-a5d2df0e04c3	3321c09d-b923-421e-be67-bfe855547773	Yes	10	2023-01-14 19:21:32.608432-08	2023-01-14 19:21:32.608432-08	\N	\N	24bb3104-3cc7-4405-ad14-72eeda08978e	usd	$
7f635d26-e09a-4bf2-ad7f-cfd7ee62c6b8	3321c09d-b923-421e-be67-bfe855547773	No	0	2023-01-14 19:21:44.906997-08	2023-01-14 19:21:44.906997-08	\N	\N		usd	$
79ea9adf-1b79-492d-9da4-9d64dfa92d9b	864badac-a2b8-4ab8-910b-e77ded4ddff7	yes I love football	3000	2022-12-23 08:59:35.202799-08	2022-12-23 08:59:35.202799-08	\N	\N	810772cf-f97e-478c-8939-c1631e8f1c70	$	\N
e9a4e2f1-6f13-4689-903a-ac6e57f6a014	864badac-a2b8-4ab8-910b-e77ded4ddff7	No I dont love football	3000	2022-12-23 09:04:39.509036-08	2022-12-23 09:04:39.509036-08	\N	\N	7867aa5e-995e-47c8-b296-1b7390e7d383	$	\N
97453765-eac7-4693-96fc-213a151c1c4d	864badac-a2b8-4ab8-910b-e77ded4ddff7	Yes try again	3000	2022-12-23 13:45:58.025005-08	2022-12-23 13:45:58.025005-08	\N	\N	\N	$	\N
b78303c6-0a38-40bf-9738-578b7ed5709b	864badac-a2b8-4ab8-910b-e77ded4ddff7	Yes try again hello	3000	2022-12-23 13:47:57.976623-08	2022-12-23 13:47:57.976623-08	\N	\N	\N	$	\N
d31adbde-7295-40b5-b011-697b214064c2	810772cf-f97e-478c-8939-c1631e8f1c70	Yes try again in body	3000	2022-12-23 13:49:50.521468-08	2022-12-23 13:49:50.521468-08	\N	\N	\N	$	\N
32d05c82-3de0-4ab2-b9ff-17fb9b2b0f4c	810772cf-f97e-478c-8939-c1631e8f1c70	Yes try again in body	3000	2022-12-23 13:50:59.449473-08	2022-12-23 13:50:59.449473-08	\N	\N	\N	$	\N
2d473230-c5a9-4572-8a1c-240f63a0bfe4	a6d1774a-bf34-40e7-b9a5-7011775efb4f	Yes try again in body this time hard	3000	2022-12-23 13:54:25.261813-08	2022-12-23 13:54:25.261813-08	\N	\N	\N	$	\N
7267404c-3648-461c-b472-a6ae1a577ee3	a6d1774a-bf34-40e7-b9a5-7011775efb4f	No Go home again hardereeerrrr	3000	2022-12-23 13:57:32.719123-08	2022-12-23 13:57:32.719123-08	\N	\N	\N	$	\N
33ecf772-d80f-4e89-9c99-000d3dbc4984	c95f391f-d94a-45f7-b2b5-a6260f8bec04	Yes our last try	3000	2022-12-23 13:59:20.108366-08	2022-12-23 13:59:20.108366-08	\N	\N	\N	$	\N
db98374b-7166-4146-9ccf-e8062a98a42c	24bb3104-3cc7-4405-ad14-72eeda08978e	No	0	2023-01-14 19:22:31.183289-08	2023-01-14 19:22:31.183289-08	\N	\N		usd	$
1065f92e-5fa8-4eb0-99c4-1a3f82d92335	24bb3104-3cc7-4405-ad14-72eeda08978e	Yes	0	2023-01-14 19:22:36.767442-08	2023-01-14 19:22:36.767442-08	\N	\N		usd	$
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
4a3ba3f9-949e-4d27-9be3-b269c4ee8252	5ff1b83f-7fe9-492a-9369-dab26e437de6	Yes	0	2023-01-14 20:34:26.224862-08	2023-01-14 20:34:26.224862-08	\N	\N		usd	$
fb1da75e-1b8c-44a0-9db8-efd38e15c9d7	402d230b-08cb-4db3-a311-409d3969a2e8	No	0	2022-12-28 08:32:11.635297-08	2022-12-28 08:32:11.635297-08	\N	\N		usd	$
093440bb-9e73-4731-97a6-de68e266100f	402d230b-08cb-4db3-a311-409d3969a2e8	Yes	10	2022-12-28 08:32:22.450984-08	2022-12-28 08:32:22.450984-08	\N	\N		usd	$
55b18b8d-eeca-4fdb-9542-aafa6205dbbe	5ff1b83f-7fe9-492a-9369-dab26e437de6	No	0	2023-01-14 20:34:33.692813-08	2023-01-14 20:34:33.692813-08	\N	\N		usd	$
2b5dd5f9-970c-48e3-ab1d-fb7852816e41	82b9793f-a002-4af7-ac68-09cf8f431105	Build New	5000	2022-12-28 08:15:45.347605-08	2022-12-28 08:15:45.347605-08	\N	\N	402d230b-08cb-4db3-a311-409d3969a2e8	usd	\N
2e88e718-4596-43dc-9ea5-888791d636d2	82b9793f-a002-4af7-ac68-09cf8f431105	Business Website	4000	2022-12-28 08:16:41.912839-08	2022-12-28 08:16:41.912839-08	\N	\N	75924dee-0b68-4691-b9c5-0c0588ed9fbd	usd	\N
d63bb2a5-b4d2-4f56-94e2-be289372b780	cd8dd648-8aaf-4d28-979a-66c3a5033205	No	0	2023-01-15 13:11:27.935472-08	2023-01-15 13:11:27.935472-08	\N	\N	4b53edee-80d9-4ebe-960f-f53c6cc26b2d	usd	$
09ec2566-4ded-45d7-a06d-105f63962c99	cd8dd648-8aaf-4d28-979a-66c3a5033205	Yes	0	2023-01-15 13:11:35.962089-08	2023-01-15 13:11:35.962089-08	\N	\N	4b53edee-80d9-4ebe-960f-f53c6cc26b2d	usd	$
ed57de7e-37a6-4bc8-80f2-dd74b8b06bcc	cd8dd648-8aaf-4d28-979a-66c3a5033205	Yes again	0	2023-01-15 13:11:44.930467-08	2023-01-15 13:11:44.930467-08	\N	\N	4b53edee-80d9-4ebe-960f-f53c6cc26b2d	usd	$
6386649b-6d47-403d-a7ac-6c1ee027b948	cd8dd648-8aaf-4d28-979a-66c3a5033205	sorry	0	2023-01-15 13:12:03.122879-08	2023-01-15 13:12:03.122879-08	\N	\N		usd	$
4bdcaa08-d089-4f79-9de0-cc109645617b	4b53edee-80d9-4ebe-960f-f53c6cc26b2d	No	0	2023-01-15 13:12:49.671233-08	2023-01-15 13:12:49.671233-08	\N	\N		usd	$
38144124-53c9-46ef-b691-ff1cb360e7e1	4b53edee-80d9-4ebe-960f-f53c6cc26b2d	Yes	0	2023-01-15 13:12:54.905892-08	2023-01-15 13:12:54.905892-08	\N	\N		usd	$
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (id, service, question, created_at, updated_at, created_by, updates_by, percentage, minimum_value, multiple) FROM stdin;
dd4fab5d-562f-474f-8020-b73478df97dd	9d9f0e7e-5e01-44af-a736-cea29040b3d1	good in english?	2022-12-20 23:16:53.818498-08	2022-12-20 23:16:53.818498-08	\N	\N	\N	\N	\N
810772cf-f97e-478c-8939-c1631e8f1c70	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	What team do you support?	2022-12-23 08:48:34.691453-08	2022-12-23 08:48:34.691453-08	\N	\N	\N	\N	\N
7867aa5e-995e-47c8-b296-1b7390e7d383	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	Okay you sleep then?	2022-12-23 09:02:37.748258-08	2022-12-23 09:02:37.748258-08	\N	\N	\N	\N	\N
a6d1774a-bf34-40e7-b9a5-7011775efb4f	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	Seems its becoming challenging?	2022-12-23 13:53:31.720712-08	2022-12-23 13:53:31.720712-08	\N	\N	\N	\N	\N
89ef3a8e-7417-4d15-80ae-4d8a91077247	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	for documentaion abi?	2022-12-23 14:31:50.729683-08	2022-12-23 14:31:50.729683-08	\N	\N	\N	\N	\N
fba69c51-85ed-419d-bd29-1956930a572d	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	for documentaion again again abi	2022-12-23 14:35:14.310787-08	2022-12-23 14:35:14.310787-08	\N	\N	\N	\N	\N
c1f40177-1975-4df3-ad83-ab04679001b3	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	we doing this for the lastime innit?	2022-12-26 09:00:29.343802-08	2022-12-26 09:00:29.343802-08	\N	\N	\N	\N	\N
7d94e4ec-aa21-4a6a-9a61-8dbc6faed95a	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	sub qtn for we doing this again right innit?	2022-12-26 10:36:13.851351-08	2022-12-26 10:36:13.851351-08	\N	\N	\N	\N	\N
83432b72-70f7-4975-bf06-50c893f2e3a6	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	hello one	2022-12-26 10:53:55.881808-08	2022-12-26 10:53:55.881808-08	\N	\N	\N	\N	\N
08d266ee-4223-44d8-9ade-b381b413dd8d	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	hello two	2022-12-26 10:54:05.157688-08	2022-12-26 10:54:05.157688-08	\N	\N	\N	\N	\N
9ca52a96-54c9-451a-aea6-6b2bdfb41369	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	after updating	2022-12-26 12:48:07.20003-08	2022-12-26 12:48:07.20003-08	\N	\N	\N	\N	\N
f36adc06-4c60-4ef5-ad96-6188f854bee5	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	after updating two	2022-12-26 12:48:12.671198-08	2022-12-26 12:48:12.671198-08	\N	\N	\N	\N	\N
f950c06b-1dd5-4f6a-a2a6-9c18cc4f1352	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	after updating three	2022-12-26 12:51:22.805948-08	2022-12-26 12:51:22.805948-08	\N	\N	\N	\N	\N
54967e48-1f2a-48b6-b910-2788598f4c4d	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	after updating fotuh	2022-12-26 13:01:09.777725-08	2022-12-26 13:01:09.777725-08	\N	\N	\N	\N	\N
82b9793f-a002-4af7-ac68-09cf8f431105	bc022627-5133-4834-942e-8496cd614ddf	Would you like to build new website or redesign your existing website?	2022-12-28 08:06:18.031121-08	2022-12-28 08:06:18.031121-08	\N	\N	\N	\N	\N
5f945bdf-542c-4b98-9f96-1f095c0f08f4	bc022627-5133-4834-942e-8496cd614ddf	How many pages you need in a website?	2022-12-28 08:06:44.992647-08	2022-12-28 08:06:44.992647-08	\N	\N	\N	\N	\N
891d331d-9392-43a2-9071-49c467c23e9c	bc022627-5133-4834-942e-8496cd614ddf	Would you like to get domain name and hosting? (i.e. www.businessname.com)	2022-12-28 08:07:04.887894-08	2022-12-28 08:07:04.887894-08	\N	\N	\N	\N	\N
a5ca7a00-f816-422a-bed7-854c5819d06d	bc022627-5133-4834-942e-8496cd614ddf	Would you like to get company email address? (i.e. contact@businessname.com)	2022-12-28 08:07:23.953107-08	2022-12-28 08:07:23.953107-08	\N	\N	\N	\N	\N
66830599-79fb-4be0-a2ac-1d9412631a24	bc022627-5133-4834-942e-8496cd614ddf	Would you like us to write website content?	2022-12-28 08:07:49.972713-08	2022-12-28 08:07:49.972713-08	\N	\N	\N	\N	\N
892141e1-5141-4b4f-b501-fe394333344b	bc022627-5133-4834-942e-8496cd614ddf	Would you like to register your business on Google? (Google MyBusiness)	2022-12-28 08:09:30.284656-08	2022-12-28 08:09:30.284656-08	\N	\N	\N	\N	\N
f4421d9f-2bbc-491b-b78e-d1547a994ce1	bc022627-5133-4834-942e-8496cd614ddf	Would you like to integrate Google Analytics to traffic on your website?	2022-12-28 08:09:53.725329-08	2022-12-28 08:09:53.725329-08	\N	\N	\N	\N	\N
402d230b-08cb-4db3-a311-409d3969a2e8	bc022627-5133-4834-942e-8496cd614ddf	Are you sure you want to build new?	2022-12-28 08:30:41.395135-08	2022-12-28 08:30:41.395135-08	\N	\N	\N	\N	\N
75924dee-0b68-4691-b9c5-0c0588ed9fbd	bc022627-5133-4834-942e-8496cd614ddf	Are you sure you want to build new Business Website?	2022-12-28 08:33:17.585515-08	2022-12-28 08:33:17.585515-08	\N	\N	\N	\N	\N
3321c09d-b923-421e-be67-bfe855547773	bc022627-5133-4834-942e-8496cd614ddf	Do you want our Digital Marketing Package?	2023-01-14 19:17:04.387903-08	2023-01-14 19:17:04.387903-08	\N	\N	\N	\N	\N
24bb3104-3cc7-4405-ad14-72eeda08978e	bc022627-5133-4834-942e-8496cd614ddf	Package Type	2023-01-14 19:20:59.965422-08	2023-01-14 19:20:59.965422-08	\N	\N	\N	\N	\N
5ff1b83f-7fe9-492a-9369-dab26e437de6	bc022627-5133-4834-942e-8496cd614ddf	hello we go again	2023-01-14 20:33:11.291855-08	2023-01-14 20:33:11.291855-08	\N	\N	\N	\N	\N
cd8dd648-8aaf-4d28-979a-66c3a5033205	bc022627-5133-4834-942e-8496cd614ddf	sunday last special	2023-01-15 13:10:21.92162-08	2023-01-15 13:10:21.92162-08	\N	\N	\N	\N	\N
4b53edee-80d9-4ebe-960f-f53c6cc26b2d	bc022627-5133-4834-942e-8496cd614ddf	sunday last special if next	2023-01-15 13:11:09.867958-08	2023-01-15 13:11:09.867958-08	\N	\N	\N	\N	\N
56894bc4-65d9-4317-b12f-0dca73caa3f4	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	eben?	2022-12-26 10:35:53.854413-08	2022-12-26 10:35:53.854413-08	\N	\N	\N	\N	\N
864badac-a2b8-4ab8-910b-e77ded4ddff7	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	Do you love football again?	2022-12-23 08:46:15.483325-08	2022-12-23 08:46:15.483325-08	\N	\N	\N	\N	\N
c95f391f-d94a-45f7-b2b5-a6260f8bec04	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	Do you love football again?	2022-12-23 13:58:53.156989-08	2022-12-23 13:58:53.156989-08	\N	\N	20	10	\N
c4278375-b6bb-4fa2-84d0-30047ad42400	bc022627-5133-4834-942e-8496cd614ddf	Would you like to design new logo for your brand?	2022-12-28 08:08:09.034099-08	2022-12-28 08:08:09.034099-08	\N	\N	20	10	\N
559b2a71-05cc-4372-85e3-c6aa63eaa6e3	bc022627-5133-4834-942e-8496cd614ddf	How many custom banners would you like to make for the website?	2022-12-28 08:09:15.807174-08	2022-12-28 08:09:15.807174-08	\N	\N	\N	\N	t
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, service, description, created_at, updated_at, created_by, updates_by, dynamicinfo) FROM stdin;
9d9f0e7e-5e01-44af-a736-cea29040b3d1	felicity three	for felecity	2022-12-20 22:15:35.286971-08	2022-12-20 22:15:35.286971-08	\N	\N	\N
bec9e57e-85eb-4b6d-87ff-9d1628f36d3d	ecommerce	an updated ecommerce thing	2022-12-20 23:08:13.127797-08	2022-12-20 23:08:13.127797-08	\N	\N	\N
f36ffa40-c2a9-46bb-aedc-5b38f35d91bc	about football	the love of the game	2022-12-23 08:44:28.612485-08	2022-12-23 08:44:28.612485-08	\N	\N	\N
b5db11b8-fd56-41ec-be37-dbf738032bd0	for demo again	for_demo_again_with_underscores	2022-12-26 08:49:57.937169-08	2022-12-26 08:49:57.937169-08	\N	\N	\N
cf53e57b-93ef-4827-b1b3-697992c09c36	we creating a sevice 	we_creating_service_with_underscores	2022-12-26 10:28:04.358497-08	2022-12-26 10:28:04.358497-08	\N	\N	\N
3a56dc83-4076-446a-b983-02d2b66fa1ad	real_qtns go	for our real questions now	2023-01-18 10:07:30.056671-08	2023-01-18 10:07:30.056671-08	\N	\N	\N
bc022627-5133-4834-942e-8496cd614ddf	real_qtns	for updating creating services with option	2022-12-28 07:57:09.738943-08	2022-12-28 07:57:09.738943-08	\N	\N	{"data":" ` <h2>My dynamic Information through bend</h2> <img class='dynamicLogo' src='assets/images/azLogo.png' alt=''>`"}
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
6d295659-4e5f-4efa-85b7-81e703ff1ff3	Prince  Hello	afd	asidf@gmail.com	6555888	industry_1	2023-01-04 10:15:41.333078-08	2023-01-04 10:15:41.333078-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
f1444cf1-ee42-4eff-8e68-11af420f0d91	PRINCE  Darko	My business	padarko99@gmail.com	2569865214	industry_2	2023-01-04 10:18:32.777013-08	2023-01-04 10:18:32.777013-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
daea9573-8e36-44fb-a992-4b66b3e880bb	Asif  Bharmal	My_business	asif@azguards.com	512255885555	industry_3	2023-01-04 11:10:06.733029-08	2023-01-04 11:10:06.733029-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
3968ec3f-4ccd-4f8d-9e8f-1bea4fd6cb13	Ali  Bharmal	My_bus	aliasgar@azguards.com	4585558845	industry_1	2023-01-04 11:11:19.439888-08	2023-01-04 11:11:19.439888-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
b133da5e-7df1-428f-8f3b-9442fdd1b027	Abdeali  Vaniya	My_bus	abdeali@azgurads.com	225255	industry_2	2023-01-04 11:12:21.447031-08	2023-01-04 11:12:21.447031-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
e7d468f7-7e73-40c5-b3f6-49dbc2879d3d	afsdk  asdf  asdf	asdf	padarko99@gmail.com	2569865214	industry_1	2023-01-04 11:15:09.525211-08	2023-01-04 11:15:09.525211-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
9186d5aa-04e1-468a-b05b-bd98ddae6265	afsdk  asdf	asdf	padarko99@gmail.com	2569865214	industry_1	2023-01-04 11:15:09.528763-08	2023-01-04 11:15:09.528763-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
1bffeb54-0c8d-465e-ac16-50112cac07ed	Prince  Dsr	asdf	padarko99@gmail.com	2569865214	industry_2	2023-01-04 11:18:43.57355-08	2023-01-04 11:18:43.57355-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
6879a4db-de1b-4e33-abf3-3f4da73f60c5	PRINCE  ads	asdf	padarko99@gmail.com	2569865214	industry_1	2023-01-04 11:25:59.781251-08	2023-01-04 11:25:59.781251-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
cb89afab-26e2-4847-93e3-e749a3beb32b	Asif  Bharmal	My_business	asif@azguards.com	5454564	industry_1	2023-01-04 11:27:44.311111-08	2023-01-04 11:27:44.311111-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
c6c1b65e-5202-4e2b-b80b-5d18f0155731	Ali  Bharmal	My_bus	aliasgar@azguards.com	4585558845	industry_2	2023-01-04 11:28:33.49499-08	2023-01-04 11:28:33.49499-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
0fd94bef-89ce-4b17-84d5-70f4379537e0	Abdeali  Vaniya	My_bus	abdeali@azgurads.com	44546554654	industry_1	2023-01-04 11:29:15.828712-08	2023-01-04 11:29:15.828712-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
bf254675-9cb6-4ed1-b312-19bcf5ba4782	Abdeali  Vaniya	My_bus	abdeali@azguards.com	564545	industry_2	2023-01-04 11:32:18.861013-08	2023-01-04 11:32:18.861013-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
32d07c5c-98e2-406d-b380-8f355262ac1c	Prince  Hello	Mybs	padarko99@gmail.com	2569865214	industry_1	2023-01-04 15:16:34.426577-08	2023-01-04 15:16:34.426577-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
977e5a84-27a4-4d43-922d-f02f9905c0a5	Asif  Bharmal	My_business	asif@azguards.com	5454564	industry_2	2023-01-04 15:39:08.846604-08	2023-01-04 15:39:08.846604-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
f1036599-578a-4a87-aec3-8b870d85f36a	Ali  Bharmal	My_bus	aliasgar@azguards.com	4585558845	industry_2	2023-01-04 15:40:29.748025-08	2023-01-04 15:40:29.748025-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
bbe3f423-842f-4878-84de-c32e44f14868	Abdeali  Vaniya	My_bus	abdeali@azguards.com	2569865214	industry_1	2023-01-04 15:41:37.028453-08	2023-01-04 15:41:37.028453-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
415fa928-a9aa-4688-bb28-02706ca7ca12	Prince  Hello	Mybs	padarko99@gmail.com	2569865214	industry_2	2023-01-05 07:55:32.744452-08	2023-01-05 07:55:32.744452-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
4b2e2d48-7e32-4cef-84e5-1247c74a5791	Abdeali  Vaniya	My_bus	abdeali@azguards.com	2569865214	industry_1	2023-01-06 10:05:59.507526-08	2023-01-06 10:05:59.507526-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
d6bf6540-06e1-46d8-b206-60869e1e6cbb	Prince  Darko	My_bus	padarko99@gmail.com	2569865214	industry_3	2023-01-06 10:06:05.830843-08	2023-01-06 10:06:05.830843-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
503d6ec8-944e-4fac-8153-3a03cceaf361	Prince  Darko	My_bus	padarko99@gmail.com	2569865214	industry_3	2023-01-06 13:14:20.747689-08	2023-01-06 13:14:20.747689-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
353dbf4c-ec20-443e-a268-1aeb2e907000	Prince  Darko	My_bus	padarko99@gmail.com	2569865214	industry_2	2023-01-06 13:20:20.137434-08	2023-01-06 13:20:20.137434-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
f3c091f1-51bb-477c-a1e1-629d4f53c838	Prince  Darko	My_bus	padarko99@gmail.com	2569865214	industry_1	2023-01-06 13:21:08.188283-08	2023-01-06 13:21:08.188283-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
75538bfc-61fe-4179-8c04-c4fb4b524903	Prince  Darko	My_bus	padarko99@gmail.com	2569865214	industry_1	2023-01-06 14:15:27.634838-08	2023-01-06 14:15:27.634838-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
186968a8-f227-4197-8d16-5c82b4f4311d	Asif  Bharmal	Our bus	asif@azguards.com	5454564	industry_1	2023-01-06 14:32:32.83722-08	2023-01-06 14:32:32.83722-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
924323c0-3583-4b1c-b62e-a94e61f271f7	kljkjkl  Bharmal	Our bus	asif@jkk.com	5454564	industry_3	2023-01-09 13:26:15.439952-08	2023-01-09 13:26:15.439952-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
c71e4c1c-c520-41e9-929d-b72a93cf7071	kljkjkl  Bharmal	Our bus	asif@jkk.com	5454564	industry_3	2023-01-10 14:03:31.390367-08	2023-01-10 14:03:31.390367-08	\N	\N	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc
fbbeb8b4-246a-453d-89cb-527c9ffc5534	Abdeali  Vaniya	My_bus	abdeali@azguards.com	2569865214	industry_2	2023-01-10 14:08:00.889412-08	2023-01-10 14:08:00.889412-08	\N	\N	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc
4004c264-1d90-4587-aa1a-49bf1804f6ff	Prince  Darko	My_bus	padarko99@gmail.com	2569865214	industry_1	2023-01-10 15:00:50.192522-08	2023-01-10 15:00:50.192522-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
6acfd508-cd04-43fd-8001-7d7cbb4616a5	Asif  Bharmal	Our bus	asif@azguards.com	5454564	industry_2	2023-01-10 16:02:02.051618-08	2023-01-10 16:02:02.051618-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
65338186-2e57-49cf-9234-34e047ef56f4	Abdeali  Vaniya	My_bus	abdeali@azguards.com	2569865214	industry_2	2023-01-10 16:03:43.395177-08	2023-01-10 16:03:43.395177-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
5b11dc34-fac4-4c93-8764-923b1294ac91	Asif  Bharmal	Our bus	asif@azguards.com	+233 54 125 0251	industry_2	2023-01-12 08:07:21.864902-08	2023-01-12 08:07:21.864902-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
4df193e6-97a9-4bd5-b451-91a75db69879	Prince  Darko	My_bus	padarko99@gmail.com	+233 54 125 0251	industry_1	2023-01-12 12:37:39.95137-08	2023-01-12 12:37:39.95137-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
c7766816-63df-4916-9a68-2eb4a1ceb760	Prince  Darko	My_bus	padarko99@gmail.com	+233 54 125 0251	industry_3	2023-01-12 13:13:46.849524-08	2023-01-12 13:13:46.849524-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
0b3f3f5e-a859-44d9-983a-ada6e9c275d6	Prince  Darko	My_bus	padarko99@gmail.com	+233 54 125 0251	industry_2	2023-01-12 13:48:45.948657-08	2023-01-12 13:48:45.948657-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
4d6c749d-ade0-4bb9-a7b3-461091ee2800	Asif  Bharmal	Our bus	asif@azguards.com	+233 54 125 0251	industry_2	2023-01-12 13:57:12.865027-08	2023-01-12 13:57:12.865027-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
88c3b26a-dd3d-4fbc-88bf-f171c1cfdbd2	Ali  Bharmal	My_bus	aliasgar@azguards.com	+233 54 125 0251	industry_3	2023-01-12 13:59:28.745043-08	2023-01-12 13:59:28.745043-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
2ea01702-fcbf-4531-a4eb-16be241387c1	Abdeali  Vaniya	My_bus	abdeali@azguards.com	+233 54 125 0251	industry_1	2023-01-12 14:03:03.871418-08	2023-01-12 14:03:03.871418-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
7d6a5627-85d8-442c-bfe3-ea7ce38c0639	Prince  Darko	My_bus	padarko99@gmail.com	+233 54 125 0251	industry_2	2023-01-12 14:06:25.719774-08	2023-01-12 14:06:25.719774-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
4cc89e27-b2ec-47e2-8182-5ffd7789ba79	Prince  Darko	My_bus	padarko99@gmail.com	+233 54 125 0251	industry_2	2023-01-13 10:17:56.595474-08	2023-01-13 10:17:56.595474-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
2260d2bc-6a95-4e25-9e48-778424b77632	Prince  Darko	My_bus	padarko99@gmail.com	+233 54 125 0251	Auto-Parts	2023-01-14 19:04:47.484949-08	2023-01-14 19:04:47.484949-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
a66c95b2-91db-49e0-a843-e547e5e859bf	Prince  Darko	My_bus	padarko99@gmail.com	+233 54 125 0251	Agriculture	2023-01-15 14:38:08.608858-08	2023-01-15 14:38:08.608858-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
d1b2681e-4201-4dd2-8bf1-711c349480ae	Abdeali  Vaniya	My_bus	abdeali@azguards.com	+233 54 125 0251	Agriculture	2023-01-16 08:59:22.515712-08	2023-01-16 08:59:22.515712-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
4bebc856-4e74-41de-8ecc-66673178d2d5	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-15 13:00:51.003758-08	2023-02-15 13:00:51.003758-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
abe36d67-ba34-48c8-b024-3fa6d6b91512	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-15 15:24:03.489978-08	2023-02-15 15:24:03.489978-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
f5392330-3a62-4719-9694-7407f8b29ba5	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-15 15:26:20.340087-08	2023-02-15 15:26:20.340087-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
3dbf1123-fb2d-4659-8a50-272f38874172	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Arts and Crafts	2023-02-15 15:28:05.166753-08	2023-02-15 15:28:05.166753-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
24b7aa85-300c-487a-afe4-52b9dc11f832	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Arts and Crafts	2023-02-15 15:29:06.314421-08	2023-02-15 15:29:06.314421-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
7a3d3414-043d-4852-8522-da7ecac98020	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-15 15:30:22.220351-08	2023-02-15 15:30:22.220351-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
9c5d2acb-55fa-4252-bb97-0dd816fc6bae	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-15 15:32:15.846856-08	2023-02-15 15:32:15.846856-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
d3ec255a-3abc-4c16-9818-a1947b7356b7	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-15 15:33:33.039141-08	2023-02-15 15:33:33.039141-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
f97f6cfa-fc63-4b3c-9455-59867ea0285b	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Arts and Crafts	2023-02-15 15:34:53.038267-08	2023-02-15 15:34:53.038267-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
0e2177d5-5756-48c6-b6b6-747b7ad24ad7	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-15 15:40:24.054475-08	2023-02-15 15:40:24.054475-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
48264644-6cb2-4a95-8d3b-3efb1cfbc82f	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-15 15:40:56.544759-08	2023-02-15 15:40:56.544759-08	\N	\N	9d9f0e7e-5e01-44af-a736-cea29040b3d1
e004e020-6add-4cbc-88e1-45a742c922eb	anita  darko  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-15 15:40:59.845674-08	2023-02-15 15:40:59.845674-08	\N	\N	9d9f0e7e-5e01-44af-a736-cea29040b3d1
55632a66-1636-460e-8b20-aba87339daa0	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-15 15:42:37.577327-08	2023-02-15 15:42:37.577327-08	\N	\N	9d9f0e7e-5e01-44af-a736-cea29040b3d1
ef055a45-2b8d-4082-9cdb-5c62cdfcf931	anita  prince	WE TRYING PROFESSIONAL	padarko99@gmail.com	+233 54 125 0251	Agriculture	2023-02-15 15:44:12.399915-08	2023-02-15 15:44:12.399915-08	\N	\N	9d9f0e7e-5e01-44af-a736-cea29040b3d1
fd25b73e-6ed6-44ae-8b58-bf3826df08a3	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-16 10:02:39.674658-08	2023-02-16 10:02:39.674658-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
e55b5341-4404-4013-accf-eda57c2729d3	anita  darko  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-16 10:02:40.853365-08	2023-02-16 10:02:40.853365-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
b06b28f2-ebb5-4984-ae4f-c220506b8c42	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-16 10:03:14.055022-08	2023-02-16 10:03:14.055022-08	\N	\N	f36ffa40-c2a9-46bb-aedc-5b38f35d91bc
3fae4aa7-a6f5-441c-9fe1-44fa7b23aeec	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Arts and Crafts	2023-02-16 11:04:48.866201-08	2023-02-16 11:04:48.866201-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
4b4e68fa-c2c0-4722-a5a0-e018f7081e3b	anita  darko  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Arts and Crafts	2023-02-16 11:04:58.284261-08	2023-02-16 11:04:58.284261-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
37ba4f34-5d82-404e-b205-a713248c937e	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Auto-Parts	2023-02-17 09:51:02.618391-08	2023-02-17 09:51:02.618391-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
7d609bb4-7ef6-4d80-aee6-b99c12ba3d45	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Arts and Crafts	2023-02-21 14:39:55.57444-08	2023-02-21 14:39:55.57444-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
79d35c54-1ad9-4cc5-b3a2-9a0a7e042f8e	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Arts and Crafts	2023-02-21 20:21:46.182772-08	2023-02-21 20:21:46.182772-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
bbf57559-4b46-4d84-b893-90da95eccfa3	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Auto-Parts	2023-02-21 20:24:33.526345-08	2023-02-21 20:24:33.526345-08	\N	\N	3a56dc83-4076-446a-b983-02d2b66fa1ad
032665cc-dacb-4b62-a0ee-7bb0c1e99250	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Auto-Parts	2023-02-21 20:35:18.003205-08	2023-02-21 20:35:18.003205-08	\N	\N	3a56dc83-4076-446a-b983-02d2b66fa1ad
eef7bf81-2dd1-43cb-8191-d920ba36974f	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-21 20:36:17.114107-08	2023-02-21 20:36:17.114107-08	\N	\N	3a56dc83-4076-446a-b983-02d2b66fa1ad
78b099a3-08d1-44fe-bfc1-c740d30d57ba	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Arts and Crafts	2023-02-21 20:39:21.033102-08	2023-02-21 20:39:21.033102-08	\N	\N	3a56dc83-4076-446a-b983-02d2b66fa1ad
68c473e9-f063-4c77-b88e-d6a9911b8ebc	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Arts and Crafts	2023-02-21 20:45:59.422837-08	2023-02-21 20:45:59.422837-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
ec81a200-4929-45d2-8ec3-56a3c96c2823	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Auto-Parts	2023-02-21 20:48:27.2061-08	2023-02-21 20:48:27.2061-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
86c5de12-137f-46af-9b8c-dad025c28ae2	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Arts and Crafts	2023-02-21 20:52:57.784854-08	2023-02-21 20:52:57.784854-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
12996f64-e965-4396-98e7-1e493ce1bbb8	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-02-22 10:03:12.131688-08	2023-02-22 10:03:12.131688-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
bbcb2fb0-31c3-4d1d-b341-f5b326901804	anita  darko	WE TRYING PROFESSIONAL	anita@gmail.com	+233 54 125 0251	Agriculture	2023-03-02 08:28:51.571507-08	2023-03-02 08:28:51.571507-08	\N	\N	bc022627-5133-4834-942e-8496cd614ddf
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
2df539ad-6741-448f-9a77-cfe00aade49f	f1444cf1-ee42-4eff-8e68-11af420f0d91	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 10:19:01.055459-08	2023-01-04 10:19:01.055459-08	\N	\N
676a282d-d119-460c-8aa8-7ebe59ff08e2	f1444cf1-ee42-4eff-8e68-11af420f0d91	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 10:21:49.292206-08	2023-01-04 10:21:49.292206-08	\N	\N
251adc8b-bd87-42df-a770-3d449fc4b4f0	f1444cf1-ee42-4eff-8e68-11af420f0d91	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 10:23:49.13488-08	2023-01-04 10:23:49.13488-08	\N	\N
3a556c28-c4f3-437b-a2a5-744914170dce	f1444cf1-ee42-4eff-8e68-11af420f0d91	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 10:36:15.579824-08	2023-01-04 10:36:15.579824-08	\N	\N
46c9c47e-ed84-4c05-afcc-bd95aae13914	daea9573-8e36-44fb-a992-4b66b3e880bb	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 11:10:34.105015-08	2023-01-04 11:10:34.105015-08	\N	\N
ad1ce571-ddee-44a1-9ab8-f819928f8bce	3968ec3f-4ccd-4f8d-9e8f-1bea4fd6cb13	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 11:11:41.64064-08	2023-01-04 11:11:41.64064-08	\N	\N
c9ccecbe-48f3-429b-ba68-42efdd6cba25	b133da5e-7df1-428f-8f3b-9442fdd1b027	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"e62445dc-2691-4adf-90c8-c00e9d4686c9","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 11:12:39.383559-08	2023-01-04 11:12:39.383559-08	\N	\N
f998a531-87b0-40db-895b-c3d04cf19f07	e7d468f7-7e73-40c5-b3f6-49dbc2879d3d	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"fb1da75e-1b8c-44a0-9db8-efd38e15c9d7","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"cfa03499-d518-4325-9f73-2bcdbd5376e7","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 11:17:12.525336-08	2023-01-04 11:17:12.525336-08	\N	\N
c875c263-d97f-4f69-bf25-7d5df33f86cd	1bffeb54-0c8d-465e-ac16-50112cac07ed	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"0179cba2-896d-4c58-8e65-8a59a84ec8ee","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"421c0f84-5da3-42ca-ba2c-8c16ca74e306","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"0f401647-ab78-4018-8543-d73209d82479"}	2023-01-04 11:19:00.151312-08	2023-01-04 11:19:00.151312-08	\N	\N
f5ea4887-3f02-41a9-86a2-495e01825b44	6879a4db-de1b-4e33-abf3-3f4da73f60c5	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 11:26:17.952002-08	2023-01-04 11:26:17.952002-08	\N	\N
7bfa0999-2459-4056-a859-7737872f6791	cb89afab-26e2-4847-93e3-e749a3beb32b	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"0179cba2-896d-4c58-8e65-8a59a84ec8ee","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"e62445dc-2691-4adf-90c8-c00e9d4686c9","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 11:28:03.3267-08	2023-01-04 11:28:03.3267-08	\N	\N
cb67409a-ed01-4bdc-bfdf-fd867e202494	c6c1b65e-5202-4e2b-b80b-5d18f0155731	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 11:28:49.945552-08	2023-01-04 11:28:49.945552-08	\N	\N
9cbfee05-bc40-40b5-b99c-a45b86fd8fff	0fd94bef-89ce-4b17-84d5-70f4379537e0	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"421c0f84-5da3-42ca-ba2c-8c16ca74e306","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 11:29:36.236564-08	2023-01-04 11:29:36.236564-08	\N	\N
c50d61a4-ede4-44a8-97c9-b7b6a2488038	bf254675-9cb6-4ed1-b312-19bcf5ba4782	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 11:33:33.256359-08	2023-01-04 11:33:33.256359-08	\N	\N
9ede1f73-c861-44f3-8ae1-4883f878e93d	32d07c5c-98e2-406d-b380-8f355262ac1c	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"421c0f84-5da3-42ca-ba2c-8c16ca74e306","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 15:17:01.2978-08	2023-01-04 15:17:01.2978-08	\N	\N
72fca701-8acb-4c12-beb3-36483574f33f	32d07c5c-98e2-406d-b380-8f355262ac1c	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"fb1da75e-1b8c-44a0-9db8-efd38e15c9d7","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"cfa03499-d518-4325-9f73-2bcdbd5376e7","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 15:22:23.270485-08	2023-01-04 15:22:23.270485-08	\N	\N
2334e450-5202-41e4-877d-c064e2899e2a	32d07c5c-98e2-406d-b380-8f355262ac1c	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"093440bb-9e73-4731-97a6-de68e266100f","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"421c0f84-5da3-42ca-ba2c-8c16ca74e306","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 15:26:01.898455-08	2023-01-04 15:26:01.898455-08	\N	\N
4697413f-9c68-4cec-934e-33589be5c0e7	32d07c5c-98e2-406d-b380-8f355262ac1c	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"093440bb-9e73-4731-97a6-de68e266100f","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"421c0f84-5da3-42ca-ba2c-8c16ca74e306","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"0f401647-ab78-4018-8543-d73209d82479"}	2023-01-04 15:28:17.451031-08	2023-01-04 15:28:17.451031-08	\N	\N
907063df-7c9b-441c-8ad9-1bb2efa150d3	977e5a84-27a4-4d43-922d-f02f9905c0a5	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"093440bb-9e73-4731-97a6-de68e266100f","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"0179cba2-896d-4c58-8e65-8a59a84ec8ee","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 15:39:34.430764-08	2023-01-04 15:39:34.430764-08	\N	\N
767652ec-a65d-43f5-a57d-451249d7ed9b	f1036599-578a-4a87-aec3-8b870d85f36a	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"0f401647-ab78-4018-8543-d73209d82479"}	2023-01-04 15:40:59.436305-08	2023-01-04 15:40:59.436305-08	\N	\N
6b7ce334-a5dc-4ec3-beea-41ad11d82e65	bbe3f423-842f-4878-84de-c32e44f14868	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"0179cba2-896d-4c58-8e65-8a59a84ec8ee","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-04 15:41:58.620829-08	2023-01-04 15:41:58.620829-08	\N	\N
7260fa0d-3f84-4790-8ce8-d679f81c977d	415fa928-a9aa-4688-bb28-02706ca7ca12	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"0f401647-ab78-4018-8543-d73209d82479"}	2023-01-05 07:56:27.40279-08	2023-01-05 07:56:27.40279-08	\N	\N
859e4c4b-724a-4fba-97b2-89d693d0c982	415fa928-a9aa-4688-bb28-02706ca7ca12	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-05 07:58:20.231945-08	2023-01-05 07:58:20.231945-08	\N	\N
f0d7009d-f9c1-44cb-a8ef-1b41d4a54de0	75538bfc-61fe-4179-8c04-c4fb4b524903	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-06 14:15:46.476334-08	2023-01-06 14:15:46.476334-08	\N	\N
73bf8e54-0d1e-41d9-8e39-6c151184d7f8	75538bfc-61fe-4179-8c04-c4fb4b524903	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-06 14:24:55.743657-08	2023-01-06 14:24:55.743657-08	\N	\N
15a54760-0f01-40c4-9837-a9a7f52df66d	75538bfc-61fe-4179-8c04-c4fb4b524903	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-06 14:27:19.608181-08	2023-01-06 14:27:19.608181-08	\N	\N
0725b3d5-0f76-4ca4-b3d7-88efffbf1a0f	186968a8-f227-4197-8d16-5c82b4f4311d	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"e62445dc-2691-4adf-90c8-c00e9d4686c9","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-06 14:32:56.119042-08	2023-01-06 14:32:56.119042-08	\N	\N
29402f60-6332-44ea-b589-4fa10613cb87	186968a8-f227-4197-8d16-5c82b4f4311d	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"fb1da75e-1b8c-44a0-9db8-efd38e15c9d7","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"cfa03499-d518-4325-9f73-2bcdbd5376e7","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"0f401647-ab78-4018-8543-d73209d82479"}	2023-01-06 14:33:46.228809-08	2023-01-06 14:33:46.228809-08	\N	\N
a45f5800-f2f3-4a54-b13d-434c658707c3	4004c264-1d90-4587-aa1a-49bf1804f6ff	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"fb1da75e-1b8c-44a0-9db8-efd38e15c9d7","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"421c0f84-5da3-42ca-ba2c-8c16ca74e306","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-10 15:07:22.827072-08	2023-01-10 15:07:22.827072-08	\N	\N
a8cfc17f-3ce5-4b00-9153-f6432a7a6c0d	4004c264-1d90-4587-aa1a-49bf1804f6ff	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"fb1da75e-1b8c-44a0-9db8-efd38e15c9d7","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"0179cba2-896d-4c58-8e65-8a59a84ec8ee","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"a0ea53d4-9777-4fff-ae5c-236ac6bde802","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-10 15:10:51.92124-08	2023-01-10 15:10:51.92124-08	\N	\N
156fc077-d121-447f-b854-8fa0c1a3622d	4004c264-1d90-4587-aa1a-49bf1804f6ff	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-10 15:33:54.198123-08	2023-01-10 15:33:54.198123-08	\N	\N
e07c131e-ba0b-4e75-90ae-066fd21f22d3	4004c264-1d90-4587-aa1a-49bf1804f6ff	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-10 15:57:09.456379-08	2023-01-10 15:57:09.456379-08	\N	\N
0ad86462-d442-4533-89ca-00bf7d7e538f	6acfd508-cd04-43fd-8001-7d7cbb4616a5	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"cfa03499-d518-4325-9f73-2bcdbd5376e7","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-10 16:02:31.043587-08	2023-01-10 16:02:31.043587-08	\N	\N
fc13dedb-e740-4ada-9691-6b114cb62d4b	65338186-2e57-49cf-9234-34e047ef56f4	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"fb1da75e-1b8c-44a0-9db8-efd38e15c9d7","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"a0ea53d4-9777-4fff-ae5c-236ac6bde802","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-10 16:04:03.516496-08	2023-01-10 16:04:03.516496-08	\N	\N
1a8b7fbd-c7a8-4395-9990-e3428950a5c0	5b11dc34-fac4-4c93-8764-923b1294ac91	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2b5dd5f9-970c-48e3-ab1d-fb7852816e41","402d230b-08cb-4db3-a311-409d3969a2e8":"fb1da75e-1b8c-44a0-9db8-efd38e15c9d7","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"421c0f84-5da3-42ca-ba2c-8c16ca74e306","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"e62445dc-2691-4adf-90c8-c00e9d4686c9","892141e1-5141-4b4f-b501-fe394333344b":"a0ea53d4-9777-4fff-ae5c-236ac6bde802","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 08:21:09.435209-08	2023-01-12 08:21:09.435209-08	\N	\N
3dae3752-11a2-4a3a-81fc-4f154ce9441c	4df193e6-97a9-4bd5-b451-91a75db69879	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 12:38:00.310794-08	2023-01-12 12:38:00.310794-08	\N	\N
35445aa1-5814-44c9-830e-6a0da534f20a	4df193e6-97a9-4bd5-b451-91a75db69879	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"0179cba2-896d-4c58-8e65-8a59a84ec8ee","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"421c0f84-5da3-42ca-ba2c-8c16ca74e306","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 12:42:54.298012-08	2023-01-12 12:42:54.298012-08	\N	\N
f062da4f-9baf-46f9-9847-3669adeb65a4	4df193e6-97a9-4bd5-b451-91a75db69879	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 12:47:59.998024-08	2023-01-12 12:47:59.998024-08	\N	\N
f99f241b-a4d0-49eb-9bfd-5e5be71fbfdf	c7766816-63df-4916-9a68-2eb4a1ceb760	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 13:14:09.339295-08	2023-01-12 13:14:09.339295-08	\N	\N
f3cb7c0d-ad53-46af-894b-1ecff71640c8	0b3f3f5e-a859-44d9-983a-ada6e9c275d6	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 13:50:26.846339-08	2023-01-12 13:50:26.846339-08	\N	\N
470e343d-dc45-42e3-b786-bb132ee0dbc4	0b3f3f5e-a859-44d9-983a-ada6e9c275d6	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 13:52:14.547184-08	2023-01-12 13:52:14.547184-08	\N	\N
d2b6e7a2-b5f5-4bcf-b9e7-b4f4370d84e8	0b3f3f5e-a859-44d9-983a-ada6e9c275d6	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"181b1338-636c-4819-af4b-1d3ebd450920","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 13:55:03.145241-08	2023-01-12 13:55:03.145241-08	\N	\N
df350f59-6117-4e76-9e2b-76671dd05367	4d6c749d-ade0-4bb9-a7b3-461091ee2800	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 13:57:29.117212-08	2023-01-12 13:57:29.117212-08	\N	\N
cd5bd20b-30ee-4686-9147-faddd1ab63b1	88c3b26a-dd3d-4fbc-88bf-f171c1cfdbd2	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 13:59:52.24142-08	2023-01-12 13:59:52.24142-08	\N	\N
5d4c09a5-78f5-485d-bc44-6e7da76fb553	88c3b26a-dd3d-4fbc-88bf-f171c1cfdbd2	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"0f401647-ab78-4018-8543-d73209d82479"}	2023-01-12 14:01:41.712864-08	2023-01-12 14:01:41.712864-08	\N	\N
6b13a9ae-3bb6-4a13-8f55-5ccdaf3f1df8	2ea01702-fcbf-4531-a4eb-16be241387c1	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"daf335af-a455-4f03-a5cf-51ae1451b80b","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"0ef415a3-f1fc-41d0-9021-73aa714c1fdc","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"0f401647-ab78-4018-8543-d73209d82479"}	2023-01-12 14:03:18.864955-08	2023-01-12 14:03:18.864955-08	\N	\N
2b70adcd-5836-4f2e-b655-f9a32360be25	2ea01702-fcbf-4531-a4eb-16be241387c1	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 14:05:13.631538-08	2023-01-12 14:05:13.631538-08	\N	\N
ed785212-e8f8-493b-9d64-fa87bd2e0744	7d6a5627-85d8-442c-bfe3-ea7ce38c0639	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"771cbab1-6477-4b95-b38a-70115637dfac","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd"}	2023-01-12 14:06:45.164557-08	2023-01-12 14:06:45.164557-08	\N	\N
d51e55bb-d5a7-4c1b-a60b-e22270dba474	a66c95b2-91db-49e0-a843-e547e5e859bf	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd","3321c09d-b923-421e-be67-bfe855547773":"7f635d26-e09a-4bf2-ad7f-cfd7ee62c6b8","5ff1b83f-7fe9-492a-9369-dab26e437de6":"55b18b8d-eeca-4fdb-9542-aafa6205dbbe","cd8dd648-8aaf-4d28-979a-66c3a5033205":"09ec2566-4ded-45d7-a06d-105f63962c99","4b53edee-80d9-4ebe-960f-f53c6cc26b2d":"38144124-53c9-46ef-b691-ff1cb360e7e1"}	2023-01-15 14:38:48.678426-08	2023-01-15 14:38:48.678426-08	\N	\N
8c1710c6-e560-4f94-8ff3-7d5add0b5687	a66c95b2-91db-49e0-a843-e547e5e859bf	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"7a5791ab-9432-4ad0-b38f-cc2bc0d554c5","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd","3321c09d-b923-421e-be67-bfe855547773":"7f635d26-e09a-4bf2-ad7f-cfd7ee62c6b8","5ff1b83f-7fe9-492a-9369-dab26e437de6":"55b18b8d-eeca-4fdb-9542-aafa6205dbbe","cd8dd648-8aaf-4d28-979a-66c3a5033205":"09ec2566-4ded-45d7-a06d-105f63962c99","4b53edee-80d9-4ebe-960f-f53c6cc26b2d":"38144124-53c9-46ef-b691-ff1cb360e7e1"}	2023-01-15 14:46:12.506691-08	2023-01-15 14:46:12.506691-08	\N	\N
5fe81322-5a1d-4459-9b3b-2de71321c548	a66c95b2-91db-49e0-a843-e547e5e859bf	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"a369003f-5243-42c2-8ca1-d26f302ca011","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd","3321c09d-b923-421e-be67-bfe855547773":"7f635d26-e09a-4bf2-ad7f-cfd7ee62c6b8","5ff1b83f-7fe9-492a-9369-dab26e437de6":"55b18b8d-eeca-4fdb-9542-aafa6205dbbe","cd8dd648-8aaf-4d28-979a-66c3a5033205":"09ec2566-4ded-45d7-a06d-105f63962c99","4b53edee-80d9-4ebe-960f-f53c6cc26b2d":"38144124-53c9-46ef-b691-ff1cb360e7e1"}	2023-01-15 14:49:31.157855-08	2023-01-15 14:49:31.157855-08	\N	\N
946af328-b2d1-4741-b916-c7862bcd8e05	4b4e68fa-c2c0-4722-a5a0-e018f7081e3b	{"82b9793f-a002-4af7-ac68-09cf8f431105":"2e88e718-4596-43dc-9ea5-888791d636d2","75924dee-0b68-4691-b9c5-0c0588ed9fbd":"f6052008-4aee-4c16-8e54-49fc5df21f6e","5f945bdf-542c-4b98-9f96-1f095c0f08f4":"d313343e-f0de-4908-89cf-ce56ecfd1893","891d331d-9392-43a2-9071-49c467c23e9c":"4139bdb6-5521-4af7-ae1c-5e2e8995031f","a5ca7a00-f816-422a-bed7-854c5819d06d":"7460a034-0465-4d84-b824-e943cbd12941","66830599-79fb-4be0-a2ac-1d9412631a24":"2b9db18f-a62d-418f-b129-356fe967f7ea","c4278375-b6bb-4fa2-84d0-30047ad42400":"9fe61f8b-bd14-44af-919e-e8c0c16bafdf","559b2a71-05cc-4372-85e3-c6aa63eaa6e3":"38e85bbd-a232-4278-b422-1ee3816e8576","892141e1-5141-4b4f-b501-fe394333344b":"540533cb-9a4d-4179-b3f4-6a5407efa266","f4421d9f-2bbc-491b-b78e-d1547a994ce1":"21027570-9807-4d06-b1f0-c41a167007dd","3321c09d-b923-421e-be67-bfe855547773":"7f635d26-e09a-4bf2-ad7f-cfd7ee62c6b8","5ff1b83f-7fe9-492a-9369-dab26e437de6":"55b18b8d-eeca-4fdb-9542-aafa6205dbbe","cd8dd648-8aaf-4d28-979a-66c3a5033205":"ed57de7e-37a6-4bc8-80f2-dd74b8b06bcc","4b53edee-80d9-4ebe-960f-f53c6cc26b2d":"38144124-53c9-46ef-b691-ff1cb360e7e1"}	2023-02-16 11:05:59.2126-08	2023-02-16 11:05:59.2126-08	\N	\N
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

