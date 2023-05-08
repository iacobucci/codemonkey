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
-- Name: actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actions (
    id bigint NOT NULL,
    user_id character varying NOT NULL,
    date timestamp(6) without time zone,
    description text
);


--
-- Name: actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.actions_id_seq OWNED BY public.actions.id;


--
-- Name: admins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admins (
    username character varying NOT NULL
);


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: codemonkeys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.codemonkeys (
    username character varying NOT NULL,
    first_name character varying,
    last_name character varying,
    bio text,
    propic bytea,
    rating double precision,
    status character varying
);


--
-- Name: codemonkeys_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.codemonkeys_projects (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    codemonkey_id character varying NOT NULL
);


--
-- Name: codemonkeys_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.codemonkeys_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: codemonkeys_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.codemonkeys_projects_id_seq OWNED BY public.codemonkeys_projects.id;


--
-- Name: codemonkeys_technologies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.codemonkeys_technologies (
    id bigint NOT NULL,
    technology_id bigint NOT NULL,
    codemonkey_id character varying NOT NULL
);


--
-- Name: codemonkeys_technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.codemonkeys_technologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: codemonkeys_technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.codemonkeys_technologies_id_seq OWNED BY public.codemonkeys_technologies.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companies (
    username character varying NOT NULL,
    name character varying,
    bio text,
    propic bytea,
    status character varying
);


--
-- Name: companies_projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companies_projects (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    company_id character varying NOT NULL
);


--
-- Name: companies_projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.companies_projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.companies_projects_id_seq OWNED BY public.companies_projects.id;


--
-- Name: companies_technologies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companies_technologies (
    id bigint NOT NULL,
    technology_id bigint NOT NULL,
    company_id character varying NOT NULL
);


--
-- Name: companies_technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.companies_technologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.companies_technologies_id_seq OWNED BY public.companies_technologies.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    name character varying,
    description text,
    suggestion timestamp(6) without time zone,
    start timestamp(6) without time zone,
    "end" timestamp(6) without time zone,
    rating double precision,
    comment text,
    codemonkey_id character varying NOT NULL,
    company_id character varying NOT NULL
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: projects_technologies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects_technologies (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    technology_id bigint NOT NULL
);


--
-- Name: projects_technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_technologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_technologies_id_seq OWNED BY public.projects_technologies.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reports (
    id bigint NOT NULL,
    to_id character varying NOT NULL,
    from_id character varying NOT NULL,
    date timestamp(6) without time zone,
    description text
);


--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: technologies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.technologies (
    id bigint NOT NULL,
    name character varying,
    suggestion timestamp(6) without time zone,
    approved boolean,
    refused boolean
);


--
-- Name: technologies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.technologies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: technologies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.technologies_id_seq OWNED BY public.technologies.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    username character varying NOT NULL,
    password_digest character varying,
    email character varying,
    kind character varying,
    totp_secret character varying
);


--
-- Name: actions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actions ALTER COLUMN id SET DEFAULT nextval('public.actions_id_seq'::regclass);


--
-- Name: codemonkeys_projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.codemonkeys_projects ALTER COLUMN id SET DEFAULT nextval('public.codemonkeys_projects_id_seq'::regclass);


--
-- Name: codemonkeys_technologies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.codemonkeys_technologies ALTER COLUMN id SET DEFAULT nextval('public.codemonkeys_technologies_id_seq'::regclass);


--
-- Name: companies_projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_projects ALTER COLUMN id SET DEFAULT nextval('public.companies_projects_id_seq'::regclass);


--
-- Name: companies_technologies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_technologies ALTER COLUMN id SET DEFAULT nextval('public.companies_technologies_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: projects_technologies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_technologies ALTER COLUMN id SET DEFAULT nextval('public.projects_technologies_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: technologies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technologies ALTER COLUMN id SET DEFAULT nextval('public.technologies_id_seq'::regclass);


--
-- Name: actions actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (id);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (username);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: codemonkeys codemonkeys_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.codemonkeys
    ADD CONSTRAINT codemonkeys_pkey PRIMARY KEY (username);


--
-- Name: codemonkeys_projects codemonkeys_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.codemonkeys_projects
    ADD CONSTRAINT codemonkeys_projects_pkey PRIMARY KEY (id);


--
-- Name: codemonkeys_technologies codemonkeys_technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.codemonkeys_technologies
    ADD CONSTRAINT codemonkeys_technologies_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (username);


--
-- Name: companies_projects companies_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_projects
    ADD CONSTRAINT companies_projects_pkey PRIMARY KEY (id);


--
-- Name: companies_technologies companies_technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_technologies
    ADD CONSTRAINT companies_technologies_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: projects_technologies projects_technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_technologies
    ADD CONSTRAINT projects_technologies_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: technologies technologies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.technologies
    ADD CONSTRAINT technologies_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: index_actions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_actions_on_user_id ON public.actions USING btree (user_id);


--
-- Name: index_codemonkeys_projects_on_codemonkey_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_codemonkeys_projects_on_codemonkey_id ON public.codemonkeys_projects USING btree (codemonkey_id);


--
-- Name: index_codemonkeys_projects_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_codemonkeys_projects_on_project_id ON public.codemonkeys_projects USING btree (project_id);


--
-- Name: index_codemonkeys_technologies_on_codemonkey_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_codemonkeys_technologies_on_codemonkey_id ON public.codemonkeys_technologies USING btree (codemonkey_id);


--
-- Name: index_codemonkeys_technologies_on_technology_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_codemonkeys_technologies_on_technology_id ON public.codemonkeys_technologies USING btree (technology_id);


--
-- Name: index_companies_projects_on_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_companies_projects_on_company_id ON public.companies_projects USING btree (company_id);


--
-- Name: index_companies_projects_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_companies_projects_on_project_id ON public.companies_projects USING btree (project_id);


--
-- Name: index_companies_technologies_on_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_companies_technologies_on_company_id ON public.companies_technologies USING btree (company_id);


--
-- Name: index_companies_technologies_on_technology_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_companies_technologies_on_technology_id ON public.companies_technologies USING btree (technology_id);


--
-- Name: index_projects_on_codemonkey_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_codemonkey_id ON public.projects USING btree (codemonkey_id);


--
-- Name: index_projects_on_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_company_id ON public.projects USING btree (company_id);


--
-- Name: index_projects_technologies_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_technologies_on_project_id ON public.projects_technologies USING btree (project_id);


--
-- Name: index_projects_technologies_on_technology_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_technologies_on_technology_id ON public.projects_technologies USING btree (technology_id);


--
-- Name: index_reports_on_from_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_from_id ON public.reports USING btree (from_id);


--
-- Name: index_reports_on_to_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reports_on_to_id ON public.reports USING btree (to_id);


--
-- Name: projects fk_rails_084d8846e2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_084d8846e2 FOREIGN KEY (codemonkey_id) REFERENCES public.codemonkeys(username);


--
-- Name: codemonkeys fk_rails_19e945a81f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.codemonkeys
    ADD CONSTRAINT fk_rails_19e945a81f FOREIGN KEY (username) REFERENCES public.users(username);


--
-- Name: admins fk_rails_380ee00caa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT fk_rails_380ee00caa FOREIGN KEY (username) REFERENCES public.users(username);


--
-- Name: companies fk_rails_382002dea0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT fk_rails_382002dea0 FOREIGN KEY (username) REFERENCES public.users(username);


--
-- Name: companies_technologies fk_rails_3ea760b7e2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_technologies
    ADD CONSTRAINT fk_rails_3ea760b7e2 FOREIGN KEY (technology_id) REFERENCES public.technologies(id);


--
-- Name: projects fk_rails_44a549d7b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_44a549d7b3 FOREIGN KEY (company_id) REFERENCES public.companies(username);


--
-- Name: reports fk_rails_469361b016; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT fk_rails_469361b016 FOREIGN KEY (to_id) REFERENCES public.users(username);


--
-- Name: companies_projects fk_rails_5bb3e8ae2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_projects
    ADD CONSTRAINT fk_rails_5bb3e8ae2b FOREIGN KEY (company_id) REFERENCES public.companies(username);


--
-- Name: codemonkeys_technologies fk_rails_6e3ceec533; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.codemonkeys_technologies
    ADD CONSTRAINT fk_rails_6e3ceec533 FOREIGN KEY (technology_id) REFERENCES public.technologies(id);


--
-- Name: companies_projects fk_rails_7bceccc920; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_projects
    ADD CONSTRAINT fk_rails_7bceccc920 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: codemonkeys_technologies fk_rails_9f269cf3de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.codemonkeys_technologies
    ADD CONSTRAINT fk_rails_9f269cf3de FOREIGN KEY (codemonkey_id) REFERENCES public.codemonkeys(username);


--
-- Name: reports fk_rails_b8d5d8776e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT fk_rails_b8d5d8776e FOREIGN KEY (from_id) REFERENCES public.users(username);


--
-- Name: companies_technologies fk_rails_b9a0f4c59c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies_technologies
    ADD CONSTRAINT fk_rails_b9a0f4c59c FOREIGN KEY (company_id) REFERENCES public.companies(username);


--
-- Name: projects_technologies fk_rails_d8f511fde6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_technologies
    ADD CONSTRAINT fk_rails_d8f511fde6 FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: projects_technologies fk_rails_ddd74c4e53; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects_technologies
    ADD CONSTRAINT fk_rails_ddd74c4e53 FOREIGN KEY (technology_id) REFERENCES public.technologies(id);


--
-- Name: codemonkeys_projects fk_rails_de729917cd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.codemonkeys_projects
    ADD CONSTRAINT fk_rails_de729917cd FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: codemonkeys_projects fk_rails_ed7a4bfad3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.codemonkeys_projects
    ADD CONSTRAINT fk_rails_ed7a4bfad3 FOREIGN KEY (codemonkey_id) REFERENCES public.codemonkeys(username);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20230506132505'),
('20230506132506'),
('20230506132508'),
('20230506132511'),
('20230506132513'),
('20230506132518'),
('20230506132521'),
('20230506132523'),
('20230506132527'),
('20230506132529'),
('20230506132532'),
('20230506132534'),
('20230506132616');


