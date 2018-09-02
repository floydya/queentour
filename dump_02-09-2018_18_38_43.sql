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
    customs text NOT NULL
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
    country_id integer NOT NULL
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
    cost integer NOT NULL,
    stars smallint NOT NULL,
    hotel_id integer NOT NULL,
    type_id integer NOT NULL,
    CONSTRAINT tours_tour_cost_check CHECK ((cost >= 0)),
    CONSTRAINT tours_tour_duration_days_check CHECK ((duration_days >= 0)),
    CONSTRAINT tours_tour_duration_nights_check CHECK ((duration_nights >= 0)),
    CONSTRAINT tours_tour_stars_check CHECK ((stars >= 0))
);


ALTER TABLE tours_tour OWNER TO postgres;

--
-- Name: tours_tour_dates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tours_tour_dates (
    id integer NOT NULL,
    tour_id integer NOT NULL,
    tourdatepair_id integer NOT NULL
);


ALTER TABLE tours_tour_dates OWNER TO postgres;

--
-- Name: tours_tour_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tours_tour_dates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tours_tour_dates_id_seq OWNER TO postgres;

--
-- Name: tours_tour_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tours_tour_dates_id_seq OWNED BY tours_tour_dates.id;


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
-- Name: tours_tour_xcludes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tours_tour_xcludes (
    id integer NOT NULL,
    tour_id integer NOT NULL,
    tourxcludes_id integer NOT NULL
);


ALTER TABLE tours_tour_xcludes OWNER TO postgres;

--
-- Name: tours_tour_xcludes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tours_tour_xcludes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tours_tour_xcludes_id_seq OWNER TO postgres;

--
-- Name: tours_tour_xcludes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tours_tour_xcludes_id_seq OWNED BY tours_tour_xcludes.id;


--
-- Name: tours_tourdatepair; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tours_tourdatepair (
    id integer NOT NULL,
    start date NOT NULL,
    "end" date NOT NULL
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
-- Name: tours_tourtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tours_tourtype (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(50) NOT NULL
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
-- Name: tours_tourxcludes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tours_tourxcludes (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    type boolean NOT NULL
);


ALTER TABLE tours_tourxcludes OWNER TO postgres;

--
-- Name: tours_tourxcludes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tours_tourxcludes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tours_tourxcludes_id_seq OWNER TO postgres;

--
-- Name: tours_tourxcludes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tours_tourxcludes_id_seq OWNED BY tours_tourxcludes.id;


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
-- Name: tours_tour_dates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour_dates ALTER COLUMN id SET DEFAULT nextval('tours_tour_dates_id_seq'::regclass);


--
-- Name: tours_tour_xcludes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour_xcludes ALTER COLUMN id SET DEFAULT nextval('tours_tour_xcludes_id_seq'::regclass);


--
-- Name: tours_tourdatepair id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourdatepair ALTER COLUMN id SET DEFAULT nextval('tours_tourdatepair_id_seq'::regclass);


--
-- Name: tours_tourtype id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourtype ALTER COLUMN id SET DEFAULT nextval('tours_tourtype_id_seq'::regclass);


--
-- Name: tours_tourxcludes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourxcludes ALTER COLUMN id SET DEFAULT nextval('tours_tourxcludes_id_seq'::regclass);


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
77	Can add Country	21	add_country
78	Can change Country	21	change_country
79	Can delete Country	21	delete_country
80	Can view Country	21	view_country
81	Can add Hotel	22	add_hotel
82	Can change Hotel	22	change_hotel
83	Can delete Hotel	22	delete_hotel
84	Can view Hotel	22	view_hotel
85	Can add Hotel Type	23	add_hoteltype
86	Can change Hotel Type	23	change_hoteltype
87	Can delete Hotel Type	23	delete_hoteltype
88	Can view Hotel Type	23	view_hoteltype
89	Can add Resort	24	add_resort
90	Can change Resort	24	change_resort
91	Can delete Resort	24	delete_resort
92	Can view Resort	24	view_resort
93	Can add Tour	25	add_tour
94	Can change Tour	25	change_tour
95	Can delete Tour	25	delete_tour
96	Can view Tour	25	view_tour
97	Can add Tour Datepair	26	add_tourdatepair
98	Can change Tour Datepair	26	change_tourdatepair
99	Can delete Tour Datepair	26	delete_tourdatepair
100	Can view Tour Datepair	26	view_tourdatepair
101	Can add Tour Type	27	add_tourtype
102	Can change Tour Type	27	change_tourtype
103	Can delete Tour Type	27	delete_tourtype
104	Can view Tour Type	27	view_tourtype
105	Can add Tour Xclude	28	add_tourxcludes
106	Can change Tour Xclude	28	change_tourxcludes
107	Can delete Tour Xclude	28	delete_tourxcludes
108	Can view Tour Xclude	28	view_tourxcludes
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
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$HJiv8YQyN3HG$3n17xM7pI7zORdDyGFVap/+zHqXdQB7IYK2T57V/yMI=	2018-09-02 07:29:54.11723+00	t	admin			xfloydya@gmail.com	t	t	2018-09-02 07:16:25.221986+00
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
1	lorem-ipsum-dolor-sit	Lorem ipsum dolor sit	2018-09-02 10:42:11.034974+00	<div>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum fringilla feugiat. Quisque tellus elit, dapibus at tellus sit amet, maximus hendrerit elit. Aenean eros tortor, pellentesque eu tortor at, scelerisque tempor dolor. Integer eu est facilisis, dapibus augue id, maximus urna. Maecenas sit amet pharetra ante, et interdum odio. Vestibulum rhoncus ornare leo, eget laoreet justo eleifend convallis. Vestibulum finibus, mauris non tempus consequat, mi mauris vehicula magna, nec iaculis felis magna eu massa. Duis aliquam erat elit, eget suscipit turpis dapibus sit amet. Maecenas vitae sagittis metus.</p>\r\n\r\n<p>Quisque lacus enim, mollis in volutpat vel, viverra quis sapien. Ut blandit, enim nec tincidunt ullamcorper, velit nunc malesuada mi, vel viverra velit sem non metus. Donec tempus lacus non ante aliquam, consectetur volutpat sem fringilla. Sed sagittis mi mauris, sit amet accumsan mi sollicitudin placerat. Ut posuere urna eu lorem suscipit pretium. Praesent fermentum eget augue at malesuada. Donec sed risus sed felis ullamcorper vestibulum. Vivamus in molestie arcu. Nunc pulvinar faucibus nibh, vel tincidunt sapien scelerisque quis. Pellentesque felis tortor, malesuada et libero nec, consectetur vehicula mi. Morbi neque velit, fringilla vitae turpis id, rhoncus consequat quam. Aliquam maximus justo ac ligula varius, ac dignissim massa placerat. Nulla rhoncus, ante ut tincidunt dictum, odio lectus gravida sem, vel finibus purus felis dignissim est.</p>\r\n\r\n<p>Cras dictum metus orci, et ullamcorper tellus sollicitudin tincidunt. Sed tempor sapien tortor, in dapibus nisi congue nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris cursus ex eu hendrerit luctus. Sed tempor nunc consectetur felis aliquam vestibulum. Vestibulum in dolor porta, sollicitudin risus ut, fringilla turpis. Nunc tincidunt lectus vel nulla mattis gravida. Aliquam tempor lacus eu massa dignissim finibus.</p>\r\n\r\n<p>Maecenas pretium turpis nec felis rhoncus accumsan. Vivamus dictum vestibulum ornare. Nam aliquet ut risus a gravida. Etiam gravida porta lorem et elementum. Nam molestie aliquam tempus. In vel neque ex. Nam tincidunt sollicitudin purus, sed consectetur elit sollicitudin ac. Integer lacinia semper est vel condimentum. Donec placerat rutrum eleifend.</p>\r\n\r\n<p>Aliquam efficitur, felis ut blandit facilisis, nibh dui dictum massa, et viverra nisl magna in eros. In hac habitasse platea dictumst. Donec tempus consequat ligula eget accumsan. Curabitur ullamcorper magna velit, non rhoncus purus hendrerit eget. Ut congue bibendum porta. Sed viverra pharetra purus, vitae accumsan mi mattis feugiat. Pellentesque luctus imperdiet lacus, quis aliquam mauris pretium a. Aenean ut risus tincidunt risus tincidunt maximus. Suspendisse sodales ipsum ut lorem dapibus porttitor. Nulla facilisi. In aliquet nunc nunc, at cursus nulla mattis non. Quisque at molestie est. Etiam eu nunc dignissim nibh luctus tempor.</p>\r\n</div>	1	4	3
2	second-article	Second article	2018-09-02 10:42:55.123569+00	<div>\r\n<p>Nam molestie justo purus, ut feugiat sapien posuere et. Ut sodales volutpat ipsum, sed molestie velit tristique sed. In et blandit odio. Maecenas in magna molestie, congue turpis id, tincidunt neque. Phasellus sit amet dictum dui, non condimentum orci. Donec turpis arcu, vestibulum sed nisl ac, vehicula blandit arcu. Donec accumsan erat eget ipsum semper, vel aliquam enim pretium.</p>\r\n\r\n<p>Suspendisse eleifend ligula nisi, ac vehicula orci tempor quis. Fusce nibh massa, molestie non pretium quis, faucibus sit amet ex. Proin at erat lectus. Sed malesuada iaculis orci in sollicitudin. Duis a pharetra leo, a ornare eros. Praesent porta nisl eu ornare feugiat. Ut maximus purus eu velit sollicitudin, cursus varius ante pretium. Cras at purus non libero porta vestibulum. Donec commodo, erat ut pretium gravida, enim nunc dignissim felis, sit amet congue nisi risus id augue. Pellentesque ullamcorper est id finibus aliquam.</p>\r\n\r\n<p>Ut ut dolor non justo gravida ullamcorper. Fusce efficitur arcu at leo hendrerit, sit amet iaculis tortor luctus. Donec a pulvinar mi, ut tempor arcu. Sed volutpat, est a maximus fermentum, ante nibh consectetur lectus, pellentesque eleifend tortor justo non lectus. Donec vitae nisl orci. Maecenas ultricies nisi quis mauris consectetur, in laoreet elit laoreet. Nulla at convallis metus, consequat auctor ligula. Aliquam vitae nunc at mi condimentum egestas.</p>\r\n\r\n<p>Mauris varius dui et ligula vulputate facilisis. Ut tellus lorem, dapibus eu tempor ac, condimentum quis turpis. Aliquam malesuada varius leo nec sodales. Aenean egestas lacus sed arcu elementum, in pellentesque sapien faucibus. Phasellus iaculis sapien vitae neque feugiat convallis. Maecenas placerat nulla non eros aliquam egestas. Suspendisse potenti. Mauris auctor fringilla nulla, at consectetur augue venenatis nec. Vivamus hendrerit ac lacus eu ullamcorper. Morbi ante ipsum, auctor eget tempus eget, venenatis eu justo. Maecenas sagittis, eros sit amet tincidunt viverra, odio erat faucibus mi, sed mattis purus libero id risus. Sed et commodo nunc, ac elementum dui. In tempor euismod neque vitae sollicitudin. Ut sit amet tellus tincidunt, condimentum dolor ac, bibendum tortor.</p>\r\n\r\n<p>Nam ornare erat risus, nec convallis felis facilisis sit amet. Donec elit lorem, scelerisque nec nunc sit amet, dignissim convallis turpis. Sed lectus erat, tempus sed est at, pulvinar venenatis sapien. Morbi dapibus aliquet placerat. Cras sit amet molestie dui. Phasellus viverra, elit eu fermentum efficitur, nibh lacus bibendum metus, non lacinia risus ex in erat. Vivamus sit amet interdum erat, id ullamcorper arcu. Maecenas eu urna nec urna condimentum placerat a nec elit. Donec mattis neque aliquet risus placerat, nec feugiat felis bibendum. Sed pretium pharetra ligula quis pellentesque. Donec consequat condimentum sem sed ornare. In hac habitasse platea dictumst. Nulla bibendum tincidunt urna eget tincidunt. Mauris quis commodo velit. Vivamus tristique dapibus cursus.</p>\r\n\r\n<p>Praesent ultrices, nulla non tempus ullamcorper, augue nisi finibus urna, non tempus risus ligula non nisi. Nulla ut odio lorem. Maecenas ultrices sem non pretium pellentesque. Curabitur porttitor mattis dolor id mattis. Aliquam aliquam commodo nisl ac vestibulum. Phasellus at feugiat ex. Nulla vel lorem convallis, pretium mauris in, fringilla tellus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur commodo vestibulum aliquet. Nullam fermentum eros ut cursus porttitor.</p>\r\n\r\n<p>Morbi consequat vehicula massa accumsan pulvinar. Pellentesque at ante volutpat, tincidunt dui quis, auctor orci. Aenean lectus tortor, imperdiet nec ex in, tempor imperdiet dolor. In ex odio, feugiat eget sollicitudin ac, dignissim a ipsum. Nam lacinia, lectus ac eleifend ultrices, mauris metus faucibus nibh, sit amet dignissim nisi massa nec leo. Proin quis mi ut lectus pellentesque eleifend. Pellentesque egestas augue ut lorem lobortis hendrerit. Vivamus eros libero, varius at risus et, sodales luctus risus. Proin mattis mollis dignissim.</p>\r\n\r\n<p>Nam massa lorem, faucibus eu tortor eu, convallis fringilla tellus. Praesent fermentum et urna sit amet mollis. Maecenas feugiat bibendum massa id dictum. Etiam ut nisi velit. Ut placerat aliquam tortor, a vestibulum nisi pharetra ac. Pellentesque nec tortor id sem viverra finibus. Etiam sed mollis ante. Nulla ipsum magna, auctor non porta ut, aliquam eget ipsum. Aliquam mi lacus, semper quis cursus nec, facilisis id purus. In eu justo id mi interdum interdum vitae et neque. Pellentesque id enim vestibulum, pellentesque dolor eget, suscipit justo. Nam condimentum cursus nunc ac consequat. Quisque placerat lacinia dolor, sed malesuada neque.</p>\r\n\r\n<p>Vivamus in sodales libero, a consectetur lacus. Nam vel posuere mi. Donec et libero rhoncus, lacinia velit ac, dapibus ante. In sed fringilla libero. Maecenas lacinia et sapien id tempus. Sed blandit lacinia varius. Curabitur pharetra fermentum enim, condimentum interdum odio tempus non. Sed quis dui mattis, ultrices orci sed, finibus nulla. Curabitur sem ante, imperdiet porttitor augue molestie, eleifend placerat est. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Morbi eu ipsum et turpis rutrum facilisis sed ac nunc. Proin vehicula eleifend magna nec laoreet. Morbi eu mauris justo. Nulla imperdiet ex a nibh auctor, nec tempus nunc dapibus. Maecenas convallis fringilla justo, sit amet malesuada quam ultrices eget.</p>\r\n\r\n<p>Fusce eu augue sit amet tellus vulputate bibendum. Suspendisse feugiat molestie augue, eget euismod odio molestie in. Donec vel ante imperdiet, hendrerit risus eu, condimentum urna. Curabitur suscipit aliquet velit quis cursus. Nunc arcu magna, hendrerit sit amet malesuada a, molestie ac neque. In hac habitasse platea dictumst. Nam interdum nulla eget libero iaculis, in scelerisque enim euismod. Mauris neque diam, varius nec lacus vitae, blandit sodales diam. Curabitur volutpat erat non magna bibendum accumsan. Aenean eget pellentesque nulla. Praesent eu tincidunt eros. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Quisque ac congue mi. Curabitur tempus, enim at vestibulum venenatis, dolor odio venenatis lacus, eget pharetra enim risus vitae eros.</p>\r\n</div>	0	5	5
3	third-article	Third article	2018-09-02 10:43:25.902406+00	<div>\r\n<p>Aenean vitae dui in felis pharetra varius. Proin ut tristique sapien, lacinia porta nibh. Nulla ut lectus ac quam tincidunt pharetra at sit amet felis. Nullam leo augue, aliquam ut lobortis id, sollicitudin eget ligula. Nam id tempor justo. Maecenas eget rutrum tellus. Quisque egestas est erat, et rhoncus risus malesuada malesuada. Cras elementum eros sit amet ligula tempus, non ultricies elit facilisis. Nunc pellentesque malesuada consectetur. Suspendisse tincidunt, urna id pharetra congue, nisl ligula cursus nisl, quis blandit tellus mi sit amet sem. Vivamus laoreet eu tortor dignissim dapibus. Donec quam magna, blandit facilisis neque ac, tempus interdum ex. Praesent tellus metus, dapibus ac mauris id, mattis accumsan augue. Suspendisse et arcu vel lorem vulputate mattis. Curabitur bibendum id nibh non interdum. In hac habitasse platea dictumst.</p>\r\n\r\n<p>Aliquam tempor sagittis lectus eget aliquet. Donec hendrerit sagittis ligula, sit amet blandit ante tempus sit amet. Fusce iaculis lacus non tincidunt bibendum. Ut congue sagittis urna non mattis. Nulla ut lorem eget metus rhoncus iaculis. Donec ut nisl eu neque fermentum volutpat non vel turpis. Aliquam ac velit sit amet arcu porttitor sagittis. Nam faucibus, eros at hendrerit mollis, dolor quam semper mauris, vitae rutrum dolor quam a lorem. Donec consectetur ante ac dolor lacinia accumsan. Aliquam quam mauris, dapibus sit amet erat ac, accumsan sollicitudin nibh. Sed sed mi quis libero fermentum dictum.</p>\r\n\r\n<p>Duis efficitur orci nec ante sodales, elementum egestas erat sagittis. Etiam malesuada hendrerit metus, eu feugiat metus efficitur non. Quisque ac fringilla urna. Donec convallis velit vitae erat bibendum hendrerit. Fusce fermentum vestibulum velit, sit amet suscipit ipsum commodo sodales. Pellentesque pharetra enim quis pellentesque vestibulum. Maecenas posuere velit quis metus sodales suscipit. Suspendisse sed iaculis felis. Pellentesque metus dui, congue et ante non, convallis eleifend nibh. Nulla dapibus leo sed convallis eleifend.</p>\r\n\r\n<p>Vestibulum vel neque varius, eleifend nunc pharetra, imperdiet eros. Nulla id purus convallis, ornare ex condimentum, varius magna. Ut molestie libero est, et hendrerit risus mattis vel. Quisque semper magna eget elit venenatis posuere. Vivamus porttitor commodo euismod. Phasellus scelerisque ultrices imperdiet. Interdum et malesuada fames ac ante ipsum primis in faucibus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>\r\n\r\n<p>Phasellus eleifend neque nec vehicula molestie. Curabitur ac mattis magna. Proin tincidunt neque ac sollicitudin tincidunt. Nunc consectetur, odio non vulputate aliquet, metus libero dictum orci, a efficitur sapien mauris quis dui. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam non rhoncus erat. Donec blandit posuere ipsum ac volutpat. Suspendisse sed vestibulum tellus. Vestibulum vitae nunc id quam consequat commodo ut fringilla lacus. Proin mollis finibus semper. Nam semper nec est ac facilisis.</p>\r\n\r\n<p>Nam libero nulla, eleifend id pretium in, lacinia a velit. Quisque vel aliquet neque, et rutrum mi. In volutpat tortor sit amet vestibulum pretium. Integer venenatis augue sollicitudin tellus consequat, vel varius ante suscipit. In faucibus odio sit amet porttitor semper. Donec rutrum varius ligula et tristique. Morbi dignissim nec leo nec pulvinar. In vel venenatis eros, eget rhoncus tortor.</p>\r\n\r\n<p>Morbi ac gravida elit. Sed fermentum sollicitudin massa, et tristique ligula finibus sed. Mauris consectetur velit ultricies egestas fermentum. Integer sem leo, dapibus nec turpis vitae, sollicitudin convallis leo. Curabitur euismod, urna sit amet blandit hendrerit, elit augue facilisis quam, posuere vulputate ligula risus eget nibh. Etiam efficitur ornare lacus, ac vulputate ipsum porta finibus. Nunc ac erat eu urna accumsan blandit. Pellentesque vitae libero fringilla, blandit urna eget, ultrices ex. In velit sapien, rutrum id commodo nec, pellentesque nec magna. Aenean placerat sed tellus sit amet sollicitudin. Aliquam luctus lectus ac porta fringilla. Vestibulum dignissim neque ac congue viverra.</p>\r\n\r\n<p>Sed commodo rutrum enim, eget ornare tellus. Proin porttitor eget dui egestas pulvinar. Praesent lobortis turpis quis metus pulvinar, venenatis scelerisque mauris sagittis. Phasellus lacinia sit amet enim ut tincidunt. Vestibulum eu urna et velit rutrum tincidunt. Vestibulum rutrum bibendum semper. Quisque efficitur at risus in efficitur.</p>\r\n\r\n<p>Fusce non semper arcu, in porttitor lacus. Vivamus accumsan, felis in varius rutrum, ante lorem pellentesque turpis, ut luctus orci lacus eu leo. Phasellus cursus sem in elit gravida, nec porttitor elit efficitur. Aenean malesuada ex id elementum laoreet. Donec ultricies nec nulla ac dignissim. Curabitur nunc enim, eleifend sit amet euismod sit amet, dapibus nec erat. Vivamus id urna luctus, egestas leo a, laoreet nisl. Mauris eget diam dolor. Nunc eu tortor eget massa mollis tempus. Maecenas ut magna nulla. Vestibulum auctor nulla est, dictum suscipit justo pulvinar vitae. Quisque diam odio, vestibulum in velit at, sagittis gravida orci. Morbi vel nulla vel arcu dignissim dignissim. Suspendisse nibh erat, imperdiet id elit in, accumsan sodales risus. Pellentesque turpis justo, maximus ac pulvinar id, mattis vel turpis.</p>\r\n\r\n<p>Vivamus et erat ut sem porta mattis. Maecenas viverra orci sapien, eget vulputate diam mollis nec. Etiam a faucibus leo. Nam tellus dolor, scelerisque ut lacus at, sodales dictum mi. Nunc vitae mauris ut sem sodales bibendum sit amet vitae mauris. Proin lacinia nisi orci, sed fringilla mauris sollicitudin vel. Mauris nec odio sed metus viverra facilisis non sed ex.</p>\r\n</div>	0	5	1
4	fourth-article	Fourth article	2018-09-02 10:43:49.307067+00	<div>\r\n<p>Sed ut tortor lectus. Mauris bibendum eros ipsum, nec iaculis eros convallis ac. Duis dictum felis nec erat posuere sollicitudin. Sed feugiat eget mauris eget vulputate. Proin ut lectus eu neque convallis accumsan accumsan at dolor. Quisque mollis eget ante sed efficitur. Cras id gravida ante. Nulla leo tortor, tempor ac laoreet in, hendrerit at purus. Nullam dictum nisl elit, vel porttitor mi ultrices eget. Vestibulum nec tellus nec felis pellentesque mattis. Vivamus eleifend ac nisi vitae iaculis. Vestibulum a tempus magna. Vivamus elementum id mauris et tempor. Integer sit amet convallis felis, et vehicula massa.</p>\r\n\r\n<p>Nullam et massa eros. Pellentesque sollicitudin non libero tristique placerat. Donec leo est, ultrices interdum efficitur vitae, maximus vel libero. Sed semper augue nec lorem tempor varius. Proin egestas, urna sed pharetra gravida, lacus justo dapibus arcu, sed aliquam nunc urna fermentum massa. Vivamus maximus erat nunc, sit amet tristique elit lacinia vitae. Nam placerat bibendum arcu, id aliquam justo blandit vel. Nulla quis tellus sit amet tellus pretium facilisis ut at nisi. Nam molestie pulvinar erat ut mollis. Integer id purus ante. Nullam ultrices nibh ante, quis bibendum quam consequat in. Pellentesque vitae ipsum tincidunt, ullamcorper sem sagittis, bibendum eros. Suspendisse vulputate mi ut efficitur porttitor.</p>\r\n\r\n<p>Cras euismod condimentum volutpat. Etiam rutrum massa eleifend nulla iaculis, et sagittis diam venenatis. Sed fringilla eu lectus quis facilisis. Vestibulum elementum justo ante, at efficitur tellus pellentesque sit amet. Proin maximus eleifend fringilla. Vestibulum tempus odio nec rutrum viverra. Sed semper velit est, vitae vestibulum odio maximus eu. Sed in tempus nisl. Sed mollis nunc laoreet pellentesque tempor. Nulla maximus vulputate sem. Vestibulum interdum, ex vel tincidunt maximus, elit odio gravida orci, in tristique arcu sapien ac nisi. In vitae pulvinar lectus, vitae rhoncus tortor.</p>\r\n\r\n<p>Nullam venenatis justo in nisi tempus congue. Mauris id erat a purus elementum venenatis. Aenean eu euismod lacus, eu scelerisque augue. Pellentesque malesuada elit ligula, quis convallis ligula ultrices eget. Cras feugiat eu lorem maximus fermentum. Curabitur commodo ex et sem sollicitudin, sed faucibus quam porttitor. Donec efficitur ornare ex, non posuere leo varius in. Morbi non augue imperdiet quam tincidunt tristique. Ut a pulvinar est. Duis in lacinia justo. Aliquam congue dignissim orci, id vulputate purus scelerisque eu. Ut imperdiet gravida dolor, id hendrerit magna sagittis molestie. Nulla eu pulvinar dolor, in fringilla ligula. Vivamus porttitor malesuada condimentum.</p>\r\n\r\n<p>Maecenas eget diam eu diam volutpat molestie eget sit amet dolor. Ut nunc nunc, posuere vitae finibus a, hendrerit eu tellus. Nullam sodales orci urna, vel pharetra odio molestie a. Sed rutrum condimentum enim, fringilla feugiat leo imperdiet et. Mauris libero lorem, ullamcorper vitae urna nec, blandit varius dui. Duis at neque in risus rhoncus varius cursus at nulla. Duis pulvinar facilisis sem, a aliquam ex ornare sit amet. Etiam suscipit purus vel erat pellentesque, id hendrerit nisl aliquet. Etiam feugiat, sem sit amet ultrices lacinia, velit turpis pretium urna, ut volutpat dui magna at nunc. Curabitur semper laoreet fringilla. Pellentesque mollis mollis diam elementum sollicitudin. Aenean nec ante est. Nunc velit felis, congue at odio sit amet, consectetur fermentum arcu. Ut eu tristique sapien. Proin accumsan suscipit diam sit amet sodales. Praesent non auctor enim.</p>\r\n\r\n<p>Etiam ultricies ut felis vel iaculis. Proin enim nulla, accumsan quis purus vel, scelerisque luctus arcu. Nam at diam sed felis ullamcorper tempor. Proin gravida libero nec diam mattis, sit amet lobortis nulla sagittis. Vivamus at aliquet diam. Morbi vel facilisis quam. Morbi posuere ullamcorper tellus, pretium tempor est ultrices id. Nulla a lectus lectus. Maecenas tortor leo, egestas sed eros sit amet, fringilla luctus mauris. Aliquam eget ultricies quam. Nulla consectetur purus vitae ex fermentum iaculis. Phasellus metus lacus, faucibus tincidunt scelerisque a, sollicitudin sit amet nisl. Donec nec lorem elit. Pellentesque sollicitudin odio nec ipsum posuere, sed tincidunt libero maximus.</p>\r\n\r\n<p>Curabitur a commodo risus, a facilisis lorem. Pellentesque venenatis et mauris ac ullamcorper. Suspendisse pharetra, arcu vitae maximus iaculis, diam urna ornare velit, ut sagittis massa est in tellus. Nam congue sit amet diam eu ultricies. Nulla mattis leo erat, vitae gravida metus imperdiet in. Maecenas nec accumsan orci, et euismod nisi. Nullam a facilisis quam. Etiam magna nulla, dignissim mattis mollis eget, cursus non nisi. Pellentesque id tincidunt odio. Suspendisse fringilla metus in cursus iaculis. Maecenas sapien leo, congue ut vestibulum non, iaculis sed ante. Nunc a neque dui. Mauris vehicula leo quis lorem hendrerit, mollis scelerisque diam interdum. Quisque accumsan dolor et semper porta. Curabitur imperdiet malesuada libero, sit amet tempor massa laoreet eu.</p>\r\n\r\n<p>Vestibulum ut convallis lectus, eu rutrum tellus. Fusce ut odio id nulla porta laoreet eu id mauris. Etiam eu eros sem. Vestibulum non elit hendrerit, vestibulum magna nec, egestas felis. Sed ac tortor rhoncus, efficitur tortor eu, gravida lectus. Aliquam dictum metus non auctor venenatis. Pellentesque nisi velit, blandit et lacus sed, euismod suscipit dui. Fusce quis cursus arcu. Aliquam dictum elementum semper. Cras ut vehicula mi. Vivamus odio dolor, consectetur ac metus sit amet, dignissim tristique urna. Etiam eget viverra ante. Sed lobortis luctus tempus. Sed vestibulum nisl id dui congue rutrum.</p>\r\n\r\n<p>Ut ut interdum est. Etiam porta tortor sit amet elementum bibendum. Etiam vitae lorem felis. Ut in scelerisque diam, ac vulputate quam. Curabitur non laoreet eros. Aenean nisl ante, euismod nec consequat vel, tristique ac est. Integer malesuada eleifend odio vitae ullamcorper.</p>\r\n\r\n<p>Fusce cursus pretium leo et imperdiet. Proin a nunc nec felis cursus hendrerit vel vel velit. Pellentesque varius tempor leo et vulputate. Quisque aliquet nisi ex, id dignissim odio feugiat pretium. Phasellus pellentesque elit orci, vel posuere erat euismod id. Sed non erat venenatis, porta nisi a, iaculis risus. Fusce ac diam a ligula consequat scelerisque. Aenean commodo a tortor eget facilisis. Integer faucibus id purus vel imperdiet. Proin suscipit velit eu tincidunt rhoncus. Donec sodales urna et risus dictum condimentum. Aliquam convallis leo non facilisis dictum. Vestibulum eget commodo nulla. Ut eu elit felis.</p>\r\n</div>	0	4	3
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
1	Дана Борисова	36	преподаватель	2018-09-02	https://www.youtube.com/embed/FXHLKyK0GGY	1	
2	Иван Иванов	29	менеджер	2018-09-02	\N	1	<p>Cras dictum metus orci, et ullamcorper tellus sollicitudin tincidunt. Sed tempor sapien tortor, in dapibus nisi congue nec. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Mauris cursus ex eu hendrerit luctus. Sed tempor nunc consectetur felis aliquam vestibulum. Vestibulum in dolor porta, sollicitudin risus ut, fringilla turpis. Nunc tincidunt lectus vel nulla mattis gravida. Aliquam tempor lacus eu massa dignissim finibus.</p>
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
1	1	1
2	1	2
3	1	3
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
21	locations	country
22	locations	hotel
23	locations	hoteltype
24	locations	resort
25	tours	tour
26	tours	tourdatepair
27	tours	tourtype
28	tours	tourxcludes
29	reports	call
30	reports	pickingtour
31	reports	report
32	reports	reservation
33	reports	sertificate
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-09-02 07:09:06.055573+00
2	auth	0001_initial	2018-09-02 07:09:07.006842+00
3	admin	0001_initial	2018-09-02 07:09:07.215174+00
4	admin	0002_logentry_remove_auto_add	2018-09-02 07:09:07.231488+00
5	admin	0003_logentry_add_action_flag_choices	2018-09-02 07:09:07.246744+00
6	contenttypes	0002_remove_content_type_name	2018-09-02 07:09:07.281791+00
7	auth	0002_alter_permission_name_max_length	2018-09-02 07:09:07.298378+00
8	auth	0003_alter_user_email_max_length	2018-09-02 07:09:07.323792+00
9	auth	0004_alter_user_username_opts	2018-09-02 07:09:07.33824+00
10	auth	0005_alter_user_last_login_null	2018-09-02 07:09:07.365145+00
11	auth	0006_require_contenttypes_0002	2018-09-02 07:09:07.37422+00
12	auth	0007_alter_validators_add_error_messages	2018-09-02 07:09:07.389303+00
13	auth	0008_alter_user_username_max_length	2018-09-02 07:09:07.456888+00
14	auth	0009_alter_user_last_name_max_length	2018-09-02 07:09:07.481899+00
15	blog	0001_initial	2018-09-02 07:09:07.799066+00
16	locations	0001_initial	2018-09-02 07:09:08.916977+00
17	core	0001_initial	2018-09-02 07:09:09.334048+00
18	core	0002_auto_20180901_1105	2018-09-02 07:09:09.475905+00
19	core	0003_comment	2018-09-02 07:09:09.600979+00
20	core	0004_comment_comment	2018-09-02 07:09:09.809707+00
21	core	0005_auto_20180901_1502	2018-09-02 07:09:09.834405+00
22	des	0001_initial	2018-09-02 07:09:09.942965+00
23	postie	0001_initial	2018-09-02 07:09:10.587008+00
24	postie	0002_auto_20180501_0834	2018-09-02 07:09:10.600732+00
25	postie	0003_auto_20180504_0340	2018-09-02 07:09:10.619768+00
26	tours	0001_initial	2018-09-02 07:09:11.554533+00
27	reports	0001_initial	2018-09-02 07:09:12.063715+00
28	sessions	0001_initial	2018-09-02 07:09:12.255457+00
29	sites	0001_initial	2018-09-02 07:09:12.330418+00
30	sites	0002_alter_domain_unique	2018-09-02 07:09:12.472041+00
31	core	0006_auto_20180902_0735	2018-09-02 07:35:59.619851+00
32	core	0007_auto_20180902_1438	2018-09-02 14:39:10.264568+00
33	locations	0002_hotel_address	2018-09-02 14:39:10.64126+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
2iwqh0hfq5xcl2ypmqfvqdz4t2blitgs	N2NjODdiZmQyOGJiN2FmNjBmMDA1Y2JhNmE0ZThiYTFmMzY2NmE1ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMTMwNzg5NjYwYzRkNmM0Yzg1MTU0ZGJmZTEzYjMxNGFkMjVmMmNhIn0=	2018-09-16 07:29:54.136067+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: locations_country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY locations_country (id, slug, name, about, holidays, to_visit, customs) FROM stdin;
1	avstriia	Австрия	<div>\r\n<p>Австрия - самая красивая страна центральной Европы. Это поистине маленькая жемчужина: горнолыжные и бальнеологические курорты, отдых на озерах, достопримечательности городов Австрии, живописные деревушки на тирольских склонах - все это привлекает в страну туристов со всего света.</p>\r\n</div>\r\n\r\n<div>\r\n<p><strong>Столица: </strong>Вена</p>\r\n\r\n<p><strong>Язык: </strong>Немецкий с характерным австрийским акцентом.</p>\r\n\r\n<p><strong>Язык: </strong>Отстает от киевского на 1 час</p>\r\n\r\n<p><strong>География:</strong></p>\r\n</div>\r\n\r\n<div>\r\n<p>Государство в Центральной Европе. На севере граничит с Чехией, на северо-востоке - со Словакией, на востоке - с Венгрией, на юге - со Словенией, Италией и Швейцарией, на западе - с Лихтенштейном, Швейцарией и Германией. Австрия в основном горная страна (на 70%): средний уровень составляет около 900 м, большая часть Австрии занята Восточными Альпами, которые в свою очередь подразделяются на Альпы Северного Тироля и Зальцбургские Альпы на севере; Циллертальские и Кар-никские Альпы на юге. Высшая точка - гора Гросглокнер (3797 метров), на ней находится и один из крупнейших в Европе ледников: Пастерзе.</p>\r\n</div>\r\n\r\n<div>\r\n<p><strong>Климат: </strong></p>\r\n</div>\r\n\r\n<div>\r\n<p>Умеренный, континентальный. Самый холодный зимний месяц &ndash; январь, температура опускается до &ndash;2 C. Самые жаркие &ndash; июль и август, температура около +20 С. Осадков от 600 до 1100 мм в год.</p>\r\n</div>\r\n\r\n<div>\r\n<p><strong>Валюта: </strong>Евро</p>\r\n</div>	<div>\r\n<div>\r\n<p><strong>01 января: </strong>Новый год;</p>\r\n\r\n<p><strong>06 января: </strong>Богоявление;</p>\r\n\r\n<p><strong>05 апреля: </strong>Пасхальный Понедельник;</p>\r\n\r\n<p><strong>01 мая: </strong>Государственный праздник;</p>\r\n\r\n<p><strong>13 мая: </strong>Вознесение;</p>\r\n\r\n<p><strong>24 мая: </strong>Понедельник Пятидесятницы;</p>\r\n\r\n<p><strong>03 июня: </strong>Праздник Тела Господня;</p>\r\n</div>\r\n\r\n<div>\r\n<p><strong>15 августа: </strong>Успение Богородицы;</p>\r\n\r\n<p><strong>26 октября: </strong>Национальный праздник;</p>\r\n\r\n<p><strong>01 ноября: </strong>День Всех Святых;</p>\r\n\r\n<p><strong>08 декабря: </strong>Зачатие Богородицы;</p>\r\n\r\n<p><strong>25 декабря: </strong>Рождество;</p>\r\n\r\n<p><strong>26 декабря: </strong>Понедельник Пятидесятницы;</p>\r\n\r\n<p><strong>03 июня: </strong>День Святого Стефана.</p>\r\n</div>\r\n</div>	<div>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean euismod bibendum laoreet. Proin gravida dolor sit amet lacus accumsan et viverra justo commodo. Proin sodales pulvinar tempor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam fermentum, nulla luctus pharetra vulputate, felis tellus mollis orci, sed rhoncus sapien nunc eget odio.</p>\r\n</div>	<div>\r\n<p><strong>Виза:</strong></p>\r\n</div>\r\n\r\n<div>\r\n<p>Австрия входит в состав стран - членов Шенгенского соглашения. Для въезда в Австрию гражданам&nbsp; СНГ необходима виза.</p>\r\n</div>\r\n\r\n<div>\r\n<p><strong>Таможенные правила: </strong></p>\r\n</div>\r\n\r\n<div>\r\n<p>Разрешен беспошлинный ввоз до 200 сигарет или 100 сигарилл, или 50 сигар, или 250 г табака; до 1 л крепких спиртных напитков (содержание алкоголя более 22%), или до 2 л крепленых вин и ликеров (содержание алкоголя менее 22%); столового вина - до 2 л; не более 500 г кофе или 200 г кофейного экстракта; до 100 г чая или 40 г чайного экстракта; до 50 г духов и 250 мл туалетной воды; а также товаров личного использования из расчета 175 евро на одного взрослого и 90 евро на ребенка в возрасте до 15 лет. Золотые изделия и драгоценности общим весом до 500 г (для личного использования) ввозятся бесплатно, свыше этой нормы все ювелирные украшения подлежат обязательной декларации.</p>\r\n</div>
\.


--
-- Data for Name: locations_hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY locations_hotel (id, slug, name, stars, hot, website, description, breakfasts, resort_id, type_id, address) FROM stdin;
1	hotel-number-one	Hotel Number One	4	f	http://hotel-number-one.com/	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum fringilla feugiat. Quisque tellus elit, dapibus at tellus sit amet, maximus hendrerit elit. Aenean eros tortor, pellentesque eu tortor at, scelerisque tempor dolor. Integer eu est facilisis, dapibus augue id, maximus urna. Maecenas sit amet pharetra ante, et interdum odio. Vestibulum rhoncus ornare leo, eget laoreet justo eleifend convallis. Vestibulum finibus, mauris non tempus consequat, mi mauris vehicula magna, nec iaculis felis magna eu massa. Duis aliquam erat elit, eget suscipit turpis dapibus sit amet. Maecenas vitae sagittis metus.</p>	<p>Quisque lacus enim, mollis in volutpat vel, viverra quis sapien. Ut blandit, enim nec tincidunt ullamcorper, velit nunc malesuada mi, vel viverra velit sem non metus. Donec tempus lacus non ante aliquam, consectetur volutpat sem fringilla. Sed sagittis mi mauris, sit amet accumsan mi sollicitudin placerat. Ut posuere urna eu lorem suscipit pretium. Praesent fermentum eget augue at malesuada. Donec sed risus sed felis ullamcorper vestibulum. Vivamus in molestie arcu. Nunc pulvinar faucibus nibh, vel tincidunt sapien scelerisque quis. Pellentesque felis tortor, malesuada et libero nec, consectetur vehicula mi. Morbi neque velit, fringilla vitae turpis id, rhoncus consequat quam. Aliquam maximus justo ac ligula varius, ac dignissim massa placerat. Nulla rhoncus, ante ut tincidunt dictum, odio lectus gravida sem, vel finibus purus felis dignissim est.</p>	1	1	Berlin, Germany
\.


--
-- Data for Name: locations_hoteltype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY locations_hoteltype (id, slug, name) FROM stdin;
1	spa-otel	Спа-отель
\.


--
-- Data for Name: locations_resort; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY locations_resort (id, slug, name, about, sights, country_id) FROM stdin;
1	zaltsburg	Зальцбург	<div>\r\n<p>Город Моцарта Зальцбург носит и второе имя &ndash; &laquo;сцена мира&raquo;. И это по праву, поскольку в таких жемчужинах культурной жизни, как Зальцбургский фестиваль, принимают участие звезды мировой величины. Живописный старый город Зальцбурга признан мировым культурным наследием ЮНЕСКО.</p>\r\n\r\n<p>Церкви, крепости, замки и дворцы составляют доминанту в картине этого города.&nbsp; Его символ &ndash; крепость Хоэнзальцбург, одна из самых больших и хорошо сохранившихся в Европе. Посетите резиденцию эрцгерцога Зальцбургского, роскошное сооружение в стиле раннего барокко с пышными залами и картинной галереей.</p>\r\n\r\n<p>Недалеко расположенный Кафедральный собор Зальцбурга считается самым значимым сакральным сооружением города. Не менее примечателен и с размахом построенный в стиле барокко архитектором Лукасом фон Хильдебрандтом дворец Мирабель.</p>\r\n\r\n<p>У подножья горы Мёнхсберг вы обнаружите так называемый район Зальцбургского фестиваля, включающий в себя Малый и Большой фестивальные дворцы, а также Летнюю школу верховой езды, построенную в 1693 году по планам архитектора Фишера фон Эрлаха. Недалеко от города вас очарует загородный дворец Хельбрунн в стиле раннего барокко с его всемирно известными каскадами фонтанов.</p>\r\n</div>	<div>\r\n<div>\r\n<div><strong>Первая:</strong></div>\r\n\r\n<div>\r\n<p>Город Моцарта Зальцбург носит и второе имя &ndash; &laquo;сцена мира&raquo;. И это по праву, поскольку в таких жемчужинах культурной жизни, как Зальцбургский фестиваль, принимают участие звезды мировой величины. Живописный старый город Зальцбурга признан мировым культурным наследием ЮНЕСКО.</p>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div>\r\n<div>\r\n<div><strong>Вторая:</strong></div>\r\n\r\n<div>\r\n<p>Город Моцарта Зальцбург носит и второе имя &ndash; &laquo;сцена мира&raquo;. И это по праву, поскольку в таких жемчужинах культурной жизни, как Зальцбургский фестиваль, принимают участие звезды мировой величины. Живописный старый город Зальцбурга признан мировым культурным наследием ЮНЕСКО.</p>\r\n\r\n<p>Церкви, крепости, замки и дворцы составляют доминанту в картине этого города.&nbsp; Его символ &ndash; крепость Хоэнзальцбург, одна из самых больших и хорошо сохранившихся в Европе. Посетите резиденцию эрцгерцога Зальцбургского, роскошное сооружение в стиле раннего барокко с пышными залами и картинной галереей.</p>\r\n\r\n<p>Недалеко расположенный Кафедральный собор Зальцбурга считается самым значимым сакральным сооружением города. Не менее примечателен и с размахом построенный в стиле барокко архитектором Лукасом фон Хильдебрандтом дворец Мирабель.</p>\r\n\r\n<p>У подножья горы Мёнхсберг вы обнаружите так называемый район</p>\r\n</div>\r\n</div>\r\n</div>	1
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
\.


--
-- Data for Name: reports_pickingtour; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports_pickingtour (id, duration, number_of_persons, name, phone, email, comment, from_link, datetime, status, country_id) FROM stdin;
\.


--
-- Data for Name: reports_report; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports_report (id, name, email, message, from_link, status, datetime) FROM stdin;
\.


--
-- Data for Name: reports_reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports_reservation (id, full_name, phone, email, comment, from_link, datetime, status, tour_id, tour_date_id) FROM stdin;
\.


--
-- Data for Name: reports_sertificate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reports_sertificate (id, name, phone, from_link, datetime, status) FROM stdin;
\.


--
-- Data for Name: tours_tour; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tours_tour (id, sending_from, duration_days, duration_nights, cost, stars, hotel_id, type_id) FROM stdin;
1	Киев	7	7	45500	4	1	1
\.


--
-- Data for Name: tours_tour_dates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tours_tour_dates (id, tour_id, tourdatepair_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: tours_tour_xcludes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tours_tour_xcludes (id, tour_id, tourxcludes_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
\.


--
-- Data for Name: tours_tourdatepair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tours_tourdatepair (id, start, "end") FROM stdin;
1	2018-09-02	2018-09-09
\.


--
-- Data for Name: tours_tourtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tours_tourtype (id, slug, name) FROM stdin;
1	vip-tur	Вип тур
\.


--
-- Data for Name: tours_tourxcludes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tours_tourxcludes (id, name, description, type) FROM stdin;
1	Перелет	- Экскурсии в Шарм Ель Шейхе\r\n- Экскурсии в Табе\r\n- Экскурсии в Дахабе\r\n- Экскурсии в Нувейбе	t
2	Питание	- Экскурсии в Шарм Ель Шейхе\r\n- Экскурсии в Табе\r\n- Экскурсии в Дахабе\r\n- Экскурсии в Нувейбе	t
3	Виза	- Экскурсии в Шарм Ель Шейхе\r\n- Экскурсии в Табе\r\n- Экскурсии в Дахабе\r\n- Экскурсии в Нувейбе	t
4	Страховка		t
5	Экскурсии	- Экскурсии в Шарм Ель Шейхе\r\n- Экскурсии в Табе\r\n- Экскурсии в Дахабе\r\n- Экскурсии в Нувейбе	f
6	Трансфер		f
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

SELECT pg_catalog.setval('auth_permission_id_seq', 128, true);


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

SELECT pg_catalog.setval('blog_article_id_seq', 4, true);


--
-- Name: blog_heading_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_heading_id_seq', 6, true);


--
-- Name: core_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_comment_id_seq', 2, true);


--
-- Name: core_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_image_id_seq', 18, true);


--
-- Name: core_indexsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_indexsettings_id_seq', 1, false);


--
-- Name: core_indexsettings_phone_numbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('core_indexsettings_phone_numbers_id_seq', 3, true);


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

SELECT pg_catalog.setval('django_admin_log_id_seq', 45, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 33, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 33, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Name: locations_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('locations_country_id_seq', 1, true);


--
-- Name: locations_hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('locations_hotel_id_seq', 1, true);


--
-- Name: locations_hoteltype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('locations_hoteltype_id_seq', 1, true);


--
-- Name: locations_resort_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('locations_resort_id_seq', 1, true);


--
-- Name: postie_attachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('postie_attachment_id_seq', 1, false);


--
-- Name: postie_letter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('postie_letter_id_seq', 1, false);


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

SELECT pg_catalog.setval('reports_call_id_seq', 1, false);


--
-- Name: reports_pickingtour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_pickingtour_id_seq', 1, false);


--
-- Name: reports_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_report_id_seq', 1, false);


--
-- Name: reports_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_reservation_id_seq', 1, false);


--
-- Name: reports_sertificate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reports_sertificate_id_seq', 1, false);


--
-- Name: tours_tour_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tours_tour_dates_id_seq', 1, true);


--
-- Name: tours_tour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tours_tour_id_seq', 1, true);


--
-- Name: tours_tour_xcludes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tours_tour_xcludes_id_seq', 6, true);


--
-- Name: tours_tourdatepair_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tours_tourdatepair_id_seq', 1, true);


--
-- Name: tours_tourtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tours_tourtype_id_seq', 1, true);


--
-- Name: tours_tourxcludes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tours_tourxcludes_id_seq', 6, true);


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
-- Name: tours_tour_dates tours_tour_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour_dates
    ADD CONSTRAINT tours_tour_dates_pkey PRIMARY KEY (id);


--
-- Name: tours_tour_dates tours_tour_dates_tour_id_tourdatepair_id_57fa5eaa_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour_dates
    ADD CONSTRAINT tours_tour_dates_tour_id_tourdatepair_id_57fa5eaa_uniq UNIQUE (tour_id, tourdatepair_id);


--
-- Name: tours_tour tours_tour_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour
    ADD CONSTRAINT tours_tour_pkey PRIMARY KEY (id);


--
-- Name: tours_tour_xcludes tours_tour_xcludes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour_xcludes
    ADD CONSTRAINT tours_tour_xcludes_pkey PRIMARY KEY (id);


--
-- Name: tours_tour_xcludes tours_tour_xcludes_tour_id_tourxcludes_id_379d133f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour_xcludes
    ADD CONSTRAINT tours_tour_xcludes_tour_id_tourxcludes_id_379d133f_uniq UNIQUE (tour_id, tourxcludes_id);


--
-- Name: tours_tourdatepair tours_tourdatepair_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourdatepair
    ADD CONSTRAINT tours_tourdatepair_pkey PRIMARY KEY (id);


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
-- Name: tours_tourxcludes tours_tourxcludes_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourxcludes
    ADD CONSTRAINT tours_tourxcludes_name_key UNIQUE (name);


--
-- Name: tours_tourxcludes tours_tourxcludes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tourxcludes
    ADD CONSTRAINT tours_tourxcludes_pkey PRIMARY KEY (id);


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
-- Name: tours_tour_dates_tour_id_432fec06; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tour_dates_tour_id_432fec06 ON tours_tour_dates USING btree (tour_id);


--
-- Name: tours_tour_dates_tourdatepair_id_369b19d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tour_dates_tourdatepair_id_369b19d7 ON tours_tour_dates USING btree (tourdatepair_id);


--
-- Name: tours_tour_hotel_id_30d10642; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tour_hotel_id_30d10642 ON tours_tour USING btree (hotel_id);


--
-- Name: tours_tour_type_id_70bfc62d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tour_type_id_70bfc62d ON tours_tour USING btree (type_id);


--
-- Name: tours_tour_xcludes_tour_id_92edb58d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tour_xcludes_tour_id_92edb58d ON tours_tour_xcludes USING btree (tour_id);


--
-- Name: tours_tour_xcludes_tourxcludes_id_e791784c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tour_xcludes_tourxcludes_id_e791784c ON tours_tour_xcludes USING btree (tourxcludes_id);


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
-- Name: tours_tourxcludes_name_cff93f24_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tours_tourxcludes_name_cff93f24_like ON tours_tourxcludes USING btree (name varchar_pattern_ops);


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
-- Name: tours_tour_dates tours_tour_dates_tour_id_432fec06_fk_tours_tour_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour_dates
    ADD CONSTRAINT tours_tour_dates_tour_id_432fec06_fk_tours_tour_id FOREIGN KEY (tour_id) REFERENCES tours_tour(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tours_tour_dates tours_tour_dates_tourdatepair_id_369b19d7_fk_tours_tou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour_dates
    ADD CONSTRAINT tours_tour_dates_tourdatepair_id_369b19d7_fk_tours_tou FOREIGN KEY (tourdatepair_id) REFERENCES tours_tourdatepair(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: tours_tour_xcludes tours_tour_xcludes_tour_id_92edb58d_fk_tours_tour_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour_xcludes
    ADD CONSTRAINT tours_tour_xcludes_tour_id_92edb58d_fk_tours_tour_id FOREIGN KEY (tour_id) REFERENCES tours_tour(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tours_tour_xcludes tours_tour_xcludes_tourxcludes_id_e791784c_fk_tours_tou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tours_tour_xcludes
    ADD CONSTRAINT tours_tour_xcludes_tourxcludes_id_e791784c_fk_tours_tou FOREIGN KEY (tourxcludes_id) REFERENCES tours_tourxcludes(id) DEFERRABLE INITIALLY DEFERRED;


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

