--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE db;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Database creation
--

CREATE DATABASE db WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect db

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_article (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    title character varying(144) NOT NULL,
    date timestamp with time zone NOT NULL,
    body text NOT NULL,
    views integer NOT NULL,
    stars smallint NOT NULL,
    heading_id integer,
    CONSTRAINT blog_article_stars_check CHECK ((stars >= 0)),
    CONSTRAINT blog_article_views_check CHECK ((views >= 0))
);


ALTER TABLE blog_article OWNER TO postgres;

--
-- Name: blog_article_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_article_id_seq OWNER TO postgres;

--
-- Name: blog_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_article_id_seq OWNED BY blog_article.id;


--
-- Name: blog_heading; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE blog_heading (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE blog_heading OWNER TO postgres;

--
-- Name: blog_heading_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_heading_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_heading_id_seq OWNER TO postgres;

--
-- Name: blog_heading_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_heading_id_seq OWNED BY blog_heading.id;


--
-- Name: core_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_comment (
    id integer NOT NULL,
    name character varying(144) NOT NULL,
    age smallint NOT NULL,
    description character varying(144) NOT NULL,
    datetime date NOT NULL,
    youtube character varying(200),
    hotel_id integer NOT NULL,
    comment text,
    CONSTRAINT core_comment_age_check CHECK ((age >= 0))
);


ALTER TABLE core_comment OWNER TO postgres;

--
-- Name: core_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_comment_id_seq OWNER TO postgres;

--
-- Name: core_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_comment_id_seq OWNED BY core_comment.id;


--
-- Name: core_emaildispatch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_emaildispatch (
    id integer NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE core_emaildispatch OWNER TO postgres;

--
-- Name: core_emaildispatch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_emaildispatch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_emaildispatch_id_seq OWNER TO postgres;

--
-- Name: core_emaildispatch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_emaildispatch_id_seq OWNED BY core_emaildispatch.id;


--
-- Name: core_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_image (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT core_image_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE core_image OWNER TO postgres;

--
-- Name: core_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_image_id_seq OWNER TO postgres;

--
-- Name: core_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_image_id_seq OWNED BY core_image.id;


--
-- Name: core_indexsettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_indexsettings (
    id integer NOT NULL,
    address character varying(144) NOT NULL,
    instagram character varying(200) NOT NULL,
    facebook character varying(200) NOT NULL,
    vk character varying(200) NOT NULL
);


ALTER TABLE core_indexsettings OWNER TO postgres;

--
-- Name: core_indexsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_indexsettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_indexsettings_id_seq OWNER TO postgres;

--
-- Name: core_indexsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_indexsettings_id_seq OWNED BY core_indexsettings.id;


--
-- Name: core_indexsettings_phone_numbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_indexsettings_phone_numbers (
    id integer NOT NULL,
    indexsettings_id integer NOT NULL,
    phonenumbers_id integer NOT NULL
);


ALTER TABLE core_indexsettings_phone_numbers OWNER TO postgres;

--
-- Name: core_indexsettings_phone_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_indexsettings_phone_numbers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_indexsettings_phone_numbers_id_seq OWNER TO postgres;

--
-- Name: core_indexsettings_phone_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_indexsettings_phone_numbers_id_seq OWNED BY core_indexsettings_phone_numbers.id;


--
-- Name: core_phonenumbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_phonenumbers (
    id integer NOT NULL,
    phone character varying(40) NOT NULL
);


ALTER TABLE core_phonenumbers OWNER TO postgres;

--
-- Name: core_phonenumbers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_phonenumbers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_phonenumbers_id_seq OWNER TO postgres;

--
-- Name: core_phonenumbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_phonenumbers_id_seq OWNED BY core_phonenumbers.id;


--
-- Name: core_sertificatesettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE core_sertificatesettings (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    title character varying(144) NOT NULL,
    column_1 text NOT NULL,
    column_2 text NOT NULL
);


ALTER TABLE core_sertificatesettings OWNER TO postgres;

--
-- Name: core_sertificatesettings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE core_sertificatesettings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_sertificatesettings_id_seq OWNER TO postgres;

--
-- Name: core_sertificatesettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE core_sertificatesettings_id_seq OWNED BY core_sertificatesettings.id;


--
-- Name: des_dynamicemailconfiguration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE des_dynamicemailconfiguration (
    id integer NOT NULL,
    host character varying(256),
    port smallint,
    from_email character varying(256),
    username character varying(256),
    password character varying(256),
    use_tls boolean NOT NULL,
    use_ssl boolean NOT NULL,
    fail_silently boolean NOT NULL,
    timeout smallint
);


ALTER TABLE des_dynamicemailconfiguration OWNER TO postgres;

--
-- Name: des_dynamicemailconfiguration_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE des_dynamicemailconfiguration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE des_dynamicemailconfiguration_id_seq OWNER TO postgres;

--
-- Name: des_dynamicemailconfiguration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE des_dynamicemailconfiguration_id_seq OWNED BY des_dynamicemailconfiguration.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO postgres;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: locations_country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE locations_country (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    about text NOT NULL,
    holidays text NOT NULL,
    to_visit text NOT NULL,
    customs text NOT NULL,
    preview_image character varying(100) NOT NULL
);


ALTER TABLE locations_country OWNER TO postgres;

--
-- Name: locations_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE locations_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_country_id_seq OWNER TO postgres;

--
-- Name: locations_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE locations_country_id_seq OWNED BY locations_country.id;


--
-- Name: locations_hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE locations_hotel (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    stars smallint NOT NULL,
    hot boolean NOT NULL,
    website character varying(200),
    description text NOT NULL,
    breakfasts text NOT NULL,
    resort_id integer NOT NULL,
    type_id integer NOT NULL,
    address character varying(144) NOT NULL,
    preview_image character varying(100) NOT NULL,
    CONSTRAINT locations_hotel_stars_check CHECK ((stars >= 0))
);


ALTER TABLE locations_hotel OWNER TO postgres;

--
-- Name: locations_hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE locations_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_hotel_id_seq OWNER TO postgres;

--
-- Name: locations_hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE locations_hotel_id_seq OWNED BY locations_hotel.id;


--
-- Name: locations_hoteltype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE locations_hoteltype (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE locations_hoteltype OWNER TO postgres;

--
-- Name: locations_hoteltype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE locations_hoteltype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_hoteltype_id_seq OWNER TO postgres;

--
-- Name: locations_hoteltype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE locations_hoteltype_id_seq OWNED BY locations_hoteltype.id;


--
-- Name: locations_resort; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE locations_resort (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    about text NOT NULL,
    sights text NOT NULL,
    country_id integer NOT NULL,
    preview_image character varying(100) NOT NULL
);


ALTER TABLE locations_resort OWNER TO postgres;

--
-- Name: locations_resort_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE locations_resort_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_resort_id_seq OWNER TO postgres;

--
-- Name: locations_resort_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE locations_resort_id_seq OWNED BY locations_resort.id;


--
-- Name: postie_attachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postie_attachment (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    attachment character varying(100) NOT NULL,
    letter_id integer NOT NULL
);


ALTER TABLE postie_attachment OWNER TO postgres;

--
-- Name: postie_attachment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE postie_attachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE postie_attachment_id_seq OWNER TO postgres;

--
-- Name: postie_attachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE postie_attachment_id_seq OWNED BY postie_attachment.id;


--
-- Name: postie_letter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postie_letter (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    subject character varying(255) NOT NULL,
    html text NOT NULL,
    plain text NOT NULL,
    email_from character varying(255),
    recipients text NOT NULL,
    event character varying(255),
    status character varying(255) NOT NULL,
    language character varying(127)
);


ALTER TABLE postie_letter OWNER TO postgres;

--
-- Name: postie_letter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE postie_letter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE postie_letter_id_seq OWNER TO postgres;

--
-- Name: postie_letter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE postie_letter_id_seq OWNED BY postie_letter.id;


--
-- Name: postie_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postie_log (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    message character varying(255) NOT NULL,
    traceback text,
    letter_id integer NOT NULL
);


ALTER TABLE postie_log OWNER TO postgres;

--
-- Name: postie_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE postie_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE postie_log_id_seq OWNER TO postgres;

--
-- Name: postie_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE postie_log_id_seq OWNED BY postie_log.id;


--
-- Name: postie_template; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postie_template (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    event character varying(255) NOT NULL
);


ALTER TABLE postie_template OWNER TO postgres;

--
-- Name: postie_template_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE postie_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE postie_template_id_seq OWNER TO postgres;

--
-- Name: postie_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE postie_template_id_seq OWNED BY postie_template.id;


--
-- Name: postie_template_translation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE postie_template_translation (
    id integer NOT NULL,
    language_code character varying(15) NOT NULL,
    subject character varying(255),
    html text,
    plain text,
    master_id integer
);


ALTER TABLE postie_template_translation OWNER TO postgres;

--
-- Name: postie_template_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE postie_template_translation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE postie_template_translation_id_seq OWNER TO postgres;

--
-- Name: postie_template_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE postie_template_translation_id_seq OWNED BY postie_template_translation.id;


--
-- Name: reports_call; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reports_call (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    phone character varying(40) NOT NULL,
    status boolean NOT NULL,
    from_link character varying(200) NOT NULL,
    datetime timestamp with time zone NOT NULL
);


ALTER TABLE reports_call OWNER TO postgres;

--
-- Name: reports_call_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reports_call_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_call_id_seq OWNER TO postgres;

--
-- Name: reports_call_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reports_call_id_seq OWNED BY reports_call.id;


--
-- Name: reports_pickingtour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reports_pickingtour (
    id integer NOT NULL,
    duration character varying(144) NOT NULL,
    number_of_persons smallint NOT NULL,
    name character varying(40) NOT NULL,
    phone character varying(40) NOT NULL,
    email character varying(254) NOT NULL,
    comment text NOT NULL,
    from_link character varying(200) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    status boolean NOT NULL,
    country_id integer NOT NULL,
    CONSTRAINT reports_pickingtour_number_of_persons_check CHECK ((number_of_persons >= 0))
);


ALTER TABLE reports_pickingtour OWNER TO postgres;

--
-- Name: reports_pickingtour_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reports_pickingtour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_pickingtour_id_seq OWNER TO postgres;

--
-- Name: reports_pickingtour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reports_pickingtour_id_seq OWNED BY reports_pickingtour.id;


--
-- Name: reports_report; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reports_report (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    email character varying(254) NOT NULL,
    message text NOT NULL,
    from_link character varying(200) NOT NULL,
    status boolean NOT NULL,
    datetime timestamp with time zone NOT NULL
);


ALTER TABLE reports_report OWNER TO postgres;

--
-- Name: reports_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reports_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_report_id_seq OWNER TO postgres;

--
-- Name: reports_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reports_report_id_seq OWNED BY reports_report.id;


--
-- Name: reports_reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reports_reservation (
    id integer NOT NULL,
    full_name character varying(144) NOT NULL,
    phone character varying(40) NOT NULL,
    email character varying(254) NOT NULL,
    comment text NOT NULL,
    from_link character varying(200) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    status boolean NOT NULL,
    tour_id integer NOT NULL,
    tour_date_id integer NOT NULL
);


ALTER TABLE reports_reservation OWNER TO postgres;

--
-- Name: reports_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reports_reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_reservation_id_seq OWNER TO postgres;

--
-- Name: reports_reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reports_reservation_id_seq OWNED BY reports_reservation.id;


--
-- Name: reports_sertificate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE reports_sertificate (
    id integer NOT NULL,
    name character varying(40) NOT NULL,
    phone character varying(40) NOT NULL,
    from_link character varying(200) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    status boolean NOT NULL
);


ALTER TABLE reports_sertificate OWNER TO postgres;

--
-- Name: reports_sertificate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reports_sertificate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reports_sertificate_id_seq OWNER TO postgres;

--
-- Name: reports_sertificate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reports_sertificate_id_seq OWNED BY reports_sertificate.id;


--
-- Name: tours_tour; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tours_tour (
    id integer NOT NULL,
    sending_from character varying(50) NOT NULL,
    duration_days smallint NOT NULL,
    duration_nights smallint NOT NULL,
    stars smallint NOT NULL,
    hotel_id integer NOT NULL,
    type_id integer NOT NULL,
    CONSTRAINT tours_tour_duration_days_check CHECK ((duration_days >= 0)),
    CONSTRAINT tours_tour_duration_nights_check CHECK ((duration_nights >= 0)),
    CONSTRAINT tours_tour_stars_check CHECK ((stars >= 0))
);


ALTER TABLE tours_tour OWNER TO postgres;

--
-- Name: tours_tour_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tours_tour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tours_tour_id_seq OWNER TO postgres;

--
-- Name: tours_tour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tours_tour_id_seq OWNED BY tours_tour.id;


--
-- Name: tours_tourdatepair; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tours_tourdatepair (
    id integer NOT NULL,
    start date NOT NULL,
    "end" date NOT NULL,
    cost integer NOT NULL,
    tour_id integer NOT NULL,
    uah_cost integer NOT NULL,
    CONSTRAINT tours_tourdatepair_cost_check CHECK ((cost >= 0)),
    CONSTRAINT tours_tourdatepair_uah_cost_check CHECK ((uah_cost >= 0))
);


ALTER TABLE tours_tourdatepair OWNER TO postgres;

--
-- Name: tours_tourdatepair_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tours_tourdatepair_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tours_tourdatepair_id_seq OWNER TO postgres;

--
-- Name: tours_tourdatepair_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tours_tourdatepair_id_seq OWNED BY tours_tourdatepair.id;


--
-- Name: tours_tourexcludes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tours_tourexcludes (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    tour_id integer NOT NULL
);


ALTER TABLE tours_tourexcludes OWNER TO postgres;

--
-- Name: tours_tourexcludes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tours_tourexcludes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tours_tourexcludes_id_seq OWNER TO postgres;

--
-- Name: tours_tourexcludes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tours_tourexcludes_id_seq OWNED BY tours_tourexcludes.id;


--
-- Name: tours_tourincludes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tours_tourincludes (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    tour_id integer NOT NULL
);


ALTER TABLE tours_tourincludes OWNER TO postgres;

--
-- Name: tours_tourincludes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tours_tourincludes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tours_tourincludes_id_seq OWNER TO postgres;

--
-- Name: tours_tourincludes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tours_tourincludes_id_seq OWNED BY tours_tourincludes.id;


--
-- Name: tours_tourtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tours_tourtype (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    preview_image character varying(100) NOT NULL
);


ALTER TABLE tours_tourtype OWNER TO postgres;

--
-- Name: tours_tourtype_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tours_tourtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tours_tourtype_id_seq OWNER TO postgres;

--
-- Name: tours_tourtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tours_tourtype_id_seq OWNED BY tours_tourtype.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_article id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_article ALTER COLUMN id SET DEFAULT nextval('blog_article_id_seq'::regclass);


--
-- Name: blog_heading id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_heading ALTER COLUMN id SET DEFAULT nextval('blog_heading_id_seq'::regclass);


--
-- Name: core_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_comment ALTER COLUMN id SET DEFAULT nextval('core_comment_id_seq'::regclass);


--
-- Name: core_emaildispatch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_emaildispatch ALTER COLUMN id SET DEFAULT nextval('core_emaildispatch_id_seq'::regclass);


--
-- Name: core_image id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_image ALTER COLUMN id SET DEFAULT nextval('core_image_id_seq'::regclass);


--
-- Name: core_indexsettings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_indexsettings ALTER COLUMN id SET DEFAULT nextval('core_indexsettings_id_seq'::regclass);


--
-- Name: core_indexsettings_phone_numbers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_indexsettings_phone_numbers ALTER COLUMN id SET DEFAULT nextval('core_indexsettings_phone_numbers_id_seq'::regclass);


--
-- Name: core_phonenumbers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_phonenumbers ALTER COLUMN id SET DEFAULT nextval('core_phonenumbers_id_seq'::regclass);


--
-- Name: core_sertificatesettings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_sertificatesettings ALTER COLUMN id SET DEFAULT nextval('core_sertificatesettings_id_seq'::regclass);


--
-- Name: des_dynamicemailconfiguration id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY des_dynamicemailconfiguration ALTER COLUMN id SET DEFAULT nextval('des_dynamicemailconfiguration_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: locations_country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_country ALTER COLUMN id SET DEFAULT nextval('locations_country_id_seq'::regclass);


--
-- Name: locations_hotel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_hotel ALTER COLUMN id SET DEFAULT nextval('locations_hotel_id_seq'::regclass);


--
-- Name: locations_hoteltype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_hoteltype ALTER COLUMN id SET DEFAULT nextval('locations_hoteltype_id_seq'::regclass);


--
-- Name: locations_resort id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_resort ALTER COLUMN id SET DEFAULT nextval('locations_resort_id_seq'::regclass);


--
-- Name: postie_attachment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_attachment ALTER COLUMN id SET DEFAULT nextval('postie_attachment_id_seq'::regclass);


--
-- Name: postie_letter id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_letter ALTER COLUMN id SET DEFAULT nextval('postie_letter_id_seq'::regclass);


--
-- Name: postie_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_log ALTER COLUMN id SET DEFAULT nextval('postie_log_id_seq'::regclass);


--
-- Name: postie_template id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_template ALTER COLUMN id SET DEFAULT nextval('postie_template_id_seq'::regclass);


--
-- Name: postie_template_translation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_template_translation ALTER COLUMN id SET DEFAULT nextval('postie_template_translation_id_seq'::regclass);


--
-- Name: reports_call id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_call ALTER COLUMN id SET DEFAULT nextval('reports_call_id_seq'::regclass);


--
-- Name: reports_pickingtour id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_pickingtour ALTER COLUMN id SET DEFAULT nextval('reports_pickingtour_id_seq'::regclass);


--
-- Name: reports_report id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_report ALTER COLUMN id SET DEFAULT nextval('reports_report_id_seq'::regclass);


--
-- Name: reports_reservation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_reservation ALTER COLUMN id SET DEFAULT nextval('reports_reservation_id_seq'::regclass);


--
-- Name: reports_sertificate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_sertificate ALTER COLUMN id SET DEFAULT nextval('reports_sertificate_id_seq'::regclass);


--
-- Name: tours_tour id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour ALTER COLUMN id SET DEFAULT nextval('tours_tour_id_seq'::regclass);


--
-- Name: tours_tourdatepair id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourdatepair ALTER COLUMN id SET DEFAULT nextval('tours_tourdatepair_id_seq'::regclass);


--
-- Name: tours_tourexcludes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourexcludes ALTER COLUMN id SET DEFAULT nextval('tours_tourexcludes_id_seq'::regclass);


--
-- Name: tours_tourincludes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourincludes ALTER COLUMN id SET DEFAULT nextval('tours_tourincludes_id_seq'::regclass);


--
-- Name: tours_tourtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourtype ALTER COLUMN id SET DEFAULT nextval('tours_tourtype_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add Email Configuration	1	add_dynamicemailconfiguration
2	Can change Email Configuration	1	change_dynamicemailconfiguration
3	Can delete Email Configuration	1	delete_dynamicemailconfiguration
4	Can view Email Configuration	1	view_dynamicemailconfiguration
5	Can add Letter attachment	2	add_attachment
6	Can change Letter attachment	2	change_attachment
7	Can delete Letter attachment	2	delete_attachment
8	Can view Letter attachment	2	view_attachment
9	Can add Mail letter	3	add_letter
10	Can change Mail letter	3	change_letter
11	Can delete Mail letter	3	delete_letter
12	Can view Mail letter	3	view_letter
13	Can add Log	4	add_log
14	Can change Log	4	change_log
15	Can delete Log	4	delete_log
16	Can view Log	4	view_log
17	Can add Mail template	5	add_template
18	Can change Mail template	5	change_template
19	Can delete Mail template	5	delete_template
20	Can view Mail template	5	view_template
21	Can add log entry	7	add_logentry
22	Can change log entry	7	change_logentry
23	Can delete log entry	7	delete_logentry
24	Can view log entry	7	view_logentry
25	Can add permission	8	add_permission
26	Can change permission	8	change_permission
27	Can delete permission	8	delete_permission
28	Can view permission	8	view_permission
29	Can add group	9	add_group
30	Can change group	9	change_group
31	Can delete group	9	delete_group
32	Can view group	9	view_group
33	Can add user	10	add_user
34	Can change user	10	change_user
35	Can delete user	10	delete_user
36	Can view user	10	view_user
37	Can add content type	11	add_contenttype
38	Can change content type	11	change_contenttype
39	Can delete content type	11	delete_contenttype
40	Can view content type	11	view_contenttype
41	Can add session	12	add_session
42	Can change session	12	change_session
43	Can delete session	12	delete_session
44	Can view session	12	view_session
45	Can add site	13	add_site
46	Can change site	13	change_site
47	Can delete site	13	delete_site
48	Can view site	13	view_site
49	Can add image	14	add_image
50	Can change image	14	change_image
51	Can delete image	14	delete_image
52	Can view image	14	view_image
53	Can add Site Configuration	15	add_indexsettings
54	Can change Site Configuration	15	change_indexsettings
55	Can delete Site Configuration	15	delete_indexsettings
56	Can view Site Configuration	15	view_indexsettings
57	Can add phone numbers	16	add_phonenumbers
58	Can change phone numbers	16	change_phonenumbers
59	Can delete phone numbers	16	delete_phonenumbers
60	Can view phone numbers	16	view_phonenumbers
61	Can add Certificate Configuration	17	add_sertificatesettings
62	Can change Certificate Configuration	17	change_sertificatesettings
63	Can delete Certificate Configuration	17	delete_sertificatesettings
64	Can view Certificate Configuration	17	view_sertificatesettings
65	Can add comment	18	add_comment
66	Can change comment	18	change_comment
67	Can delete comment	18	delete_comment
68	Can view comment	18	view_comment
69	Can add Article	19	add_article
70	Can change Article	19	change_article
71	Can delete Article	19	delete_article
72	Can view Article	19	view_article
73	Can add Heading	20	add_heading
74	Can change Heading	20	change_heading
75	Can delete Heading	20	delete_heading
76	Can view Heading	20	view_heading
77	Can add Tour	21	add_tour
78	Can change Tour	21	change_tour
79	Can delete Tour	21	delete_tour
80	Can view Tour	21	view_tour
81	Can add Tour Datepair	22	add_tourdatepair
82	Can change Tour Datepair	22	change_tourdatepair
83	Can delete Tour Datepair	22	delete_tourdatepair
84	Can view Tour Datepair	22	view_tourdatepair
85	Can add Tour Type	23	add_tourtype
86	Can change Tour Type	23	change_tourtype
87	Can delete Tour Type	23	delete_tourtype
88	Can view Tour Type	23	view_tourtype
89	Can add Tour Xclude	24	add_tourxcludes
90	Can change Tour Xclude	24	change_tourxcludes
91	Can delete Tour Xclude	24	delete_tourxcludes
92	Can view Tour Xclude	24	view_tourxcludes
93	Can add Country	25	add_country
94	Can change Country	25	change_country
95	Can delete Country	25	delete_country
96	Can view Country	25	view_country
97	Can add Hotel	26	add_hotel
98	Can change Hotel	26	change_hotel
99	Can delete Hotel	26	delete_hotel
100	Can view Hotel	26	view_hotel
101	Can add Hotel Type	27	add_hoteltype
102	Can change Hotel Type	27	change_hoteltype
103	Can delete Hotel Type	27	delete_hoteltype
104	Can view Hotel Type	27	view_hoteltype
105	Can add Resort	28	add_resort
106	Can change Resort	28	change_resort
107	Can delete Resort	28	delete_resort
108	Can view Resort	28	view_resort
109	Can add Call	29	add_call
110	Can change Call	29	change_call
111	Can delete Call	29	delete_call
112	Can view Call	29	view_call
113	Can add Picking tour	30	add_pickingtour
114	Can change Picking tour	30	change_pickingtour
115	Can delete Picking tour	30	delete_pickingtour
116	Can view Picking tour	30	view_pickingtour
117	Can add Report	31	add_report
118	Can change Report	31	change_report
119	Can delete Report	31	delete_report
120	Can view Report	31	view_report
121	Can add Booked tour	32	add_reservation
122	Can change Booked tour	32	change_reservation
123	Can delete Booked tour	32	delete_reservation
124	Can view Booked tour	32	view_reservation
125	Can add Sertificate Apply	33	add_sertificate
126	Can change Sertificate Apply	33	change_sertificate
127	Can delete Sertificate Apply	33	delete_sertificate
128	Can view Sertificate Apply	33	view_sertificate
129	Can add email dispatch	34	add_emaildispatch
130	Can change email dispatch	34	change_emaildispatch
131	Can delete email dispatch	34	delete_emaildispatch
132	Can view email dispatch	34	view_emaildispatch
133	Can add tour excludes	35	add_tourexcludes
134	Can change tour excludes	35	change_tourexcludes
135	Can delete tour excludes	35	delete_tourexcludes
136	Can view tour excludes	35	view_tourexcludes
137	Can add tour includes	36	add_tourincludes
138	Can change tour includes	36	change_tourincludes
139	Can delete tour includes	36	delete_tourincludes
140	Can view tour includes	36	view_tourincludes
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$WCSW3EErb1gX$7OP77D312a49vnrCwvygBN9pbYj2UGvQxSe0YG5SYa4=	2018-09-03 13:24:27.294783+00	t	admin	adminqwerty12345		xfloydya@gmail.com	t	t	2018-09-02 07:16:25+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blog_article; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_article (id, slug, title, date, body, views, stars, heading_id) FROM stdin;
6	article-2	article #2	2018-09-03 06:35:31.192223+00	<p>Vestibulum dictum dignissim faucibus. Vestibulum convallis ut magna non blandit. Sed et scelerisque turpis, sit amet convallis massa. Sed imperdiet suscipit tortor non congue. Vivamus in risus sit amet est iaculis blandit. Mauris mollis consectetur elementum. Nullam eu viverra diam. Morbi erat urna, dignissim quis convallis eu, gravida ut ligula. Maecenas hendrerit sem ut odio pellentesque sollicitudin. Morbi feugiat eget dui eget ultricies.</p>\r\n\r\n<p>Aenean iaculis imperdiet sem, sed laoreet lorem commodo quis. Aliquam pharetra consectetur nulla, non tempus dui fringilla et. Integer luctus finibus velit, eu accumsan felis tempor eget. Ut lacinia risus sed risus iaculis fermentum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec nunc quam, molestie non nulla eu, dictum pretium massa. Mauris rutrum massa in blandit tempor. Nam blandit auctor tellus quis bibendum. Pellentesque imperdiet quis augue et ullamcorper. Vestibulum porttitor dui risus, vel laoreet sem posuere vitae. Pellentesque quis mollis enim, sit amet ultricies risus. Etiam vitae iaculis est, suscipit fringilla diam. Cras tincidunt felis malesuada, pharetra mauris sit amet, lacinia sapien.</p>	1	5	3
5	new-article1	New article1	2018-09-03 06:35:12.62523+00	<p>Vivamus consequat dolor nec diam interdum lacinia. Nunc sodales lacinia sollicitudin. Quisque cursus, quam sit amet fringilla finibus, mauris magna ultricies erat, eu ultrices diam nibh vitae tellus. Aliquam volutpat, dui sit amet porta consectetur, est dolor aliquet sem, in porttitor lorem metus vitae leo. Curabitur et mollis nisl, non porttitor massa. Morbi in risus nec dolor iaculis blandit. Proin non vulputate leo, eget pellentesque dolor. Maecenas congue eros magna, at rutrum eros ornare nec. Fusce elementum nisi at leo rutrum, vel efficitur leo molestie. Phasellus felis ipsum, tristique commodo purus non, malesuada congue tellus. Duis non elit purus. Sed sed nibh aliquet, finibus lorem sed, sodales ipsum. Proin sit amet porta justo, in aliquet velit. Fusce tincidunt purus vel accumsan ullamcorper. Duis dictum tellus ex, in ornare lacus lacinia vel. Fusce sagittis efficitur risus, ac sagittis est vestibulum quis.</p>\r\n\r\n<p>Suspendisse sit amet congue orci. Duis eleifend bibendum libero non dapibus. Vestibulum at aliquet purus. Maecenas vel odio elementum, pharetra nisl a, fermentum neque. Sed sed nunc maximus, iaculis eros varius, convallis mauris. Aliquam erat volutpat. Pellentesque lectus libero, viverra quis diam sit amet, imperdiet bibendum dolor. Nulla at nulla suscipit, congue diam interdum, commodo ex. Pellentesque eu dapibus neque. Proin vitae lectus aliquam, congue enim vel, finibus leo. Nullam nunc felis, fringilla eu porttitor vitae, tincidunt in ipsum. Integer maximus, elit eget luctus sodales, ex urna sodales metus, sit amet suscipit nunc odio a lacus. Nam varius volutpat tellus, ut vestibulum sapien vestibulum vel. Sed aliquet vel nisi ac bibendum. Curabitur bibendum nunc a nisi imperdiet gravida.</p>	3	4	5
8	article-4	article #4	2018-09-03 06:36:02.760418+00	<p>Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla ornare purus velit, quis viverra lectus ullamcorper in. Phasellus vel odio sed nunc semper sollicitudin vel sed turpis. Cras non fermentum arcu, vel tristique purus. Donec finibus dignissim ligula, a mattis neque rutrum quis. Aenean tincidunt quam gravida molestie maximus. Praesent ut ipsum aliquet, fermentum eros ac, maximus nisl. Praesent id tortor urna. Sed eleifend massa non ante venenatis, eu euismod urna convallis. Aliquam pulvinar nunc vulputate condimentum gravida. In in felis diam. Ut consequat, elit vel vehicula faucibus, metus diam ornare nunc, vel varius enim mi eget odio. Cras volutpat, dui at gravida sagittis, nunc nisl faucibus ante, et vulputate leo nibh nec massa. Sed tristique ac lectus nec interdum. Ut tempus bibendum orci, non iaculis risus lobortis vitae.</p>\r\n\r\n<p>Duis eget leo ac lorem fermentum hendrerit non id metus. Sed commodo sit amet velit sed dictum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc laoreet libero a vehicula porttitor. Integer nec magna molestie, mattis arcu ut, aliquam sem. Proin a mi ligula. Cras ut mauris a elit accumsan bibendum. Duis imperdiet porttitor congue. Morbi quis fermentum diam, viverra dictum augue. Aenean congue velit sed rutrum faucibus. Maecenas ac elit et massa suscipit sollicitudin sed non lacus. Vivamus nec leo porttitor, accumsan est fermentum, faucibus mi. Aenean tempor leo sapien. Vestibulum eu magna ut dolor aliquet ullamcorper a et risus.</p>	1	4	2
7	article-3	article #3	2018-09-03 06:35:47.624791+00	<p>Sed pretium lorem at diam iaculis, eget vestibulum justo ullamcorper. Sed ullamcorper varius consectetur. Nulla vitae lorem eleifend, consequat quam nec, rutrum erat. Donec finibus nunc vel lorem cursus viverra. Quisque vel odio quam. Quisque vitae neque egestas velit iaculis semper. Aliquam metus lectus, commodo in erat sed, posuere viverra sem. Vivamus ac egestas augue, ac pellentesque urna. Nunc sed magna vitae nisl iaculis efficitur. Mauris iaculis condimentum malesuada. Sed sodales lectus turpis, vel dapibus ante tristique nec. Sed ac orci non eros pulvinar facilisis quis non ligula. Sed sed arcu ac ex sagittis accumsan. Donec eu tincidunt dui.</p>\r\n\r\n<p>Nulla dictum scelerisque urna ac luctus. Donec vel tellus tempus, venenatis dui et, maximus nulla. Aliquam erat volutpat. Nunc iaculis, augue at tristique semper, tellus est faucibus tellus, et pretium tellus nisl sed ex. Integer tristique magna at viverra iaculis. Pellentesque porttitor justo nec ultrices hendrerit. Quisque at justo urna. Vestibulum sit amet eros congue, rutrum quam vel, rutrum leo. Nunc purus mauris, elementum sed vestibulum et, tristique vitae arcu. Fusce ligula ante, tincidunt et imperdiet quis, eleifend nec enim. Cras a imperdiet eros. Vestibulum sodales tortor accumsan ligula posuere vehicula. Suspendisse dapibus, ligula in venenatis euismod, risus ipsum ullamcorper erat, et placerat magna leo quis lacus.</p>	1	4	4
9	article-0	Article 0	2018-09-03 12:59:38.213738+00	<p>Body 0</p>	0	0	4
10	article-1	Article 1	2018-09-03 12:59:38.24236+00	<p>Body 1</p>	0	0	1
11	article-2-1	Article 2	2018-09-03 12:59:38.268821+00	<p>Body 2</p>	0	0	4
12	article-3-1	Article 3	2018-09-03 12:59:38.317541+00	<p>Body 3</p>	0	0	5
13	article-4-1	Article 4	2018-09-03 12:59:38.338981+00	<p>Body 4</p>	0	0	2
14	article-5	Article 5	2018-09-03 12:59:38.385066+00	<p>Body 5</p>	0	0	1
15	article-6	Article 6	2018-09-03 12:59:38.410838+00	<p>Body 6</p>	0	0	4
16	article-7	Article 7	2018-09-03 12:59:38.435419+00	<p>Body 7</p>	0	0	1
18	article-9	Article 9	2018-09-03 12:59:38.485331+00	<p>Body 9</p>	0	0	6
17	article-8	Article 8	2018-09-03 12:59:38.460868+00	<p>Body 8</p>	0	0	1
19	article-10	Article 10	2018-09-03 12:59:38.522365+00	<p>Body 10</p>	0	0	4
20	article-11	Article 11	2018-09-03 12:59:38.559123+00	<p>Body 11</p>	0	0	5
21	article-12	Article 12	2018-09-03 12:59:38.594352+00	<p>Body 12</p>	0	0	3
22	article-13	Article 13	2018-09-03 12:59:38.643062+00	<p>Body 13</p>	0	0	1
23	article-14	Article 14	2018-09-03 12:59:38.705814+00	<p>Body 14</p>	0	0	5
24	article-15	Article 15	2018-09-03 12:59:38.736872+00	<p>Body 15</p>	0	0	3
25	article-16	Article 16	2018-09-03 12:59:38.761974+00	<p>Body 16</p>	0	0	1
26	article-17	Article 17	2018-09-03 12:59:38.785346+00	<p>Body 17</p>	0	0	2
27	article-18	Article 18	2018-09-03 12:59:38.809961+00	<p>Body 18</p>	0	0	3
28	article-19	Article 19	2018-09-03 12:59:38.832692+00	<p>Body 19</p>	0	0	3
\.


--
-- Data for Name: blog_heading; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_heading (id, slug, name) FROM stdin;
1	aktsii	Акции
2	ekzotika	Экзотика
3	novosti-kompanii	Новости компании
4	v-pomoshch-turistu	В помощь туристу
5	obzory-stran	Обзоры стран
6	dokumenty	Документы
\.


--
-- Data for Name: core_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_comment (id, name, age, description, datetime, youtube, hotel_id, comment) FROM stdin;
3	Дана Борисова	36	преподаватель	2018-09-03	\N	2	<p>In at facilisis purus, vitae ultricies elit. Phasellus pharetra velit ut ipsum semper gravida. Donec a dictum orci. Morbi quis risus nunc. Donec congue, nisl vitae ornare pharetra, odio nisi rutrum tellus, quis euismod nulla felis laoreet urna. Nulla facilisi. Nunc fringilla enim eget accumsan porttitor. Donec tincidunt mattis mi, in auctor enim sollicitudin sed.</p>
4	Иван Иванов	29	Менеджер	2018-09-01	https://www.youtube.com/embed/tgbNymZ7vqY	2	
\.


--
-- Data for Name: core_emaildispatch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_emaildispatch (id, email) FROM stdin;
1	asd@mail.ru
\.


--
-- Data for Name: core_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_image (id, image, object_id, content_type_id) FROM stdin;
1	images/anex.png	1	15
2	images/coral.png	1	15
3	images/join.png	1	15
4	images/pegas.png	1	15
5	images/tez.png	1	15
6	images/trg.png	1	15
8	images/city-main.png	1	24
9	images/h1.png	1	22
10	images/news-1.png	1	19
11	images/news-2.png	2	19
12	images/news-3.png	3	19
13	images/news-4.png	4	19
7	images/big-main.png	1	21
14	images/blog_1-1.png	1	21
15	images/city-main_t4Wsmwx.png	1	21
16	images/hotels1.png	1	21
17	images/reg-main.png	1	21
21	images/city-main_XhujIcb.png	1	28
22	images/news-1_KBdpVaL.png	5	19
23	images/news-2_kH3rApT.png	6	19
24	images/news-3_FfBzbID.png	7	19
25	images/news-4_jpcbnoY.png	8	19
19	images/big-main_SJu59vu.png	2	26
20	images/reg-main_4ZyRIuK.png	1	25
26	images/city-main_oFpg0Gu.png	1	25
28	images/city-main_G4pQNwM.png	2	26
29	images/reg-main_HZ377PG.png	2	26
27	images/big-main_h9R46if.png	1	28
30	images/reg-main_T9bJHV3.png	1	28
31	images/big-main_M8oadIY.png	2	25
32	images/reg-main_tQr9EIa.png	2	25
33	images/city-main_C7ByMsl.png	2	25
34	images/big-main_ytV99Du.png	3	25
35	images/city-main_W7rOqyd.png	3	25
36	images/reg-main_RpV3XkO.png	3	25
37	images/big-main_SFfNBt1.png	2	28
38	images/city-main_dYoWMJr.png	2	28
39	images/reg-main_xzBPaMC.png	2	28
40	images/big-main_uQqpssX.png	3	28
41	images/city-main_HH3hQHw.png	3	28
42	images/reg-main_Z1dv47I.png	3	28
43	images/big-main_pZSCAnU.png	4	28
44	images/reg-main_QMKSkPE.png	4	28
45	images/city-main_ESEKUCP.png	4	28
46	images/big-main_5BtHxqJ.png	5	28
47	images/reg-main_a69xlzj.png	5	28
48	images/city-main_eckwdej.png	5	28
49	images/big-main_RcJxrQR.png	6	28
50	images/city-main_Cm72fOt.png	6	28
51	images/reg-main_9n0wDXh.png	6	28
52	images/city-main_PJIXph9.png	7	28
53	images/big-main_VHjtNLZ.png	7	28
54	images/reg-main_ugo1KTU.png	7	28
55	images/reg-main_2kv7Nng.png	8	28
56	images/big-main_DH8RHuU.png	8	28
57	images/city-main_OmPeNx8.png	8	28
58	images/reg-main_3YNjy97.png	9	28
59	images/city-main_nIFhU7D.png	9	28
60	images/big-main_g1Qivew.png	9	28
61	images/big-main_l1a1Toq.png	3	26
62	images/city-main_ayV8ct0.png	3	26
63	images/reg-main_2MrSYj5.png	3	26
64	images/big-main_QYpNCmm.png	4	26
65	images/city-main_HVOT6Ts.png	4	26
66	images/big-main_kYgECGW.png	5	26
67	images/reg-main_7z856VF.png	5	26
68	images/big-main_0xTRz1F.png	6	26
69	images/big-main_xMSYS8o.png	7	26
70	images/city-main_QAU7WPg.png	7	26
71	images/reg-main_qVBS4Od.png	7	26
72	images/big-main_klPTc3x.png	8	26
73	images/city-main_Uwl8NDt.png	8	26
74	images/city-main_w05dOc6.png	9	26
75	images/big-main_QAyGPty.png	10	26
76	images/city-main_uWTjatd.png	10	26
77	images/reg-main_c8uHYlW.png	10	26
78	images/big-main_zUhKhB9.png	11	26
79	images/blog1.png	9	19
80	images/blog_1-1_YkqsBYP.png	10	19
81	images/blog1_KAnfkbc.png	11	19
82	images/blog_1-1_KKA6skr.png	12	19
83	images/blog1_VbTz8GG.png	13	19
84	images/blog_1-1_O5F1WdW.png	14	19
85	images/blog1_1ZrzwjD.png	15	19
86	images/blog_1-1_nzitnD0.png	16	19
87	images/blog1_SquvylT.png	18	19
88	images/blog_1-1_V5xkQ7c.png	17	19
89	images/blog1_VsEiM9r.png	19	19
90	images/blog_1-1_f20aXOc.png	20	19
91	images/blog1_1qE7XKY.png	21	19
92	images/blog_1-1_qzvaNMl.png	22	19
93	images/blog1_HW4HB8E.png	23	19
94	images/blog_1-1_nbY82xC.png	24	19
95	images/blog1_EWfqFV5.png	25	19
96	images/blog_1-1_k7Vtjlr.png	26	19
97	images/blog_1-1_LE7LN7v.png	27	19
98	images/blog1_sxHe9A3.png	28	19
\.


--
-- Data for Name: core_indexsettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_indexsettings (id, address, instagram, facebook, vk) FROM stdin;
1	г. Киев, ул.  Гоголевская 10, оф. 1а	http://instagram.com/	http://facebook.com/	http://vk.com/
\.


--
-- Data for Name: core_indexsettings_phone_numbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_indexsettings_phone_numbers (id, indexsettings_id, phonenumbers_id) FROM stdin;
4	1	1
5	1	2
6	1	3
\.


--
-- Data for Name: core_phonenumbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_phonenumbers (id, phone) FROM stdin;
1	044 2235 838
2	068 6594 950
3	066 0808 478
\.


--
-- Data for Name: core_sertificatesettings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY core_sertificatesettings (id, image, title, column_1, column_2) FROM stdin;
1	images/serf-logo.png	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis animi, voluptatibus adipisci	<div>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quod amet omnis fuga modi et, sapiente</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, amet iure quis accusamus cupiditate blanditiis unde aperiam molestiae consequatur. Repellat fugiat, mollitia minima natus laborum dolorem, et neque reiciendis accusantium, eligendi magni. Blanditiis qui, ullam laboriosam, tempore maxime dolorem laudantium quo, eveniet, amet quis reiciendis!</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati tempore eaque asperiores omnis quis mollitia eveniet quae corrupti amet id possimus quasi odio debitis sunt et ex, architecto incidunt nisi</p>\r\n</div>	<div>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa</p>\r\n\r\n<ul>\r\n\t<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit quis perspiciatis sint minima, odit, voluptatibus</li>\r\n\t<li>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit quis perspiciatis sint minima</li>\r\n\t<li>Lorem ipsum dolor sit amet</li>\r\n</ul>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt nemo sunt laborum recusandae minus inventore beatae sit ab! Labore placeat rerum et ut</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. At fugiat impedit accusamus reprehenderit aliquid, exercitationem</p>\r\n</div>
\.


--
-- Data for Name: des_dynamicemailconfiguration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY des_dynamicemailconfiguration (id, host, port, from_email, username, password, use_tls, use_ssl, fail_silently, timeout) FROM stdin;
1	smtp.ukr.net	465	floydya@ukr.net	floydya@ukr.net	NoMbRe19	f	t	f	120
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-09-02 07:36:20.666766+00	1	044 2235 838	1	[{"added": {}}]	16	1
2	2018-09-02 07:36:28.261086+00	2	068 6594 950	1	[{"added": {}}]	16	1
3	2018-09-02 07:36:35.017899+00	3	066 0808 478	1	[{"added": {}}]	16	1
4	2018-09-02 07:38:10.192172+00	1	IndexSettings object (1)	2	[{"changed": {"fields": ["phone_numbers", "address"]}}, {"added": {"name": "image", "object": "Image object (1)"}}, {"added": {"name": "image", "object": "Image object (2)"}}, {"added": {"name": "image", "object": "Image object (3)"}}, {"added": {"name": "image", "object": "Image object (4)"}}, {"added": {"name": "image", "object": "Image object (5)"}}, {"added": {"name": "image", "object": "Image object (6)"}}]	15	1
5	2018-09-02 07:39:13.048796+00	1	Email Configuration	2	[{"changed": {"fields": ["host", "port", "from_email", "username", "password", "use_ssl", "timeout"]}}]	1	1
6	2018-09-02 07:40:58.706243+00	1	CALL	1	[{"added": {}}]	5	1
7	2018-09-02 09:00:55.856806+00	1	SertificateSettings object (1)	2	[{"changed": {"fields": ["image", "title", "column_1", "column_2"]}}]	17	1
8	2018-09-02 10:35:56.92836+00	1	Австрия	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (7)"}}]	21	1
9	2018-09-02 10:36:58.663206+00	1	Зальцбург	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (8)"}}]	24	1
10	2018-09-02 10:37:13.482179+00	1	Спа-отель	1	[{"added": {}}]	23	1
11	2018-09-02 10:38:20.733992+00	1	Hotel Number One	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (9)"}}]	22	1
12	2018-09-02 10:39:27.337693+00	1	Comment object (1)	1	[{"added": {}}]	18	1
13	2018-09-02 10:39:47.137777+00	2	Comment object (2)	1	[{"added": {}}]	18	1
14	2018-09-02 10:40:50.626881+00	1	Акции	1	[{"added": {}}]	20	1
15	2018-09-02 10:40:55.836792+00	2	Экзотика	1	[{"added": {}}]	20	1
16	2018-09-02 10:41:01.658045+00	3	Новости компании	1	[{"added": {}}]	20	1
17	2018-09-02 10:41:08.623619+00	4	В помощь туристу	1	[{"added": {}}]	20	1
18	2018-09-02 10:41:14.981536+00	5	Обзоры стран	1	[{"added": {}}]	20	1
19	2018-09-02 10:41:19.476308+00	6	Документы	1	[{"added": {}}]	20	1
20	2018-09-02 10:42:11.036919+00	1	Lorem ipsum dolor sit	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (10)"}}]	19	1
21	2018-09-02 10:42:55.125335+00	2	Second article	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (11)"}}]	19	1
22	2018-09-02 10:43:25.904117+00	3	Third article	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (12)"}}]	19	1
23	2018-09-02 10:43:49.30911+00	4	Fourth article	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (13)"}}]	19	1
24	2018-09-02 10:44:57.103878+00	1	CALL	2	[{"changed": {"fields": ["subject", "html"]}}]	5	1
25	2018-09-02 10:45:13.07199+00	2	REPORT	1	[{"added": {}}]	5	1
26	2018-09-02 10:45:42.217469+00	2	REPORT	2	[{"changed": {"fields": ["subject", "html"]}}]	5	1
27	2018-09-02 10:45:48.388351+00	3	RESERVATION	1	[{"added": {}}]	5	1
28	2018-09-02 10:46:04.537505+00	3	RESERVATION	2	[{"changed": {"fields": ["subject", "html"]}}]	5	1
29	2018-09-02 10:46:41.538105+00	4	PICKING	1	[{"added": {}}]	5	1
30	2018-09-02 10:46:56.551022+00	4	PICKING	2	[{"changed": {"fields": ["subject", "html"]}}]	5	1
31	2018-09-02 10:47:04.141225+00	5	SERTIFICATE	1	[{"added": {}}]	5	1
32	2018-09-02 10:47:18.242945+00	5	SERTIFICATE	2	[{"changed": {"fields": ["subject", "html"]}}]	5	1
33	2018-09-02 11:22:08.86061+00	1	Австрия	2	[{"added": {"name": "image", "object": "Image object (14)"}}, {"added": {"name": "image", "object": "Image object (15)"}}, {"added": {"name": "image", "object": "Image object (16)"}}, {"added": {"name": "image", "object": "Image object (17)"}}, {"added": {"name": "image", "object": "Image object (18)"}}]	21	1
34	2018-09-02 11:25:10.968785+00	1	Австрия	2	[{"changed": {"name": "image", "object": "Image object (7)", "fields": ["image"]}}]	21	1
35	2018-09-02 11:36:01.145602+00	1	Австрия	2	[{"changed": {"name": "image", "object": "Image object (14)", "fields": ["image"]}}, {"changed": {"name": "image", "object": "Image object (15)", "fields": ["image"]}}, {"changed": {"name": "image", "object": "Image object (16)", "fields": ["image"]}}, {"changed": {"name": "image", "object": "Image object (17)", "fields": ["image"]}}, {"deleted": {"name": "image", "object": "Image object (None)"}}]	21	1
36	2018-09-02 12:01:54.175318+00	1	Вип тур	1	[{"added": {}}]	27	1
37	2018-09-02 12:02:04.107012+00	1	2018-09-02 — 2018-09-09	1	[{"added": {}}]	26	1
38	2018-09-02 12:03:34.091418+00	1	Includes Перелет	1	[{"added": {}}]	28	1
39	2018-09-02 12:03:43.806137+00	2	Includes Питание	1	[{"added": {}}]	28	1
40	2018-09-02 12:03:53.721101+00	3	Includes Виза	1	[{"added": {}}]	28	1
41	2018-09-02 12:04:02.542124+00	4	Includes Страховка	1	[{"added": {}}]	28	1
42	2018-09-02 12:04:10.329593+00	5	Excludes Экскурсии	1	[{"added": {}}]	28	1
43	2018-09-02 12:04:16.213581+00	6	Excludes Трансфер	1	[{"added": {}}]	28	1
44	2018-09-02 12:04:18.857689+00	1	Tour object (1)	1	[{"added": {}}]	25	1
45	2018-09-02 15:00:53.103405+00	1	Hotel Number One	2	[{"changed": {"fields": ["hot", "address"]}}]	22	1
46	2018-09-03 06:30:40.866948+00	1	IndexSettings object (1)	2	[{"changed": {"fields": ["phone_numbers"]}}]	15	1
47	2018-09-03 06:32:46.696976+00	2	Hotel Number One	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (19)"}}]	26	1
48	2018-09-03 06:33:06.706339+00	1	Австрия	2	[{"added": {"name": "image", "object": "Image object (20)"}}]	25	1
49	2018-09-03 06:33:22.994481+00	1	Австрия	2	[{"changed": {"name": "image", "object": "Image object (20)", "fields": ["image"]}}]	25	1
50	2018-09-03 06:34:13.05463+00	1	Зальцбург	2	[{"added": {"name": "image", "object": "Image object (21)"}}]	28	1
51	2018-09-03 06:35:12.656812+00	5	New article1	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (22)"}}]	19	1
52	2018-09-03 06:35:31.200934+00	6	article #2	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (23)"}}]	19	1
53	2018-09-03 06:35:47.635636+00	7	article #3	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (24)"}}]	19	1
54	2018-09-03 06:36:02.771185+00	8	article #4	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (25)"}}]	19	1
55	2018-09-03 06:37:39.873291+00	2	Tour object (2)	1	[{"added": {}}]	21	1
56	2018-09-03 07:32:01.785146+00	2	Hotel Number One	2	[{"changed": {"name": "image", "object": "Image object (19)", "fields": ["image"]}}]	26	1
57	2018-09-03 08:03:13.060815+00	3	Tour object (3)	1	[{"added": {}}]	21	1
58	2018-09-03 08:08:12.21528+00	2	2018-09-03 — 2018-09-10	1	[{"added": {}}]	22	1
59	2018-09-03 08:08:29.122124+00	4	Tour object (4)	1	[{"added": {}}]	21	1
60	2018-09-03 08:08:49.440322+00	3	2018-09-04 — 2018-09-07	1	[{"added": {}}]	22	1
61	2018-09-03 08:09:05.672977+00	5	Tour object (5)	1	[{"added": {}}]	21	1
62	2018-09-03 08:09:19.400005+00	4	2018-09-03 — 2018-09-17	1	[{"added": {}}]	22	1
63	2018-09-03 08:09:35.825577+00	6	Tour object (6)	1	[{"added": {}}]	21	1
64	2018-09-03 09:18:15.78925+00	2	Hotel Number One	2	[{"changed": {"fields": ["hot"]}}]	26	1
65	2018-09-03 09:39:26.570633+00	3	Comment object (3)	1	[{"added": {}}]	18	1
66	2018-09-03 09:39:44.556923+00	4	Comment object (4)	1	[{"added": {}}]	18	1
67	2018-09-03 10:59:34.000887+00	1	admin	2	[{"changed": {"fields": ["password"]}}]	10	1
68	2018-09-03 10:59:47.540151+00	1	admin	2	[{"changed": {"fields": ["first_name"]}}]	10	1
69	2018-09-03 11:07:31.299871+00	2	Авиа тур	1	[{"added": {}}]	23	1
70	2018-09-03 11:07:35.079688+00	3	Шоппинг тур	1	[{"added": {}}]	23	1
71	2018-09-03 11:07:41.274655+00	4	Автобусный тур	1	[{"added": {}}]	23	1
72	2018-09-03 11:07:44.974221+00	5	Свадебный тур	1	[{"added": {}}]	23	1
73	2018-09-03 11:08:00.745047+00	6	Детский отдых	1	[{"added": {}}]	23	1
74	2018-09-03 11:08:09.667318+00	7	Горнолыжный курорт	1	[{"added": {}}]	23	1
75	2018-09-03 11:08:15.292932+00	8	Пляжный отдых	1	[{"added": {}}]	23	1
76	2018-09-03 11:08:20.880247+00	9	Экзотика	1	[{"added": {}}]	23	1
77	2018-09-03 11:23:53.633258+00	1	Австрия	2	[{"changed": {"fields": ["preview_image"]}}, {"added": {"name": "image", "object": "Image object (26)"}}, {"changed": {"name": "image", "object": "Image object (20)", "fields": ["image"]}}]	25	1
78	2018-09-03 11:26:03.821674+00	1	Зальцбург	2	[{"changed": {"fields": ["preview_image"]}}, {"added": {"name": "image", "object": "Image object (27)"}}]	28	1
79	2018-09-03 11:27:02.552008+00	2	Hotel Number One	2	[{"changed": {"fields": ["preview_image"]}}, {"added": {"name": "image", "object": "Image object (28)"}}, {"added": {"name": "image", "object": "Image object (29)"}}]	26	1
80	2018-09-03 11:29:36.178301+00	1	Зальцбург	2	[{"added": {"name": "image", "object": "Image object (30)"}}, {"changed": {"name": "image", "object": "Image object (27)", "fields": ["image"]}}]	28	1
81	2018-09-03 11:33:56.434692+00	1	Вип тур	2	[{"changed": {"fields": ["preview_image"]}}]	23	1
82	2018-09-03 11:34:01.693558+00	2	Авиа тур	2	[{"changed": {"fields": ["preview_image"]}}]	23	1
83	2018-09-03 11:34:09.088062+00	3	Шоппинг тур	2	[{"changed": {"fields": ["preview_image"]}}]	23	1
84	2018-09-03 11:34:14.506638+00	4	Автобусный тур	2	[{"changed": {"fields": ["preview_image"]}}]	23	1
85	2018-09-03 11:34:37.50389+00	5	Свадебный тур	2	[{"changed": {"fields": ["preview_image"]}}]	23	1
86	2018-09-03 11:34:43.558209+00	6	Детский отдых	2	[{"changed": {"fields": ["preview_image"]}}]	23	1
87	2018-09-03 11:35:09.494259+00	7	Горнолыжный курорт	2	[{"changed": {"fields": ["preview_image"]}}]	23	1
88	2018-09-03 11:35:25.02863+00	8	Пляжный отдых	2	[{"changed": {"fields": ["preview_image"]}}]	23	1
89	2018-09-03 11:35:30.418172+00	9	Экзотика	2	[{"changed": {"fields": ["preview_image"]}}]	23	1
90	2018-09-03 12:18:19.635709+00	2	Египет	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (31)"}}, {"added": {"name": "image", "object": "Image object (32)"}}, {"added": {"name": "image", "object": "Image object (33)"}}]	25	1
91	2018-09-03 12:18:57.626556+00	3	Турция	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (34)"}}, {"added": {"name": "image", "object": "Image object (35)"}}, {"added": {"name": "image", "object": "Image object (36)"}}]	25	1
92	2018-09-03 12:20:48.029661+00	2	Вена	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (37)"}}, {"added": {"name": "image", "object": "Image object (38)"}}, {"added": {"name": "image", "object": "Image object (39)"}}]	28	1
93	2018-09-03 12:21:57.811705+00	3	Баден	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (40)"}}, {"added": {"name": "image", "object": "Image object (41)"}}, {"added": {"name": "image", "object": "Image object (42)"}}]	28	1
94	2018-09-03 12:22:54.499556+00	4	Каир	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (43)"}}, {"added": {"name": "image", "object": "Image object (44)"}}, {"added": {"name": "image", "object": "Image object (45)"}}]	28	1
95	2018-09-03 12:23:32.461694+00	5	Александрия	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (46)"}}, {"added": {"name": "image", "object": "Image object (47)"}}, {"added": {"name": "image", "object": "Image object (48)"}}]	28	1
96	2018-09-03 12:24:07.18286+00	6	Хургада	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (49)"}}, {"added": {"name": "image", "object": "Image object (50)"}}, {"added": {"name": "image", "object": "Image object (51)"}}]	28	1
97	2018-09-03 12:25:00.509013+00	7	Улудаг	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (52)"}}, {"added": {"name": "image", "object": "Image object (53)"}}, {"added": {"name": "image", "object": "Image object (54)"}}]	28	1
98	2018-09-03 12:25:47.676649+00	8	Анкара	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (55)"}}, {"added": {"name": "image", "object": "Image object (56)"}}, {"added": {"name": "image", "object": "Image object (57)"}}]	28	1
99	2018-09-03 12:26:29.063808+00	9	Каппадокия	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (58)"}}, {"added": {"name": "image", "object": "Image object (59)"}}, {"added": {"name": "image", "object": "Image object (60)"}}]	28	1
100	2018-09-03 12:26:37.39761+00	9	Каппадокия	2	[{"changed": {"fields": ["country"]}}]	28	1
101	2018-09-03 12:28:40.238785+00	3	Bloberger Hof	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (61)"}}, {"added": {"name": "image", "object": "Image object (62)"}}, {"added": {"name": "image", "object": "Image object (63)"}}]	26	1
102	2018-09-03 12:29:06.554596+00	3	Bloberger Hof	2	[{"changed": {"fields": ["address"]}}]	26	1
103	2018-09-03 12:29:36.319985+00	2	Отель	1	[{"added": {}}]	27	1
104	2018-09-03 12:29:38.592469+00	3	Отель-курорт	1	[{"added": {}}]	27	1
105	2018-09-03 12:29:48.649525+00	4	Апартаменты	1	[{"added": {}}]	27	1
106	2018-09-03 12:29:55.901093+00	5	Гостевой дом	1	[{"added": {}}]	27	1
107	2018-09-03 12:30:05.071886+00	3	Bloberger Hof	2	[{"changed": {"fields": ["type"]}}]	26	1
108	2018-09-03 12:31:30.407248+00	4	Arthotel Blaue Gans	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (64)"}}, {"added": {"name": "image", "object": "Image object (65)"}}]	26	1
109	2018-09-03 12:33:17.572858+00	5	Semiramis Hotel	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (66)"}}, {"added": {"name": "image", "object": "Image object (67)"}}]	26	1
110	2018-09-03 12:34:39.015663+00	6	Hilton Alexandria Corniche	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (68)"}}]	26	1
160	2018-09-03 14:14:15.168046+00	2	Tour object (2)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-09"}}]	21	1
111	2018-09-03 12:35:53.370788+00	7	Gleem Luxury Apartments	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (69)"}}, {"added": {"name": "image", "object": "Image object (70)"}}, {"added": {"name": "image", "object": "Image object (71)"}}]	26	1
112	2018-09-03 12:37:59.896021+00	8	One Wien-Hauptbahnhof	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (72)"}}, {"added": {"name": "image", "object": "Image object (73)"}}]	26	1
113	2018-09-03 12:39:07.0071+00	9	Leonardo Hotel Vienna	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (74)"}}]	26	1
114	2018-09-03 12:40:29.946331+00	10	At the Park Hotel	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (75)"}}, {"added": {"name": "image", "object": "Image object (76)"}}, {"added": {"name": "image", "object": "Image object (77)"}}]	26	1
115	2018-09-03 12:41:24.199411+00	11	Hotel Schloss Weikersdorf	1	[{"added": {}}, {"added": {"name": "image", "object": "Image object (78)"}}]	26	1
116	2018-09-03 12:42:17.723751+00	7	Tour object (7)	1	[{"added": {}}]	21	1
117	2018-09-03 12:42:44.316595+00	8	Tour object (8)	1	[{"added": {}}]	21	1
118	2018-09-03 12:43:16.636071+00	9	Tour object (9)	1	[{"added": {}}]	21	1
119	2018-09-03 12:43:42.693569+00	10	Tour object (10)	1	[{"added": {}}]	21	1
120	2018-09-03 12:44:35.745102+00	11	Tour object (11)	1	[{"added": {}}]	21	1
121	2018-09-03 12:45:03.177965+00	12	Tour object (12)	1	[{"added": {}}]	21	1
122	2018-09-03 12:45:37.49966+00	13	Tour object (13)	1	[{"added": {}}]	21	1
123	2018-09-03 12:46:08.891697+00	14	Tour object (14)	1	[{"added": {}}]	21	1
124	2018-09-03 13:00:00.969899+00	9	Article 0	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (79)"}}]	19	1
125	2018-09-03 13:00:06.39644+00	10	Article 1	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (80)"}}]	19	1
126	2018-09-03 13:00:11.873903+00	11	Article 2	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (81)"}}]	19	1
127	2018-09-03 13:00:17.614132+00	12	Article 3	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (82)"}}]	19	1
128	2018-09-03 13:00:25.39744+00	13	Article 4	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (83)"}}]	19	1
129	2018-09-03 13:00:31.246374+00	14	Article 5	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (84)"}}]	19	1
130	2018-09-03 13:00:36.00724+00	15	Article 6	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (85)"}}]	19	1
131	2018-09-03 13:00:45.5699+00	16	Article 7	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (86)"}}]	19	1
132	2018-09-03 13:00:50.818862+00	18	Article 9	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (87)"}}]	19	1
133	2018-09-03 13:00:54.710865+00	17	Article 8	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (88)"}}]	19	1
134	2018-09-03 13:00:59.030612+00	19	Article 10	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (89)"}}]	19	1
135	2018-09-03 13:01:03.151298+00	20	Article 11	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (90)"}}]	19	1
136	2018-09-03 13:01:08.522646+00	21	Article 12	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (91)"}}]	19	1
137	2018-09-03 13:01:12.947187+00	22	Article 13	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (92)"}}]	19	1
138	2018-09-03 13:01:24.647244+00	23	Article 14	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (93)"}}]	19	1
139	2018-09-03 13:01:28.539117+00	24	Article 15	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (94)"}}]	19	1
140	2018-09-03 13:01:32.863331+00	25	Article 16	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (95)"}}]	19	1
141	2018-09-03 13:01:36.551185+00	26	Article 17	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (96)"}}]	19	1
142	2018-09-03 13:01:43.090638+00	27	Article 18	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (97)"}}]	19	1
143	2018-09-03 13:01:47.954989+00	28	Article 19	2	[{"changed": {"fields": ["body"]}}, {"added": {"name": "image", "object": "Image object (98)"}}]	19	1
144	2018-09-03 13:50:17.823958+00	14	Tour object (14)	2	[{"changed": {"name": "Tour Datepair", "object": "2018-09-02 \\u2014 2018-09-09", "fields": ["cost"]}}, {"changed": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10", "fields": ["cost"]}}, {"changed": {"name": "Tour Datepair", "object": "2018-09-04 \\u2014 2018-09-07", "fields": ["cost"]}}, {"changed": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-17", "fields": ["cost"]}}]	21	1
145	2018-09-03 13:54:36.252277+00	2	Tour object (2)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
146	2018-09-03 13:54:44.508434+00	3	Tour object (3)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
147	2018-09-03 13:54:53.964817+00	4	Tour object (4)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
148	2018-09-03 13:55:02.298908+00	5	Tour object (5)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
149	2018-09-03 13:55:15.58926+00	6	Tour object (6)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
150	2018-09-03 13:55:25.003763+00	7	Tour object (7)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
151	2018-09-03 13:55:32.029582+00	8	Tour object (8)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
152	2018-09-03 13:55:39.711525+00	9	Tour object (9)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
153	2018-09-03 13:55:48.742757+00	10	Tour object (10)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
154	2018-09-03 13:55:55.711426+00	11	Tour object (11)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
155	2018-09-03 13:56:05.155871+00	12	Tour object (12)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
156	2018-09-03 13:57:27.181814+00	13	Tour object (13)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-10"}}]	21	1
157	2018-09-03 13:59:07.120537+00	15	Tour object (15)	1	[{"added": {}}, {"added": {"name": "Tour Datepair", "object": "2018-09-01 \\u2014 2018-09-20"}}]	21	1
158	2018-09-03 14:02:41.559958+00	15	Tour object (15)	2	[{"changed": {"name": "Tour Datepair", "object": "2018-09-01 \\u2014 2018-09-08", "fields": ["end"]}}]	21	1
159	2018-09-03 14:07:24.283005+00	2	Tour object (2)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-01 \\u2014 2018-09-08"}}]	21	1
161	2018-09-03 14:20:25.813019+00	15	Tour object (15)	2	[{"added": {"name": "tour includes", "object": "TourIncludes object (1)"}}, {"added": {"name": "tour includes", "object": "TourIncludes object (2)"}}, {"added": {"name": "tour includes", "object": "TourIncludes object (3)"}}, {"added": {"name": "tour excludes", "object": "TourExcludes object (1)"}}, {"added": {"name": "tour excludes", "object": "TourExcludes object (2)"}}]	21	1
162	2018-09-03 14:22:57.133851+00	15	Tour object (15)	2	[{"changed": {"name": "Tour Datepair", "object": "2018-09-03 \\u2014 2018-09-08", "fields": ["start"]}}]	21	1
163	2018-09-03 14:23:12.04936+00	3	Tour object (3)	2	[{"changed": {"name": "Tour Datepair", "object": "2018-09-01 \\u2014 2018-09-10", "fields": ["start"]}}]	21	1
164	2018-09-03 14:23:18.027838+00	4	Tour object (4)	2	[{"changed": {"name": "Tour Datepair", "object": "2018-09-01 \\u2014 2018-09-10", "fields": ["start"]}}]	21	1
165	2018-09-03 14:25:36.821823+00	15	Tour object (15)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-04 \\u2014 2018-09-09"}}]	21	1
166	2018-09-03 14:44:02.869942+00	1	127.0.0.1:8535	2	[{"changed": {"fields": ["domain", "name"]}}]	13	1
167	2018-09-03 14:47:07.115487+00	12	Tour object (12)	2	[{"added": {"name": "Tour Datepair", "object": "2018-09-01 \\u2014 2018-09-08"}}]	21	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	des	dynamicemailconfiguration
2	postie	attachment
3	postie	letter
4	postie	log
5	postie	template
6	postie	templatetranslation
7	admin	logentry
8	auth	permission
9	auth	group
10	auth	user
11	contenttypes	contenttype
12	sessions	session
13	sites	site
14	core	image
15	core	indexsettings
16	core	phonenumbers
17	core	sertificatesettings
18	core	comment
19	blog	article
20	blog	heading
21	tours	tour
22	tours	tourdatepair
23	tours	tourtype
24	tours	tourxcludes
25	locations	country
26	locations	hotel
27	locations	hoteltype
28	locations	resort
29	reports	call
30	reports	pickingtour
31	reports	report
32	reports	reservation
33	reports	sertificate
34	core	emaildispatch
35	tours	tourexcludes
36	tours	tourincludes
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-09-03 06:07:38.706986+00
2	auth	0001_initial	2018-09-03 06:07:43.49774+00
3	admin	0001_initial	2018-09-03 06:07:44.483256+00
4	admin	0002_logentry_remove_auto_add	2018-09-03 06:07:44.53077+00
5	admin	0003_logentry_add_action_flag_choices	2018-09-03 06:07:44.658898+00
6	contenttypes	0002_remove_content_type_name	2018-09-03 06:07:45.156119+00
7	auth	0002_alter_permission_name_max_length	2018-09-03 06:07:45.243069+00
8	auth	0003_alter_user_email_max_length	2018-09-03 06:07:45.391375+00
9	auth	0004_alter_user_username_opts	2018-09-03 06:07:45.463662+00
10	auth	0005_alter_user_last_login_null	2018-09-03 06:07:45.756863+00
11	auth	0006_require_contenttypes_0002	2018-09-03 06:07:45.843985+00
12	auth	0007_alter_validators_add_error_messages	2018-09-03 06:07:45.973523+00
13	auth	0008_alter_user_username_max_length	2018-09-03 06:07:46.288341+00
14	auth	0009_alter_user_last_name_max_length	2018-09-03 06:07:46.592983+00
15	blog	0001_initial	2018-09-03 06:12:03.61501+00
16	locations	0001_initial	2018-09-03 06:12:06.230693+00
17	core	0001_initial	2018-09-03 06:12:07.140982+00
18	core	0002_auto_20180901_1105	2018-09-03 06:12:07.74621+00
19	core	0003_comment	2018-09-03 06:12:08.005683+00
20	core	0004_comment_comment	2018-09-03 06:12:08.714555+00
21	core	0005_auto_20180901_1502	2018-09-03 06:12:08.799697+00
22	core	0006_auto_20180902_0735	2018-09-03 06:12:08.89255+00
23	core	0007_auto_20180902_1438	2018-09-03 06:12:08.933996+00
24	des	0001_initial	2018-09-03 06:12:09.266777+00
25	locations	0002_hotel_address	2018-09-03 06:12:10.192704+00
26	postie	0001_initial	2018-09-03 06:12:11.883753+00
27	postie	0002_auto_20180501_0834	2018-09-03 06:12:11.933384+00
28	postie	0003_auto_20180504_0340	2018-09-03 06:12:12.011138+00
29	tours	0001_initial	2018-09-03 06:12:14.786147+00
30	reports	0001_initial	2018-09-03 06:12:17.008238+00
31	sessions	0001_initial	2018-09-03 06:12:17.876268+00
32	sites	0001_initial	2018-09-03 06:12:18.38392+00
33	sites	0002_alter_domain_unique	2018-09-03 06:12:18.831835+00
34	locations	0003_auto_20180903_1122	2018-09-03 11:22:53.361021+00
35	tours	0002_tourtype_preview_image	2018-09-03 11:33:41.654717+00
36	core	0008_auto_20180903_1201	2018-09-03 12:01:27.194667+00
37	locations	0004_auto_20180903_1201	2018-09-03 12:01:27.329127+00
38	tours	0003_auto_20180903_1201	2018-09-03 12:01:27.427772+00
39	core	0009_auto_20180903_1216	2018-09-03 12:16:30.695645+00
40	tours	0004_auto_20180903_1339	2018-09-03 13:39:41.690067+00
41	tours	0005_auto_20180903_1343	2018-09-03 13:45:08.064976+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
2iwqh0hfq5xcl2ypmqfvqdz4t2blitgs	N2NjODdiZmQyOGJiN2FmNjBmMDA1Y2JhNmE0ZThiYTFmMzY2NmE1ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMTMwNzg5NjYwYzRkNmM0Yzg1MTU0ZGJmZTEzYjMxNGFkMjVmMmNhIn0=	2018-09-16 07:29:54.136067+00
88mtr7koi9ec06km80wlsqc6ov7p3lzp	N2I5MTE4ODE1NzRkMTI4NjAxMjUzYWNkNjU5YWU3YzU4MzllNzg2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MjM2ZTUxOTY0Mjk3Y2JjOTgzY2Q3YmFiZDFhNzVhYTI3OGQyNGEzIn0=	2018-09-17 10:59:34.166314+00
x41lub2rnj1yc1frh7b5w8qjfbe27vzp	N2I5MTE4ODE1NzRkMTI4NjAxMjUzYWNkNjU5YWU3YzU4MzllNzg2Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MjM2ZTUxOTY0Mjk3Y2JjOTgzY2Q3YmFiZDFhNzVhYTI3OGQyNGEzIn0=	2018-09-17 13:24:27.320815+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_site (id, domain, name) FROM stdin;
1	127.0.0.1:8535	127.0.0.1:8535
\.


--
-- Data for Name: locations_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY locations_country (id, slug, name, about, holidays, to_visit, customs, preview_image) FROM stdin;
1	avstriia	Австрия	<div>\r\n<p>Австрия - самая красивая страна центральной Европы. Это поистине маленькая жемчужина: горнолыжные и бальнеологические курорты, отдых на озерах, достопримечательности городов Австрии, живописные деревушки на тирольских склонах - все это привлекает в страну туристов со всего света.</p>\r\n</div>\r\n\r\n<div>\r\n<p><strong>Столица: </strong>Вена</p>\r\n\r\n<p><strong>Язык: </strong>Немецкий с характерным австрийским акцентом.</p>\r\n\r\n<p><strong>Язык: </strong>Отстает от киевского на 1 час</p>\r\n\r\n<p><strong>География:</strong></p>\r\n</div>\r\n\r\n<div>\r\n<p>Государство в Центральной Европе. На севере граничит с Чехией, на северо-востоке - со Словакией, на востоке - с Венгрией, на юге - со Словенией, Италией и Швейцарией, на западе - с Лихтенштейном, Швейцарией и Германией. Австрия в основном горная страна (на 70%): средний уровень составляет около 900 м, большая часть Австрии занята Восточными Альпами, которые в свою очередь подразделяются на Альпы Северного Тироля и Зальцбургские Альпы на севере; Циллертальские и Кар-никские Альпы на юге. Высшая точка - гора Гросглокнер (3797 метров), на ней находится и один из крупнейших в Европе ледников: Пастерзе.</p>\r\n</div>\r\n\r\n<div>\r\n<p><strong>Климат: </strong></p>\r\n</div>\r\n\r\n<div>\r\n<p>Умеренный, континентальный. Самый холодный зимний месяц &ndash; январь, температура опускается до &ndash;2 C. Самые жаркие &ndash; июль и август, температура около +20 С. Осадков от 600 до 1100 мм в год.</p>\r\n</div>\r\n\r\n<div>\r\n<p><strong>Валюта: </strong>Евро</p>\r\n</div>	<div>\r\n<div>\r\n<p><strong>01 января: </strong>Новый год;</p>\r\n\r\n<p><strong>06 января: </strong>Богоявление;</p>\r\n\r\n<p><strong>05 апреля: </strong>Пасхальный Понедельник;</p>\r\n\r\n<p><strong>01 мая: </strong>Государственный праздник;</p>\r\n\r\n<p><strong>13 мая: </strong>Вознесение;</p>\r\n\r\n<p><strong>24 мая: </strong>Понедельник Пятидесятницы;</p>\r\n\r\n<p><strong>03 июня: </strong>Праздник Тела Господня;</p>\r\n</div>\r\n\r\n<div>\r\n<p><strong>15 августа: </strong>Успение Богородицы;</p>\r\n\r\n<p><strong>26 октября: </strong>Национальный праздник;</p>\r\n\r\n<p><strong>01 ноября: </strong>День Всех Святых;</p>\r\n\r\n<p><strong>08 декабря: </strong>Зачатие Богородицы;</p>\r\n\r\n<p><strong>25 декабря: </strong>Рождество;</p>\r\n\r\n<p><strong>26 декабря: </strong>Понедельник Пятидесятницы;</p>\r\n\r\n<p><strong>03 июня: </strong>День Святого Стефана.</p>\r\n</div>\r\n</div>	<div>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.</p>\r\n</div>	<div>\r\n<p><strong>Виза:</strong></p>\r\n</div>\r\n\r\n<div>\r\n<p>Австрия входит в состав стран - членов Шенгенского соглашения. Для въезда в Австрию гражданам&nbsp; СНГ необходима виза.</p>\r\n</div>\r\n\r\n<div>\r\n<p><strong>Таможенные правила: </strong></p>\r\n</div>\r\n\r\n<div>\r\n<p>Разрешен беспошлинный ввоз до 200 сигарет или 100 сигарилл, или 50 сигар, или 250 г табака; до 1 л крепких спиртных напитков (содержание алкоголя более 22%), или до 2 л крепленых вин и ликеров (содержание алкоголя менее 22%); столового вина - до 2 л; не более 500 г кофе или 200 г кофейного экстракта; до 100 г чая или 40 г чайного экстракта; до 50 г духов и 250 мл туалетной воды; а также товаров личного использования из расчета 175 евро на одного взрослого и 90 евро на ребенка в возрасте до 15 лет. Золотые изделия и драгоценности общим весом до 500 г (для личного использования) ввозятся бесплатно, свыше этой нормы все ювелирные украшения подлежат обязательной декларации.</p>\r\n</div>	images/cont2_UbDuoNg.png
2	egipet	Египет	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	images/egip.png
3	turtsiia	Турция	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	images/Turkey.png
\.


--
-- Data for Name: locations_hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY locations_hotel (id, slug, name, stars, hot, website, description, breakfasts, resort_id, type_id, address, preview_image) FROM stdin;
2	hotel-number-one	Hotel Number One	4	t	\N	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas porttitor felis in nisi interdum malesuada. Sed sit amet vulputate diam. Morbi quis fringilla ipsum. In dignissim tempor erat at tincidunt. Nam eget odio tincidunt, pellentesque turpis sed, maximus lorem. Fusce magna libero, suscipit sed tellus id, placerat imperdiet est. Quisque lobortis libero vel nibh bibendum bibendum. Nam sollicitudin malesuada feugiat. Etiam turpis magna, maximus sit amet ullamcorper et, rutrum quis sem. Aliquam tempor dui dolor, id tincidunt ipsum venenatis id. Donec non ligula quis ex accumsan finibus. Duis volutpat turpis eu lobortis sagittis. Nunc in placerat dui, et molestie est. Nullam sit amet sollicitudin lectus, nec auctor justo.</p>\r\n\r\n<p>Quisque faucibus odio dui, quis aliquam erat maximus sed. Quisque at tincidunt orci. Suspendisse luctus a massa vel blandit. Proin quis augue in orci eleifend posuere. Quisque dignissim pharetra odio eget sagittis. Nam non augue sodales, vehicula nulla pellentesque, consequat nunc. Maecenas ac erat erat. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>\r\n\r\n<p>Donec posuere dui ac laoreet sollicitudin. Morbi pretium augue tristique mi tristique interdum. Vivamus id malesuada ipsum, nec imperdiet odio. Praesent non elementum purus. Vivamus imperdiet neque mauris, at placerat augue posuere id. Vestibulum faucibus, sapien vel pulvinar dapibus, nisl metus tristique metus, vel pellentesque quam sem sollicitudin elit. Cras eleifend tristique rhoncus. Maecenas quis mi ut neque euismod faucibus id eget justo. Phasellus aliquet lacus id ullamcorper tempus. Morbi at aliquet leo. Suspendisse a ante vel nibh blandit sollicitudin. Vivamus ornare, justo auctor facilisis hendrerit, massa mi egestas turpis, nec ultrices augue purus in quam. Donec interdum ex quis bibendum dapibus. In turpis dolor, finibus et tortor id, dapibus sollicitudin erat.</p>\r\n\r\n<p>Curabitur finibus placerat convallis. Praesent non nulla vitae justo venenatis rhoncus congue ac sapien. Integer varius eros non metus cursus, consectetur rutrum dui viverra. Vestibulum ut magna tincidunt, sagittis leo non, suscipit felis. Phasellus orci lorem, aliquet vel sem eu, viverra posuere augue. Nam sed eros vulputate, euismod risus ac, condimentum neque. Pellentesque pretium elit ligula, vitae efficitur orci mattis tempus. Nunc dictum, orci sit amet condimentum iaculis, augue nibh sagittis orci, quis ultricies odio erat id erat. Nam vulputate erat in turpis eleifend imperdiet. Donec vulputate feugiat elit, id pretium sem fringilla a. Etiam quis purus gravida, congue dui sed, ornare ipsum. Nam ultrices tellus vel aliquet commodo. Sed consectetur ornare interdum. Sed elementum ac urna eget rutrum.</p>\r\n\r\n<p>Integer et elementum libero. Mauris eu tristique odio, at egestas augue. Aenean pharetra cursus tincidunt. In lobortis ante fermentum mi finibus, sit amet sodales nisl ullamcorper. Etiam non est nec justo vulputate porta. Nullam eu ex sit amet arcu faucibus egestas. Integer placerat, dui varius auctor molestie, nibh leo tempor mauris, vel mollis nibh velit at ante. Ut convallis varius urna. Vivamus placerat convallis arcu, in congue est imperdiet at. Sed a convallis augue. Nullam blandit sem eu posuere faucibus. Proin ante libero, tristique vel ligula varius, sagittis consectetur erat. Vivamus sollicitudin vitae erat vitae aliquet. Mauris efficitur nulla eget nisi vulputate porta. Proin pretium sapien ornare, venenatis elit at, pulvinar felis.</p>	<p>Quisque faucibus odio dui, quis aliquam erat maximus sed. Quisque at tincidunt orci. Suspendisse luctus a massa vel blandit. Proin quis augue in orci eleifend posuere. Quisque dignissim pharetra odio eget sagittis. Nam non augue sodales, vehicula nulla pellentesque, consequat nunc. Maecenas ac erat erat. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>	1	1	Berlin, Germany	images/h1_I7DWyPd.png
11	hotel-schloss-weikersdorf	Hotel Schloss Weikersdorf	1	f	\N	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	3	2	Баден, Австрия	images/b2_n7JaNvk.png
3	bloberger-hof	Bloberger Hof	4	f	\N	<p>A 15-minute bus ride from the Old Town, the Bloberger Hof enjoys a quiet and scenic location on the southern outskirts of Salzburg. It offers free Wi-Fi and free parking.</p>\r\n\r\n<p>The traditionally furnished rooms feature cable TV, a fan, and a bathroom with hairdryer. They offer views of the Untersberg Mountain or Hohensalzburg Fortress.</p>\r\n\r\n<p>The Bloberger Hof&rsquo;s restaurant serves traditional Austrian cuisine and a daily breakfast buffet. In the summer months, guests can enjoy their breakfast or dinner on the covered terrace overlooking the Untersberg Mountain.</p>\r\n\r\n<p>The bus stop providing direct connections into the centre (line 21) is 100 metres away from the Bloberger Hof.&nbsp;</p>\r\n\r\n<p>Леопольдскрон-Моос - прекрасний вибір для мандрівників, яких цікавить:&nbsp;пейзаж,&nbsp;відвідування музеїв&nbsp;і&nbsp;атмосфера.</p>\r\n\r\n<p>Розташування цього помешкання - одне з найкращих у Зальцбурзі! Воно подобається гостям більше, ніж розташування інших помешкань у цьому районі.</p>\r\n\r\n<p>Це місце розташування особливо подобається парам - вони оцінили його на&nbsp;<strong>9,1</strong>&nbsp;для поїздки удвох.</p>\r\n\r\n<p>Це помешкання пропонує найкраще співвідношення ціни й якості у Зальцбурзі! Порівняно з іншими помешканнями в місті, тут гості отримують більше за ті ж гроші.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	1	5	Hammerauer Straße 4, Зальцбург, Австрия	images/reg2.png
4	arthotel-blaue-gans	Arthotel Blaue Gans	5	t	\N	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	1	4	Getreidegasse 41-43, Зальцбург, Австрия	images/t9.png
10	at-the-park-hotel	At the Park Hotel	4	f	\N	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	3	3	Баден, Австрия	images/hot-1.png
5	semiramis-hotel	Semiramis Hotel	3	f	\N	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	5	1	80 El Corniche Road Raml Station, Александрия, Египет	images/t3.png
6	hilton-alexandria-corniche	Hilton Alexandria Corniche	5	t	\N	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	5	3	544 El Geish Road , Александрия, Египет	images/t11.png
7	gleem-luxury-apartments	Gleem Luxury Apartments	5	t	\N	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	5	4	366 El-Gaish Road gleem, Александрия, Египет	images/t8.png
8	one-wien-hauptbahnhof	One Wien-Hauptbahnhof	4	f	\N	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	2	2	Gerhard-Bronner-Str. 11, Австрия	images/reg4.png
9	leonardo-hotel-vienna	Leonardo Hotel Vienna	2	f	\N	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	2	3	Matrosengasse 6-8, Австрия	images/b5_7ySVoym.png
\.


--
-- Data for Name: locations_hoteltype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY locations_hoteltype (id, slug, name) FROM stdin;
1	spa-otel	Спа-отель
2	otel	Отель
3	otel-kurort	Отель-курорт
4	apartamenty	Апартаменты
5	gostevoi-dom	Гостевой дом
\.


--
-- Data for Name: locations_resort; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY locations_resort (id, slug, name, about, sights, country_id, preview_image) FROM stdin;
5	aleksandriia	Александрия	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	2	images/t2.png
1	zaltsburg	Зальцбург	<div>\r\n<p>Город Моцарта Зальцбург носит и второе имя &ndash; &laquo;сцена мира&raquo;. И это по праву, поскольку в таких жемчужинах культурной жизни, как Зальцбургский фестиваль, принимают участие звезды мировой величины. Живописный старый город Зальцбурга признан мировым культурным наследием ЮНЕСКО.</p>\r\n\r\n<p>Церкви, крепости, замки и дворцы составляют доминанту в картине этого города.&nbsp; Его символ &ndash; крепость Хоэнзальцбург, одна из самых больших и хорошо сохранившихся в Европе. Посетите резиденцию эрцгерцога Зальцбургского, роскошное сооружение в стиле раннего барокко с пышными залами и картинной галереей.</p>\r\n\r\n<p>Недалеко расположенный Кафедральный собор Зальцбурга считается самым значимым сакральным сооружением города. Не менее примечателен и с размахом построенный в стиле барокко архитектором Лукасом фон Хильдебрандтом дворец Мирабель.</p>\r\n\r\n<p>У подножья горы Мёнхсберг вы обнаружите так называемый район Зальцбургского фестиваля, включающий в себя Малый и Большой фестивальные дворцы, а также Летнюю школу верховой езды, построенную в 1693 году по планам архитектора Фишера фон Эрлаха. Недалеко от города вас очарует загородный дворец Хельбрунн в стиле раннего барокко с его всемирно известными каскадами фонтанов.</p>\r\n</div>	<div>\r\n<div>\r\n<div><strong>Первая:</strong></div>\r\n\r\n<div>\r\n<p>Город Моцарта Зальцбург носит и второе имя &ndash; &laquo;сцена мира&raquo;. И это по праву, поскольку в таких жемчужинах культурной жизни, как Зальцбургский фестиваль, принимают участие звезды мировой величины. Живописный старый город Зальцбурга признан мировым культурным наследием ЮНЕСКО.</p>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div>\r\n<div>\r\n<div><strong>Вторая:</strong></div>\r\n\r\n<div>\r\n<p>Город Моцарта Зальцбург носит и второе имя &ndash; &laquo;сцена мира&raquo;. И это по праву, поскольку в таких жемчужинах культурной жизни, как Зальцбургский фестиваль, принимают участие звезды мировой величины. Живописный старый город Зальцбурга признан мировым культурным наследием ЮНЕСКО.</p>\r\n\r\n<p>Церкви, крепости, замки и дворцы составляют доминанту в картине этого города.&nbsp; Его символ &ndash; крепость Хоэнзальцбург, одна из самых больших и хорошо сохранившихся в Европе. Посетите резиденцию эрцгерцога Зальцбургского, роскошное сооружение в стиле раннего барокко с пышными залами и картинной галереей.</p>\r\n\r\n<p>Недалеко расположенный Кафедральный собор Зальцбурга считается самым значимым сакральным сооружением города. Не менее примечателен и с размахом построенный в стиле барокко архитектором Лукасом фон Хильдебрандтом дворец Мирабель.</p>\r\n\r\n<p>У подножья горы Мёнхсберг вы обнаружите так называемый район</p>\r\n</div>\r\n</div>\r\n</div>	1	images/c1.png
2	vena	Вена	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	1	images/c2.png
3	baden	Баден	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	1	images/c3.png
4	kair	Каир	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	2	images/t1.png
6	khurgada	Хургада	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	2	images/t10.png
7	uludag	Улудаг	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	3	images/cont13.png
8	ankara	Анкара	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	3	images/reg1.png
9	kappadokiia	Каппадокия	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris elementum metus non diam posuere tincidunt. Fusce sit amet lorem nisi. Suspendisse neque orci, tempor vel imperdiet ac, fringilla viverra nunc. Proin sit amet lectus id tellus molestie gravida. Suspendisse lobortis nulla lectus, eget mollis elit pulvinar et. Nunc velit eros, sodales sed lorem sed, hendrerit interdum libero. Proin efficitur augue sit amet arcu vehicula, in commodo nisi rhoncus.</p>\r\n\r\n<p>Vivamus ex dui, lacinia eu massa eu, tristique vulputate massa. Maecenas sollicitudin condimentum turpis ut pulvinar. Aenean vitae nulla et diam elementum consequat. Nam suscipit urna vel nibh fermentum, vitae mollis purus luctus. Nulla lacus purus, dictum accumsan fermentum at, blandit eget risus. Donec non dignissim turpis. Phasellus scelerisque tristique ex, ut pharetra risus aliquam id. Phasellus consequat auctor mauris. Duis dignissim turpis ligula, vel luctus leo fringilla vitae. Maecenas convallis augue non lectus volutpat, at molestie lectus finibus. Etiam sit amet posuere enim. Morbi placerat ut arcu at dignissim. Nullam vel elementum velit. Aliquam volutpat sem a tellus efficitur, bibendum sagittis lacus euismod. In eget maximus enim, sit amet placerat sapien.</p>	3	images/cont14.png
\.


--
-- Data for Name: postie_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postie_attachment (id, created, modified, attachment, letter_id) FROM stdin;
\.


--
-- Data for Name: postie_letter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postie_letter (id, created, modified, subject, html, plain, email_from, recipients, event, status, language) FROM stdin;
1	2018-09-03 09:55:46.761398+00	2018-09-03 09:55:47.840697+00	Новая заявка на звонок!	<p>Nikolay: First Name<br />\r\n+380665005001: Phone Number<br />\r\nhttp://127.0.0.1:8535/: Sent From Link<br />\r\n3 сентября 2018 г. 9:55: Date</p>		floydya@ukr.net	xfloydya@gmail.com	CALL	sent	\N
2	2018-09-03 09:56:18.901222+00	2018-09-03 09:56:19.495559+00	Новая заявка на звонок!	<p>Nikolay: First Name<br />\r\n+380665005001: Phone Number<br />\r\nhttp://127.0.0.1:8535/: Sent From Link<br />\r\n3 сентября 2018 г. 9:56: Date</p>		floydya@ukr.net	xfloydya@gmail.com	CALL	sent	\N
3	2018-09-03 09:56:33.935782+00	2018-09-03 09:56:34.529426+00	Новая заявка на звонок!	<p>Nikolay: First Name<br />\r\n+380665005001: Phone Number<br />\r\nhttp://127.0.0.1:8535/: Sent From Link<br />\r\n3 сентября 2018 г. 9:56: Date</p>		floydya@ukr.net	xfloydya@gmail.com	CALL	sent	\N
4	2018-09-03 09:56:39.058356+00	2018-09-03 09:56:39.735596+00	Новая заявка на звонок!	<p>Nikolay: First Name<br />\r\n+380665005001: Phone Number<br />\r\nhttp://127.0.0.1:8535/: Sent From Link<br />\r\n3 сентября 2018 г. 9:56: Date</p>		floydya@ukr.net	xfloydya@gmail.com	CALL	sent	\N
5	2018-09-03 09:57:34.225348+00	2018-09-03 09:57:35.033897+00	Новая заявка на звонок!	<p>Nikolay: First Name<br />\r\n+380665005001: Phone Number<br />\r\nhttp://127.0.0.1:8535/: Sent From Link<br />\r\n3 сентября 2018 г. 9:57: Date</p>		floydya@ukr.net	xfloydya@gmail.com	CALL	sent	\N
6	2018-09-03 10:07:07.582476+00	2018-09-03 10:07:08.258156+00	Новая заявка на бронь!	<p>2: Tour Number<br />\r\n2018-09-02 — 2018-09-09: Tour Date<br />\r\nasdasdasd: Full Name<br />\r\nasjlkdalksjdlkajsd: Phone Number<br />\r\nasdjaksd@mail.ru: Адрес электронной почты<br />\r\njadlksjdklajsdkljasd: Message<br />\r\nhttp://127.0.0.1:8535/tour/2/: Sent From Link<br />\r\n3 сентября 2018 г. 10:07: Date</p>		floydya@ukr.net	xfloydya@gmail.com	RESERVATION	sent	\N
7	2018-09-03 11:29:48.094785+00	2018-09-03 11:29:48.754322+00	Новая заявка на звонок!	<p>Николай: First Name<br />\r\n066 0808 478: Phone Number<br />\r\nhttp://127.0.0.1:8535/resort/zaltsburg/: Sent From Link<br />\r\n3 сентября 2018 г. 11:29: Date</p>		floydya@ukr.net	xfloydya@gmail.com	CALL	sent	\N
8	2018-09-03 11:49:40.936274+00	2018-09-03 11:49:41.627532+00	Новая заявка на подбор!	<p>Австрия: Country<br />\r\n10 дней: Tour Duration<br />\r\n5: Number of persons<br />\r\nНиколай: First Name<br />\r\n+380505555500: Phone Number<br />\r\nasd@mail.ru: Адрес электронной почты<br />\r\nasdasdasdasdasd: Message<br />\r\nhttp://127.0.0.1:8535/tour/2/: Sent From Link<br />\r\n3 сентября 2018 г. 11:49: Date</p>		floydya@ukr.net	xfloydya@gmail.com	PICKING	sent	\N
9	2018-09-03 11:49:51.2305+00	2018-09-03 11:49:51.893622+00	Новая заявка на бронь!	<p>2: Tour Number<br />\r\n2018-09-02 — 2018-09-09: Tour Date<br />\r\nasdasdasd: Full Name<br />\r\nasjlkdalksjdlkajsd: Phone Number<br />\r\nasdjaksd@mail.ru: Адрес электронной почты<br />\r\nasdasdasdasd: Message<br />\r\nhttp://127.0.0.1:8535/tour/2/: Sent From Link<br />\r\n3 сентября 2018 г. 11:49: Date</p>		floydya@ukr.net	xfloydya@gmail.com	RESERVATION	sent	\N
10	2018-09-03 11:49:56.607583+00	2018-09-03 11:49:57.196101+00	Новая заявка на звонок!	<p>Николай: First Name<br />\r\n+380505555500: Phone Number<br />\r\nhttp://127.0.0.1:8535/tour/2/: Sent From Link<br />\r\n3 сентября 2018 г. 11:49: Date</p>		floydya@ukr.net	xfloydya@gmail.com	CALL	sent	\N
11	2018-09-03 11:50:17.83889+00	2018-09-03 11:50:18.438076+00	Новое сообщение администрации!	<p>Николай: First Name<br />\r\nasd@mail.ru: Адрес электронной почты<br />\r\nasdasdasdasd: Message<br />\r\nhttp://127.0.0.1:8535/pages/contact/: Sent From Link<br />\r\n3 сентября 2018 г. 11:50: Date</p>		floydya@ukr.net	xfloydya@gmail.com	REPORT	sent	\N
12	2018-09-03 11:50:40.578219+00	2018-09-03 11:50:41.157068+00	Новая заявка на получение сертификата!	<p>Николай: First Name<br />\r\n+380501234512: Phone Number<br />\r\nhttp://127.0.0.1:8535/pages/certificate/: Sent From Link<br />\r\n3 сентября 2018 г. 11:50: Date</p>		floydya@ukr.net	xfloydya@gmail.com	SERTIFICATE	sent	\N
\.


--
-- Data for Name: postie_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postie_log (id, created, modified, message, traceback, letter_id) FROM stdin;
\.


--
-- Data for Name: postie_template; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postie_template (id, name, event) FROM stdin;
1	CALL	CALL
2	REPORT	REPORT
3	RESERVATION	RESERVATION
4	PICKING	PICKING
5	SERTIFICATE	SERTIFICATE
\.


--
-- Data for Name: postie_template_translation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY postie_template_translation (id, language_code, subject, html, plain, master_id) FROM stdin;
1	ru	Новая заявка на звонок!	<p>{{ name }}: First Name<br />\r\n{{ phone }}: Phone Number<br />\r\n{{ from_link }}: Sent From Link<br />\r\n{{ datetime }}: Date</p>		1
2	ru	Новое сообщение администрации!	<p>{{ name }}: First Name<br />\r\n{{ email }}: Адрес электронной почты<br />\r\n{{ message }}: Message<br />\r\n{{ from_link }}: Sent From Link<br />\r\n{{ datetime }}: Date</p>		2
3	ru	Новая заявка на бронь!	<p>{{ tour }}: Tour Number<br />\r\n{{ tour_date }}: Tour Date<br />\r\n{{ fullname }}: Full Name<br />\r\n{{ phone }}: Phone Number<br />\r\n{{ email }}: Адрес электронной почты<br />\r\n{{ comment }}: Message<br />\r\n{{ from_link }}: Sent From Link<br />\r\n{{ datetime }}: Date</p>		3
4	ru	Новая заявка на подбор!	<p>{{ country }}: Country<br />\r\n{{ duration }}: Tour Duration<br />\r\n{{ number_of_persons }}: Number of persons<br />\r\n{{ name }}: First Name<br />\r\n{{ phone }}: Phone Number<br />\r\n{{ email }}: Адрес электронной почты<br />\r\n{{ comment }}: Message<br />\r\n{{ from_link }}: Sent From Link<br />\r\n{{ datetime }}: Date</p>		4
5	ru	Новая заявка на получение сертификата!	<p>{{ name }}: First Name<br />\r\n{{ phone }}: Phone Number<br />\r\n{{ from_link }}: Sent From Link<br />\r\n{{ datetime }}: Date</p>		5
\.


--
-- Data for Name: reports_call; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports_call (id, name, phone, status, from_link, datetime) FROM stdin;
1	Nikolay	+380665005001	f	http://127.0.0.1:8535/	2018-09-03 09:55:46.649747+00
2	Nikolay	+380665005001	f	http://127.0.0.1:8535/	2018-09-03 09:56:18.822995+00
3	Nikolay	+380665005001	f	http://127.0.0.1:8535/	2018-09-03 09:56:33.903001+00
4	Nikolay	+380665005001	f	http://127.0.0.1:8535/	2018-09-03 09:56:38.974207+00
5	Nikolay	+380665005001	f	http://127.0.0.1:8535/	2018-09-03 09:57:34.198069+00
6	Николай	066 0808 478	f	http://127.0.0.1:8535/resort/zaltsburg/	2018-09-03 11:29:48.065512+00
7	Николай	+380505555500	f	http://127.0.0.1:8535/tour/2/	2018-09-03 11:49:56.566328+00
\.


--
-- Data for Name: reports_pickingtour; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports_pickingtour (id, duration, number_of_persons, name, phone, email, comment, from_link, datetime, status, country_id) FROM stdin;
1	10 дней	5	Николай	+380505555500	asd@mail.ru	asdasdasdasdasd	http://127.0.0.1:8535/tour/2/	2018-09-03 11:49:40.809884+00	f	1
\.


--
-- Data for Name: reports_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports_report (id, name, email, message, from_link, status, datetime) FROM stdin;
1	Николай	asd@mail.ru	asdasdasdasd	http://127.0.0.1:8535/pages/contact/	f	2018-09-03 11:50:17.782099+00
\.


--
-- Data for Name: reports_reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports_reservation (id, full_name, phone, email, comment, from_link, datetime, status, tour_id, tour_date_id) FROM stdin;
1	asdasdasd	asjlkdalksjdlkajsd	asdjaksd@mail.ru	jadlksjdklajsdkljasd	http://127.0.0.1:8535/tour/2/	2018-09-03 10:07:07.531119+00	f	2	1
2	asdasdasd	asjlkdalksjdlkajsd	asdjaksd@mail.ru	asdasdasdasd	http://127.0.0.1:8535/tour/2/	2018-09-03 11:49:51.196388+00	f	2	1
\.


--
-- Data for Name: reports_sertificate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports_sertificate (id, name, phone, from_link, datetime, status) FROM stdin;
1	Николай	+380501234512	http://127.0.0.1:8535/pages/certificate/	2018-09-03 11:50:40.538405+00	f
\.


--
-- Data for Name: tours_tour; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tours_tour (id, sending_from, duration_days, duration_nights, stars, hotel_id, type_id) FROM stdin;
14	Киев	3	3	1	10	6
5	Киев	3	3	1	2	1
6	Киев	14	14	5	2	1
7	Киев	5	5	4	9	6
8	Харьков	14	14	5	3	7
9	Киев	6	6	2	3	4
10	Киев	14	14	5	7	5
11	Харьков	12	12	3	8	7
13	Киев	3	3	2	11	2
2	Киев	7	7	4	2	1
3	Киев	5	5	2	2	1
4	Киев	7	7	5	2	1
15	Киев	7	7	4	8	1
12	Киев	7	7	5	6	9
\.


--
-- Data for Name: tours_tourdatepair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tours_tourdatepair (id, start, "end", cost, tour_id, uah_cost) FROM stdin;
1	2018-09-02	2018-09-09	350	14	9932
2	2018-09-03	2018-09-10	425	14	12060
3	2018-09-04	2018-09-07	128	14	3632
4	2018-09-03	2018-09-17	256	14	7264
5	2018-09-03	2018-09-10	125	2	3547
8	2018-09-03	2018-09-10	512	5	14529
9	2018-09-03	2018-09-10	154	6	4370
10	2018-09-03	2018-09-10	567	7	16090
11	2018-09-03	2018-09-10	452	8	12826
12	2018-09-03	2018-09-10	764	9	21681
13	2018-09-03	2018-09-10	999	10	28349
14	2018-09-03	2018-09-10	111	11	3149
15	2018-09-03	2018-09-10	96	12	2724
16	2018-09-03	2018-09-10	242	13	6867
18	2018-09-01	2018-09-08	112	2	3178
19	2018-09-03	2018-09-09	28	2	794
17	2018-09-03	2018-09-08	115	15	3263
6	2018-09-01	2018-09-10	256	3	7264
7	2018-09-01	2018-09-10	219	4	6214
20	2018-09-04	2018-09-09	116	15	3291
21	2018-09-01	2018-09-08	1	12	28
\.


--
-- Data for Name: tours_tourexcludes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tours_tourexcludes (id, name, description, tour_id) FROM stdin;
1	Трансфер	<p>- Экскурсии в Шарм Ель Шейхе</p>\r\n\r\n<p>- Экскурсии в Табе</p>\r\n\r\n<p>- Экскурсии в Дахабе</p>\r\n\r\n<p>- Экскурсии в Нувейбе</p>	15
2	Экскурсии		15
\.


--
-- Data for Name: tours_tourincludes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tours_tourincludes (id, name, description, tour_id) FROM stdin;
1	Перелет	<p>- Экскурсии в Шарм Ель Шейхе</p>\r\n\r\n<p>- Экскурсии в Табе</p>\r\n\r\n<p>- Экскурсии в Дахабе</p>\r\n\r\n<p>- Экскурсии в Нувейбе</p>	15
2	Страховка		15
3	Питание	<p>- фывйцуйвфывйцу</p>\r\n\r\n<p>- фывфывйцуйцуйцу</p>\r\n\r\n<p>- ячсячсячсячс</p>\r\n\r\n<p>- фывфывфывфыв</p>	15
\.


--
-- Data for Name: tours_tourtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tours_tourtype (id, slug, name, preview_image) FROM stdin;
1	vip-tur	Вип тур	images/vip.png
2	avia-tur	Авиа тур	images/avia.png
3	shopping-tur	Шоппинг тур	images/shop.png
4	avtobusnyi-tur	Автобусный тур	images/bus.png
5	svadebnyi-tur	Свадебный тур	images/will.png
6	detskii-otdykh	Детский отдых	images/child.png
7	gornolyzhnyi-kurort	Горнолыжный курорт	images/cont2_ZJSaYCw.png
8	pliazhnyi-otdykh	Пляжный отдых	images/rest.png
9	ekzotika	Экзотика	images/exsotic.png
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 140, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Name: blog_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_article_id_seq', 28, true);


--
-- Name: blog_heading_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_heading_id_seq', 6, true);


--
-- Name: core_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_comment_id_seq', 4, true);


--
-- Name: core_emaildispatch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_emaildispatch_id_seq', 1, true);


--
-- Name: core_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_image_id_seq', 98, true);


--
-- Name: core_indexsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_indexsettings_id_seq', 1, false);


--
-- Name: core_indexsettings_phone_numbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_indexsettings_phone_numbers_id_seq', 6, true);


--
-- Name: core_phonenumbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_phonenumbers_id_seq', 3, true);


--
-- Name: core_sertificatesettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_sertificatesettings_id_seq', 1, false);


--
-- Name: des_dynamicemailconfiguration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('des_dynamicemailconfiguration_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 167, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 36, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 41, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: locations_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('locations_country_id_seq', 3, true);


--
-- Name: locations_hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('locations_hotel_id_seq', 11, true);


--
-- Name: locations_hoteltype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('locations_hoteltype_id_seq', 5, true);


--
-- Name: locations_resort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('locations_resort_id_seq', 9, true);


--
-- Name: postie_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('postie_attachment_id_seq', 1, false);


--
-- Name: postie_letter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('postie_letter_id_seq', 12, true);


--
-- Name: postie_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('postie_log_id_seq', 1, false);


--
-- Name: postie_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('postie_template_id_seq', 5, true);


--
-- Name: postie_template_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('postie_template_translation_id_seq', 5, true);


--
-- Name: reports_call_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_call_id_seq', 7, true);


--
-- Name: reports_pickingtour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_pickingtour_id_seq', 1, true);


--
-- Name: reports_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_report_id_seq', 1, true);


--
-- Name: reports_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_reservation_id_seq', 2, true);


--
-- Name: reports_sertificate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_sertificate_id_seq', 1, true);


--
-- Name: tours_tour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tours_tour_id_seq', 15, true);


--
-- Name: tours_tourdatepair_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tours_tourdatepair_id_seq', 21, true);


--
-- Name: tours_tourexcludes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tours_tourexcludes_id_seq', 2, true);


--
-- Name: tours_tourincludes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tours_tourincludes_id_seq', 3, true);


--
-- Name: tours_tourtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tours_tourtype_id_seq', 9, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_article blog_article_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_article
    ADD CONSTRAINT blog_article_pkey PRIMARY KEY (id);


--
-- Name: blog_heading blog_heading_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_heading
    ADD CONSTRAINT blog_heading_pkey PRIMARY KEY (id);


--
-- Name: core_comment core_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_comment
    ADD CONSTRAINT core_comment_pkey PRIMARY KEY (id);


--
-- Name: core_emaildispatch core_emaildispatch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_emaildispatch
    ADD CONSTRAINT core_emaildispatch_pkey PRIMARY KEY (id);


--
-- Name: core_image core_image_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_image
    ADD CONSTRAINT core_image_pkey PRIMARY KEY (id);


--
-- Name: core_indexsettings_phone_numbers core_indexsettings_phone_indexsettings_id_phonenu_fb8ac5dc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_indexsettings_phone_numbers
    ADD CONSTRAINT core_indexsettings_phone_indexsettings_id_phonenu_fb8ac5dc_uniq UNIQUE (indexsettings_id, phonenumbers_id);


--
-- Name: core_indexsettings_phone_numbers core_indexsettings_phone_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_indexsettings_phone_numbers
    ADD CONSTRAINT core_indexsettings_phone_numbers_pkey PRIMARY KEY (id);


--
-- Name: core_indexsettings core_indexsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_indexsettings
    ADD CONSTRAINT core_indexsettings_pkey PRIMARY KEY (id);


--
-- Name: core_phonenumbers core_phonenumbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_phonenumbers
    ADD CONSTRAINT core_phonenumbers_pkey PRIMARY KEY (id);


--
-- Name: core_sertificatesettings core_sertificatesettings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_sertificatesettings
    ADD CONSTRAINT core_sertificatesettings_pkey PRIMARY KEY (id);


--
-- Name: des_dynamicemailconfiguration des_dynamicemailconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY des_dynamicemailconfiguration
    ADD CONSTRAINT des_dynamicemailconfiguration_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: locations_country locations_country_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_country
    ADD CONSTRAINT locations_country_name_key UNIQUE (name);


--
-- Name: locations_country locations_country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_country
    ADD CONSTRAINT locations_country_pkey PRIMARY KEY (id);


--
-- Name: locations_hotel locations_hotel_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_hotel
    ADD CONSTRAINT locations_hotel_name_key UNIQUE (name);


--
-- Name: locations_hotel locations_hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_hotel
    ADD CONSTRAINT locations_hotel_pkey PRIMARY KEY (id);


--
-- Name: locations_hoteltype locations_hoteltype_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_hoteltype
    ADD CONSTRAINT locations_hoteltype_name_key UNIQUE (name);


--
-- Name: locations_hoteltype locations_hoteltype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_hoteltype
    ADD CONSTRAINT locations_hoteltype_pkey PRIMARY KEY (id);


--
-- Name: locations_resort locations_resort_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_resort
    ADD CONSTRAINT locations_resort_name_key UNIQUE (name);


--
-- Name: locations_resort locations_resort_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_resort
    ADD CONSTRAINT locations_resort_pkey PRIMARY KEY (id);


--
-- Name: postie_attachment postie_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_attachment
    ADD CONSTRAINT postie_attachment_pkey PRIMARY KEY (id);


--
-- Name: postie_letter postie_letter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_letter
    ADD CONSTRAINT postie_letter_pkey PRIMARY KEY (id);


--
-- Name: postie_log postie_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_log
    ADD CONSTRAINT postie_log_pkey PRIMARY KEY (id);


--
-- Name: postie_template postie_template_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_template
    ADD CONSTRAINT postie_template_pkey PRIMARY KEY (id);


--
-- Name: postie_template_translation postie_template_translat_language_code_master_id_92419003_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_template_translation
    ADD CONSTRAINT postie_template_translat_language_code_master_id_92419003_uniq UNIQUE (language_code, master_id);


--
-- Name: postie_template_translation postie_template_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_template_translation
    ADD CONSTRAINT postie_template_translation_pkey PRIMARY KEY (id);


--
-- Name: reports_call reports_call_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_call
    ADD CONSTRAINT reports_call_pkey PRIMARY KEY (id);


--
-- Name: reports_pickingtour reports_pickingtour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_pickingtour
    ADD CONSTRAINT reports_pickingtour_pkey PRIMARY KEY (id);


--
-- Name: reports_report reports_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_report
    ADD CONSTRAINT reports_report_pkey PRIMARY KEY (id);


--
-- Name: reports_reservation reports_reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_reservation
    ADD CONSTRAINT reports_reservation_pkey PRIMARY KEY (id);


--
-- Name: reports_sertificate reports_sertificate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_sertificate
    ADD CONSTRAINT reports_sertificate_pkey PRIMARY KEY (id);


--
-- Name: tours_tour tours_tour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour
    ADD CONSTRAINT tours_tour_pkey PRIMARY KEY (id);


--
-- Name: tours_tourdatepair tours_tourdatepair_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourdatepair
    ADD CONSTRAINT tours_tourdatepair_pkey PRIMARY KEY (id);


--
-- Name: tours_tourexcludes tours_tourexcludes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourexcludes
    ADD CONSTRAINT tours_tourexcludes_pkey PRIMARY KEY (id);


--
-- Name: tours_tourincludes tours_tourincludes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourincludes
    ADD CONSTRAINT tours_tourincludes_pkey PRIMARY KEY (id);


--
-- Name: tours_tourtype tours_tourtype_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourtype
    ADD CONSTRAINT tours_tourtype_name_key UNIQUE (name);


--
-- Name: tours_tourtype tours_tourtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourtype
    ADD CONSTRAINT tours_tourtype_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_article_heading_id_2541a93b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_article_heading_id_2541a93b ON blog_article USING btree (heading_id);


--
-- Name: blog_article_slug_c3fca16d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_article_slug_c3fca16d ON blog_article USING btree (slug);


--
-- Name: blog_article_slug_c3fca16d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_article_slug_c3fca16d_like ON blog_article USING btree (slug varchar_pattern_ops);


--
-- Name: blog_heading_slug_4f43f974; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_heading_slug_4f43f974 ON blog_heading USING btree (slug);


--
-- Name: blog_heading_slug_4f43f974_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX blog_heading_slug_4f43f974_like ON blog_heading USING btree (slug varchar_pattern_ops);


--
-- Name: core_comment_hotel_id_c6095d91; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_comment_hotel_id_c6095d91 ON core_comment USING btree (hotel_id);


--
-- Name: core_image_content_type_id_14df077f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_image_content_type_id_14df077f ON core_image USING btree (content_type_id);


--
-- Name: core_indexsettings_phone_numbers_indexsettings_id_34543d77; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_indexsettings_phone_numbers_indexsettings_id_34543d77 ON core_indexsettings_phone_numbers USING btree (indexsettings_id);


--
-- Name: core_indexsettings_phone_numbers_phonenumbers_id_704ae485; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX core_indexsettings_phone_numbers_phonenumbers_id_704ae485 ON core_indexsettings_phone_numbers USING btree (phonenumbers_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: locations_country_name_822b110c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_country_name_822b110c_like ON locations_country USING btree (name varchar_pattern_ops);


--
-- Name: locations_country_slug_bafce7fc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_country_slug_bafce7fc ON locations_country USING btree (slug);


--
-- Name: locations_country_slug_bafce7fc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_country_slug_bafce7fc_like ON locations_country USING btree (slug varchar_pattern_ops);


--
-- Name: locations_hotel_name_46753774_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_hotel_name_46753774_like ON locations_hotel USING btree (name varchar_pattern_ops);


--
-- Name: locations_hotel_resort_id_012a4d28; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_hotel_resort_id_012a4d28 ON locations_hotel USING btree (resort_id);


--
-- Name: locations_hotel_slug_5ea34486; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_hotel_slug_5ea34486 ON locations_hotel USING btree (slug);


--
-- Name: locations_hotel_slug_5ea34486_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_hotel_slug_5ea34486_like ON locations_hotel USING btree (slug varchar_pattern_ops);


--
-- Name: locations_hotel_type_id_6160074c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_hotel_type_id_6160074c ON locations_hotel USING btree (type_id);


--
-- Name: locations_hoteltype_name_9911496a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_hoteltype_name_9911496a_like ON locations_hoteltype USING btree (name varchar_pattern_ops);


--
-- Name: locations_hoteltype_slug_4afde465; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_hoteltype_slug_4afde465 ON locations_hoteltype USING btree (slug);


--
-- Name: locations_hoteltype_slug_4afde465_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_hoteltype_slug_4afde465_like ON locations_hoteltype USING btree (slug varchar_pattern_ops);


--
-- Name: locations_resort_country_id_4657b318; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_resort_country_id_4657b318 ON locations_resort USING btree (country_id);


--
-- Name: locations_resort_name_209ed69b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_resort_name_209ed69b_like ON locations_resort USING btree (name varchar_pattern_ops);


--
-- Name: locations_resort_slug_c29d9274; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_resort_slug_c29d9274 ON locations_resort USING btree (slug);


--
-- Name: locations_resort_slug_c29d9274_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX locations_resort_slug_c29d9274_like ON locations_resort USING btree (slug varchar_pattern_ops);


--
-- Name: postie_attachment_letter_id_8852e004; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX postie_attachment_letter_id_8852e004 ON postie_attachment USING btree (letter_id);


--
-- Name: postie_log_letter_id_a2d610d5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX postie_log_letter_id_a2d610d5 ON postie_log USING btree (letter_id);


--
-- Name: postie_template_translation_language_code_6d45f8be; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX postie_template_translation_language_code_6d45f8be ON postie_template_translation USING btree (language_code);


--
-- Name: postie_template_translation_language_code_6d45f8be_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX postie_template_translation_language_code_6d45f8be_like ON postie_template_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: postie_template_translation_master_id_6227bd66; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX postie_template_translation_master_id_6227bd66 ON postie_template_translation USING btree (master_id);


--
-- Name: reports_pickingtour_country_id_90402b58; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reports_pickingtour_country_id_90402b58 ON reports_pickingtour USING btree (country_id);


--
-- Name: reports_reservation_tour_date_id_ad173717; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reports_reservation_tour_date_id_ad173717 ON reports_reservation USING btree (tour_date_id);


--
-- Name: reports_reservation_tour_id_bc8ee56c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reports_reservation_tour_id_bc8ee56c ON reports_reservation USING btree (tour_id);


--
-- Name: tours_tour_hotel_id_30d10642; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tour_hotel_id_30d10642 ON tours_tour USING btree (hotel_id);


--
-- Name: tours_tour_type_id_70bfc62d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tour_type_id_70bfc62d ON tours_tour USING btree (type_id);


--
-- Name: tours_tourdatepair_tour_id_887da014; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tourdatepair_tour_id_887da014 ON tours_tourdatepair USING btree (tour_id);


--
-- Name: tours_tourexcludes_tour_id_4602b14c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tourexcludes_tour_id_4602b14c ON tours_tourexcludes USING btree (tour_id);


--
-- Name: tours_tourincludes_tour_id_d4cad367; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tourincludes_tour_id_d4cad367 ON tours_tourincludes USING btree (tour_id);


--
-- Name: tours_tourtype_name_37801832_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tourtype_name_37801832_like ON tours_tourtype USING btree (name varchar_pattern_ops);


--
-- Name: tours_tourtype_slug_4c2e0b88; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tourtype_slug_4c2e0b88 ON tours_tourtype USING btree (slug);


--
-- Name: tours_tourtype_slug_4c2e0b88_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tourtype_slug_4c2e0b88_like ON tours_tourtype USING btree (slug varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_article blog_article_heading_id_2541a93b_fk_blog_heading_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_article
    ADD CONSTRAINT blog_article_heading_id_2541a93b_fk_blog_heading_id FOREIGN KEY (heading_id) REFERENCES blog_heading(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_comment core_comment_hotel_id_c6095d91_fk_locations_hotel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_comment
    ADD CONSTRAINT core_comment_hotel_id_c6095d91_fk_locations_hotel_id FOREIGN KEY (hotel_id) REFERENCES locations_hotel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_image core_image_content_type_id_14df077f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_image
    ADD CONSTRAINT core_image_content_type_id_14df077f_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_indexsettings_phone_numbers core_indexsettings_p_indexsettings_id_34543d77_fk_core_inde; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_indexsettings_phone_numbers
    ADD CONSTRAINT core_indexsettings_p_indexsettings_id_34543d77_fk_core_inde FOREIGN KEY (indexsettings_id) REFERENCES core_indexsettings(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_indexsettings_phone_numbers core_indexsettings_p_phonenumbers_id_704ae485_fk_core_phon; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY core_indexsettings_phone_numbers
    ADD CONSTRAINT core_indexsettings_p_phonenumbers_id_704ae485_fk_core_phon FOREIGN KEY (phonenumbers_id) REFERENCES core_phonenumbers(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: locations_hotel locations_hotel_resort_id_012a4d28_fk_locations_resort_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_hotel
    ADD CONSTRAINT locations_hotel_resort_id_012a4d28_fk_locations_resort_id FOREIGN KEY (resort_id) REFERENCES locations_resort(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: locations_hotel locations_hotel_type_id_6160074c_fk_locations_hoteltype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_hotel
    ADD CONSTRAINT locations_hotel_type_id_6160074c_fk_locations_hoteltype_id FOREIGN KEY (type_id) REFERENCES locations_hoteltype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: locations_resort locations_resort_country_id_4657b318_fk_locations_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY locations_resort
    ADD CONSTRAINT locations_resort_country_id_4657b318_fk_locations_country_id FOREIGN KEY (country_id) REFERENCES locations_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: postie_attachment postie_attachment_letter_id_8852e004_fk_postie_letter_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_attachment
    ADD CONSTRAINT postie_attachment_letter_id_8852e004_fk_postie_letter_id FOREIGN KEY (letter_id) REFERENCES postie_letter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: postie_log postie_log_letter_id_a2d610d5_fk_postie_letter_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_log
    ADD CONSTRAINT postie_log_letter_id_a2d610d5_fk_postie_letter_id FOREIGN KEY (letter_id) REFERENCES postie_letter(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: postie_template_translation postie_template_tran_master_id_6227bd66_fk_postie_te; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postie_template_translation
    ADD CONSTRAINT postie_template_tran_master_id_6227bd66_fk_postie_te FOREIGN KEY (master_id) REFERENCES postie_template(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_pickingtour reports_pickingtour_country_id_90402b58_fk_locations_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_pickingtour
    ADD CONSTRAINT reports_pickingtour_country_id_90402b58_fk_locations_country_id FOREIGN KEY (country_id) REFERENCES locations_country(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_reservation reports_reservation_tour_date_id_ad173717_fk_tours_tou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_reservation
    ADD CONSTRAINT reports_reservation_tour_date_id_ad173717_fk_tours_tou FOREIGN KEY (tour_date_id) REFERENCES tours_tourdatepair(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_reservation reports_reservation_tour_id_bc8ee56c_fk_tours_tour_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reports_reservation
    ADD CONSTRAINT reports_reservation_tour_id_bc8ee56c_fk_tours_tour_id FOREIGN KEY (tour_id) REFERENCES tours_tour(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tours_tour tours_tour_hotel_id_30d10642_fk_locations_hotel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour
    ADD CONSTRAINT tours_tour_hotel_id_30d10642_fk_locations_hotel_id FOREIGN KEY (hotel_id) REFERENCES locations_hotel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tours_tour tours_tour_type_id_70bfc62d_fk_tours_tourtype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour
    ADD CONSTRAINT tours_tour_type_id_70bfc62d_fk_tours_tourtype_id FOREIGN KEY (type_id) REFERENCES tours_tourtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tours_tourdatepair tours_tourdatepair_tour_id_887da014_fk_tours_tour_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourdatepair
    ADD CONSTRAINT tours_tourdatepair_tour_id_887da014_fk_tours_tour_id FOREIGN KEY (tour_id) REFERENCES tours_tour(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tours_tourexcludes tours_tourexcludes_tour_id_4602b14c_fk_tours_tour_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourexcludes
    ADD CONSTRAINT tours_tourexcludes_tour_id_4602b14c_fk_tours_tour_id FOREIGN KEY (tour_id) REFERENCES tours_tour(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tours_tourincludes tours_tourincludes_tour_id_d4cad367_fk_tours_tour_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourincludes
    ADD CONSTRAINT tours_tourincludes_tour_id_d4cad367_fk_tours_tour_id FOREIGN KEY (tour_id) REFERENCES tours_tour(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

