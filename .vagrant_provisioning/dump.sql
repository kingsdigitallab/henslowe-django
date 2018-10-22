--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
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


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO henslowe;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO henslowe;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO henslowe;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO henslowe;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO henslowe;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO henslowe;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.auth_user (
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


ALTER TABLE public.auth_user OWNER TO henslowe;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO henslowe;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO henslowe;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO henslowe;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO henslowe;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO henslowe;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: cms_catalogue; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.cms_catalogue (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    subtitle text
);


ALTER TABLE public.cms_catalogue OWNER TO henslowe;

--
-- Name: cms_catalogueentry; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.cms_catalogueentry (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    subtitle text
);


ALTER TABLE public.cms_catalogueentry OWNER TO henslowe;

--
-- Name: cms_homepage; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.cms_homepage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    subtitle text
);


ALTER TABLE public.cms_homepage OWNER TO henslowe;

--
-- Name: cms_image; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.cms_image (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    subtitle text,
    reference text,
    filename text,
    transcription text NOT NULL
);


ALTER TABLE public.cms_image OWNER TO henslowe;

--
-- Name: cms_richtextpage; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.cms_richtextpage (
    page_ptr_id integer NOT NULL,
    body text NOT NULL,
    subtitle text
);


ALTER TABLE public.cms_richtextpage OWNER TO henslowe;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO henslowe;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO henslowe;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO henslowe;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO henslowe;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO henslowe;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO henslowe;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO henslowe;

--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO henslowe;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.taggit_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO henslowe;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO henslowe;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO henslowe;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: wagtailcore_collection; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailcore_collection (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    name character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_collection_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_collection_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_collection OWNER TO henslowe;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailcore_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collection_id_seq OWNER TO henslowe;

--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailcore_collection_id_seq OWNED BY public.wagtailcore_collection.id;


--
-- Name: wagtailcore_collectionviewrestriction; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailcore_collectionviewrestriction (
    id integer NOT NULL,
    restriction_type character varying(20) NOT NULL,
    password character varying(255) NOT NULL,
    collection_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_collectionviewrestriction OWNER TO henslowe;

--
-- Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailcore_collectionviewrestriction_groups (
    id integer NOT NULL,
    collectionviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_collectionviewrestriction_groups OWNER TO henslowe;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collectionviewrestriction_groups_id_seq OWNER TO henslowe;

--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_groups_id_seq OWNED BY public.wagtailcore_collectionviewrestriction_groups.id;


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_collectionviewrestriction_id_seq OWNER TO henslowe;

--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailcore_collectionviewrestriction_id_seq OWNED BY public.wagtailcore_collectionviewrestriction.id;


--
-- Name: wagtailcore_groupcollectionpermission; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailcore_groupcollectionpermission (
    id integer NOT NULL,
    collection_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_groupcollectionpermission OWNER TO henslowe;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_groupcollectionpermission_id_seq OWNER TO henslowe;

--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailcore_groupcollectionpermission_id_seq OWNED BY public.wagtailcore_groupcollectionpermission.id;


--
-- Name: wagtailcore_grouppagepermission; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailcore_grouppagepermission (
    id integer NOT NULL,
    permission_type character varying(20) NOT NULL,
    group_id integer NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_grouppagepermission OWNER TO henslowe;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailcore_grouppagepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_grouppagepermission_id_seq OWNER TO henslowe;

--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailcore_grouppagepermission_id_seq OWNED BY public.wagtailcore_grouppagepermission.id;


--
-- Name: wagtailcore_page; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailcore_page (
    id integer NOT NULL,
    path character varying(255) COLLATE pg_catalog."C" NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    live boolean NOT NULL,
    has_unpublished_changes boolean NOT NULL,
    url_path text NOT NULL,
    seo_title character varying(255) NOT NULL,
    show_in_menus boolean NOT NULL,
    search_description text NOT NULL,
    go_live_at timestamp with time zone,
    expire_at timestamp with time zone,
    expired boolean NOT NULL,
    content_type_id integer NOT NULL,
    owner_id integer,
    locked boolean NOT NULL,
    latest_revision_created_at timestamp with time zone,
    first_published_at timestamp with time zone,
    live_revision_id integer,
    last_published_at timestamp with time zone,
    draft_title character varying(255) NOT NULL,
    CONSTRAINT wagtailcore_page_depth_check CHECK ((depth >= 0)),
    CONSTRAINT wagtailcore_page_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.wagtailcore_page OWNER TO henslowe;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailcore_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_page_id_seq OWNER TO henslowe;

--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailcore_page_id_seq OWNED BY public.wagtailcore_page.id;


--
-- Name: wagtailcore_pagerevision; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailcore_pagerevision (
    id integer NOT NULL,
    submitted_for_moderation boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    content_json text NOT NULL,
    approved_go_live_at timestamp with time zone,
    page_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.wagtailcore_pagerevision OWNER TO henslowe;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailcore_pagerevision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pagerevision_id_seq OWNER TO henslowe;

--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailcore_pagerevision_id_seq OWNED BY public.wagtailcore_pagerevision.id;


--
-- Name: wagtailcore_pageviewrestriction; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailcore_pageviewrestriction (
    id integer NOT NULL,
    password character varying(255) NOT NULL,
    page_id integer NOT NULL,
    restriction_type character varying(20) NOT NULL
);


ALTER TABLE public.wagtailcore_pageviewrestriction OWNER TO henslowe;

--
-- Name: wagtailcore_pageviewrestriction_groups; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailcore_pageviewrestriction_groups (
    id integer NOT NULL,
    pageviewrestriction_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.wagtailcore_pageviewrestriction_groups OWNER TO henslowe;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pageviewrestriction_groups_id_seq OWNER TO henslowe;

--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_groups_id_seq OWNED BY public.wagtailcore_pageviewrestriction_groups.id;


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailcore_pageviewrestriction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_pageviewrestriction_id_seq OWNER TO henslowe;

--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailcore_pageviewrestriction_id_seq OWNED BY public.wagtailcore_pageviewrestriction.id;


--
-- Name: wagtailcore_site; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailcore_site (
    id integer NOT NULL,
    hostname character varying(255) NOT NULL,
    port integer NOT NULL,
    is_default_site boolean NOT NULL,
    root_page_id integer NOT NULL,
    site_name character varying(255)
);


ALTER TABLE public.wagtailcore_site OWNER TO henslowe;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailcore_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailcore_site_id_seq OWNER TO henslowe;

--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailcore_site_id_seq OWNED BY public.wagtailcore_site.id;


--
-- Name: wagtaildocs_document; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtaildocs_document (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    uploaded_by_user_id integer,
    collection_id integer NOT NULL,
    file_size integer,
    CONSTRAINT wagtaildocs_document_file_size_check CHECK ((file_size >= 0))
);


ALTER TABLE public.wagtaildocs_document OWNER TO henslowe;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtaildocs_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtaildocs_document_id_seq OWNER TO henslowe;

--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtaildocs_document_id_seq OWNED BY public.wagtaildocs_document.id;


--
-- Name: wagtailembeds_embed; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailembeds_embed (
    id integer NOT NULL,
    url character varying(200) NOT NULL,
    max_width smallint,
    type character varying(10) NOT NULL,
    html text NOT NULL,
    title text NOT NULL,
    author_name text NOT NULL,
    provider_name text NOT NULL,
    thumbnail_url character varying(200),
    width integer,
    height integer,
    last_updated timestamp with time zone NOT NULL
);


ALTER TABLE public.wagtailembeds_embed OWNER TO henslowe;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailembeds_embed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailembeds_embed_id_seq OWNER TO henslowe;

--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailembeds_embed_id_seq OWNED BY public.wagtailembeds_embed.id;


--
-- Name: wagtailforms_formsubmission; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailforms_formsubmission (
    id integer NOT NULL,
    form_data text NOT NULL,
    submit_time timestamp with time zone NOT NULL,
    page_id integer NOT NULL
);


ALTER TABLE public.wagtailforms_formsubmission OWNER TO henslowe;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailforms_formsubmission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailforms_formsubmission_id_seq OWNER TO henslowe;

--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailforms_formsubmission_id_seq OWNED BY public.wagtailforms_formsubmission.id;


--
-- Name: wagtailimages_image; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailimages_image (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    focal_point_x integer,
    focal_point_y integer,
    focal_point_width integer,
    focal_point_height integer,
    uploaded_by_user_id integer,
    file_size integer,
    collection_id integer NOT NULL,
    file_hash character varying(40) NOT NULL,
    CONSTRAINT wagtailimages_image_file_size_check CHECK ((file_size >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_height_check CHECK ((focal_point_height >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_width_check CHECK ((focal_point_width >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_x_check CHECK ((focal_point_x >= 0)),
    CONSTRAINT wagtailimages_image_focal_point_y_check CHECK ((focal_point_y >= 0))
);


ALTER TABLE public.wagtailimages_image OWNER TO henslowe;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailimages_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_image_id_seq OWNER TO henslowe;

--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailimages_image_id_seq OWNED BY public.wagtailimages_image.id;


--
-- Name: wagtailimages_rendition; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailimages_rendition (
    id integer NOT NULL,
    file character varying(100) NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    focal_point_key character varying(16) NOT NULL,
    image_id integer NOT NULL,
    filter_spec character varying(255) NOT NULL
);


ALTER TABLE public.wagtailimages_rendition OWNER TO henslowe;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailimages_rendition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailimages_rendition_id_seq OWNER TO henslowe;

--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailimages_rendition_id_seq OWNED BY public.wagtailimages_rendition.id;


--
-- Name: wagtailredirects_redirect; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailredirects_redirect (
    id integer NOT NULL,
    old_path character varying(255) NOT NULL,
    is_permanent boolean NOT NULL,
    redirect_link character varying(255) NOT NULL,
    redirect_page_id integer,
    site_id integer
);


ALTER TABLE public.wagtailredirects_redirect OWNER TO henslowe;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailredirects_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailredirects_redirect_id_seq OWNER TO henslowe;

--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailredirects_redirect_id_seq OWNED BY public.wagtailredirects_redirect.id;


--
-- Name: wagtailsearch_editorspick; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailsearch_editorspick (
    id integer NOT NULL,
    sort_order integer,
    description text NOT NULL,
    page_id integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearch_editorspick OWNER TO henslowe;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailsearch_editorspick_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_editorspick_id_seq OWNER TO henslowe;

--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailsearch_editorspick_id_seq OWNED BY public.wagtailsearch_editorspick.id;


--
-- Name: wagtailsearch_query; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailsearch_query (
    id integer NOT NULL,
    query_string character varying(255) NOT NULL
);


ALTER TABLE public.wagtailsearch_query OWNER TO henslowe;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailsearch_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_query_id_seq OWNER TO henslowe;

--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailsearch_query_id_seq OWNED BY public.wagtailsearch_query.id;


--
-- Name: wagtailsearch_querydailyhits; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailsearch_querydailyhits (
    id integer NOT NULL,
    date date NOT NULL,
    hits integer NOT NULL,
    query_id integer NOT NULL
);


ALTER TABLE public.wagtailsearch_querydailyhits OWNER TO henslowe;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailsearch_querydailyhits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailsearch_querydailyhits_id_seq OWNER TO henslowe;

--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailsearch_querydailyhits_id_seq OWNED BY public.wagtailsearch_querydailyhits.id;


--
-- Name: wagtailusers_userprofile; Type: TABLE; Schema: public; Owner: henslowe
--

CREATE TABLE public.wagtailusers_userprofile (
    id integer NOT NULL,
    submitted_notifications boolean NOT NULL,
    approved_notifications boolean NOT NULL,
    rejected_notifications boolean NOT NULL,
    user_id integer NOT NULL,
    preferred_language character varying(10) NOT NULL,
    current_time_zone character varying(40) NOT NULL,
    avatar character varying(100) NOT NULL
);


ALTER TABLE public.wagtailusers_userprofile OWNER TO henslowe;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: henslowe
--

CREATE SEQUENCE public.wagtailusers_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wagtailusers_userprofile_id_seq OWNER TO henslowe;

--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: henslowe
--

ALTER SEQUENCE public.wagtailusers_userprofile_id_seq OWNED BY public.wagtailusers_userprofile.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_collection ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_collectionviewrestriction_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_groupcollectionpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_grouppagepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_page ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pagerevision ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pagerevision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_pageviewrestriction_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_site ALTER COLUMN id SET DEFAULT nextval('public.wagtailcore_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtaildocs_document ALTER COLUMN id SET DEFAULT nextval('public.wagtaildocs_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailembeds_embed ALTER COLUMN id SET DEFAULT nextval('public.wagtailembeds_embed_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailforms_formsubmission ALTER COLUMN id SET DEFAULT nextval('public.wagtailforms_formsubmission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailimages_image ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailimages_rendition ALTER COLUMN id SET DEFAULT nextval('public.wagtailimages_rendition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailredirects_redirect ALTER COLUMN id SET DEFAULT nextval('public.wagtailredirects_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailsearch_editorspick ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_editorspick_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailsearch_query ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits ALTER COLUMN id SET DEFAULT nextval('public.wagtailsearch_querydailyhits_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailusers_userprofile ALTER COLUMN id SET DEFAULT nextval('public.wagtailusers_userprofile_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.auth_group (id, name) FROM stdin;
1	Moderators
2	Editors
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	2	1
3	1	2
4	1	3
5	1	4
6	2	2
7	2	3
8	2	4
9	1	5
10	1	6
11	1	7
12	2	5
13	2	6
14	2	7
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 14, true);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can access Wagtail admin	2	access_admin
2	Can add document	3	add_document
3	Can change document	3	change_document
4	Can delete document	3	delete_document
5	Can add image	4	add_image
6	Can change image	4	change_image
7	Can delete image	4	delete_image
8	Can add log entry	5	add_logentry
9	Can change log entry	5	change_logentry
10	Can delete log entry	5	delete_logentry
11	Can add permission	6	add_permission
12	Can change permission	6	change_permission
13	Can delete permission	6	delete_permission
14	Can add group	7	add_group
15	Can change group	7	change_group
16	Can delete group	7	delete_group
17	Can add user	8	add_user
18	Can change user	8	change_user
19	Can delete user	8	delete_user
20	Can add content type	9	add_contenttype
21	Can change content type	9	change_contenttype
22	Can delete content type	9	delete_contenttype
23	Can add session	10	add_session
24	Can change session	10	change_session
25	Can delete session	10	delete_session
26	Can add page	1	add_page
27	Can change page	1	change_page
28	Can delete page	1	delete_page
29	Can add group collection permission	11	add_groupcollectionpermission
30	Can change group collection permission	11	change_groupcollectionpermission
31	Can delete group collection permission	11	delete_groupcollectionpermission
32	Can add collection	12	add_collection
33	Can change collection	12	change_collection
34	Can delete collection	12	delete_collection
35	Can add group page permission	13	add_grouppagepermission
36	Can change group page permission	13	change_grouppagepermission
37	Can delete group page permission	13	delete_grouppagepermission
38	Can add page view restriction	14	add_pageviewrestriction
39	Can change page view restriction	14	change_pageviewrestriction
40	Can delete page view restriction	14	delete_pageviewrestriction
41	Can add site	15	add_site
42	Can change site	15	change_site
43	Can delete site	15	delete_site
44	Can add collection view restriction	16	add_collectionviewrestriction
45	Can change collection view restriction	16	change_collectionviewrestriction
46	Can delete collection view restriction	16	delete_collectionviewrestriction
47	Can add page revision	17	add_pagerevision
48	Can change page revision	17	change_pagerevision
49	Can delete page revision	17	delete_pagerevision
50	Can add user profile	18	add_userprofile
51	Can change user profile	18	change_userprofile
52	Can delete user profile	18	delete_userprofile
53	Can add rendition	19	add_rendition
54	Can change rendition	19	change_rendition
55	Can delete rendition	19	delete_rendition
56	Can add embed	20	add_embed
57	Can change embed	20	change_embed
58	Can delete embed	20	delete_embed
59	Can add redirect	21	add_redirect
60	Can change redirect	21	change_redirect
61	Can delete redirect	21	delete_redirect
62	Can add form submission	22	add_formsubmission
63	Can change form submission	22	change_formsubmission
64	Can delete form submission	22	delete_formsubmission
65	Can add Tagged Item	23	add_taggeditem
66	Can change Tagged Item	23	change_taggeditem
67	Can delete Tagged Item	23	delete_taggeditem
68	Can add Tag	24	add_tag
69	Can change Tag	24	change_tag
70	Can delete Tag	24	delete_tag
71	Can add Query Daily Hits	25	add_querydailyhits
72	Can change Query Daily Hits	25	change_querydailyhits
73	Can delete Query Daily Hits	25	delete_querydailyhits
74	Can add query	26	add_query
75	Can change query	26	change_query
76	Can delete query	26	delete_query
77	Can add home page	27	add_homepage
78	Can change home page	27	change_homepage
79	Can delete home page	27	delete_homepage
80	Can add catalogue	28	add_catalogue
81	Can change catalogue	28	change_catalogue
82	Can delete catalogue	28	delete_catalogue
83	Can add image	29	add_image
84	Can change image	29	change_image
85	Can delete image	29	delete_image
86	Can add catalogue entry	30	add_catalogueentry
87	Can change catalogue entry	30	change_catalogueentry
88	Can delete catalogue entry	30	delete_catalogueentry
89	Can add rich text page	31	add_richtextpage
90	Can change rich text page	31	change_richtextpage
91	Can delete rich text page	31	delete_richtextpage
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 91, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$lSXn85l5Ek2m$PLZsu64osFCdMrpyeqKafEeiZg32he9klnkHaOIJWmQ=	2018-10-22 15:36:36.052051+00	t	vagrant			vagrant@henslowe.local	t	t	2018-10-22 15:35:20.391561+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: cms_catalogue; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.cms_catalogue (page_ptr_id, body, subtitle) FROM stdin;
30	[{"id": "377b4505-1098-43e9-b15b-96844dd306fa", "type": "paragraph", "value": "<p></p><h2>Introduction</h2><p>Catalogue Adapted by Grace Ioppolo from George Warner, <i>The Catalogue of the Manuscripts and Muniments of Alleyn\\u2019s College of God\\u2019s Gift at Dulwich</i> (London: Longmans, Green, and Co, 1881); and Francis Bickley, <i>The Second Series of The Catalogue of the Manuscripts and Muniments of Alleyn\\u2019s College of God\\u2019s Gift at Dulwich</i> (London: privately printed, 1903).</p><p>The main aim of the Henslowe-Alleyn Digitisation Project is to provide the best possible images of every page of the manuscripts relating to theatrical affairs in the Henslowe-Alleyn Papers at Dulwich College. However, this aim had to be adjusted to suit the funding, resources and equipment available during photography and the conservation of the manuscripts being photographed.</p><h2>The Photography of the Images</h2><p></p><p>Dr David Cooper, assisted by Prof Grace Ioppolo, and, often, Mrs Gill Cooper, photographed each page of the manuscripts in 600 dpi resolution with professional equipment, including a tripod-mounted Sinar camera, two tripod-mounted lights, and specialised Macintosh software to process each photograph. The set-up of each photograph took between 5 and 30 minutes, and the photographs presented here of each image resulted from 16-64 photographs, which were integrated by computer software into one single photograph.</p><p>In order to protect this archive of fragile vellum, parchment and paper manuscripts, the photography of manuscripts in bound volumes was done using a specially-designed cradle (produced under Dr Cooper\\u2019s supervision) that used a vacuum pump to lightly flatten each page against the cradle. In this way, neither the manuscripts nor the binding of their volumes sustained any damage during photography. Larger unbound items, including the muniments, were photographed while placed flat on the floor, using a special, and more complicated, photography process. All of the items, whether bound or unbound, were photographed against a black background that provides the best possible contrast and offers remarkably clear images of watermarks in the paper manuscripts.</p><p>As many pages as possible, including of blank verso or recto pages, were photographed. An exception to this rule were the versos of the Orlando \\u2018part\\u2019, which were not photographed (and contained no text or markings at all). As the \\u2018part\\u2019 was originally put together as a continuous scroll, successive recto images give a close representation of its original state.</p><p>Dr Cooper\\u2019s method of photography produces the best possible result for bound and unbound manuscripts. In only a very few instances is any text obscured by the 19th century binding of the volumes or by the attachment of seals after the completion of manuscripts or muniments. A small number of manuscripts, including those that are still tightly folded and cannot be opened flat, were too fragile to photograph at this time. It is possible that with further funding, more manuscripts in the archive will be photographed and their images added to the site.</p><p>All photography was done at Dulwich College between August 2004 and September 2007. Dr and Mrs Cooper and Prof. Ioppolo remain very grateful to the generous support offered by staff at Dulwich College throughout that time.</p><h2>The Processing of the Images</h2><p>Dr and Mrs Cooper and Prof. Ioppolo processed the images using Adobe Photoshop; this processing mainly consisted of rotating and/or straightening the images and cropping and regularising the background. The resolution of the images was so high that further enhancement was not necessary.</p><p>All images have been rotated to a position in which the text can be most easily read. Thus, some of the images are not in the same position in which the original pages are currently bound. Examples of this can be found in the versos of numerous pages, especially in the latter part of Henslowe\\u2019s \\u2018Diary\\u2019, which was turned upside down on occasion so that Henslowe could write from the last pages forward. The images of these \\u2018upside down\\u2019 original pages, and many others, including those versos of letters containing addresses, have been rotated right side up.</p><h2>The Order of the Images</h2><p>These images are offered as \\u2018thumbnails\\u2019, that is, a small view of each image, which users can click on to bring up that image.</p><p>As noted elsewhere in this website, the numbering of images follows the cataloguing of George Warner and Charles Bickley in series 1 and 2 of <i>The Catalogue of the Manuscripts and Muniments of Alleyn\\u2019s College of God\\u2019s Gift at Dulwich</i> (London, 1881, 1903); both volumes are widely available at major libraries. Prof. Ioppolo has produced a very condensed version of these catalogues for this website.</p><p>As part of their cataloguing, Warner and Bickley used pencil to foliate the volumes of manuscript; that is, they used a pencil to number each recto (or right-hand) page in succession and did not number the verso (or left-hand) page. Warner\\u2019s and Bickley\\u2019s folio numbers supercede those originally written out by the authors of the documents. Items such as Henslowe\\u2019s and Alleyn\\u2019s \\u2018Diaries&#x27; and the manuscript of <i>The Telltale</i> (volumes 7, 9 and 20), which were already bound at the time of cataloguing can therefore be easily indexed by these folio numbers. For example, folio 50r or 50v in Henslowe&#x27;s Diary can be found under the image numbers 07-50r and 07-50v.</p><p>However, Warner and Bickley also had to catalogue hundreds of pages of unbound manuscripts, many consisting of four or more, rather than two, pages each. For example, an individual document can be in the form of a bifolium, that is, a large sheet of paper folded vertically once to produce four pages, or in the form of a bifolium and some single pages. Thus, in MSS 1, 2, 3, and 5, for example, Warner and Bickley placed numerous individual documents (or \\u2018Articles\\u2019 as they called them) in succession. Although they foliated these documents, they indexed them by Article number. Hence, for example, the fourteenth document in MSS 1 is indexed as Article 14 (even though it begins with folio 19). On this website and electronic archive, such items are also represented by Article number, for example, as 01-14, with successive recto and verso numbers included (as in 01-14-01r, 01-14-01v, 01-14-02r, 01-14-02v).</p><p>It is thus important to note that this website does not use the original folio numbers assigned to any &#x27;Article&#x27; by Warner and Bickley. This website does use the original folio numbers assigned to manuscripts that do not consist of \\u2018Articles\\u2019.</p><p>The members of the Project hope that additional funding will become available in the future to allow us to offer simple transcriptions of most, if not all, of these images. Until then, for the transcription and study of the images of Henslowe\\u2019s &#x27;Diary&#x27;, we recommend the use of R. A. Foakes\\u2019s edition (Cambridge: Cambridge University Press, reprinted in 2002).</p>"}]	
\.


--
-- Data for Name: cms_catalogueentry; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.cms_catalogueentry (page_ptr_id, body, subtitle) FROM stdin;
31	[{"id": "e8e3f130-abd6-4c5e-95c0-51814a12a827", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n\\n    \\n    <div class=\\"unorderedList\\"><div class=\\"t01\\"><ul><li>\\n            <a href=\\"/images/MSS-5/Group-045/01r.html\\" class=\\"int\\" target=\\"_blank\\">45</a>. Petition of King James I for the incorporation of the making of\\n            ammunition, with a list in Edward Alleyn's hand of his books on the verso,\\n            no date.</li><li>\\n            <a href=\\"/images/MSS-5/Group-047/01r.html\\" class=\\"int\\" target=\\"_blank\\">47</a>.The Order of Eton College bakehouse and brewhouse, to be used as models\\n            for Dulwich College, Aug. 3, 1618.</li><li>\\n            <a href=\\"/images/MSS-5/Group-048/01r.html\\" class=\\"int\\" target=\\"_blank\\">48</a>. Statutes of the 'Orphanocomium', or the Hospital of the Orphans, and\\n            the 'Gerontocomium', or the Hospital of old Folks, to be used as models for\\n            Dulwich College, 1611.</li></ul></div></div>\\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	Legal and Miscellaneous Papers of Edward Alleyn and his Family,\n                    1612-1626.
35	[{"id": "fd6da89a-418b-4931-b372-38225e846b27", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n\\n    \\n    <div class=\\"unorderedList\\"><div class=\\"t01\\"><ul><li>\\n            <a href=\\"/images/Miscellaneous-Images/01r.html\\" class=\\"int\\" target=\\"_blank\\">1</a>. List in the hand of William Cartwright the younger of his books,\\n            including a First Folio of Shakespeare's pl, no date.</li></ul></div></div>\\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	\N
37	[{"id": "b552a630-48d5-478c-865f-0a947f889cfd", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n   \\n            <select name=\\"menu1\\" id=\\"menu1\\" onchange=\\"jumpMenu('parent',this,0)\\"><option selected=\\"selected\\" value=\\"#\\">Please select...</option><option value=\\"/images/MSS-7/001r.html\\">Page 001r</option><option value=\\"/images/MSS-7/001v.html\\">Page 001v</option><option value=\\"/images/MSS-7/002r.html\\">Page 002r</option><option value=\\"/images/MSS-7/002v.html\\">Page 002v</option><option value=\\"/images/MSS-7/003r.html\\">Page 003r</option><option value=\\"/images/MSS-7/003v.html\\">Page 003v</option><option value=\\"/images/MSS-7/004r.html\\">Page 004r</option><option value=\\"/images/MSS-7/004v.html\\">Page 004v</option><option value=\\"/images/MSS-7/005r.html\\">Page 005r</option><option value=\\"/images/MSS-7/005v.html\\">Page 005v</option><option value=\\"/images/MSS-7/006r.html\\">Page 006r</option><option value=\\"/images/MSS-7/006v.html\\">Page 006v</option><option value=\\"/images/MSS-7/007r.html\\">Page 007r</option><option value=\\"/images/MSS-7/007v.html\\">Page 007v</option><option value=\\"/images/MSS-7/008r.html\\">Page 008r</option><option value=\\"/images/MSS-7/008v.html\\">Page 008v</option><option value=\\"/images/MSS-7/009r.html\\">Page 009r</option><option value=\\"/images/MSS-7/009v.html\\">Page 009v</option><option value=\\"/images/MSS-7/010r.html\\">Page 010r</option><option value=\\"/images/MSS-7/010v.html\\">Page 010v</option><option value=\\"/images/MSS-7/011r.html\\">Page 011r</option><option value=\\"/images/MSS-7/011v.html\\">Page 011v</option><option value=\\"/images/MSS-7/012r.html\\">Page 012r</option><option value=\\"/images/MSS-7/012v.html\\">Page 012v</option><option value=\\"/images/MSS-7/013r.html\\">Page 013r</option><option value=\\"/images/MSS-7/013v.html\\">Page 013v</option><option value=\\"/images/MSS-7/014r.html\\">Page 014r</option><option value=\\"/images/MSS-7/014v.html\\">Page 014v</option><option value=\\"/images/MSS-7/015r.html\\">Page 015r</option><option value=\\"/images/MSS-7/015v.html\\">Page 015v</option><option value=\\"/images/MSS-7/016r.html\\">Page 016r</option><option value=\\"/images/MSS-7/016v.html\\">Page 016v</option><option value=\\"/images/MSS-7/017r.html\\">Page 017r</option><option value=\\"/images/MSS-7/017v.html\\">Page 017v</option><option value=\\"/images/MSS-7/018r.html\\">Page 018r</option><option value=\\"/images/MSS-7/018v.html\\">Page 018v</option><option value=\\"/images/MSS-7/019r.html\\">Page 019r</option><option value=\\"/images/MSS-7/019v.html\\">Page 019v</option><option value=\\"/images/MSS-7/020r.html\\">Page 020r</option><option value=\\"/images/MSS-7/020v.html\\">Page 020v</option><option value=\\"/images/MSS-7/021r.html\\">Page 021r</option><option value=\\"/images/MSS-7/021v.html\\">Page 021v</option><option value=\\"/images/MSS-7/022r.html\\">Page 022r</option><option value=\\"/images/MSS-7/022v.html\\">Page 022v</option><option value=\\"/images/MSS-7/023r.html\\">Page 023r</option><option value=\\"/images/MSS-7/023v.html\\">Page 023v</option><option value=\\"/images/MSS-7/024r.html\\">Page 024r</option><option value=\\"/images/MSS-7/024v.html\\">Page 024v</option><option value=\\"/images/MSS-7/025r.html\\">Page 025r</option><option value=\\"/images/MSS-7/025v.html\\">Page 025v</option><option value=\\"/images/MSS-7/026r.html\\">Page 026r</option><option value=\\"/images/MSS-7/026v.html\\">Page 026v</option><option value=\\"/images/MSS-7/027r.html\\">Page 027r</option><option value=\\"/images/MSS-7/027v.html\\">Page 027v</option><option value=\\"/images/MSS-7/028r.html\\">Page 028r</option><option value=\\"/images/MSS-7/028v.html\\">Page 028v</option><option value=\\"/images/MSS-7/029r.html\\">Page 029r</option><option value=\\"/images/MSS-7/029v.html\\">Page 029v</option><option value=\\"/images/MSS-7/030r.html\\">Page 030r</option><option value=\\"/images/MSS-7/030v.html\\">Page 030v</option><option value=\\"/images/MSS-7/031r.html\\">Page 031r</option><option value=\\"/images/MSS-7/031v.html\\">Page 031v</option><option value=\\"/images/MSS-7/032r.html\\">Page 032r</option><option value=\\"/images/MSS-7/032v.html\\">Page 032v</option><option value=\\"/images/MSS-7/033r.html\\">Page 033r</option><option value=\\"/images/MSS-7/033v.html\\">Page 033v</option><option value=\\"/images/MSS-7/034r.html\\">Page 034r</option><option value=\\"/images/MSS-7/034v.html\\">Page 034v</option><option value=\\"/images/MSS-7/035r.html\\">Page 035r</option><option value=\\"/images/MSS-7/035v.html\\">Page 035v</option><option value=\\"/images/MSS-7/036r.html\\">Page 036r</option><option value=\\"/images/MSS-7/036v.html\\">Page 036v</option><option value=\\"/images/MSS-7/037r.html\\">Page 037r</option><option value=\\"/images/MSS-7/037v.html\\">Page 037v</option><option value=\\"/images/MSS-7/038r.html\\">Page 038r</option><option value=\\"/images/MSS-7/038v.html\\">Page 038v</option><option value=\\"/images/MSS-7/039r.html\\">Page 039r</option><option value=\\"/images/MSS-7/039v.html\\">Page 039v</option><option value=\\"/images/MSS-7/040r.html\\">Page 040r</option><option value=\\"/images/MSS-7/040v.html\\">Page 040v</option><option value=\\"/images/MSS-7/041r.html\\">Page 041r</option><option value=\\"/images/MSS-7/041v.html\\">Page 041v</option><option value=\\"/images/MSS-7/042r.html\\">Page 042r</option><option value=\\"/images/MSS-7/042v.html\\">Page 042v</option><option value=\\"/images/MSS-7/043r.html\\">Page 043r</option><option value=\\"/images/MSS-7/043v.html\\">Page 043v</option><option value=\\"/images/MSS-7/044r.html\\">Page 044r</option><option value=\\"/images/MSS-7/044v.html\\">Page 044v</option><option value=\\"/images/MSS-7/045r.html\\">Page 045r</option><option value=\\"/images/MSS-7/045v.html\\">Page 045v</option><option value=\\"/images/MSS-7/046r.html\\">Page 046r</option><option value=\\"/images/MSS-7/046v.html\\">Page 046v</option><option value=\\"/images/MSS-7/047r.html\\">Page 047r</option><option value=\\"/images/MSS-7/047v.html\\">Page 047v</option><option value=\\"/images/MSS-7/048r.html\\">Page 048r</option><option value=\\"/images/MSS-7/048v.html\\">Page 048v</option><option value=\\"/images/MSS-7/049r.html\\">Page 049r</option><option value=\\"/images/MSS-7/049v.html\\">Page 049v</option><option value=\\"/images/MSS-7/050r.html\\">Page 050r</option><option value=\\"/images/MSS-7/050v.html\\">Page 050v</option><option value=\\"/images/MSS-7/051r.html\\">Page 051r</option><option value=\\"/images/MSS-7/051v.html\\">Page 051v</option><option value=\\"/images/MSS-7/052r.html\\">Page 052r</option><option value=\\"/images/MSS-7/052v.html\\">Page 052v</option><option value=\\"/images/MSS-7/053r.html\\">Page 053r</option><option value=\\"/images/MSS-7/053v.html\\">Page 053v</option><option value=\\"/images/MSS-7/054r.html\\">Page 054r</option><option value=\\"/images/MSS-7/054v.html\\">Page 054v</option><option value=\\"/images/MSS-7/055r.html\\">Page 055r</option><option value=\\"/images/MSS-7/055v.html\\">Page 055v</option><option value=\\"/images/MSS-7/056r.html\\">Page 056r</option><option value=\\"/images/MSS-7/056v.html\\">Page 056v</option><option value=\\"/images/MSS-7/057r.html\\">Page 057r</option><option value=\\"/images/MSS-7/057v.html\\">Page 057v</option><option value=\\"/images/MSS-7/058r.html\\">Page 058r</option><option value=\\"/images/MSS-7/058v.html\\">Page 058v</option><option value=\\"/images/MSS-7/059r.html\\">Page 059r</option><option value=\\"/images/MSS-7/059v.html\\">Page 059v</option><option value=\\"/images/MSS-7/060r.html\\">Page 060r</option><option value=\\"/images/MSS-7/060v.html\\">Page 060v</option><option value=\\"/images/MSS-7/061r.html\\">Page 061r</option><option value=\\"/images/MSS-7/061v.html\\">Page 061v</option><option value=\\"/images/MSS-7/062r.html\\">Page 062r</option><option value=\\"/images/MSS-7/062v.html\\">Page 062v</option><option value=\\"/images/MSS-7/063r.html\\">Page 063r</option><option value=\\"/images/MSS-7/063v.html\\">Page 063v</option><option value=\\"/images/MSS-7/064r.html\\">Page 064r</option><option value=\\"/images/MSS-7/064v.html\\">Page 064v</option><option value=\\"/images/MSS-7/065r.html\\">Page 065r</option><option value=\\"/images/MSS-7/065v.html\\">Page 065v</option><option value=\\"/images/MSS-7/066r.html\\">Page 066r</option><option value=\\"/images/MSS-7/066v.html\\">Page 066v</option><option value=\\"/images/MSS-7/067r.html\\">Page 067r</option><option value=\\"/images/MSS-7/067v.html\\">Page 067v</option><option value=\\"/images/MSS-7/068r.html\\">Page 068r</option><option value=\\"/images/MSS-7/068v.html\\">Page 068v</option><option value=\\"/images/MSS-7/069r.html\\">Page 069r</option><option value=\\"/images/MSS-7/069v.html\\">Page 069v</option><option value=\\"/images/MSS-7/070r.html\\">Page 070r</option><option value=\\"/images/MSS-7/070v.html\\">Page 070v</option><option value=\\"/images/MSS-7/071r.html\\">Page 071r</option><option value=\\"/images/MSS-7/071v.html\\">Page 071v</option><option value=\\"/images/MSS-7/072r.html\\">Page 072r</option><option value=\\"/images/MSS-7/072v.html\\">Page 072v</option><option value=\\"/images/MSS-7/073r.html\\">Page 073r</option><option value=\\"/images/MSS-7/073v.html\\">Page 073v</option><option value=\\"/images/MSS-7/074r.html\\">Page 074r</option><option value=\\"/images/MSS-7/074v.html\\">Page 074v</option><option value=\\"/images/MSS-7/075r.html\\">Page 075r</option><option value=\\"/images/MSS-7/075v.html\\">Page 075v</option><option value=\\"/images/MSS-7/076r.html\\">Page 076r</option><option value=\\"/images/MSS-7/076v.html\\">Page 076v</option><option value=\\"/images/MSS-7/077r.html\\">Page 077r</option><option value=\\"/images/MSS-7/077v.html\\">Page 077v</option><option value=\\"/images/MSS-7/078r.html\\">Page 078r</option><option value=\\"/images/MSS-7/078v.html\\">Page 078v</option><option value=\\"/images/MSS-7/079r.html\\">Page 079r</option><option value=\\"/images/MSS-7/079v.html\\">Page 079v</option><option value=\\"/images/MSS-7/080r.html\\">Page 080r</option><option value=\\"/images/MSS-7/080v.html\\">Page 080v</option><option value=\\"/images/MSS-7/081r.html\\">Page 081r</option><option value=\\"/images/MSS-7/081v.html\\">Page 081v</option><option value=\\"/images/MSS-7/082r.html\\">Page 082r</option><option value=\\"/images/MSS-7/082v.html\\">Page 082v</option><option value=\\"/images/MSS-7/083r.html\\">Page 083r</option><option value=\\"/images/MSS-7/083v.html\\">Page 083v</option><option value=\\"/images/MSS-7/084r.html\\">Page 084r</option><option value=\\"/images/MSS-7/084v.html\\">Page 084v</option><option value=\\"/images/MSS-7/085r.html\\">Page 085r</option><option value=\\"/images/MSS-7/085v.html\\">Page 085v</option><option value=\\"/images/MSS-7/086r.html\\">Page 086r</option><option value=\\"/images/MSS-7/086v.html\\">Page 086v</option><option value=\\"/images/MSS-7/087r.html\\">Page 087r</option><option value=\\"/images/MSS-7/087v.html\\">Page 087v</option><option value=\\"/images/MSS-7/088r.html\\">Page 088r</option><option value=\\"/images/MSS-7/088v.html\\">Page 088v</option><option value=\\"/images/MSS-7/089r.html\\">Page 089r</option><option value=\\"/images/MSS-7/089v.html\\">Page 089v</option><option value=\\"/images/MSS-7/090r.html\\">Page 090r</option><option value=\\"/images/MSS-7/090v.html\\">Page 090v</option><option value=\\"/images/MSS-7/091r.html\\">Page 091r</option><option value=\\"/images/MSS-7/091v.html\\">Page 091v</option><option value=\\"/images/MSS-7/092r.html\\">Page 092r</option><option value=\\"/images/MSS-7/092v.html\\">Page 092v</option><option value=\\"/images/MSS-7/093r.html\\">Page 093r</option><option value=\\"/images/MSS-7/093v.html\\">Page 093v</option><option value=\\"/images/MSS-7/094r.html\\">Page 094r</option><option value=\\"/images/MSS-7/094v.html\\">Page 094v</option><option value=\\"/images/MSS-7/095r.html\\">Page 095r</option><option value=\\"/images/MSS-7/095v.html\\">Page 095v</option><option value=\\"/images/MSS-7/096r.html\\">Page 096r</option><option value=\\"/images/MSS-7/096v.html\\">Page 096v</option><option value=\\"/images/MSS-7/097r.html\\">Page 097r</option><option value=\\"/images/MSS-7/097v.html\\">Page 097v</option><option value=\\"/images/MSS-7/098r.html\\">Page 098r</option><option value=\\"/images/MSS-7/098v.html\\">Page 098v</option><option value=\\"/images/MSS-7/099r.html\\">Page 099r</option><option value=\\"/images/MSS-7/099v.html\\">Page 099v</option><option value=\\"/images/MSS-7/100r.html\\">Page 100r</option><option value=\\"/images/MSS-7/100v.html\\">Page 100v</option><option value=\\"/images/MSS-7/101r.html\\">Page 101r</option><option value=\\"/images/MSS-7/101v.html\\">Page 101v</option><option value=\\"/images/MSS-7/102r.html\\">Page 102r</option><option value=\\"/images/MSS-7/102v.html\\">Page 102v</option><option value=\\"/images/MSS-7/103r.html\\">Page 103r</option><option value=\\"/images/MSS-7/103v.html\\">Page 103v</option><option value=\\"/images/MSS-7/104r.html\\">Page 104r</option><option value=\\"/images/MSS-7/104v.html\\">Page 104v</option><option value=\\"/images/MSS-7/105r.html\\">Page 105r</option><option value=\\"/images/MSS-7/105v.html\\">Page 105v</option><option value=\\"/images/MSS-7/106r.html\\">Page 106r</option><option value=\\"/images/MSS-7/106v.html\\">Page 106v</option><option value=\\"/images/MSS-7/107r.html\\">Page 107r</option><option value=\\"/images/MSS-7/107v.html\\">Page 107v</option><option value=\\"/images/MSS-7/108r.html\\">Page 108r</option><option value=\\"/images/MSS-7/108v.html\\">Page 108v</option><option value=\\"/images/MSS-7/109r.html\\">Page 109r</option><option value=\\"/images/MSS-7/109v.html\\">Page 109v</option><option value=\\"/images/MSS-7/110r.html\\">Page 110r</option><option value=\\"/images/MSS-7/110v.html\\">Page 110v</option><option value=\\"/images/MSS-7/111r.html\\">Page 111r</option><option value=\\"/images/MSS-7/111v.html\\">Page 111v</option><option value=\\"/images/MSS-7/112r.html\\">Page 112r</option><option value=\\"/images/MSS-7/112v.html\\">Page 112v</option><option value=\\"/images/MSS-7/113r.html\\">Page 113r</option><option value=\\"/images/MSS-7/113v.html\\">Page 113v</option><option value=\\"/images/MSS-7/114r.html\\">Page 114r</option><option value=\\"/images/MSS-7/114v.html\\">Page 114v</option><option value=\\"/images/MSS-7/115r.html\\">Page 115r</option><option value=\\"/images/MSS-7/115v.html\\">Page 115v</option><option value=\\"/images/MSS-7/116r.html\\">Page 116r</option><option value=\\"/images/MSS-7/116v.html\\">Page 116v</option><option value=\\"/images/MSS-7/117r.html\\">Page 117r</option><option value=\\"/images/MSS-7/117v.html\\">Page 117v</option><option value=\\"/images/MSS-7/118r.html\\">Page 118r</option><option value=\\"/images/MSS-7/118v.html\\">Page 118v</option><option value=\\"/images/MSS-7/119r.html\\">Page 119r</option><option value=\\"/images/MSS-7/119v.html\\">Page 119v</option><option value=\\"/images/MSS-7/120r.html\\">Page 120r</option><option value=\\"/images/MSS-7/120v.html\\">Page 120v</option><option value=\\"/images/MSS-7/121r.html\\">Page 121r</option><option value=\\"/images/MSS-7/121v.html\\">Page 121v</option><option value=\\"/images/MSS-7/122r.html\\">Page 122r</option><option value=\\"/images/MSS-7/122v.html\\">Page 122v</option><option value=\\"/images/MSS-7/123r.html\\">Page 123r</option><option value=\\"/images/MSS-7/123v.html\\">Page 123v</option><option value=\\"/images/MSS-7/124r.html\\">Page 124r</option><option value=\\"/images/MSS-7/124v.html\\">Page 124v</option><option value=\\"/images/MSS-7/125r.html\\">Page 125r</option><option value=\\"/images/MSS-7/125v.html\\">Page 125v</option><option value=\\"/images/MSS-7/126ar.html\\">Page 126ar</option><option value=\\"/images/MSS-7/126av.html\\">Page 126av</option><option value=\\"/images/MSS-7/126br.html\\">Page 126br</option><option value=\\"/images/MSS-7/126bv.html\\">Page 126bv</option><option value=\\"/images/MSS-7/126cr.html\\">Page 126cr</option><option value=\\"/images/MSS-7/126cv.html\\">Page 126cv</option><option value=\\"/images/MSS-7/126dr.html\\">Page 126dr</option><option value=\\"/images/MSS-7/126dv.html\\">Page 126dv</option><option value=\\"/images/MSS-7/126er.html\\">Page 126er</option><option value=\\"/images/MSS-7/126ev.html\\">Page 126ev</option><option value=\\"/images/MSS-7/126r.html\\">Page 126r</option><option value=\\"/images/MSS-7/126v.html\\">Page 126v</option><option value=\\"/images/MSS-7/127r.html\\">Page 127r</option><option value=\\"/images/MSS-7/127v.html\\">Page 127v</option><option value=\\"/images/MSS-7/128r.html\\">Page 128r</option><option value=\\"/images/MSS-7/128v.html\\">Page 128v</option><option value=\\"/images/MSS-7/129r.html\\">Page 129r</option><option value=\\"/images/MSS-7/129v.html\\">Page 129v</option><option value=\\"/images/MSS-7/130r.html\\">Page 130r</option><option value=\\"/images/MSS-7/130v.html\\">Page 130v</option><option value=\\"/images/MSS-7/131r.html\\">Page 131r</option><option value=\\"/images/MSS-7/131v.html\\">Page 131v</option><option value=\\"/images/MSS-7/132r.html\\">Page 132r</option><option value=\\"/images/MSS-7/132v.html\\">Page 132v</option><option value=\\"/images/MSS-7/133r.html\\">Page 133r</option><option value=\\"/images/MSS-7/133v.html\\">Page 133v</option><option value=\\"/images/MSS-7/134r.html\\">Page 134r</option><option value=\\"/images/MSS-7/134v.html\\">Page 134v</option><option value=\\"/images/MSS-7/135r.html\\">Page 135r</option><option value=\\"/images/MSS-7/135v.html\\">Page 135v</option><option value=\\"/images/MSS-7/136r.html\\">Page 136r</option><option value=\\"/images/MSS-7/136v.html\\">Page 136v</option><option value=\\"/images/MSS-7/137r.html\\">Page 137r</option><option value=\\"/images/MSS-7/137v.html\\">Page 137v</option><option value=\\"/images/MSS-7/138r.html\\">Page 138r</option><option value=\\"/images/MSS-7/138v.html\\">Page 138v</option><option value=\\"/images/MSS-7/139r.html\\">Page 139r</option><option value=\\"/images/MSS-7/139v.html\\">Page 139v</option><option value=\\"/images/MSS-7/140r.html\\">Page 140r</option><option value=\\"/images/MSS-7/140v.html\\">Page 140v</option><option value=\\"/images/MSS-7/141r.html\\">Page 141r</option><option value=\\"/images/MSS-7/141v.html\\">Page 141v</option><option value=\\"/images/MSS-7/142r.html\\">Page 142r</option><option value=\\"/images/MSS-7/142v.html\\">Page 142v</option><option value=\\"/images/MSS-7/143r.html\\">Page 143r</option><option value=\\"/images/MSS-7/143v.html\\">Page 143v</option><option value=\\"/images/MSS-7/144r.html\\">Page 144r</option><option value=\\"/images/MSS-7/144v.html\\">Page 144v</option><option value=\\"/images/MSS-7/145r.html\\">Page 145r</option><option value=\\"/images/MSS-7/145v.html\\">Page 145v</option><option value=\\"/images/MSS-7/146r.html\\">Page 146r</option><option value=\\"/images/MSS-7/146v.html\\">Page 146v</option><option value=\\"/images/MSS-7/147r.html\\">Page 147r</option><option value=\\"/images/MSS-7/147v.html\\">Page 147v</option><option value=\\"/images/MSS-7/148r.html\\">Page 148r</option><option value=\\"/images/MSS-7/148v.html\\">Page 148v</option><option value=\\"/images/MSS-7/149r.html\\">Page 149r</option><option value=\\"/images/MSS-7/149v.html\\">Page 149v</option><option value=\\"/images/MSS-7/150r.html\\">Page 150r</option><option value=\\"/images/MSS-7/150v.html\\">Page 150v</option><option value=\\"/images/MSS-7/151r.html\\">Page 151r</option><option value=\\"/images/MSS-7/151v.html\\">Page 151v</option><option value=\\"/images/MSS-7/152r.html\\">Page 152r</option><option value=\\"/images/MSS-7/152v.html\\">Page 152v</option><option value=\\"/images/MSS-7/153r.html\\">Page 153r</option><option value=\\"/images/MSS-7/153v.html\\">Page 153v</option><option value=\\"/images/MSS-7/154r.html\\">Page 154r</option><option value=\\"/images/MSS-7/154v.html\\">Page 154v</option><option value=\\"/images/MSS-7/155r.html\\">Page 155r</option><option value=\\"/images/MSS-7/155v.html\\">Page 155v</option><option value=\\"/images/MSS-7/156r.html\\">Page 156r</option><option value=\\"/images/MSS-7/156v.html\\">Page 156v</option><option value=\\"/images/MSS-7/157r.html\\">Page 157r</option><option value=\\"/images/MSS-7/157v.html\\">Page 157v</option><option value=\\"/images/MSS-7/158r.html\\">Page 158r</option><option value=\\"/images/MSS-7/158v.html\\">Page 158v</option><option value=\\"/images/MSS-7/159r.html\\">Page 159r</option><option value=\\"/images/MSS-7/159v.html\\">Page 159v</option><option value=\\"/images/MSS-7/160r.html\\">Page 160r</option><option value=\\"/images/MSS-7/160v.html\\">Page 160v</option><option value=\\"/images/MSS-7/161r.html\\">Page 161r</option><option value=\\"/images/MSS-7/161v.html\\">Page 161v</option><option value=\\"/images/MSS-7/162r.html\\">Page 162r</option><option value=\\"/images/MSS-7/162v.html\\">Page 162v</option><option value=\\"/images/MSS-7/163r.html\\">Page 163r</option><option value=\\"/images/MSS-7/163v.html\\">Page 163v</option><option value=\\"/images/MSS-7/164r.html\\">Page 164r</option><option value=\\"/images/MSS-7/164v.html\\">Page 164v</option><option value=\\"/images/MSS-7/165r.html\\">Page 165r</option><option value=\\"/images/MSS-7/165v.html\\">Page 165v</option><option value=\\"/images/MSS-7/166r.html\\">Page 166r</option><option value=\\"/images/MSS-7/166v.html\\">Page 166v</option><option value=\\"/images/MSS-7/167r.html\\">Page 167r</option><option value=\\"/images/MSS-7/167v.html\\">Page 167v</option><option value=\\"/images/MSS-7/168r.html\\">Page 168r</option><option value=\\"/images/MSS-7/168v.html\\">Page 168v</option><option value=\\"/images/MSS-7/169r.html\\">Page 169r</option><option value=\\"/images/MSS-7/169v.html\\">Page 169v</option><option value=\\"/images/MSS-7/170r.html\\">Page 170r</option><option value=\\"/images/MSS-7/170v.html\\">Page 170v</option><option value=\\"/images/MSS-7/171r.html\\">Page 171r</option><option value=\\"/images/MSS-7/171v.html\\">Page 171v</option><option value=\\"/images/MSS-7/172r.html\\">Page 172r</option><option value=\\"/images/MSS-7/172v.html\\">Page 172v</option><option value=\\"/images/MSS-7/173r.html\\">Page 173r</option><option value=\\"/images/MSS-7/173v.html\\">Page 173v</option><option value=\\"/images/MSS-7/174r.html\\">Page 174r</option><option value=\\"/images/MSS-7/174v.html\\">Page 174v</option><option value=\\"/images/MSS-7/175r.html\\">Page 175r</option><option value=\\"/images/MSS-7/175v.html\\">Page 175v</option><option value=\\"/images/MSS-7/176r.html\\">Page 176r</option><option value=\\"/images/MSS-7/176v.html\\">Page 176v</option><option value=\\"/images/MSS-7/177r.html\\">Page 177r</option><option value=\\"/images/MSS-7/177v.html\\">Page 177v</option><option value=\\"/images/MSS-7/178r.html\\">Page 178r</option><option value=\\"/images/MSS-7/178v.html\\">Page 178v</option><option value=\\"/images/MSS-7/179r.html\\">Page 179r</option><option value=\\"/images/MSS-7/179v.html\\">Page 179v</option><option value=\\"/images/MSS-7/180r.html\\">Page 180r</option><option value=\\"/images/MSS-7/180v.html\\">Page 180v</option><option value=\\"/images/MSS-7/181r.html\\">Page 181r</option><option value=\\"/images/MSS-7/181v.html\\">Page 181v</option><option value=\\"/images/MSS-7/182r.html\\">Page 182r</option><option value=\\"/images/MSS-7/182v.html\\">Page 182v</option><option value=\\"/images/MSS-7/183r.html\\">Page 183r</option><option value=\\"/images/MSS-7/183v.html\\">Page 183v</option><option value=\\"/images/MSS-7/184r.html\\">Page 184r</option><option value=\\"/images/MSS-7/184v.html\\">Page 184v</option><option value=\\"/images/MSS-7/185r.html\\">Page 185r</option><option value=\\"/images/MSS-7/185v.html\\">Page 185v</option><option value=\\"/images/MSS-7/186r.html\\">Page 186r</option><option value=\\"/images/MSS-7/186v.html\\">Page 186v</option><option value=\\"/images/MSS-7/187r.html\\">Page 187r</option><option value=\\"/images/MSS-7/187v.html\\">Page 187v</option><option value=\\"/images/MSS-7/188r.html\\">Page 188r</option><option value=\\"/images/MSS-7/188v.html\\">Page 188v</option><option value=\\"/images/MSS-7/189r.html\\">Page 189r</option><option value=\\"/images/MSS-7/189v.html\\">Page 189v</option><option value=\\"/images/MSS-7/190r.html\\">Page 190r</option><option value=\\"/images/MSS-7/190v.html\\">Page 190v</option><option value=\\"/images/MSS-7/191r.html\\">Page 191r</option><option value=\\"/images/MSS-7/191v.html\\">Page 191v</option><option value=\\"/images/MSS-7/192r.html\\">Page 192r</option><option value=\\"/images/MSS-7/192v.html\\">Page 192v</option><option value=\\"/images/MSS-7/193r.html\\">Page 193r</option><option value=\\"/images/MSS-7/193v.html\\">Page 193v</option><option value=\\"/images/MSS-7/194r.html\\">Page 194r</option><option value=\\"/images/MSS-7/194v.html\\">Page 194v</option><option value=\\"/images/MSS-7/195r.html\\">Page 195r</option><option value=\\"/images/MSS-7/195v.html\\">Page 195v</option><option value=\\"/images/MSS-7/196r.html\\">Page 196r</option><option value=\\"/images/MSS-7/196v.html\\">Page 196v</option><option value=\\"/images/MSS-7/197r.html\\">Page 197r</option><option value=\\"/images/MSS-7/197v.html\\">Page 197v</option><option value=\\"/images/MSS-7/198r.html\\">Page 198r</option><option value=\\"/images/MSS-7/198v.html\\">Page 198v</option><option value=\\"/images/MSS-7/199r.html\\">Page 199r</option><option value=\\"/images/MSS-7/199v.html\\">Page 199v</option><option value=\\"/images/MSS-7/200r.html\\">Page 200r</option><option value=\\"/images/MSS-7/200v.html\\">Page 200v</option><option value=\\"/images/MSS-7/201r.html\\">Page 201r</option><option value=\\"/images/MSS-7/201v.html\\">Page 201v</option><option value=\\"/images/MSS-7/202r.html\\">Page 202r</option><option value=\\"/images/MSS-7/202v.html\\">Page 202v</option><option value=\\"/images/MSS-7/203r.html\\">Page 203r</option><option value=\\"/images/MSS-7/203v.html\\">Page 203v</option><option value=\\"/images/MSS-7/204r.html\\">Page 204r</option><option value=\\"/images/MSS-7/204v.html\\">Page 204v</option><option value=\\"/images/MSS-7/205r.html\\">Page 205r</option><option value=\\"/images/MSS-7/205v.html\\">Page 205v</option><option value=\\"/images/MSS-7/206r.html\\">Page 206r</option><option value=\\"/images/MSS-7/206v.html\\">Page 206v</option><option value=\\"/images/MSS-7/207r.html\\">Page 207r</option><option value=\\"/images/MSS-7/207v.html\\">Page 207v</option><option value=\\"/images/MSS-7/208r.html\\">Page 208r</option><option value=\\"/images/MSS-7/208v.html\\">Page 208v</option><option value=\\"/images/MSS-7/209r.html\\">Page 209r</option><option value=\\"/images/MSS-7/209v.html\\">Page 209v</option><option value=\\"/images/MSS-7/210r.html\\">Page 210r</option><option value=\\"/images/MSS-7/210v.html\\">Page 210v</option><option value=\\"/images/MSS-7/211r.html\\">Page 211r</option><option value=\\"/images/MSS-7/211v.html\\">Page 211v</option><option value=\\"/images/MSS-7/212r.html\\">Page 212r</option><option value=\\"/images/MSS-7/212v.html\\">Page 212v</option><option value=\\"/images/MSS-7/213r.html\\">Page 213r</option><option value=\\"/images/MSS-7/213v.html\\">Page 213v</option><option value=\\"/images/MSS-7/214r.html\\">Page 214r</option><option value=\\"/images/MSS-7/214v.html\\">Page 214v</option><option value=\\"/images/MSS-7/215r.html\\">Page 215r</option><option value=\\"/images/MSS-7/215v.html\\">Page 215v</option><option value=\\"/images/MSS-7/216r.html\\">Page 216r</option><option value=\\"/images/MSS-7/216v.html\\">Page 216v</option><option value=\\"/images/MSS-7/217r.html\\">Page 217r</option><option value=\\"/images/MSS-7/217v.html\\">Page 217v</option><option value=\\"/images/MSS-7/218r.html\\">Page 218r</option><option value=\\"/images/MSS-7/218v.html\\">Page 218v</option><option value=\\"/images/MSS-7/219r.html\\">Page 219r</option><option value=\\"/images/MSS-7/219v.html\\">Page 219v</option><option value=\\"/images/MSS-7/220r.html\\">Page 220r</option><option value=\\"/images/MSS-7/220v.html\\">Page 220v</option><option value=\\"/images/MSS-7/221r.html\\">Page 221r</option><option value=\\"/images/MSS-7/221v.html\\">Page 221v</option><option value=\\"/images/MSS-7/222r.html\\">Page 222r</option><option value=\\"/images/MSS-7/222v.html\\">Page 222v</option><option value=\\"/images/MSS-7/223r.html\\">Page 223r</option><option value=\\"/images/MSS-7/223v.html\\">Page 223v</option><option value=\\"/images/MSS-7/224r.html\\">Page 224r</option><option value=\\"/images/MSS-7/224v.html\\">Page 224v</option><option value=\\"/images/MSS-7/225r.html\\">Page 225r</option><option value=\\"/images/MSS-7/225v.html\\">Page 225v</option><option value=\\"/images/MSS-7/226r.html\\">Page 226r</option><option value=\\"/images/MSS-7/226v.html\\">Page 226v</option><option value=\\"/images/MSS-7/227r.html\\">Page 227r</option><option value=\\"/images/MSS-7/227v.html\\">Page 227v</option><option value=\\"/images/MSS-7/228r.html\\">Page 228r</option><option value=\\"/images/MSS-7/228v.html\\">Page 228v</option><option value=\\"/images/MSS-7/229r.html\\">Page 229r</option><option value=\\"/images/MSS-7/229v.html\\">Page 229v</option><option value=\\"/images/MSS-7/230r.html\\">Page 230r</option><option value=\\"/images/MSS-7/230v.html\\">Page 230v</option><option value=\\"/images/MSS-7/231r.html\\">Page 231r</option><option value=\\"/images/MSS-7/231v.html\\">Page 231v</option><option value=\\"/images/MSS-7/232r.html\\">Page 232r</option><option value=\\"/images/MSS-7/232v.html\\">Page 232v</option><option value=\\"/images/MSS-7/233r.html\\">Page 233r</option><option value=\\"/images/MSS-7/233v.html\\">Page 233v</option><option value=\\"/images/MSS-7/234r.html\\">Page 234r</option><option value=\\"/images/MSS-7/234v.html\\">Page 234v</option><option value=\\"/images/MSS-7/235r.html\\">Page 235r</option><option value=\\"/images/MSS-7/235v.html\\">Page 235v</option><option value=\\"/images/MSS-7/236r.html\\">Page 236r</option><option value=\\"/images/MSS-7/236v.html\\">Page 236v</option><option value=\\"/images/MSS-7/237r.html\\">Page 237r</option><option value=\\"/images/MSS-7/237v.html\\">Page 237v</option><option value=\\"/images/MSS-7/238r.html\\">Page 238r</option><option value=\\"/images/MSS-7/238v.html\\">Page 238v</option></select>\\n    \\n     \\n    <p>\\u00a0</p> \\n     \\n    <p>The bulk of the contents relate to the Rose and the Fortune Theatres and the\\n        theatrical companies in which Henslowe was interested. Among other valuable\\n        matter are included lists of plays acted, noting the daily receipts and first\\n        performances, transactions with and payments to authors and actors, payments to\\n        the censor, the Master of the Revels, and disbursements for the building of the\\n        Fortune Theatre, and for repairs, theatrical properites, costumes and other\\n        materials.</p>\\n    <p>The entries are generally made by Henslowe himself, but in various other places\\n        occur the handwritings, with signatures, of the dramatists George Chapman, Henry\\n        Chettle, John Day, Thomas Dekker, Michael Drayton, Richard Hathaway, William\\n        Haughton, Henry Porter, William Rankins, Samuel Rowley, Anthoney Wadeson, and\\n        Robert Wilson, together with those of a large number of actors. Mention is also\\n        made of Thomas Heywood, Ben Jonson, John Marston, Thomas Middleton, Anthony\\n        Munday, Thomas Nash, Wentworth Smith, and John Webster.</p>\\n    <p>Interspersed are various accounts unconnected with the stage, relating to private\\n        and family business, advances made on pledges, and the cutting of wood in\\n        Ashdown Forest in the county of Sussex. The last-named accounts are at the end,\\n        reversing the volume, and belong to the years 1577 and 1578.</p>\\n    <p>For a complete transcription of the portions of the Diary comprising theatrical\\n        matters, as well as an index to them, see <em>Henslowe's Diary</em>, ed.\\n        R. A. Foakes and F. T. Rickert (Cambridge University Press, 1960, rep. 2002).\\n        Also see the Digital Essays.</p>\\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	Diary and Account Book of Philip Henslowe, 1592-1609.
524	[{"id": "1b12ff45-41f3-4f09-b1b0-f81285d77921", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n\\n    <div class=\\"unorderedList\\"><div class=\\"t01\\"><ul><li>\\n            <a href=\\"/images/MSS-2/Article-001/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 1</a>. Letter from Philip Henslowe to Edward Alleyn about acquiring\\n            the reversion of the Mastership of the Royal Game of Bears, etc., from Queen\\n            Elizabeth I, June 4, 1598,</li><li>\\n            <a href=\\"/images/MSS-2/Article-002/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 2</a>. Letter from Arthur Langworth to Edward Alleyn about acquiring\\n            the reversion of the Mastership of the Royal Game of Bears, etc., June,\\n            1598.</li><li>\\n            <a href=\\"/images/MSS-2/Article-003/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 3</a>. Letter from John Dorrington to Philip Henslowe about Queen\\n            Elizabeth I's order for games, May 1600.</li><li>\\n            <a href=\\"/images/MSS-2/Article-004/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 4</a>. Acquittance from Richard Lefwicke to Philip Henslowe for rent\\n            on the Bear Garden, Jan. 1, 1601/2.</li><li>\\n            <a href=\\"/images/MSS-2/Article-005/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 5</a>. Letters Patent from King James I to Philip Henslowe and Edward\\n            Alleyn for the Mastership of the Royal Game of bears, bulls and mastiff\\n            dogs, Nov. 24, 1604. See Digital Essays.</li><li>\\n            <a href=\\"/images/MSS-2/Article-006/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 6</a>. Acquittance form Sir Wiiliam Seward to Philip Henslowe and\\n            Edward Alleyn for the assignment of the patent of the Mastership of the\\n            Royal Game of Bears, etc., Nov. 28, 1604.</li><li>\\n            Article 7. [Image not available] Contratct of Peter Street, carpenter, with Philip Henslowe and\\n            Edward Alleyn to pull down the Bear Garden and to rebuild the theatre [as\\n            the Hope], with dimensions of both, June 2, 1606.</li><li>\\n            <a href=\\"/images/MSS-2/Article-008/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 8</a>. Letter from Philip Henslowe and Edward Alleyn to Christopher\\n            Goffe authorising him to acquire dogs for the Royal Game, June, 1607.</li><li>\\n            <a href=\\"/images/MSS-2/Article-009/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 9</a>. Petition of Philip Henslowe and Edward Alleyn to King James I\\n            complaining of the high cost of their office and their loss of the license\\n            to bait on Sundays and of the loss of bears in a recent bait in front of\\n            King James and King Christian IV of Denmark, and requesting a full licence\\n            and further fees (three copies), c. 1607.</li><li>\\n            <a href=\\"/images/MSS-2/Article-010/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 10</a>. Rough memorandum-book, containing the receipts and payments of\\n            a travelling bear-ward employed by Philip Henslowe and Edward Alleyn, Aug.\\n            13-Sept. 20, 1608.</li><li>\\n            <a href=\\"/images/MSS-2/Article-011/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 11</a>. Letter from Henry Middleton to Edward Alleyn asking to return\\n            a bear, with rerference to Sir Thomas Middleton, Mar. 9, 1608/9.</li><li>\\n            <a href=\\"/images/MSS-2/Article-012/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 12</a>. Letter from Thomas Bowker to Edward Alleyn about a dog, with\\n            numerous notes on the verso by Alleyn of payments, including for a book of\\n            Shakespeare's Sonnets, June 19, 1609.</li><li>\\n            <a href=\\"/images/MSS-2/Article-013/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 13</a>. Letter from Edward Barrett to Edward Alleyn about animals for\\n            the Royal Game, no date.</li><li>\\n            <a href=\\"/images/MSS-2/Article-014/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 14</a>. Letter from John Ithell about animals, Oct. 30, 1610.</li><li>\\n            <a href=\\"/images/MSS-2/Article-015/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 15</a>. Depositions of Bryan Bradley and Richard Tyler, servants of\\n            Henslowe and Alleyn, who were mistreated by Dr Steward, a magistrate in\\n            Hampshire, who locked them up as highwaymen while on Royal Game business,\\n            1611.</li><li>\\n            <a href=\\"/images/MSS-2/Article-016/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 16</a>. Statement of the case against Dr Steward, as above, 1611.</li><li>\\n            <a href=\\"/images/MSS-2/Article-017/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 17</a>. Letter from Edward Russell, third Earl of Bedford, to Edward\\n            Alleyn about the taking up of his dog, April 13, 1612.</li><li>\\n            <a href=\\"/images/MSS-2/Article-018/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 18</a>. Bargain and sale of a male lion by Thomas Morris and William\\n            Grove to William Peadle, April 13, 1612.</li><li>\\n            <a href=\\"/images/MSS-2/Article-019/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 19</a>. Commission from Philip Henslowe and Edward Alleyn to empower\\n            John Morgan, Richard Tyler and Bryan Bradley to acquire animals for the\\n            Royal Game, April 18, 1612.</li><li>\\n            <a href=\\"/images/MSS-2/Article-020/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 20</a>. Petition from Philip Henslowe and Edward Alleyn to the same\\n            effect as Article 9 above, listing \\u00a3200 loss of animals in baiting before\\n            Henri de la Tour, Duc de Bouillon, 1612.</li><li>\\n            <a href=\\"/images/MSS-2/Article-021/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 21</a>. Warrant from Thomas Dutton, Thomas Brooke, and Thomas\\n            Marburie, justices of Cheshire, to assist Thomas Radford to take up animals\\n            for the Royal Game, May 3, 1613.</li><li>\\n            <a href=\\"/images/MSS-2/Article-022/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 22</a>. Warrant from John Ireland, Edward Stanley, and John Ashton,\\n            justices of Lancashire, to the same effect, May 19, 1613.</li><li>\\n            <a href=\\"/images/MSS-2/Article-023/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 23</a>. Letter from George Brake to Philip Henslowe about the injuries\\n            to Henslowe's servants James Starkey, Thomas Radford and John Pott who were\\n            assaulted in Chester while trying to exercise the commission for the Royal\\n            Game, May 19, 1613. </li><li>\\n            <a href=\\"/images/MSS-2/Article-024/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 24</a>. Deposition of Richard Barrowe, Anne Hall and others relatitve\\n            to the assault by Richard Penketh and others upon James Starkey, Thomas\\n            Radford, and John Pott, May 30, 1613. </li><li>\\n            <a href=\\"/images/MSS-2/Article-025/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 25</a>. Bond from Thomas Radford to Philip Henslowe for the commission\\n            to take up animals for the Royal Game, June 7, 1613.</li><li>\\n            <a href=\\"/images/MSS-2/Article-026/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 26</a>. Draft and fair copy petitions from Philip Henslowe and Edward\\n            Alleyn to Thomas Howard, Earl of Suffolk and the Lord Chamberlain,\\n            complaining of the ill treatment of their servants in the west country by\\n            Sir Morris Barlet, a justice of the peace, and assaults committed by others,\\n            and asking for the arrest of the offenders, June-July, 1613.</li><li>\\n            <a href=\\"/images/MSS-2/Article-027/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 27</a>. Letter from Thomas Howard, Earl of Suffolk and the Lord\\n            Chamberlain, to Thomas Dutton, Thomas Brooke, and other justices of the\\n            peace in Chester and Lancaster, requesting that they punish the offenders in\\n            the above matter, July 13, 1613. </li><li>\\n            <a href=\\"/images/MSS-2/Article-028/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 28</a>. Letter from Thomas Dutton and Thomas Brooke to Thomas Howard,\\n            Earl of Suffolk and the Lord Chamberlain, in answer to the above, Aug. 16,\\n            1613.</li><li>\\n            <a href=\\"/images/MSS-2/Article-029/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 29</a>. Letter from Thomas Dutton and Thomas Brooke to Philip Henslowe\\n            informing him of the charge of felony made against his deputiesby John\\n            Venables and their failure to bring about a compromise, Aug. 17, 1613.</li><li>\\n            <a href=\\"/images/MSS-2/Article-030/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 30</a>. Declaration by Thomas Radford that for the annual receipt of a\\n            mastiff dog for the King's use from the townsmen of Manchester in\\n            Lancashire, Radford promises not to take up any more of their animals, c.\\n            1613.</li><li>\\n            <a href=\\"/images/MSS-2/Article-031/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 31</a>. Letter from Anthony Cooke to Thomas Howard defending himself\\n            against charges of opposing the taking up of animals by Bear Garden\\n            officials, pre-1616.</li><li>\\n            <a href=\\"/images/MSS-2/Article-032/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 32</a>. Letter from Meredith Morgan to Philip Henslowe asking him to\\n            receive a wolf, pre-1616.</li><li>\\n            <a href=\\"/images/MSS-2/Article-033/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 33</a>. Letter from Thomas Yonge (or Young) to Edward Alleyn or Philip\\n            Henslowe about providing dogs, Aug. 24, pre-1616.</li><li>\\n            <a href=\\"/images/MSS-2/Article-034/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 34</a>. Petition to William Herbert, third Earl of Pembroke, the Lord\\n            Chamberlain, from Edward Alleyn in answer to a petition against him relating\\n            to the the baiting of bears, c. 1617-19.</li><li>\\n            <a href=\\"/images/MSS-2/Article-035/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 35</a>. Statement in the hand of Edward Alleyn of matters in dispute\\n            between himself and Jacob Meade relative to the Bear Garden, the stock of\\n            animals, and other matters appertaining to the estate of Philip Henslowe, c.\\n            1617-19.</li><li>\\n            <a href=\\"/images/MSS-2/Article-036/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 36</a>. Letter from John Nurse to Edward Alleyn about baiting and\\n            dated receipts, June 23, 1625-July 14, 1626.</li><li>\\n            <a href=\\"/images/MSS-2/Article-037/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 37</a>. Petition to the Privy Council and the Commissioners of the\\n            Treasury from Edward Alleyn asking for payment in arrears for Royal Game\\n            expenses, no date.</li><li>\\n            <a href=\\"/images/MSS-2/Article-038/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 38</a>. Letter from Sir William Fawnte (or Faunt) to Edward Alleyn\\n            discussing Fawnte's stock of dogs, no date.</li><li>\\n            <a href=\\"/images/MSS-2/Article-039/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 39</a>. Letter from Sir William Fawnte (or Faunt) to Edward Alleyn,\\n            asking for male black bear cubs, no date.</li><li>\\n            <a href=\\"/images/MSS-2/Article-040/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 40</a>. Letter from Sir William Fawnte (or Faunt) to Edward Alleyn,\\n            asking for a male bear cub, Nov. 9 (no year).</li><li>\\n            <a href=\\"/images/MSS-2/Article-041/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 41</a>. Advertisement for the Bear Garden of a match: between dogs and\\n            a single bear; to 'wearie a bull dead at the stake'; 'sport with the horse\\n            and ape'; and the whipping of the blind bear, c. 1603-1625.</li><li>\\n            <a href=\\"/images/MSS-2/Article-042/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 42</a>. Advertisement of a general prize for markmanship contests in\\n            St George's Fields using Muskets or Long Bows and arrows, with a list of\\n            prizes, Aug 21, c. 1603-1646.</li></ul></div></div>\\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	Letters and Papers of Philip Henslowe and Edward Alleyn as Joint\n                Masters of the Royal Game of Bears, Bulls and Mastiff Dogs, 1598-1626.
566	[{"id": "9e19899c-7937-42a5-b152-6dc9797556c6", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n   \\n   \\n      \\n\\n            \\n            <div class=\\"unorderedList\\"><div class=\\"t01\\"><ul><li>\\n                  <a href=\\"/images/MSS-3/Article-001/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 1</a>. Letter from Alexander White to Philip Henslowe, Feb. 21,\\n                        1576/7.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-002/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 2</a>. Letter from Thomas Keys to Alexander Whyt (or White), April 7,\\n                        c. 1580-1600.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-003/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 3</a>. Letter from The Privy Council to various Aldermen for the\\n                        relief of John Alleyn aginst Thomas Martin, July 14, 1589.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-004/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 4</a>. Letter from Charles Howard, Lord Howard of Effingham, to\\n                        William Drewry, in regards to the above, Dec. 1589.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-005/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 5</a>. Letter from Francis Henslowe to Philip Henslowe for a loan, c.\\n                        1590.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-006/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 6</a>. Letter from William Henlsowe to Philip Henslowe about an action\\n                        at law, Dec. 7, 1592.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-007/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 7</a>. Letter from William Crowe to Patrick Brewe, Jan. 12, 1592/3.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-008/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 8</a>. Love verses, beginning, 'Can she excuse my wronges with\\n                        vertious cloke?', 1596.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-009/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 9</a>. Letter from John Langworth to Edward Alleyn about land, Feb. 6,\\n                        1598/9.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-010/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 10</a>. Letter from John Alleyn to Mr Brune or Burne asking for his\\n                        daughter in marriage, no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-011/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 11</a>. Letter from Edward Alleyn to John Page about land, July 15,\\n                        1602.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-012/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 12</a>. Letter from John Page to Edward Alleyn about land, July 17,\\n                        1602.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-013/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 13</a>. Letter from Mercury Patten to Philip Henslowe about a dispute,\\n                        Sept 26, 1603.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-014/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 14</a>. Letter from John Page to Edward Alleyn, about the purchase of\\n                        Riches manor, Jan. 28, 1640.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-015/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 15</a>. Letter from Sir Francis Calton to Mr Harris, about his\\n                        property in Dulwich, c. 1605.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-016/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 16</a>. Sir Francis Calton to Edward Alleyn, lamenting 'cosening\\n                        knaveries' and asking for an advance, with a draft letter from Alleyn about\\n                        the sale of the parsonage of Firle on the verso, Dec. 24, 1605.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-017/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 17</a>. Letter from John Poyntz to Edward Alleyn asking for return of\\n                        his lute, March 6, 1605/6.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-018/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 18</a>. Letter from Sir Francis Calton to Edward Alleyn asking for\\n                        money, July 7, 1607.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-019/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 19</a>. Letter from the same to the same, Oct. 3, 1607.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-020/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 20</a>. Letter from the same to the same, Jan. 22, 1607/8.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-021/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 21</a>. Letter from the same to the same, 1608.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-022/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 22</a>. Letter from the same to the same, April 12, 1608.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-023/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 23</a>. Letter from the same to the same, April 19, 1608.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-024/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 24</a>. Letter from the same to the same, April 25, 1608.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-025/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 25</a>. Letter from the same to the same, June 15, 1608.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-026/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 26</a>. Letter from Sir Francis Calton to Thomas Bolton, the\\n                        scrivener, about money, July 8, 1608.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-027/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 27</a>. Letter from Sir Francis Calton to Edward Alleyn asking for\\n                        money, Sept. 3, 1608.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-028/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 28</a>. Letter from the same to the same, Oct. 14, 1608.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-029/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 29</a>. Letter from the same to the same, Oct. 26, 1608.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-030/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 30</a>. Letter from the same to the same, Nov. 8, 1608.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-031/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 31</a>. Letter from the same to the same, Dec. 30, 1608.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-032/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 32</a>. Letter from Matthias Alleyn to Edward Alleyn, with\\n                        acquittances from Thomas Garland to Henslowe and Alleyn for rent, Jan. 10,\\n                        1608/9-Oct. 14, 1610. See below, Muniment 31.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-033/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 33</a>. Letter from John Langworth to Philip Henslowe about tithes,\\n                        Mar. 12, 1608/9.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-034/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 34</a>. Letter from R. Redmer [possibly the stationer Richard Redmer]\\n                        to Edward Alleyn about the terms of their agreement, July, 1609.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-035/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 35</a>. Letter from the same to the same, Jan. 24 (no year).</li><li>\\n                  <a href=\\"/images/MSS-3/Article-036/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 36</a>. Letter from the same to the same, May 27 (no year).</li><li>\\n                  <a href=\\"/images/MSS-3/Article-037/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 37</a>. Letter from the same to the same, no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-038/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 38</a>. Letter from Sir Francis Calton to Edward Alleyn about a\\n                        bargain in Hampshire, c. 1609.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-039/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 39</a>. Letter from the same to the same asking for a loan, Aug. 18,\\n                        1609.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-040/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 40</a>. Letter from the same to the same, Sept. 29, 1609.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-041/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 41</a>. Letter from the same to the same, Oct. 22, 1609.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-042/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 42</a>. Letter from William Spender to Philip Henslowe, Roger Cole and\\n                        other churchwardens at St Saviour's, Southwark, for relief from poverty, c.\\n                        1609</li><li>\\n                  <a href=\\"/images/MSS-3/Article-043/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 43</a>. Letter from Sir Francis Calton to Edward Alleyn, asking for a\\n                        loan, April 30, 1610.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-044/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 44</a>. Letter from the same to the same concerning Calton's\\n                        daughter's marriage, May 9, 1611.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-045/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 45</a>. Letter from the same to the same about the same, May 12, 1611.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-046/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 46</a>. Letter from Edward Alleyn to Sir Francis Calton about money,\\n                        May, 1611.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-047/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 47</a>. Letter from Sir Francis Calton to Edward Alleyn, May, 1611.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-048/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 48</a>. Letter to Thomas Calton about the sale of property to Alleyn,\\n                        May 19, 1611.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-049/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 49</a>. Letter from Richard Forkench to Edward Alleyn about a bond,\\n                        Nov. 1, 1611.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-050/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 50</a>. Letter from John Herborne to Edward Alleyn about property in\\n                        Dulwich, Jan. 3, 1611/12</li><li>\\n                  <a href=\\"/images/MSS-3/Article-051/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 51</a>. Letter from Sir Francis Calton to Edward Alleyn, asking for a\\n                        loan, March 18, 1611/12.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-052/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 52</a>. Letter from the same to the same about a purchase, March 31,\\n                        1612.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-053/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 53</a>. Letter from the same to the same with acquittance dated March\\n                        31, 1612.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-054/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 54</a>. Letter from the same to the same about leases in Kennington,\\n                        Aug. 15, 1612.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-055/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 55</a>. Letter from the same to the same, no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-056/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 56</a>. Letter from Elizabeth Socklen to Edward Alleyn, Sept. 22,\\n                        1612.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-057/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 57</a>. Letter from John Townley to Edward Alleyn asking for help with\\n                        house repair, Nov. 10, 1612.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-058/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 58</a>. Sir Francis Calton to Edward Alleyn about Kennington manor,\\n                        March 3, 1612/13.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-059/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 59</a>. Letter from the same to the same about the purchase of land\\n                        from Sir Edward Duke, c. 1613.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-060/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 60</a>. Letter from Edward Alleyn to Sir Francis Calton about money,\\n                        c. 1613.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-061/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 61</a>. Letter from John Benson to Edward Alleyn, about glazing a\\n                        Dulwich building, no date, with acquittance dated May 14, 1614.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-062/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 62</a>. Letter from the same to the same, April 22, 1614.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-063/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 63</a>. A. P. to Philip(?) Henslowe, complaining about malicious\\n                        reports, no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-064/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 64</a>. Letter from Samuel Jeynens to Edward Alleyn about chartity\\n                        towards Chelsea College, c. 1615-1620.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-065/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 65</a>. Letter from Samuel Jeynens to the Recorder and Lord Mayor of\\n                        London, Sir Thomas Middleton, and the Lady Weild (or Weld), about\\n                        contributing to the completion of Chelsea College, c. 1615-1620.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-066/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 66</a>. Letter from Cornelius Lymer to Edward Alleyn agreeing to\\n                        preach at the consecration of Dulwich Chapel on Sept. 1, July 22, 1616.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-067/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 67</a>. Letter from the parishioners of St Giles, Cripplegate, to\\n                        Edward Alleyn thanking him for his 'bouneous graunt', Sept. 14, 1616.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-068/01v.html\\" class=\\"int\\" target=\\"_blank\\">Article 68</a>. Letter from Thomas Howard, Earl of Arundell to Edward Alleyn\\n                        asking for the placement of a 'poore fatherles boy' at Alleyn's College,\\n                        Sept. 17, 1616.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-069/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 69</a>. Letter from the Stephen Gosson, Rector, and parishioners of St\\n                        Botolph's, Bishopsgate, to Edward Alleyn presenting three candidates for\\n                        Alleyn's almshouses, Sept. 29, 1616.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-070/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 70</a>. Letter from Stephen Gosson, Rector of St Botolph's,\\n                        Bishopsgate, to Edward Alleyn offering his personal view of the three\\n                        almshouse candidates, Oct. 2, 1616.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-071/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 71</a>. Letter from the Churchwardens and others of the liberty of the\\n                        Clink to Edward Alleyn, presenting a candidate for the almshouse, and\\n                        including eight lines of complimentary doggerel, beginning, 'As god did move\\n                        your mynd to build, c. 1616.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-072/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 72</a>. Letter frrom Thomas Chard to Edward Alleyn detailing his\\n                        desperate situation in Ludgate prison and asking for release, April 14,\\n                        1617.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-073/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 73</a>. Letter from Richard Barlow to Edward Alleyn giving his reasons\\n                        for declining the offer of the ushership of Dulwich College, May 12, 1617.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-074/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 74</a>. Letter from Robert Earle to Edward Alleyn complaining of his\\n                        dealings with Jack Stanton in connection with a lease, June 24, 1617.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-075/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 75</a>. Letter from Robert Newman to Edward Alleyn about the success\\n                        of his lawsuit, July 27, 1617.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-076/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 76</a>. Letter from Stephen Gosson, Rector, and parishioners of St\\n                        Botolph's to Edward Alleyn, presenting three children for Alleyn's school,\\n                        Aug. 7, 1617.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-077/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 77</a>. Letter from Richard Meridall to Joan Alleyn, with laudatory\\n                        verses, beginning, 'Loe heare shee dwells, whome virtue doeth imbrace', no\\n                        date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-078/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 78</a>. Letter from Stephen Gosson, Rector, and parishioners of St\\n                        Botolph's to Edward Alleyn, presenting a candidate for Alleyn's almshouse,\\n                        Sept. 1, 1617.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-079/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 79</a>. Letter from John Warner to Edward Alleyn, recommending Mr\\n                        Streatinge to Alleyn, Jan. 17, 1617/18.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-080/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 80</a>. Letter from John Northe to Edward Alleyn about the making of\\n                        tiles, April 22, 1618.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-081/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 81</a>. Letter from Thomas Grymes to Edward Alleyn about the\\n                        Commissioners for New Biuldings, Aug. 25, 1618.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-082/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 82</a>. Letter from Edward Ferrers to Edward Alleyn, April 13, 1619.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-083/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 83</a>. Letter from Thomas Bolton, the scrivener, to Edward Alleyn\\n                        asking for bail from Marshalsea prison, April 14, 1619.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-084/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 84</a>. Petition to Sir Francis Bacon, Lord Verulam and the Lord\\n                        Chancellor, from Vrsley (or Ursula) Sherberyd, asking to be recommended for\\n                        Alleyn's almshouse, Oct. 7, 1615.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-085/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 85</a>. Letter from Rev. John Harrison to Edward Alleyn excusing\\n                        himself for having secretly married Alleyn's kinswoman, c. 1620.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-086/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 86</a>. Letter from the same to the same, asking Alleyn to be\\n                        godfather to Harrison's son, c. 1620.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-087/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 87</a>. Letter from the same to the same, in answer to a refusal of\\n                        the above request, c. 1620.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-088/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 88</a>. Letter from Thomas Burnet to Mr. Scheargene Owein asking him\\n                        to secure from Alleyn payment for the purchase of Henslowe's place as\\n                        Gentleman Sewer, c. 1621.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-089/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 89</a>. Letter from Alexander Nairne to Edward Alleyn on the same\\n                        subject, July 21, 1621.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-090/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 90</a>. Petition to John Wililams, Bishop of Lincoln and Lord Keeper,\\n                        from John Jones to be recommended for Alleyn's almshouse, c. Aug. 3-Nov. 10,\\n                        1621.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-091/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 91</a>. Letter from Stephen Gosson, Rector, and parishioners of St\\n                        Botolph's, Bishopsgate, to Edward Alleyn, presenting four poor children for\\n                        Dulwich College, March 17, 1621/2.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-092/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 92</a>. Letter from Sir Francis Calton to Edward Alleyn about losses\\n                        for Kennington manor, May 12, 1623.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-093/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 93</a>. Letter from Edward Alleyn to Sir Francis Calton in answer to\\n                        charges of hard dealing with respect to Dulwch and Kennington manors, c.\\n                        1623.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-094/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 94</a>. Letter from John Luntley to Edward Alleyn about rent of\\n                        tenements on the Bankside, Jan. 8, 1623/4.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-095/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 95</a>. Letter from Robert Newman to Edward Alleyn thanking him for\\n                        his good cheer, March 1, 1623/4.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-096/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 96</a>. Letter from Henry Gibb, Groom of the Bedchamber to King James\\n                        I, to Edward Alleyn, thanking him for enrolling a recommended boy in Dulwich\\n                        College, July 23, 1624.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-097/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 97</a>. Letter from Sir John Hungerford to Edward Alleyn to recommend\\n                        Alleyn's 'project' to King James I, c. 1624.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-098/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 98</a>. Letter from Ambrose Wheeler, George Lowe, and George Handcoke\\n                        to Edward Alleyn about his breaking his bargain with them, c. 1624.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-099/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 99</a>. Letter from Ambrose Wheeler to Edward Alleyn entreating him to\\n                        meet them in Chancery to declare his intentions in the 'busines', 1624.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-100/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 100</a>. Letter from William Hervey to Edward Alleyn for permission to\\n                        enclose a small parcel of land, Aug. 27, 1624.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-101/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 101</a>. Letter form E. Skory to Edward Alleyn about various issues,\\n                        Jan. 12, 1624/5.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-102/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 102</a>. Letter from William Beecher to Edward Alleyn presenting a\\n                        candidate for the almshouse, with a draft letter regarding money on the\\n                        versos by Alleyn to his father-in-law John Donne, complaining about Donne's\\n                        'manie vnkind passages' and especially the 'vnkind, vnexspecketed and\\n                        vndeserved deniall of yt comon curtesie afforded to a frend'', c. 1625.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-103/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 103</a>. Letter from Sir Thomas Grymes to Edward Alleyn about a bond,\\n                        Feb. 4, 1624/5.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-104/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 104</a>. Letter from Leonell Tychebourne to Edward Alleyn asking for a\\n                        loan, Oct. 10, 1625.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-105/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 105</a>. Letter from George Cole to Edward Alleyn about debts, Feb.\\n                        16, 1625/6.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-106/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 106</a>. Letter from George Paule to Edward Alleyn about the value of\\n                        the Kennington leases, with a draft on the verso in Alleyn's hand about the\\n                        clauses in Dulwich College statutes, June 26, 1626.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-107/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 107</a>. Letter from John Goodman to Edward Alleyn, with notes of\\n                        Alleyn's financial matters on the verso, July 11, 1626.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-108/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 108</a>. Letter from Henry Underwood to Edward Alleyn, Oct. 14, 1626.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-109/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 109</a>. Nine letters from Edward Alleyn of Newport Pagnell to his\\n                        cousin Edward Alleyn, with a draft of a clause of Dulwich College statutes\\n                        on one verso, c. 1616, </li><li>\\n                  <a href=\\"/images/MSS-3/Article-110/01v.html\\" class=\\"int\\" target=\\"_blank\\">Article 110</a>. Two letters from Matthias Alleyn to Edward Alleyn, April 20,\\n                        March 10 (no year).</li><li>\\n                  <a href=\\"/images/MSS-3/Article-111/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 111</a>. Two letters from Dorothy Calton to Edward Alleyn asking for a\\n                        loan, no dates, with acquittance dated March 20 (no year).</li><li>\\n                  <a href=\\"/images/MSS-3/Article-112/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 112</a>. Petition from Frances Davys to Edward Alleyn for the grant of\\n                        an almshouse in St Giles, Cripplegate, with a letter on the verso from\\n                        Alleyn to John Millin about the almshouse , no date. </li><li>\\n                  <a href=\\"/images/MSS-3/Article-113/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 113</a>. Letter from Isabell Found to Edward Alleyn asking to become\\n                        an almswoman,no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-114/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 114</a>. Letter from William Hull to Edward Alleyn asking for a loan,\\n                        no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-115/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 115</a>. Letter from Richard Kippeis to Edward Alleyn asking for\\n                        reimbursement of a payment to Lady Derby, no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-116/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 116</a>. Letter from Innocent Lanier to Edward Alleyn asking for more\\n                        of his medicinal 'powder', no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-117/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 117</a>. Letter from Innocent Lanier to Sir Francis Calton about their\\n                        bargain relating to Alleyn, no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-118/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 118</a>. Letter from E. Philippes to Edward Alleyn thanking him for a\\n                        gift, no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-119/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 119</a>. Letter from Anne Poyntz to Edward Alleyn asking for a loan,\\n                        no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-120/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 120</a>. Letter from Joan Ratcliff to Edward Alleyn asking for aid, no\\n                        date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-121/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 121</a>. Letter from Joan Ratcliff to Edward Alleyn asking for\\n                        assitance, no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-122/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 122</a>. Letter from Martha and John Stocke to their landlord Edward\\n                        Alleyn, complaining of encroachments on their property, April 19, 1619.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-123/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 123</a>. Letter from William Style to Edward Alleyn, concerning the\\n                        theft of a horse, no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-124/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 124</a>. Letter from Julian Tyson to Edward Alleyn asking for\\n                        assistance, no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-125/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 125</a>. Letter, unsigned, on matters in dispute relating to leases in\\n                        Dulwich, no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-126/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 126</a>. Letter, unsigned, on the inspection of weights and measures,\\n                        no date.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-127/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 127</a>. Letter, unsigned, to a woman by a 'pore sheppard'.</li><li>\\n                  <a href=\\"/images/MSS-3/Article-128/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 128</a>. Hymn, in the hand of Edward Alleyn, beginning, 'O prayse ye\\n                        Lord ye seruantes all', six verses, no date </li><li>\\n                  <a href=\\"/images/MSS-3/Article-129/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 129</a>. List, in the hand of J. O Halliwell (afterwards\\n                        Halliwell-Phillips) of thirty-six letters and papers which originally formed\\n                        part of the Dulwich Library collection and were restored by him to the\\n                        College, March 20, 1843 these [items are now bound in their proper\\n                    order].</li></ul></div></div>\\n         <!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	General Correspondence of Edward Alleyn and Philip Henslowe, 1577-1626.
696	[{"id": "0e36ae74-e009-4f9c-b6ed-ec614d107d71", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n   \\n   \\n      \\n\\n            <div class=\\"unorderedList\\"><div class=\\"t01\\"><ul><li>\\n                  <a href=\\"/images/MSS-1/Article-001/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 1</a>. Letter from Thomas Phillipson to Francis -----ton, possibly\\n                        concerning Will Kemp, Aug. 3, 1559.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-002/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 2</a>. Deed of sale of playbooks, costumes and other theatrical\\n                        property by Richard Jones to Edward Alleyn, Jan. 3, 1588/9.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-003/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 3</a>. Deed of sale of a costume by William Wardelo to John Alleyn,\\n                        Aug. 8, 1589.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-004/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 4</a>. Deed of sale of a costume by Isaacke Burges to John Alleyn,\\n                        Nov. 23, 1590.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-005/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 5</a>. Deed of sale of a costume by John Clyffe to John Alleyn, May 6,\\n                        1591.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-006/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 6</a>. Letter from W. P. to Edward Alleyn about a theatrical wager,\\n                        with six lines of verse beginning 'Deny me not, sweete Nedd, the wager's\\n                        downe', c. 1590. See Digital Essays.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-007/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 7</a>. Seventeen lines of verse to 'Sweete Nedde', no date [J. P.\\n                        Collier forgery].</li><li>\\n                  <a href=\\"/images/MSS-1/Article-008/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 8</a>. Letter from Richard Jones to Edward Alleyn, relating to pawned\\n                        costumes, c. Feb. 1591 or 1592.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-009/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 9</a>. Letter from Edward Alleyn to his wife Joan, his 'good sweett\\n                        harte and loving mouse', May 2, 1593.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-010/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 10</a>. Letter from Philip Henslowe to Edward Alleyn, sending his\\n                        regards, July 5, 1593.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-011/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 11</a>. Letter from Edward Alleyn to his wife Joan, 'his good sweett\\n                        mouse', c. July 24, 1593.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-012/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 12</a>. Letter from Philip Henslowe to Edward Alleyn about the plague,\\n                        c. Aug. 1593.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-013/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 13</a>. Letter from Philip Henslowe to Edward Alleyn about the plague,\\n                        Aug. 14, 1593</li><li>\\n                  <a href=\\"/images/MSS-1/Article-014/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 14</a>. Letter from Philip Henslowe to Edward Alleyn about the plague,\\n                        with a drawing of a stage design on 2r, Sept. 28, 1593</li><li>\\n                  <a href=\\"/images/MSS-1/Article-015/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 15</a>. Letter from John Pyk, written out by Thomas Downton, to\\n                        Mistress Alleyn, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-016/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 16</a>. Petition to the Privy Council from the Lord Strange's Men to\\n                        allow them to reopen the Rose Theatre, and thereby alleviate the financial\\n                        losses by the company and by Thames watermen, c. 1593.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-017/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 17</a>. Petition to Charles Howard, Lord Admiral from Thames watermen\\n                        to reopen the Rose theatre and relieve their poverty, c. 1593.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-018/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 18</a>. Warrant from the Privy Council to re-open the Rose Theatre, c.\\n                        April, 1594.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-019/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 19</a>. Letter from Richard Veale to Philip Henslowe about the Lord\\n                        Chamberlain's Men, May 3, 1596 [J. P. Collier forgery].</li><li>\\n                  <a href=\\"/images/MSS-1/Article-020/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 20</a>. Complaint of the Inhabitants of Southwark, July 1596 [J. P.\\n                        Collier forgery].</li><li>\\n                  <a href=\\"/images/MSS-1/Article-021/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 21</a>. Petition to Henry Carey, Lord Hunsdon and the Lord Chamberlain\\n                        from Richard Topping about Thomas Lodge's debts, c. 1596.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-022/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 22</a>. Petition to George Carey, second Lord Hunsdon and the Lord\\n                        Chamberlain, from Richard Topping about Thomas Lodge's debts, Jan. 29,\\n                        1597/8.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-023/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 23</a>. Answer of Philip Henslowe to the preceding, c. 1598.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-024/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 24</a>. Letter from Philip Henslowe to Edward Alleyn on the death of\\n                        Gabriel Spenser, slain by Ben Jonson in a duel in Hoxton fields, Sept. 26,\\n                        1598.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-025/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 25</a>. Bond from Richard Bradshawe, Byrcot Byrde and Robert Archer to\\n                        William Bird, March 2, 1599.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-026/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 26</a>. Letter from Robert Shaa (or Shaw) to Philip Henslowe to\\n                        commission the play [The Second Part of Henry Duke of\\n                        Richmond]from Robert Wilson, with one act outlined on the verso,\\n                        Nov. 8, 1599.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-027/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 27</a>. Warrant from Charles Howard, Earl of Nottingham, the Lord High\\n                        Admiral, to the Justices of Middlesex to allow construction of the Fortune\\n                        Theatre, Jan. 12, 1599/1600.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-028/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 28</a>. Address of Finsbury inhabitants to the Privy Council cetifying\\n                        their willingness to allow the construction of the Fortune Theatre, c. Jan.,\\n                        1600.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-029/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 29</a>. Warrant from the Privy Council to the Justices of Middlesex to\\n                        to allow the construction of the Fortune Theatre, April 8, 1600.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-030/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 30</a>. An Inventory of Theatrical Costumes in the hand of Edward\\n                        Alleyn, c. 1590-1600. See Digital Essays.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-031/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 31</a>. Letter from Robert Shaa (or Shaw) to Philip Henslowe to pay\\n                        the authors,including Robert Wilson, of the play Fair Constance of\\n                            Rome, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-032/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 32</a>. Letter from Samuel Rowley to Philip Henslowe to commission the\\n                        play The Conquest of the Indies, co-written by Robert Wilson,\\n                        c. April 4, 1601.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-033/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 33</a>. Letter from Samuel Rowley to Philip Henslowe about the play\\n                            John of Gaunt, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-034/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 34</a>. Letter from Samuel Rowley (or Rowley) to Philip Henslowe about\\n                        the dramatists John Daye and William Haughton, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-035/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 35</a>. Letter from Samuel Rowley (or Rowley) to Philip Henslowe about\\n                        the dramatists John Daye and William Haughton and the plays Six\\n                            Yeomen(?) of the West and The Conquest of the\\n                        Indies, no date, with verses by John Day on the verso.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-036/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 36</a>. Letter from Robert Shaa (or Shaw) to Philip Henslowe about the\\n                        play Too Good to be True, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-037/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 37</a>. Acquittance from William Playstowe to Philip Henslowe for one\\n                        month's pay to Edmund Tilney, Master of the Revels, Aug. 4, 1602.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-038/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 38</a>. Letter from Joan Alleyn to Edward Alleyn about the plague and\\n                        other matters, Oct. 21, 1603.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-039/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 39</a>. Letter from the Privy Council to the Lord Mayor and Justices\\n                        of Middlesex to permit the three companies of players for the King, Queen\\n                        and Prince to play only at the Globe, Fortune and Curtain theatres, except\\n                        in times of plague, April 9, 1604.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-040/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 40</a>. Letter from Ludovic Stuart, Duke of Lennox, to various\\n                        officials in support of his players, Oct. 13, 1604.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-041/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 41</a>. Power of attorney from Abraham Sauere (or Sawyer) to Francis\\n                        Henslowe, relating to the Duke of Lennox, Mar. 1, 1604/5.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-042/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 42</a>. Bond from Francis Henslowe to Philip Henslowe relating to the\\n                        Duke of Lennox's Men, Mar. 16, 1605.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-043/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 43</a>. Bond from Daniel, William, and Edmond Gill, to Katherine and\\n                        Gill Moore and others, Dec. 19, 1605.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-044/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 44</a>. Similar bond, Dec. 19, 1605.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-045/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 45</a>. Note by Abraham Sauere (or Sawyer) to Philip Henslowe, Mar.\\n                        11, 1605/6.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-046/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 46</a>. Letter from William Noreis (or Norris) to Edward Alleyn, June\\n                        1, 1608.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-047/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 47</a>. Assessment of the state of the Clink Liberty, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-048/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 48</a>. Assessment of the state of the Clink Liberty, including a list\\n                        of residents, with a list of residents, March 1608/9. </li><li>\\n                  <a href=\\"/images/MSS-1/Article-049/02r.html\\" class=\\"int\\" target=\\"_blank\\">Article 49</a>. Brief note on the poor book of the Clink Liberty, with a list\\n                        of residents [Shakespeare's name forged by J. P. Collier], April 6, 1609.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-050/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 50</a>. Account of the poor book of the Clink Liberty, Oct. 14, 1609.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-051/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 51</a>. Things necessary for the government of the Clink Liberty, c.\\n                        1609.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-052/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 52</a>. Remembrance of a gift from the Company of Leathersellers to\\n                        the poor of St. Saviour's parish, c. 1609.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-053/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 53</a>. Letter from Patrick Brewe to Edward Alleyn, about the sale of\\n                        the Gill family's property, April 6, 1609.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-054/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 54</a>. Letter from Patrick Brewe to Edward Alleyn, Aug. 3, 1609.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-055/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 55</a>. Letter from Patrick Brewe to Edward Alleyn, Dec. 9, 1609.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-056/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 56</a>. Directions for Sir Jeremy Turnour relating to the Fortune\\n                        Theatre, with a list of Edward Alleyn's deeds on the verso, c. March\\n                        1609-10.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-057/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 57</a>. Directions to the Commissioners relating to the above, c.\\n                        March 1609-10.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-058/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 58</a>. Bargain and sale of lands and tenements by Philip Moore and\\n                        others relating to the Fortune Theatre, March 7, 1609/10.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-059/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 59</a>. Bargain and sale of lands and tenements by William Clarke and\\n                        others relating to the Fortune Theatre, March 7, 1609/10.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-060/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 60</a>. Bargain and sale of lands and tenements by Hugh Cannell and\\n                        others relating to the Fortune Theatre, March 7, 1609/10.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-061/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 61</a>. Bargain and sale of lands and tenements by David Qualtroughe\\n                        and others relating to the Fortune Theatre, March 7, 1609/10.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-062/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 62</a>. Power of attorney from Daniel Gill and others relating to the\\n                        Fortune Theatre, March 14, 1609.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-063/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 63</a>. Acquittance from Sir William Norris to Edward Alleyn for rent\\n                        relating to lands near the Fortune Theatre, March 17, 1609/10.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-064/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 64</a>. Acquittance from Edmond Gill to Edward Alleyn relating to the\\n                        Fortune Theatre. May 18, 1610.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-065/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 65</a>. Affidavits of Edmond Gill and others relating to the Fortune\\n                        Theatre, June 29, 1610.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-066/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 66</a>. Letter from Robert Browne to Edward Alleyn, April 11, 1612.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-067/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 67</a>. Letter from Charles Massey to Edward Alleyn about Massey's\\n                        debts, c. 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-068/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 68</a>. Letter from Nathan Field, Robert Daborne and Philip Massinger\\n                        to Philip Henslow asking for payment for a play co-written with John\\n                        Fletcher, with the payment to be used for bail, c. 1614.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-069/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 69</a>. Letter from Nathan Field to Philip Henslowe for a loan for\\n                        bail, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-070/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 70</a>. Memorandum between Robert Daborne and Philip Henslowe for the\\n                        composition of Machiavel and the Devil, April 17, 1613. See\\n                        Digital Essays.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-071/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 71</a>. Bond between between Robert Daborne and Philip Henslowe for\\n                        the composition of Machiavel and the Devil, April 17, 1613.\\n                        See Digital Essays.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-072/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 72</a>. Letter from Robert Daborne to Philip Henslowe for a loan,\\n                        April 25, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-073/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 73</a>. Letter from Robert Daborne to Philip Henslowe about\\n                        composition of plays, May 3, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-074/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 74</a>. Letter from Robert Daborne to Philip Henslowe about\\n                        composition of plays, May 8, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-075/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 75</a>. Letter from Robert Daborne to Philip Henslowe about reading\\n                        his new play to the company, May 16, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-076/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 76</a>. Letter from Robert Daborne to Philip Henslowe discussing\\n                        Philip Massinger's salary and the forthcoming revival of Eastward\\n                        Ho, c. 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-077/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 77</a>. Acquittance from Robert Daborne to Philip Henslowe for part\\n                        payment of the play Machiavel and the Devil, May 19, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-078/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 78</a>. Letter from Robert Daborne to Philip Henslowe about his\\n                        collaboration with Cyril Tourneur on The Arraignment of\\n                        London, June 5, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-079/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 79</a>. Letter from Robert Daborne to Philip Henslowe about\\n                        composition of plays, June 10, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-080/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 80</a>. Letter from Robert Daborne to Philip Henslowe about\\n                        composition of plays and part payment for The Arraignment of\\n                        London, June 18, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-081/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 81</a>. Letter from Robert Daborne to Philip Henslowe about the plays\\n                            Machiavel and the Devil and The Arraignment of\\n                            London, June 25, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-082/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 82</a>. Letter from Robert Daborne to Philip Henslowe about\\n                        composition of plays, July 16, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-083/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 83</a>. Letter from Robert Daborne to Philip Henslowe about debts,\\n                        July 30, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-084/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 84</a>. Letter from Robert Daborne to Philip Henslowe about the terms\\n                        of commissioning The Bellman of London, Aug. 23, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-085/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 85</a>. Letter from Robert Daborne to Philip Henslowe threatening to\\n                        take new play to the King's Men, Oct. 14, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-086/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 86</a>. Letter from Robert Daborne to Philip Henslowe threatening to\\n                        take new play to the King's Men, Oct. 29, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-087/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 87</a>. Letter from Robert Daborne to Philip Henslowe about\\n                        composition of plays, Nov. 5, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-088/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 88</a>. Letter from Robert Daborne to Philip Henslowe about Ben\\n                        Jonson's play [Bartholomew Fair?], Nov. 13, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-089/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 89</a>. Letter from Robert Daborne to Philip Henslowe about Henslowe's\\n                        threatened breach of promise suit, Nov. 13, 1613. See Digital Essays.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-090/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 90</a>. Letter from Robert Daborne to Philip Henslowe about a loan,\\n                        Nov. 27, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-091/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 91</a>. Letter from Robert Daborne to Philip Henslowe on composition\\n                        of plays, Dec. 9, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-092/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 92</a>. Bond from Robert Daborne to Philip Henslowe for the\\n                        composition of The Owl, Dec. 10, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-093/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 93</a>. Acquittance from Robert Daborne to Philip Henslowe for part\\n                        payment for The Owl, Dec. 24, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-094/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 94</a>. Letter from Robert Daborne to Philip Henslowe about the\\n                        reading of the new play, Dec. 31, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-095/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 95</a>. Letter from Robert Daborne to Philip Henslowe about a loan, c.\\n                        1614.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-096/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 96</a>. Letter from Robert Daborne to Philip Henslowe about compsotion\\n                        of plays, c. March 11, 1613/4.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-097/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 97</a>. Letter from Robert Daborne to Philip Henslowe about final\\n                        payment for a completed play, March 28, 1613, with payment to commission the\\n                        play The She Saint.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-098/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 98</a>. Letter from Robert Daborne to Philip Henslowe for a loan,\\n                        August 2, 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-099/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 99</a>. Letter from Robert Daborne to Edward Griffin for a loan, c.\\n                        1614.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-100/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 100</a>. Letter from Nathan Field to Philip Henslowe about a play to\\n                        be co-written with Robert Daborne, c. 1613.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-101/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 101</a>. Small memorandum book chiefly in the hand of Edward Alleyn\\n                        listing building accounts, 1614-1615.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-102/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 102</a>. Bond from Robert Daborne and Philip Massinger to Philip\\n                        Henslowe, July 4, 1615.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-103/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 103</a>. Letter from John Marston to Philip Henslowe, no date [J. P.\\n                        Collier forgery].</li><li>\\n                  <a href=\\"/images/MSS-1/Article-104/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 104</a>. Letter from Wiliam Bird to Edward Alleyn about John Russell's\\n                        gathering of theatre income, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-105/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 105</a>. Letter from William Bird to Philip Henslowe for a loan, no\\n                        date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-106/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 106</a>. Articles of grievance and oppression against Philip Henslowe\\n                        from his acting company, c. 1615.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-107/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 107</a>. Articles of agreement between Edward Alleyn and Jacob Meade,\\n                        William Rowley, Robert Palllant and other actors relating to their use of\\n                        the Hope Theatre, March 20, 1615/6.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-108/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 108</a>. Letter from Thomas Dekker to Edward Alleyn containing some\\n                        verses (now lost), Sept 12, 1616.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-109/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 109</a>. Letter from Thomas Dekker to Edward Alleyn sending him\\n                        thanks, c. 1616.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-110/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 110</a>. Letter from Philip Henslowe's acting company (Joseph Meade\\n                        and others) to Edward Alleyn about their loss of the use of the Hope Theatre\\n                        and requesting a loan, c. 1616 </li><li>\\n                  <a href=\\"/images/MSS-1/Article-111/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 111</a>. Fragment of a letter to Edward Alleyn, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-112/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 112</a>. Letter from Haris Joones (or Jones) to Edward Alleyn, no\\n                        date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-113/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 113</a>. Acquittance from Wililam Gore to Mathias Alleyn about the\\n                        Fortune Theatre, November 8, 1632.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-114/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 114</a>. Certificate from Dulwich College to the Lord Keeper relating\\n                        to the Fortune Theatre, Sept 4, 1637.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-115/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 115</a>. Bill in Chancery from Dulwich College against Margaret Gray\\n                        and others relating to the Fortune Theatre, November, 1637.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-116/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 116</a>. License from the the Master and Warden of Dulwich College to\\n                        Tobias Lisle relating to the Fortune Theatre, July 15, 1639.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-117/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 117</a>. Acquittance from the Master and Warden of Dulwich College to\\n                        Tobias Lisle relating to the Fortune Theatre, July 22, 1639.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-118/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 118</a>. Petition from Dulwich College to Sir Edward Littleton, Lord\\n                        Keeper, against John Beale relating to the Fortune Theatre, Feb. 9, 1640/1.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-119/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 119</a>. Bill in Chancery by Dulwich College against John Beale\\n                        relating to the Fortune Theatre, 1640.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-120/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 120</a>. Order of court in a suit between Margaret Gray and Matthias\\n                        Alleyn and others relating to the Fortune Theatre, July 9, 1641.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-121/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 121</a>. Orders of court and the papers in a suit between Tobias Lisle\\n                        and Dulwich College relating to the Fortune Theatre, Nov. 28, 1645-Nov. 26,\\n                        1646.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-122/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 122</a>. Orders of court in a suit between Dulwich College and Tobias\\n                        Lisle and others relating to the Fortune Theatre, Oct. 16, 1647-Nov. 24,\\n                        1649.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-123/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 123</a>. Order of court regarding a lawsuit between Dulwich College\\n                        and John Rhodes relating to the Fortune Theatre, Feb. 1, 1649/50.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-124/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 124</a>. Report of Edward Jerman and John Tanner relating to the\\n                        Fortune Theatre, July 18, 1656.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-125/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 125</a>. Order of the Court of Assistants of Dulwich College relating\\n                        to the Fortune Theatre, Mar. 5, 1659/60</li><li>\\n                  <a href=\\"/images/MSS-1/Article-126/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 126</a>. Order of the same for the sale of metreials of the Fortune\\n                        Theatre, March 4, 1660/61.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-127/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 127</a>. Memorandum of a contract for the purchase of the materials\\n                        and lands of the Fortune Theatre by William Beaven from Dulwich College,\\n                        March 16, 1660/1.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-128/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 128</a>. Acquittance from Dulwich College to William Beaven for the\\n                        purchase of the materials of the Fortune Theatre, July 8, 1661.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-129/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 129</a>. Memorandum for a lease from Dulwich College to William Beaven\\n                        for the lands of the Fortune Theatre, July 24, 1661.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-130/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 130</a>. Acquittance from Dulwich College to William Beaven relating\\n                        to the Fortune Theatre, July 26, 1661.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-131/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 131</a>. Bill in Chancery of Will Beaven against Dulwich College\\n                        relating to the Fortune Theatre, Nov., 1661.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-132/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 132</a>. Decree in Chancery to Dulwich College towards William Beaven,\\n                        Nov. 21, 1661.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-133/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 133</a>. Order of the court of assistants at Dulwich college for a\\n                        lease to William Beaven relating to the Fortune Theatre, March 4, 1661/62.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-134/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 134</a>. Acquittance from Dulwich College to William Beaven relating\\n                        to the Fortune Theatre, July 28, 1662.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-135/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 135</a>. A Translation in verse in the hand of Ben Jonson of Martial's\\n                        epigram ('The things that make the happier life are these'), no date. See\\n                        Digital Essays.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-136/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 136</a>. A copy, in the hand of Ben Jonson of Sir Henry Wotton's poem\\n                        'How happy is he born and taught', no date. See Digital Essays.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-137/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 137</a>. Poem addressed to Edward Alleyn, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-138/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 138</a>. Copy of the part of Orlando in Robert Greene's play Orlando Furioso, no date. See Digital Essays.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-139/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 139</a>. A dramatic dialogue, probably played as an interlude, no date\\n                        ['Kitt Marlowe' added in a later hand on the verso], no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-140/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 140</a>. Seven stanzas in praise of tailors, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-141/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 141</a>. Dialogue of love between a man and a boy, no date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-142/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 142</a>. Ballad, without title, of the 'Bonny Wench of Adlington', no\\n                        date.</li><li>\\n                  <a href=\\"/images/MSS-1/Article-143/01r.html\\" class=\\"int\\" target=\\"_blank\\">Article 143</a>. Poem of a jealous husband outwitted, in twenty-one stanzas,\\n                        no date.</li></ul></div></div>\\n         <!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	Letters and Papers relating to the English Drama and Stage during the\n               life of Edward Alleyn and to the subsequent History of the Fortune Theatre,\n               1559-1662.
840	[{"id": "4fa3b7ec-f52a-4ae4-ae9f-cab07641881a", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n\\n    \\n    <p>A muniment is defined as 'a title deed, charter, letters patent, or other\\n        document providing evidence of specified rights,privileges or ownership' ; for\\n        these and other definitions, see Peter Beal, <em>A Dictionary of English\\n            Manuscript Terminology 1450-2000</em> (Oxford: Oxford University Press,\\n        2008). Also see the Digital Essays.</p>\\n    <div class=\\"unorderedList\\"><div class=\\"t01\\"><ul><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-001/01r.html\\" class=\\"int\\" target=\\"_blank\\">1</a>. Bargain and sale by Rauf Symondes to Thomas Langham of three tenements\\n            in Golding Lane and Whitecross Street, July 12, 1546.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-002/01r.html\\" class=\\"int\\" target=\\"_blank\\">2</a>. Bargain and sale by Thomas and Robert Langham to William Gill of three\\n            tenements in Golding Lane and Whitecross Street, Jan. 29, 1566.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-003/01r.html\\" class=\\"int\\" target=\\"_blank\\">3</a>. Bargain and sale by Thomas and Robert Langham to William Gill for three\\n            tenements in Golding Lane and Whitecross Street, Jan. 29, 1566.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-004/01r.html\\" class=\\"int\\" target=\\"_blank\\">4</a>. Feoffment from Thomas and Robert Langham to William Gill for three\\n            tenements in Golding Lane and Whitecross Street, Jan. 29, 1566. </li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-005/01r.html\\" class=\\"int\\" target=\\"_blank\\">5</a>. Fine by Thomas and Elizabeth Langham to Willliam Gill for three\\n            tenements in Golding Lane and Whitecross Street, 1568.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-006/01r.html\\" class=\\"int\\" target=\\"_blank\\">6</a>. Fine by Thomas and Elizabeth Langham to Willliam Gill for three\\n            tenements in Golding Lane and Whitecross Street, 1568.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-007/01r.html\\" class=\\"int\\" target=\\"_blank\\">7</a>. Letters Patent of Queen Elizabeth I giving Raphe Bowes the office of\\n            the Mastership of the Royal Game of Bears, Bulls and Mastiff Dogs, June 2,\\n            1573.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-008/01r.html\\" class=\\"int\\" target=\\"_blank\\">8</a>. Lease from Ambrose Nicholas, William Boxe and others to William Griffin\\n            of a messuage called the ''Little Rose', Nov. 20, 1574.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-009/01r.html\\" class=\\"int\\" target=\\"_blank\\">9</a>. Will of William Gill bequeathing tenements in Golding Lane to Katherine\\n            and Daniel Gill and others, April 21, 1575.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-010/01r.html\\" class=\\"int\\" target=\\"_blank\\">10</a>. Assignment by William Griffen to Robert Withens of the lease of the\\n            'Liitle Rose', Dec. 11, 1579.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-011/01r.html\\" class=\\"int\\" target=\\"_blank\\">11</a>. Power of attorney from Daniel Gill and his son Daniel to Patrick Brewe\\n            relating to the deeds of tenements in Golding Lane, Feb. 14, 1580.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-012/01r.html\\" class=\\"int\\" target=\\"_blank\\">12</a>. Lease from Daniel Gill to Patrick Brewe of messuages on Golding Lane\\n            and Whitecrosse Street, July 11, 1584.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-013/01r.html\\" class=\\"int\\" target=\\"_blank\\">13</a>. Lease from Daniel Gill to Patrick Brewe of messuages on Golding Lane\\n            and Whitecrosse Street, July 11, 1584.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-014/01r.html\\" class=\\"int\\" target=\\"_blank\\">14</a>. Feoffment from Daniel Gill to his son Daniel of the same messauges,\\n            Oct. 10, 1584.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-015/01r.html\\" class=\\"int\\" target=\\"_blank\\">15</a>. Assignment by Robert Withens to Philip Henslowe of the lease of the\\n            'Little Rose' , March 24, 1584/5.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-016/01r.html\\" class=\\"int\\" target=\\"_blank\\">16</a>. Deed of partnership between Philip Henslowe and John Cholmley for a\\n            parcel of ground on the Bankside and in a playhouse [the Rose] to be erected\\n            thereon, with details of how receipts are to be paid, Jan. 10, 1586/7. See\\n            Digital Essays.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-017/01r.html\\" class=\\"int\\" target=\\"_blank\\">17</a>. Will of Daniel Gill bequeathing his lands in trust to his family, May\\n            25, 1592. </li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-018/01r.html\\" class=\\"int\\" target=\\"_blank\\">18</a>. Letters Patent of Queen Elizabeth I granting to Philip Henslowe the\\n            office of the Mastership of the Royal Game of Bears, Bulls and Mastiff Dogs\\n            (not executed), before June, 1598.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-019/01r.html\\" class=\\"int\\" target=\\"_blank\\">19</a>. Warrant from Jacob Meade, Master of the Royal Game of Bears, Bulls and\\n            Mastiff Dogs, commissioning John Cullyver to act as his deputy, Nov. 24,\\n            1599.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-020/01r.html\\" class=\\"int\\" target=\\"_blank\\">20</a>. Assignment by Patrick Brewe to Edward Alleyn of the lease from Daniel\\n            Gill, relating to 12 and 13 above, Dec. 22, 1599. </li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-021/01r.html\\" class=\\"int\\" target=\\"_blank\\">21</a>. Draft of the preceding assignment, no date.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-022/01r.html\\" class=\\"int\\" target=\\"_blank\\">22</a>. Contract by Peter Streete, carpenter, with Philip Henslowe and Edward\\n            Alleyn to erect for the sum of \\u00a3440 a 'new howse and stadge for a Plaiehowse\\n            [the Fortune] . . . nere Golding Lane', to have the same dimensions, as\\n            given, as the Globe Theatre, Jan. 8, 1599/1600, with acquittances on the\\n            verso dated Jan. 8, 1599-June 11, 1600. See Digital Essays.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-023/01r.html\\" class=\\"int\\" target=\\"_blank\\">23</a>. Lease from Daniel, William and Edmond Gill to John Garrett for rent of\\n            the premises as 12 and 13 above, June 30, 1601. </li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-024/01r.html\\" class=\\"int\\" target=\\"_blank\\">24</a>. Lease from Daniel, William and Edmond Gill to John Garrett for rent of\\n            the premises as 12 and 13 above, June 30, 1601.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-025/01r.html\\" class=\\"int\\" target=\\"_blank\\">25</a>. Letters Patent of King James I, granting to John Dorrington the office\\n            of the Mastership of the Royal Game of Bears, Bulls and Mastiff Dogs, July\\n            14, 1603.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-026/01r.html\\" class=\\"int\\" target=\\"_blank\\">26</a>. Bond from Abraham Sauere (or Sawyer) to Francis Henslowe and James\\n            Browne to secure a payment to Joshua Speed, Oct. 25, 1604.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-027/01r.html\\" class=\\"int\\" target=\\"_blank\\">27</a>. Award by William Norres (or Norris) and others in a dispute with\\n            Daniel Gill and family relating to tenements in Golding Lane and Whitecrosse\\n            Street, Dec. 19, 1605.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-028/01r.html\\" class=\\"int\\" target=\\"_blank\\">28</a>. Award by William Norres (or Norris) and others in a dispute with\\n            Daniel Gill and family relating to tenements in Golding Lane and Whitecrosse\\n            Street, Dec. 19, 1605.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-029/01r.html\\" class=\\"int\\" target=\\"_blank\\">29</a>. Award by William Norres (or Norris) and others in a dispute with\\n            Daniel Gill and family relating to tenements in Golding Lane and Whitecrosse\\n            Street, Dec. 19, 1605.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-030/01r.html\\" class=\\"int\\" target=\\"_blank\\">30</a>. Lease from Thomas Towne to William Pearis of a tenement in Lambeth\\n            marsh, May 5, 1607.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-031/01r.html\\" class=\\"int\\" target=\\"_blank\\">31</a>. Lease from Thomas Garland to Philip Henslowe and Edward Alleyn for\\n            pastures in Lambeth called 'Long Slippe', June 28, 1608.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-032/01r.html\\" class=\\"int\\" target=\\"_blank\\">32</a>. Grant from Edward Alleyn to Thomas and Agnes Towne of an annuity for\\n            Dulwich manor and lands and the surrender of Kennington manor and lands,\\n            Oct. 28, 1608.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-033/01r.html\\" class=\\"int\\" target=\\"_blank\\">33</a>. Lease from Philip Henslowe and Edward Alleyn to Thomas Downton for\\n            one-eighth of a fourth part of income from the Fortune Theatre (not\\n            executed), 1608.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-034/01r.html\\" class=\\"int\\" target=\\"_blank\\">34</a>. Lease from Philip Henslowe and Edward Alleyn to Thomas Downton for\\n            one-eighth of a fourth part of income from the Fortune Theatre (not\\n            executed), 1608.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-035/01r.html\\" class=\\"int\\" target=\\"_blank\\">35</a>. Lease from Edward Alleyn to Edmond Williams of two messuages in\\n            Whitecrosse Street, Feb. 28, 1609/10.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-036/01r.html\\" class=\\"int\\" target=\\"_blank\\">36</a>. Assignment by John Garratt to Edward Alleyn of his reversion of the\\n            lease of messuages in Golding Lane and Whitecross Street, as 23 and 24\\n            above, May 1, 1610.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-037/01r.html\\" class=\\"int\\" target=\\"_blank\\">37</a>. Assignment by Edward Alleyn to Philip Henslowe of the same, May 4,\\n            1610.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-038/01r.html\\" class=\\"int\\" target=\\"_blank\\">38</a>. Bargain and sale by Daniel Gill and his family and others to Edward\\n            Alleyn for twelve tenements relating to the Fortune Theatre, May 30, 1610.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-039/01r.html\\" class=\\"int\\" target=\\"_blank\\">39</a>. Bond from the same parties to Edward alleyn to observe covenants as\\n            above, May 30, 1610.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-040/01r.html\\" class=\\"int\\" target=\\"_blank\\">40</a>. Bond from Edward Alleyn and Thomas Towne to Edmond Gill, June 2, 1610.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-041/01r.html\\" class=\\"int\\" target=\\"_blank\\">41</a>. Bond from Edward Alleyn to Edmond Gill, Sept. 29, 1610.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-042/01r.html\\" class=\\"int\\" target=\\"_blank\\">42</a>. Release from Daniel Gill and others as above 38 to Edward Alleyn of\\n            all rents and arrears, June 4, 1610.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-043/01r.html\\" class=\\"int\\" target=\\"_blank\\">43</a>. Fine by the same to Edward Alleyn of messuages and gardens, 1610.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-044/01r.html\\" class=\\"int\\" target=\\"_blank\\">44</a>. Fine by the same to Edward Alleyn of messuages and gardens, 1610.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-045/01r.html\\" class=\\"int\\" target=\\"_blank\\">45</a>. Release by Daniel and Katherine Gill and others as above 38, Oct. 20,\\n            1610.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-046/01r.html\\" class=\\"int\\" target=\\"_blank\\">46</a>. Warrant from Philip Henslowe and Edward Alleyn, joint Masters of the\\n            Royal Game of Bears, Bulls and Mastiff Dogs, to commission Thomas Radford as\\n            their deputy, May 11, 1611.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-047/01r.html\\" class=\\"int\\" target=\\"_blank\\">47</a>. Bond from John Townsend, William Barksted, Joseph Taylor and other\\n            actors to Philip Henslowe to perform 'certen articles', Aug. 29, 1611.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-048/01r.html\\" class=\\"int\\" target=\\"_blank\\">48</a>. Lease from Edward Alleyn to Robert Johnson of a tenement in Golding\\n            Lane, Jan. 6, 1612/13.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-049/01r.html\\" class=\\"int\\" target=\\"_blank\\">49</a>. Contract of Gilbert Katherens, carpenter, with Philip Henslowe and\\n            Jacob Meade to pull down the old Bear Garden and to build another playhouse\\n            [the Hope], to be used for playing and for blood sports, to be the same\\n            dimensions, as given, as the Swan Theatre, Aug. 29, 1613.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-050/01r.html\\" class=\\"int\\" target=\\"_blank\\">50</a>. Bond from Gilbert Katherens to Philip Henslowe and Jacob Meade to\\n            observe the covenants in the preceding contract, Aug. 29, 1613.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-051/01r.html\\" class=\\"int\\" target=\\"_blank\\">51</a>. Articles between Gilbert Katherens and John Browne whereby the latter\\n            covenants to make the brickwork of a playhouse [the Hope] in the same\\n            dimensions of the Swan, and to be built upon the place of the Bear Garden,\\n            Sept. 8, 1613.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-052/01r.html\\" class=\\"int\\" target=\\"_blank\\">52</a>. Articles on the part and behalf of Philip Henslowe and Jacob Meade\\n            relating to their acting company, represented by Nathan Field, c. 1613.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-053/01r.html\\" class=\\"int\\" target=\\"_blank\\">53</a>. Assignment by Agnes, widow of Philip Henslowe to Gregory Franklin and\\n            John Hammond of leases from Edward Alleyn to Philip Henslowe of a moiety of\\n            the Fortune Theatre for twenty-four years, and of messuages in the Clink\\n            from others, Feb. 15, 1616.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-054/01r.html\\" class=\\"int\\" target=\\"_blank\\">54</a>. Lease from Edward Alleyn to Henry Smith of a messuage in Golding Lane,\\n            April 24, 1618, with note of surrender dated Aug. 4, 1621 on verso.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-055/01r.html\\" class=\\"int\\" target=\\"_blank\\">55</a>. Lease from Edward Alleyn to Richard Hudson of a messauge in Golding\\n            Lane 'to have a dore way or passage towardes the playhows', July 1, 1618.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-056/01r.html\\" class=\\"int\\" target=\\"_blank\\">56</a>. Lease from Edward Alleyn of Dulwich to Edward Juby, William Bird,\\n            Frank Grace, Richard Gunnell, Charles Massey, Wiliam Stratford, William\\n            Cartwright, Richard Price, William Parre, and Richard Fowler of the Fortune\\n            Theatre, with terms listed, Oct. 31, 1618.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-057/01r.html\\" class=\\"int\\" target=\\"_blank\\">57</a>. Bond from the lessees as above to Edward Alleyn to observe convenants,\\n            Oct. 31, 1618.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-058/01r.html\\" class=\\"int\\" target=\\"_blank\\">58</a>. Lease from Edward Alleyn of Dulwich to Charles Massey of one\\n            twenty-fourth part of the ground and tenements where the Fortune Theatre\\n            stood, to be used for the construction of a new [Fortune] theatre, May 20,\\n            1622.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-059/01r.html\\" class=\\"int\\" target=\\"_blank\\">59</a>. Lease from Edward Alleyn to Richard Price of one twenty-fourth part of\\n            the same ground and tenements, May 20, 1622.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-060/01r.html\\" class=\\"int\\" target=\\"_blank\\">60</a>. Lease from Edward Alleyn to William Gwalter for a sixth part of the\\n            ground and tenements as above, May 20, 1622, with endorsement of the\\n            surrender of the lease, with further one-sixth part to William Gwalter and\\n            another lease to Robert Leigh, June 19, 1623.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-061/01r.html\\" class=\\"int\\" target=\\"_blank\\">61</a>. Lease from Edward Alleyn to William Gwalter for a sixth part of the\\n            ground and tenements as above, May 20, 1622, with endorsement of the\\n            surrender of the lease, with further one sixth part to William Gwalter and\\n            another lease to Robert Leigh, June 19, 1623.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-062/01r.html\\" class=\\"int\\" target=\\"_blank\\">62</a>. Lease from Edward Alleyn to Anthony Jarman for a twelfth part of the\\n            premises as above, paying towards the erection of a new playhouse, May 20,\\n            1622.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-063/01r.html\\" class=\\"int\\" target=\\"_blank\\">63</a>. Lease from Edward Alleyn to Margaret Grey of a twelfth part of the new\\n            [Fortune] Theatre, with a taphouse belonging to the same and five other\\n            tenements, Jan. 29, 1623/4.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-064/01r.html\\" class=\\"int\\" target=\\"_blank\\">64</a>. Lease from Edward Alleyn to George Bosgrave of half a twelfth part of\\n            the premises as above, Feb. 20, 1623/4.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-065/01r.html\\" class=\\"int\\" target=\\"_blank\\">65</a>. Extract from the roll of the Court Baron of the Mayor and citizens of\\n            London, lords of the manor of Finsbury, of the evidence of Thomas and\\n            Matthias Alleyn of Dulwich College concerning the lands and tenements of the\\n            Foturne Theatre bequeathed by Edward Alleyn to the College, Oct. 6, 1629.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-066/01r.html\\" class=\\"int\\" target=\\"_blank\\">66</a>. Bill in Chancery of Thomas (or Tobias) Lisle against Dulwich College\\n            relating to the rents for the lands and tenements of the Foturne Theatre,\\n            Nov. 26, 1646.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-067/01r.html\\" class=\\"int\\" target=\\"_blank\\">67</a>. Bill in Chancery of Dulwich College against Tobias Lisle and Thomas\\n            Grymes, relating to the above, 1647, 1649.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-068/01r.html\\" class=\\"int\\" target=\\"_blank\\">68</a>. Bill in Chancery of Dulwich College against Tobias Lisle and Thomas\\n            Grymes, relating to the above, 1647, 1649.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-069/01r.html\\" class=\\"int\\" target=\\"_blank\\">69</a>. Bill in Chancery of Dulwich College against Tobias Lisle and Thomas\\n            Grymes, relating to the above, 1647, 1649.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-070/01r.html\\" class=\\"int\\" target=\\"_blank\\">70</a>. Answer of Thomas Alleyn, Master of Dulwich College to the complaint of\\n            Arthur Minshawe and others relating to Tobias Lisle, Nov. 1649.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-071/01r.html\\" class=\\"int\\" target=\\"_blank\\">71</a>. Bill in Chancery of William Beaven against Dulwich College as above,\\n            Nov. 1661.</li><li>\\n            <a href=\\"/images/Muniments-Series-1/Group-072/01r.html\\" class=\\"int\\" target=\\"_blank\\">72</a>. Draft of a lease from Dulwich College to William Beaven of nineteen\\n            messuages built on the ground of the demolished Fortune Theatre, March\\n            1661/2.</li></ul></div></div>\\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	Relating to Theatres and Theatrical Matters.
913	[{"id": "26bbc166-6f46-4ab6-be2e-efa4b88d44d6", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n\\n    \\n    <div class=\\"unorderedList\\"><div class=\\"t01\\"><ul><li>\\n            <a href=\\"/images/Muniments-Series-3/Group-331/01r.html\\" class=\\"int\\" target=\\"_blank\\">331</a>. Letters Patent of King Henry VIII granting to Thomas Calton the manor\\n            and lands of Dulwich, Oct. 11, 1544.</li><li>\\n            <a href=\\"/images/Muniments-Series-3/Group-383/01r.html\\" class=\\"int\\" target=\\"_blank\\">383</a>. Letters Patent of Queen Elizabeth I granting to Francis Calton the\\n            livery of the manor and lands of Dulwich, Feb. 1, 1587.</li><li>\\n            <a href=\\"/images/Muniments-Series-3/Group-558/01r.html\\" class=\\"int\\" target=\\"_blank\\">558</a>. Indenture of contract between Edward Alleyn and John Benson,\\n            bricklayer, for the construction of Dulwich College, Chapel and twelve\\n            almshouses, May 17, 1613, with acquainttances from June 19, 1612-April 22,\\n            1614 on the verso.</li><li>\\n            <a href=\\"/images/Muniments-Series-3/Group-581/01r.html\\" class=\\"int\\" target=\\"_blank\\">581</a>. Letters Patent of King James I to Edward Alleyn for the foundation of\\n            Dulwich College, June 21, 1619, detailing the purchase of the lands and\\n            property.</li><li>\\n            <a href=\\"/images/Muniments-Series-3/Group-584/01r.html\\" class=\\"int\\" target=\\"_blank\\">584</a>. Deed of Foundation by Edward Alleyn by virtue of the Letters Patent\\n            as 581 above, of a college to be called and named 'The College of God's Gift\\n            in Dulwich in the County of Surrey', and to consist of one master, one\\n            warden, four fellows, six poor brethren, six poor sisters and twelve poor\\n            scholars, Sept. 1619; signed by Francis Bacon, Thomas Howard, Edward Cecil,\\n            Inigo Jones and others. See Digital Essays.</li><li>\\n            <a href=\\"/images/Muniments-Series-3/Group-586/01r.html\\" class=\\"int\\" target=\\"_blank\\">586</a>. Covenant by Edward Alleyn to levy a fine to William Allen and William\\n            Austen for the use of lands and messuages in Lambeth and Camberwell by\\n            himself and afterward to Dulwich College forever, April 24, 1620.</li><li>\\n            <a href=\\"/images/Muniments-Series-3/Group-587/01r.html\\" class=\\"int\\" target=\\"_blank\\">587</a>. Covenant by Edward Alleyn to levy a fine to William Allen and William\\n            Austen for the use of lands and messuages in Lambeth and Camberwell by\\n            himself and and afterward to Dulwich College forever, April 24, 1620.</li><li>\\n            <a href=\\"/images/Muniments-Series-3/Group-594/01r.html\\" class=\\"int\\" target=\\"_blank\\">594</a>. The Original Book of the Statutes and Ordinances of the College of\\n            God's Gift in Dulwich, Sept. 29, 1626, with an additional clause dated Nov.\\n            20, 1626.</li></ul></div></div>\\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	Relating to Dulwich manor and the foundation of Dulwich\n                    College.
1179	[{"id": "58685fe8-82e2-4771-97c0-b10797ff59b2", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n\\n            <select name=\\"menu1\\" id=\\"menu1\\" onchange=\\"jumpMenu('parent',this,0)\\"><option selected=\\"selected\\" value=\\"#\\">Please select...</option><option value=\\"/images/MSS-20/00r.html\\">Page 00r</option><option value=\\"/images/MSS-20/00v.html\\">Page 00v</option><option value=\\"/images/MSS-20/01r.html\\">Page 01r</option><option value=\\"/images/MSS-20/01v.html\\">Page 01v</option><option value=\\"/images/MSS-20/02r.html\\">Page 02r</option><option value=\\"/images/MSS-20/02v.html\\">Page 02v</option><option value=\\"/images/MSS-20/03r.html\\">Page 03r</option><option value=\\"/images/MSS-20/03v.html\\">Page 03v</option><option value=\\"/images/MSS-20/04r.html\\">Page 04r</option><option value=\\"/images/MSS-20/04v.html\\">Page 04v</option><option value=\\"/images/MSS-20/05r.html\\">Page 05r</option><option value=\\"/images/MSS-20/05v.html\\">Page 05v</option><option value=\\"/images/MSS-20/06r.html\\">Page 06r</option><option value=\\"/images/MSS-20/06v.html\\">Page 06v</option><option value=\\"/images/MSS-20/07r.html\\">Page 07r</option><option value=\\"/images/MSS-20/07v.html\\">Page 07v</option><option value=\\"/images/MSS-20/08r.html\\">Page 08r</option><option value=\\"/images/MSS-20/08v.html\\">Page 08v</option><option value=\\"/images/MSS-20/09r.html\\">Page 09r</option><option value=\\"/images/MSS-20/09v.html\\">Page 09v</option><option value=\\"/images/MSS-20/10r.html\\">Page 10r</option><option value=\\"/images/MSS-20/10v.html\\">Page 10v</option><option value=\\"/images/MSS-20/11r.html\\">Page 11r</option><option value=\\"/images/MSS-20/11v.html\\">Page 11v</option><option value=\\"/images/MSS-20/12r.html\\">Page 12r</option><option value=\\"/images/MSS-20/12v.html\\">Page 12v</option><option value=\\"/images/MSS-20/13r.html\\">Page 13r</option><option value=\\"/images/MSS-20/13v.html\\">Page 13v</option><option value=\\"/images/MSS-20/14r.html\\">Page 14r</option><option value=\\"/images/MSS-20/14v.html\\">Page 14v</option><option value=\\"/images/MSS-20/15r.html\\">Page 15r</option><option value=\\"/images/MSS-20/15v.html\\">Page 15v</option><option value=\\"/images/MSS-20/16r.html\\">Page 16r</option><option value=\\"/images/MSS-20/16v.html\\">Page 16v</option><option value=\\"/images/MSS-20/17r.html\\">Page 17r</option><option value=\\"/images/MSS-20/17v.html\\">Page 17v</option><option value=\\"/images/MSS-20/18r.html\\">Page 18r</option><option value=\\"/images/MSS-20/18v.html\\">Page 18v</option><option value=\\"/images/MSS-20/19r.html\\">Page 19r</option><option value=\\"/images/MSS-20/19v.html\\">Page 19v</option><option value=\\"/images/MSS-20/20r.html\\">Page 20r</option><option value=\\"/images/MSS-20/20v.html\\">Page 20v</option><option value=\\"/images/MSS-20/21r.html\\">Page 21r</option><option value=\\"/images/MSS-20/21v.html\\">Page 21v</option><option value=\\"/images/MSS-20/22r.html\\">Page 22r</option><option value=\\"/images/MSS-20/22v.html\\">Page 22v</option><option value=\\"/images/MSS-20/23r.html\\">Page 23r</option><option value=\\"/images/MSS-20/23v.html\\">Page 23v</option><option value=\\"/images/MSS-20/24r.html\\">Page 24r</option><option value=\\"/images/MSS-20/24v.html\\">Page 24v</option><option value=\\"/images/MSS-20/25r.html\\">Page 25r</option><option value=\\"/images/MSS-20/25v.html\\">Page 25v</option></select>\\n    \\n            <p>\\u00a0</p>\\n            \\n    <p>This play has no known connection to Edward Alleyn, although it may have been in\\n        the repertory of one or more of the acting companies with which he was\\n        associated, or the play may have been performed at the Fortune Theatre. If the\\n        play was not bequeathed to Dulwich College by Alleyn, it most likely was\\n        bequeathed by the College's later benefactor, William Cartwright the younger,\\n        the son of one of Alleyn's acting colleagues and friends. Cartwright later\\n        professed great affection to Alleyn, and <em>The Telltale</em> may have\\n        been among the one hundred play manuscripts left to Dulwich by Cartwright,\\n        nearly all of which were later dispersed to other public and private libraries. </p>\\n    <p>R. A. Foakes produced an edition of the play for the Malone Society (Oxford:\\n        Oxford University Press, 1960). Also see the Digital Essays. </p>\\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	The Manuscript of 
922	[{"id": "4b6213b1-c14e-4fc8-bad3-1b6c6ac02c30", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n\\n            <select name=\\"menu1\\" id=\\"menu1\\" onchange=\\"jumpMenu('parent',this,0)\\"><option selected=\\"selected\\" value=\\"#\\">Please select...</option><option value=\\"/images/MSS-8/001r.html\\">Page 001r</option><option value=\\"/images/MSS-8/001v.html\\">Page 001v</option><option value=\\"/images/MSS-8/002r.html\\">Page 002r</option><option value=\\"/images/MSS-8/002v.html\\">Page 002v</option><option value=\\"/images/MSS-8/003r.html\\">Page 003r</option><option value=\\"/images/MSS-8/003v.html\\">Page 003v</option><option value=\\"/images/MSS-8/004r.html\\">Page 004r</option><option value=\\"/images/MSS-8/004v.html\\">Page 004v</option><option value=\\"/images/MSS-8/005r.html\\">Page 005r</option><option value=\\"/images/MSS-8/005v.html\\">Page 005v</option><option value=\\"/images/MSS-8/006r.html\\">Page 006r</option><option value=\\"/images/MSS-8/006v.html\\">Page 006v</option><option value=\\"/images/MSS-8/007r.html\\">Page 007r</option><option value=\\"/images/MSS-8/007v.html\\">Page 007v</option><option value=\\"/images/MSS-8/008r.html\\">Page 008r</option><option value=\\"/images/MSS-8/008v.html\\">Page 008v</option><option value=\\"/images/MSS-8/009r.html\\">Page 009r</option><option value=\\"/images/MSS-8/009v.html\\">Page 009v</option><option value=\\"/images/MSS-8/010r.html\\">Page 010r</option><option value=\\"/images/MSS-8/010v.html\\">Page 010v</option><option value=\\"/images/MSS-8/011r.html\\">Page 011r</option><option value=\\"/images/MSS-8/011v.html\\">Page 011v</option><option value=\\"/images/MSS-8/012r.html\\">Page 012r</option><option value=\\"/images/MSS-8/012v.html\\">Page 012v</option><option value=\\"/images/MSS-8/013r.html\\">Page 013r</option><option value=\\"/images/MSS-8/013v.html\\">Page 013v</option><option value=\\"/images/MSS-8/014r.html\\">Page 014r</option><option value=\\"/images/MSS-8/014v.html\\">Page 014v</option><option value=\\"/images/MSS-8/015r.html\\">Page 015r</option><option value=\\"/images/MSS-8/015v.html\\">Page 015v</option><option value=\\"/images/MSS-8/016r.html\\">Page 016r</option><option value=\\"/images/MSS-8/016v.html\\">Page 016v</option><option value=\\"/images/MSS-8/017r.html\\">Page 017r</option><option value=\\"/images/MSS-8/017v.html\\">Page 017v</option><option value=\\"/images/MSS-8/018r.html\\">Page 018r</option><option value=\\"/images/MSS-8/018v.html\\">Page 018v</option><option value=\\"/images/MSS-8/019r.html\\">Page 019r</option><option value=\\"/images/MSS-8/019v.html\\">Page 019v</option><option value=\\"/images/MSS-8/020r.html\\">Page 020r</option><option value=\\"/images/MSS-8/020v.html\\">Page 020v</option><option value=\\"/images/MSS-8/021r.html\\">Page 021r</option><option value=\\"/images/MSS-8/021v.html\\">Page 021v</option><option value=\\"/images/MSS-8/022r.html\\">Page 022r</option><option value=\\"/images/MSS-8/022v.html\\">Page 022v</option><option value=\\"/images/MSS-8/023r.html\\">Page 023r</option><option value=\\"/images/MSS-8/023v.html\\">Page 023v</option><option value=\\"/images/MSS-8/024r.html\\">Page 024r</option><option value=\\"/images/MSS-8/024v.html\\">Page 024v</option><option value=\\"/images/MSS-8/025r.html\\">Page 025r</option><option value=\\"/images/MSS-8/025v.html\\">Page 025v</option><option value=\\"/images/MSS-8/026r.html\\">Page 026r</option><option value=\\"/images/MSS-8/026v.html\\">Page 026v</option><option value=\\"/images/MSS-8/027r.html\\">Page 027r</option><option value=\\"/images/MSS-8/027v.html\\">Page 027v</option><option value=\\"/images/MSS-8/028r.html\\">Page 028r</option><option value=\\"/images/MSS-8/028v.html\\">Page 028v</option><option value=\\"/images/MSS-8/029r.html\\">Page 029r</option><option value=\\"/images/MSS-8/029v.html\\">Page 029v</option><option value=\\"/images/MSS-8/030r.html\\">Page 030r</option><option value=\\"/images/MSS-8/030v.html\\">Page 030v</option><option value=\\"/images/MSS-8/031r.html\\">Page 031r</option><option value=\\"/images/MSS-8/031v.html\\">Page 031v</option><option value=\\"/images/MSS-8/032r.html\\">Page 032r</option><option value=\\"/images/MSS-8/032v.html\\">Page 032v</option><option value=\\"/images/MSS-8/033r.html\\">Page 033r</option><option value=\\"/images/MSS-8/033v.html\\">Page 033v</option><option value=\\"/images/MSS-8/034r.html\\">Page 034r</option><option value=\\"/images/MSS-8/034v.html\\">Page 034v</option><option value=\\"/images/MSS-8/035r.html\\">Page 035r</option><option value=\\"/images/MSS-8/035v.html\\">Page 035v</option><option value=\\"/images/MSS-8/036r.html\\">Page 036r</option><option value=\\"/images/MSS-8/036v.html\\">Page 036v</option><option value=\\"/images/MSS-8/037r.html\\">Page 037r</option><option value=\\"/images/MSS-8/037v.html\\">Page 037v</option><option value=\\"/images/MSS-8/038r.html\\">Page 038r</option><option value=\\"/images/MSS-8/038v.html\\">Page 038v</option><option value=\\"/images/MSS-8/039r.html\\">Page 039r</option><option value=\\"/images/MSS-8/039v.html\\">Page 039v</option><option value=\\"/images/MSS-8/040r.html\\">Page 040r</option><option value=\\"/images/MSS-8/040v.html\\">Page 040v</option><option value=\\"/images/MSS-8/041r.html\\">Page 041r</option><option value=\\"/images/MSS-8/041v.html\\">Page 041v</option><option value=\\"/images/MSS-8/042r.html\\">Page 042r</option><option value=\\"/images/MSS-8/042v.html\\">Page 042v</option><option value=\\"/images/MSS-8/043r.html\\">Page 043r</option><option value=\\"/images/MSS-8/043v.html\\">Page 043v</option><option value=\\"/images/MSS-8/044r.html\\">Page 044r</option><option value=\\"/images/MSS-8/044v.html\\">Page 044v</option><option value=\\"/images/MSS-8/045r.html\\">Page 045r</option><option value=\\"/images/MSS-8/045v.html\\">Page 045v</option><option value=\\"/images/MSS-8/046r.html\\">Page 046r</option><option value=\\"/images/MSS-8/046v.html\\">Page 046v</option><option value=\\"/images/MSS-8/047r.html\\">Page 047r</option><option value=\\"/images/MSS-8/047v.html\\">Page 047v</option><option value=\\"/images/MSS-8/048r.html\\">Page 048r</option><option value=\\"/images/MSS-8/048v.html\\">Page 048v</option><option value=\\"/images/MSS-8/049r.html\\">Page 049r</option><option value=\\"/images/MSS-8/049v.html\\">Page 049v</option><option value=\\"/images/MSS-8/050r.html\\">Page 050r</option><option value=\\"/images/MSS-8/050v.html\\">Page 050v</option><option value=\\"/images/MSS-8/051r.html\\">Page 051r</option><option value=\\"/images/MSS-8/051v.html\\">Page 051v</option><option value=\\"/images/MSS-8/052r.html\\">Page 052r</option><option value=\\"/images/MSS-8/052v.html\\">Page 052v</option><option value=\\"/images/MSS-8/053r.html\\">Page 053r</option><option value=\\"/images/MSS-8/053v.html\\">Page 053v</option><option value=\\"/images/MSS-8/054r.html\\">Page 054r</option><option value=\\"/images/MSS-8/054v.html\\">Page 054v</option><option value=\\"/images/MSS-8/055r.html\\">Page 055r</option><option value=\\"/images/MSS-8/055v.html\\">Page 055v</option><option value=\\"/images/MSS-8/056r.html\\">Page 056r</option><option value=\\"/images/MSS-8/056v.html\\">Page 056v</option><option value=\\"/images/MSS-8/057r.html\\">Page 057r</option><option value=\\"/images/MSS-8/057v.html\\">Page 057v</option><option value=\\"/images/MSS-8/058r.html\\">Page 058r</option><option value=\\"/images/MSS-8/058v.html\\">Page 058v</option><option value=\\"/images/MSS-8/059r.html\\">Page 059r</option><option value=\\"/images/MSS-8/059v.html\\">Page 059v</option><option value=\\"/images/MSS-8/060r.html\\">Page 060r</option><option value=\\"/images/MSS-8/060v.html\\">Page 060v</option><option value=\\"/images/MSS-8/061r.html\\">Page 061r</option><option value=\\"/images/MSS-8/061v.html\\">Page 061v</option><option value=\\"/images/MSS-8/062r.html\\">Page 062r</option><option value=\\"/images/MSS-8/062v.html\\">Page 062v</option></select>\\n   \\n    \\n    <p>\\u00a0</p>\\n            \\n    <p>The contents, which occupy a small portion only of the volume, consist chiefly of\\n        notes of the purchase of the Bear Garden, the Fortune Theatre, Dulwich manor,\\n        and other properties, with lists of 'evidences' and particulars of price,\\n        subseqent profits, etc. On folio 41v (08-041v) is 'a generall note of all my\\n        writings, deedes or evidencis, bondes or bills belonging to me E Alleyn'. The\\n        small size of the volume suggets that Alleyn carried it easily in his\\n        pocket.</p>\\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	Memorandum-Book of Edward Alleyn, 1594-1616.
1047	[{"id": "07e81bb8-76b8-4a05-9790-5df50aff7179", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n\\n            <select name=\\"menu1\\" id=\\"menu1\\" onchange=\\"jumpMenu('parent',this,0)\\"><option selected=\\"selected\\" value=\\"#\\">Please select...</option><option value=\\"/images/MSS-9/001r.html\\">Page 001r</option><option value=\\"/images/MSS-9/001v.html\\">Page 001v</option><option value=\\"/images/MSS-9/002r.html\\">Page 002r</option><option value=\\"/images/MSS-9/002v.html\\">Page 002v</option><option value=\\"/images/MSS-9/003r.html\\">Page 003r</option><option value=\\"/images/MSS-9/003v.html\\">Page 003v</option><option value=\\"/images/MSS-9/004r.html\\">Page 004r</option><option value=\\"/images/MSS-9/004v.html\\">Page 004v</option><option value=\\"/images/MSS-9/005r.html\\">Page 005r</option><option value=\\"/images/MSS-9/005v.html\\">Page 005v</option><option value=\\"/images/MSS-9/006r.html\\">Page 006r</option><option value=\\"/images/MSS-9/006v.html\\">Page 006v</option><option value=\\"/images/MSS-9/007r.html\\">Page 007r</option><option value=\\"/images/MSS-9/007v.html\\">Page 007v</option><option value=\\"/images/MSS-9/008r.html\\">Page 008r</option><option value=\\"/images/MSS-9/008v.html\\">Page 008v</option><option value=\\"/images/MSS-9/009r.html\\">Page 009r</option><option value=\\"/images/MSS-9/009v.html\\">Page 009v</option><option value=\\"/images/MSS-9/010r.html\\">Page 010r</option><option value=\\"/images/MSS-9/010v.html\\">Page 010v</option><option value=\\"/images/MSS-9/011r.html\\">Page 011r</option><option value=\\"/images/MSS-9/011v.html\\">Page 011v</option><option value=\\"/images/MSS-9/012r.html\\">Page 012r</option><option value=\\"/images/MSS-9/012v.html\\">Page 012v</option><option value=\\"/images/MSS-9/013r.html\\">Page 013r</option><option value=\\"/images/MSS-9/013v.html\\">Page 013v</option><option value=\\"/images/MSS-9/014r.html\\">Page 014r</option><option value=\\"/images/MSS-9/014v.html\\">Page 014v</option><option value=\\"/images/MSS-9/015r.html\\">Page 015r</option><option value=\\"/images/MSS-9/015v.html\\">Page 015v</option><option value=\\"/images/MSS-9/016r.html\\">Page 016r</option><option value=\\"/images/MSS-9/016v.html\\">Page 016v</option><option value=\\"/images/MSS-9/017r.html\\">Page 017r</option><option value=\\"/images/MSS-9/017v.html\\">Page 017v</option><option value=\\"/images/MSS-9/018r.html\\">Page 018r</option><option value=\\"/images/MSS-9/018v.html\\">Page 018v</option><option value=\\"/images/MSS-9/019r.html\\">Page 019r</option><option value=\\"/images/MSS-9/019v.html\\">Page 019v</option><option value=\\"/images/MSS-9/020r.html\\">Page 020r</option><option value=\\"/images/MSS-9/020v.html\\">Page 020v</option><option value=\\"/images/MSS-9/021r.html\\">Page 021r</option><option value=\\"/images/MSS-9/021v.html\\">Page 021v</option><option value=\\"/images/MSS-9/022r.html\\">Page 022r</option><option value=\\"/images/MSS-9/022v.html\\">Page 022v</option><option value=\\"/images/MSS-9/023r.html\\">Page 023r</option><option value=\\"/images/MSS-9/023v.html\\">Page 023v</option><option value=\\"/images/MSS-9/024r.html\\">Page 024r</option><option value=\\"/images/MSS-9/024v.html\\">Page 024v</option><option value=\\"/images/MSS-9/025r.html\\">Page 025r</option><option value=\\"/images/MSS-9/025v.html\\">Page 025v</option><option value=\\"/images/MSS-9/026r.html\\">Page 026r</option><option value=\\"/images/MSS-9/026v.html\\">Page 026v</option><option value=\\"/images/MSS-9/027r.html\\">Page 027r</option><option value=\\"/images/MSS-9/027v.html\\">Page 027v</option><option value=\\"/images/MSS-9/028r.html\\">Page 028r</option><option value=\\"/images/MSS-9/028v.html\\">Page 028v</option><option value=\\"/images/MSS-9/029r.html\\">Page 029r</option><option value=\\"/images/MSS-9/029v.html\\">Page 029v</option><option value=\\"/images/MSS-9/030r.html\\">Page 030r</option><option value=\\"/images/MSS-9/030v.html\\">Page 030v</option><option value=\\"/images/MSS-9/031r.html\\">Page 031r</option><option value=\\"/images/MSS-9/031v.html\\">Page 031v</option><option value=\\"/images/MSS-9/032r.html\\">Page 032r</option><option value=\\"/images/MSS-9/032v.html\\">Page 032v</option><option value=\\"/images/MSS-9/033r.html\\">Page 033r</option><option value=\\"/images/MSS-9/033v.html\\">Page 033v</option><option value=\\"/images/MSS-9/034r.html\\">Page 034r</option><option value=\\"/images/MSS-9/034v.html\\">Page 034v</option><option value=\\"/images/MSS-9/035r.html\\">Page 035r</option><option value=\\"/images/MSS-9/035v.html\\">Page 035v</option><option value=\\"/images/MSS-9/036r.html\\">Page 036r</option><option value=\\"/images/MSS-9/036v.html\\">Page 036v</option><option value=\\"/images/MSS-9/037r.html\\">Page 037r</option><option value=\\"/images/MSS-9/037v.html\\">Page 037v</option><option value=\\"/images/MSS-9/038r.html\\">Page 038r</option><option value=\\"/images/MSS-9/038v.html\\">Page 038v</option><option value=\\"/images/MSS-9/039r.html\\">Page 039r</option><option value=\\"/images/MSS-9/039v.html\\">Page 039v</option><option value=\\"/images/MSS-9/040r.html\\">Page 040r</option><option value=\\"/images/MSS-9/040v.html\\">Page 040v</option><option value=\\"/images/MSS-9/041r.html\\">Page 041r</option><option value=\\"/images/MSS-9/041v.html\\">Page 041v</option><option value=\\"/images/MSS-9/042r.html\\">Page 042r</option><option value=\\"/images/MSS-9/042v.html\\">Page 042v</option><option value=\\"/images/MSS-9/043r.html\\">Page 043r</option><option value=\\"/images/MSS-9/043v.html\\">Page 043v</option><option value=\\"/images/MSS-9/044r.html\\">Page 044r</option><option value=\\"/images/MSS-9/044v.html\\">Page 044v</option><option value=\\"/images/MSS-9/045r.html\\">Page 045r</option><option value=\\"/images/MSS-9/045v.html\\">Page 045v</option><option value=\\"/images/MSS-9/046r.html\\">Page 046r</option><option value=\\"/images/MSS-9/046v.html\\">Page 046v</option><option value=\\"/images/MSS-9/047r.html\\">Page 047r</option><option value=\\"/images/MSS-9/047v.html\\">Page 047v</option><option value=\\"/images/MSS-9/048r.html\\">Page 048r</option><option value=\\"/images/MSS-9/048v.html\\">Page 048v</option><option value=\\"/images/MSS-9/049r.html\\">Page 049r</option><option value=\\"/images/MSS-9/049v.html\\">Page 049v</option><option value=\\"/images/MSS-9/050r.html\\">Page 050r</option><option value=\\"/images/MSS-9/050v.html\\">Page 050v</option><option value=\\"/images/MSS-9/051r.html\\">Page 051r</option><option value=\\"/images/MSS-9/051v.html\\">Page 051v</option><option value=\\"/images/MSS-9/052r.html\\">Page 052r</option><option value=\\"/images/MSS-9/052v.html\\">Page 052v</option><option value=\\"/images/MSS-9/053r.html\\">Page 053r</option><option value=\\"/images/MSS-9/053v.html\\">Page 053v</option><option value=\\"/images/MSS-9/054r.html\\">Page 054r</option><option value=\\"/images/MSS-9/054v.html\\">Page 054v</option><option value=\\"/images/MSS-9/055r.html\\">Page 055r</option><option value=\\"/images/MSS-9/055v.html\\">Page 055v</option><option value=\\"/images/MSS-9/056r.html\\">Page 056r</option><option value=\\"/images/MSS-9/056v.html\\">Page 056v</option><option value=\\"/images/MSS-9/057r.html\\">Page 057r</option><option value=\\"/images/MSS-9/057v.html\\">Page 057v</option><option value=\\"/images/MSS-9/058r.html\\">Page 058r</option><option value=\\"/images/MSS-9/058v.html\\">Page 058v</option><option value=\\"/images/MSS-9/059r.html\\">Page 059r</option><option value=\\"/images/MSS-9/059v.html\\">Page 059v</option><option value=\\"/images/MSS-9/060r.html\\">Page 060r</option><option value=\\"/images/MSS-9/060v.html\\">Page 060v</option><option value=\\"/images/MSS-9/061r.html\\">Page 061r</option><option value=\\"/images/MSS-9/061v.html\\">Page 061v</option><option value=\\"/images/MSS-9/062r.html\\">Page 062r</option><option value=\\"/images/MSS-9/062v.html\\">Page 062v</option></select>\\n   \\n            <p>\\u00a0</p>\\n    <p>This Diary records Alleyn's daily financial accounts for every aspect of his\\n        private life and professional career, including the costs of food, clothing,\\n        medicine, and travel, property and building purchases, court and legal expenses,\\n        salaries for various employees and interaction with a variety of government and\\n        religious officials, tradesmen, and ordinary people. Also included are itemised\\n        costs for the foundation and maintenance of Dulwich College, Chapel and\\n        Almshouses, as well as festive birthday, Christmas and New Year's celebrations\\n        with the poor.</p>\\n    <p>More broadly, the Diary provides a list of Alleyn's daily actions and movements\\n        across the social and political spectrum, from meetings with James Villiers, the\\n        favorite of King James I, to property development with middle-class\\n        entrepreneurs to the supervision of gardeners, carpenters, and a variety of\\n        household servants, provding an unusually full view of life in early modern\\n        England. Alleyn's Diary also documents his frequent trips to London, complete\\n        with the routes taken and the lists of pubs visited, offering a virtual map of\\n        some areas of the city and its environs. Most notably, Alleyn is an eyewitness\\n        to a wide range of the major events of the period, including the death and\\n        funeral of Queen Anne and the destruction of Whitehall Palace by fire. </p>\\n    <p>William Young produced an edition of the Diary in Volume 2 of <em>The History\\n        of Dulwich College</em> (Edinburgh: Morrison &amp;Gibb, 1889). A new\\n        edition of the Diary is being prepared by S. P. Cerasano and Grace Ioppolo for\\n        Oxford University Press. Also see the Digital Essays.</p>\\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	Diary and Account Book of Edward Alleyn, Sepember 29, 1617-October 1,\n                    1622.
1172	[{"id": "6377b043-e7dd-4193-8e2d-60f15e6db481", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n\\n            <select name=\\"menu1\\" id=\\"menu1\\" onchange=\\"jumpMenu('parent',this,0)\\"><option selected=\\"selected\\" value=\\"#\\">Please select...</option><option value=\\"/images/MSS-19/01r.html\\">Page 01r</option><option value=\\"/images/MSS-19/01v.html\\">Page 01v</option><option value=\\"/images/MSS-19/02r.html\\">Page 02r</option><option value=\\"/images/MSS-19/02v.html\\">Page 02v</option><option value=\\"/images/MSS-19/03r.html\\">Page 03r</option><option value=\\"/images/MSS-19/03v.html\\">Page 03v</option></select>\\n    \\n            <p>\\u00a0</p>\\n            \\n    <p>This plot outlines the action of the play by Richard Tarleton, with the names of\\n        the performers, including Richard Burbage, Thomas Pope, Richard Cowley,\\n        Augustine Phillips, William Sly, Robert Pallant, and 'Ned', that is, Edward\\n        Alleyn. It is entitled on the outside ' The Booke and Platt', etc, suggesting it\\n        was copied from the 'book' (or 'promptbook' in modern terms) of the play.</p>\\n    <p>The plot of the first part of the play, which probably dealt with Pride,\\n        Gluttony, Wrath and Covetousness, has not survived. As Tarleton was buried on\\n        September 3, 1588, the second part must have been composed before that date.</p>\\n    <p>The plot is wrtiten in a large, clear hand, most likely that of a company scribe\\n        or 'book-keeper', on a sheet of paper measuring 16 x 12 inches, with a hole in\\n        the centre near the top for the nail or peg by which it was suspended in the\\n        theatre. When found at Dulwich, it formed the cover of the play of <em>The\\n            Telltale, MSS 20.</em> See the Digital Essays.</p>\\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	The 'Platt' (or Plot) of 
\.


--
-- Data for Name: cms_homepage; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.cms_homepage (page_ptr_id, body, subtitle) FROM stdin;
4	[{"id": "1b9b0a3b-5421-441f-b128-e6b9b67bf777", "type": "paragraph", "value": "<p></p><h2>Introduction to the Henslowe-Alleyn Digitisation Project</h2><p><a href=\\"images/pubimg/full/.\\"></a>The Archive of Dulwich College in London, England, holds thousands of pages of manuscripts left to the College by its founder, the eminent actor Edward Alleyn (1566-1626). This archive includes his personal and professional papers and those he inherited from his father-in-law Philip Henslowe (d. 1616). As a group, these manuscripts comprise the largest and most important single extant archive of material on the professional theatre and dramatic performance in early modern England, the age of Shakespeare, Marlowe, Jonson, Middleton, Heywood, Dekker, Chettle, and so many of their contemporaries and colleagues.</p><p>Henslowe and Alleyn built and expanded several London public playhouses, including the Rose, the Fortune, and the Hope, the foundations of some of which have recently been discovered or excavated by Museum of London staff. Named by King James I as Joint \\u2018Masters of the Royal Game of Bears, Bulls and Mastiff Dogs\\u2019, Henslowe and Alleyn also staged such blood sports as bull- and bear- and lion-baiting at the Bear Garden and other venues, including royal palaces.</p><p>Henslowe and Alleyn commissioned plays from dramatists and ran several of the most successful acting companies of the time, including the Lord Strange\\u2019s Men and the Lord Admiral\\u2019s Men, for which Alleyn performed such famous roles as Dr Faustus and Tamburlaine. The sole surviving actor\\u2019s \\u2018part\\u2019 (or script) from the period, for the play <i>Orlando Furioso</i>, is in the Dulwich archive, as is the \\u2018plot\\u2019 (or prompter&#x27;s outline) of the play <i>The Second Part of the Seven Deadly Sins</i>, one of only six plots from this period known to survive in part or in whole. In fact, most of what modern scholars know about the early modern English theatre, both as financial enterprise and artistic endeavour, comes from the study of the Henslowe and Alleyn papers at Dulwich College.</p><p>The Henslowe-Alleyn Digitisation Project has two aims and objectives: first, to protect and conserve these increasingly fragile manuscripts, and, second, to make their contents much more widely available in a free electronic archive and website, not only to specialist scholars but to all those interested in early modern English drama and theatre history, as well as social, economic, regional, architectural, and legal history, and palaeography and manuscript studies. It is the hope of the Henslowe Alleyn Digitisation Project members that the use of these manuscripts in electronic and digital form will not be confined to students and scholars but to a wide-ranging and ever-changing community of readers in a variety of ways.</p>"}]	
\.


--
-- Data for Name: cms_image; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.cms_image (page_ptr_id, body, subtitle, reference, filename, transcription) FROM stdin;
32	[]	45. Petition of King James I for the incorporation of the making of ammunition, with a list in Edward Alleyn's hand of his books on the verso, no date.	MSS 5, Group 45, 01r	05-045-01r.jp2	[]
33	[]	47.The Order of Eton College bakehouse and brewhouse, to be used as models for Dulwich College, Aug. 3, 1618.	MSS 5, Group 47, 01r	05-047-01r.jp2	[]
34	[]	48. Statutes of the 'Orphanocomium', or the Hospital of the Orphans, and the 'Gerontocomium', or the Hospital of old Folks, to be used as models for Dulwich College, 1611.	MSS 5, Group 48, 01r	05-048-01r.jp2	[]
36	[]	1. List in the hand of William Cartwright the younger of his books, including a First Folio of Shakespeare's pl, no date.	Miscellaneous Images, 01r	Cartwright-01r.jp2	[]
38	[]	Page 001r	MSS 7, 001r	07-001r.jp2	[]
39	[]	Page 001v	MSS 7, 001v	07-001v.jp2	[]
40	[]	Page 002r	MSS 7, 002r	07-002r.jp2	[]
41	[]	Page 002v	MSS 7, 002v	07-002v.jp2	[]
42	[]	Page 003r	MSS 7, 003r	07-003r.jp2	[]
43	[]	Page 003v	MSS 7, 003v	07-003v.jp2	[]
44	[]	Page 004r	MSS 7, 004r	07-004r.jp2	[]
45	[]	Page 004v	MSS 7, 004v	07-004v.jp2	[]
46	[]	Page 005r	MSS 7, 005r	07-005r.jp2	[]
47	[]	Page 005v	MSS 7, 005v	07-005v.jp2	[]
48	[]	Page 006r	MSS 7, 006r	07-006r.jp2	[]
49	[]	Page 006v	MSS 7, 006v	07-006v.jp2	[]
50	[]	Page 007r	MSS 7, 007r	07-007r.jp2	[]
51	[]	Page 007v	MSS 7, 007v	07-007v.jp2	[]
52	[]	Page 008r	MSS 7, 008r	07-008r.jp2	[]
53	[]	Page 008v	MSS 7, 008v	07-008v.jp2	[]
54	[]	Page 009r	MSS 7, 009r	07-009r.jp2	[]
55	[]	Page 009v	MSS 7, 009v	07-009v.jp2	[]
56	[]	Page 010r	MSS 7, 010r	07-010r.jp2	[]
57	[]	Page 010v	MSS 7, 010v	07-010v.jp2	[]
58	[]	Page 011r	MSS 7, 011r	07-011r.jp2	[]
59	[]	Page 011v	MSS 7, 011v	07-011v.jp2	[]
60	[]	Page 012r	MSS 7, 012r	07-012r.jp2	[]
61	[]	Page 012v	MSS 7, 012v	07-012v.jp2	[]
62	[]	Page 013r	MSS 7, 013r	07-013r.jp2	[]
63	[]	Page 013v	MSS 7, 013v	07-013v.jp2	[]
64	[]	Page 014r	MSS 7, 014r	07-014r.jp2	[]
65	[]	Page 014v	MSS 7, 014v	07-014v.jp2	[]
66	[]	Page 015r	MSS 7, 015r	07-015r.jp2	[]
67	[]	Page 015v	MSS 7, 015v	07-015v.jp2	[]
68	[]	Page 016r	MSS 7, 016r	07-016r.jp2	[]
69	[]	Page 016v	MSS 7, 016v	07-016v.jp2	[]
70	[]	Page 017r	MSS 7, 017r	07-017r.jp2	[]
71	[]	Page 017v	MSS 7, 017v	07-017v.jp2	[]
72	[]	Page 018r	MSS 7, 018r	07-018r.jp2	[]
73	[]	Page 018v	MSS 7, 018v	07-018v.jp2	[]
74	[]	Page 019r	MSS 7, 019r	07-019r.jp2	[]
75	[]	Page 019v	MSS 7, 019v	07-019v.jp2	[]
76	[]	Page 020r	MSS 7, 020r	07-020r.jp2	[]
77	[]	Page 020v	MSS 7, 020v	07-020v.jp2	[]
78	[]	Page 021r	MSS 7, 021r	07-021r.jp2	[]
79	[]	Page 021v	MSS 7, 021v	07-021v.jp2	[]
80	[]	Page 022r	MSS 7, 022r	07-022r.jp2	[]
81	[]	Page 022v	MSS 7, 022v	07-022v.jp2	[]
82	[]	Page 023r	MSS 7, 023r	07-023r.jp2	[]
83	[]	Page 023v	MSS 7, 023v	07-023v.jp2	[]
84	[]	Page 024r	MSS 7, 024r	07-024r.jp2	[]
85	[]	Page 024v	MSS 7, 024v	07-024v.jp2	[]
86	[]	Page 025r	MSS 7, 025r	07-025r.jp2	[]
87	[]	Page 025v	MSS 7, 025v	07-025v.jp2	[]
88	[]	Page 026r	MSS 7, 026r	07-026r.jp2	[]
89	[]	Page 026v	MSS 7, 026v	07-026v.jp2	[]
90	[]	Page 027r	MSS 7, 027r	07-027r.jp2	[]
91	[]	Page 027v	MSS 7, 027v	07-027v.jp2	[]
92	[]	Page 028r	MSS 7, 028r	07-028r.jp2	[]
93	[]	Page 028v	MSS 7, 028v	07-028v.jp2	[]
94	[]	Page 029r	MSS 7, 029r	07-029r.jp2	[]
95	[]	Page 029v	MSS 7, 029v	07-029v.jp2	[]
96	[]	Page 030r	MSS 7, 030r	07-030r.jp2	[]
97	[]	Page 030v	MSS 7, 030v	07-030v.jp2	[]
98	[]	Page 031r	MSS 7, 031r	07-031r.jp2	[]
99	[]	Page 031v	MSS 7, 031v	07-031v.jp2	[]
100	[]	Page 032r	MSS 7, 032r	07-032r.jp2	[]
101	[]	Page 032v	MSS 7, 032v	07-032v.jp2	[]
102	[]	Page 033r	MSS 7, 033r	07-033r.jp2	[]
103	[]	Page 033v	MSS 7, 033v	07-033v.jp2	[]
104	[]	Page 034r	MSS 7, 034r	07-034r.jp2	[]
105	[]	Page 034v	MSS 7, 034v	07-034v.jp2	[]
106	[]	Page 035r	MSS 7, 035r	07-035r.jp2	[]
107	[]	Page 035v	MSS 7, 035v	07-035v.jp2	[]
108	[]	Page 036r	MSS 7, 036r	07-036r.jp2	[]
109	[]	Page 036v	MSS 7, 036v	07-036v.jp2	[]
110	[]	Page 037r	MSS 7, 037r	07-037r.jp2	[]
111	[]	Page 037v	MSS 7, 037v	07-037v.jp2	[]
112	[]	Page 038r	MSS 7, 038r	07-038r.jp2	[]
113	[]	Page 038v	MSS 7, 038v	07-038v.jp2	[]
114	[]	Page 039r	MSS 7, 039r	07-039r.jp2	[]
115	[]	Page 039v	MSS 7, 039v	07-039v.jp2	[]
116	[]	Page 040r	MSS 7, 040r	07-040r.jp2	[]
117	[]	Page 040v	MSS 7, 040v	07-040v.jp2	[]
118	[]	Page 041r	MSS 7, 041r	07-041r.jp2	[]
119	[]	Page 041v	MSS 7, 041v	07-041v.jp2	[]
120	[]	Page 042r	MSS 7, 042r	07-042r.jp2	[]
121	[]	Page 042v	MSS 7, 042v	07-042v.jp2	[]
122	[]	Page 043r	MSS 7, 043r	07-043r.jp2	[]
123	[]	Page 043v	MSS 7, 043v	07-043v.jp2	[]
124	[]	Page 044r	MSS 7, 044r	07-044r.jp2	[]
125	[]	Page 044v	MSS 7, 044v	07-044v.jp2	[]
126	[]	Page 045r	MSS 7, 045r	07-045r.jp2	[]
127	[]	Page 045v	MSS 7, 045v	07-045v.jp2	[]
128	[]	Page 046r	MSS 7, 046r	07-046r.jp2	[]
129	[]	Page 046v	MSS 7, 046v	07-046v.jp2	[]
130	[]	Page 047r	MSS 7, 047r	07-047r.jp2	[]
131	[]	Page 047v	MSS 7, 047v	07-047v.jp2	[]
132	[]	Page 048r	MSS 7, 048r	07-048r.jp2	[]
133	[]	Page 048v	MSS 7, 048v	07-048v.jp2	[]
134	[]	Page 049r	MSS 7, 049r	07-049r.jp2	[]
135	[]	Page 049v	MSS 7, 049v	07-049v.jp2	[]
136	[]	Page 050r	MSS 7, 050r	07-050r.jp2	[]
137	[]	Page 050v	MSS 7, 050v	07-050v.jp2	[]
138	[]	Page 051r	MSS 7, 051r	07-051r.jp2	[]
139	[]	Page 051v	MSS 7, 051v	07-051v.jp2	[]
140	[]	Page 052r	MSS 7, 052r	07-052r.jp2	[]
141	[]	Page 052v	MSS 7, 052v	07-052v.jp2	[]
142	[]	Page 053r	MSS 7, 053r	07-053r.jp2	[]
143	[]	Page 053v	MSS 7, 053v	07-053v.jp2	[]
144	[]	Page 054r	MSS 7, 054r	07-054r.jp2	[]
145	[]	Page 054v	MSS 7, 054v	07-054v.jp2	[]
146	[]	Page 055r	MSS 7, 055r	07-055r.jp2	[]
147	[]	Page 055v	MSS 7, 055v	07-055v.jp2	[]
148	[]	Page 056r	MSS 7, 056r	07-056r.jp2	[]
149	[]	Page 056v	MSS 7, 056v	07-056v.jp2	[]
150	[]	Page 057r	MSS 7, 057r	07-057r.jp2	[]
151	[]	Page 057v	MSS 7, 057v	07-057v.jp2	[]
152	[]	Page 058r	MSS 7, 058r	07-058r.jp2	[]
153	[]	Page 058v	MSS 7, 058v	07-058v.jp2	[]
154	[]	Page 059r	MSS 7, 059r	07-059r.jp2	[]
155	[]	Page 059v	MSS 7, 059v	07-059v.jp2	[]
156	[]	Page 060r	MSS 7, 060r	07-060r.jp2	[]
157	[]	Page 060v	MSS 7, 060v	07-060v.jp2	[]
158	[]	Page 061r	MSS 7, 061r	07-061r.jp2	[]
159	[]	Page 061v	MSS 7, 061v	07-061v.jp2	[]
160	[]	Page 062r	MSS 7, 062r	07-062r.jp2	[]
161	[]	Page 062v	MSS 7, 062v	07-062v.jp2	[]
162	[]	Page 063r	MSS 7, 063r	07-063r.jp2	[]
163	[]	Page 063v	MSS 7, 063v	07-063v.jp2	[]
164	[]	Page 064r	MSS 7, 064r	07-064r.jp2	[]
165	[]	Page 064v	MSS 7, 064v	07-064v.jp2	[]
166	[]	Page 065r	MSS 7, 065r	07-065r.jp2	[]
167	[]	Page 065v	MSS 7, 065v	07-065v.jp2	[]
168	[]	Page 066r	MSS 7, 066r	07-066r.jp2	[]
169	[]	Page 066v	MSS 7, 066v	07-066v.jp2	[]
170	[]	Page 067r	MSS 7, 067r	07-067r.jp2	[]
171	[]	Page 067v	MSS 7, 067v	07-067v.jp2	[]
172	[]	Page 068r	MSS 7, 068r	07-068r.jp2	[]
173	[]	Page 068v	MSS 7, 068v	07-068v.jp2	[]
174	[]	Page 069r	MSS 7, 069r	07-069r.jp2	[]
175	[]	Page 069v	MSS 7, 069v	07-069v.jp2	[]
176	[]	Page 070r	MSS 7, 070r	07-070r.jp2	[]
177	[]	Page 070v	MSS 7, 070v	07-070v.jp2	[]
178	[]	Page 071r	MSS 7, 071r	07-071r.jp2	[]
179	[]	Page 071v	MSS 7, 071v	07-071v.jp2	[]
180	[]	Page 072r	MSS 7, 072r	07-072r.jp2	[]
181	[]	Page 072v	MSS 7, 072v	07-072v.jp2	[]
182	[]	Page 073r	MSS 7, 073r	07-073r.jp2	[]
183	[]	Page 073v	MSS 7, 073v	07-073v.jp2	[]
184	[]	Page 074r	MSS 7, 074r	07-074r.jp2	[]
185	[]	Page 074v	MSS 7, 074v	07-074v.jp2	[]
186	[]	Page 075r	MSS 7, 075r	07-075r.jp2	[]
187	[]	Page 075v	MSS 7, 075v	07-075v.jp2	[]
188	[]	Page 076r	MSS 7, 076r	07-076r.jp2	[]
189	[]	Page 076v	MSS 7, 076v	07-076v.jp2	[]
190	[]	Page 077r	MSS 7, 077r	07-077r.jp2	[]
191	[]	Page 077v	MSS 7, 077v	07-077v.jp2	[]
192	[]	Page 078r	MSS 7, 078r	07-078r.jp2	[]
193	[]	Page 078v	MSS 7, 078v	07-078v.jp2	[]
194	[]	Page 079r	MSS 7, 079r	07-079r.jp2	[]
195	[]	Page 079v	MSS 7, 079v	07-079v.jp2	[]
196	[]	Page 080r	MSS 7, 080r	07-080r.jp2	[]
197	[]	Page 080v	MSS 7, 080v	07-080v.jp2	[]
198	[]	Page 081r	MSS 7, 081r	07-081r.jp2	[]
199	[]	Page 081v	MSS 7, 081v	07-081v.jp2	[]
200	[]	Page 082r	MSS 7, 082r	07-082r.jp2	[]
201	[]	Page 082v	MSS 7, 082v	07-082v.jp2	[]
202	[]	Page 083r	MSS 7, 083r	07-083r.jp2	[]
203	[]	Page 083v	MSS 7, 083v	07-083v.jp2	[]
204	[]	Page 084r	MSS 7, 084r	07-084r.jp2	[]
205	[]	Page 084v	MSS 7, 084v	07-084v.jp2	[]
206	[]	Page 085r	MSS 7, 085r	07-085r.jp2	[]
207	[]	Page 085v	MSS 7, 085v	07-085v.jp2	[]
208	[]	Page 086r	MSS 7, 086r	07-086r.jp2	[]
209	[]	Page 086v	MSS 7, 086v	07-086v.jp2	[]
210	[]	Page 087r	MSS 7, 087r	07-087r.jp2	[]
211	[]	Page 087v	MSS 7, 087v	07-087v.jp2	[]
212	[]	Page 088r	MSS 7, 088r	07-088r.jp2	[]
213	[]	Page 088v	MSS 7, 088v	07-088v.jp2	[]
214	[]	Page 089r	MSS 7, 089r	07-089r.jp2	[]
215	[]	Page 089v	MSS 7, 089v	07-089v.jp2	[]
216	[]	Page 090r	MSS 7, 090r	07-090r.jp2	[]
217	[]	Page 090v	MSS 7, 090v	07-090v.jp2	[]
218	[]	Page 091r	MSS 7, 091r	07-091r.jp2	[]
219	[]	Page 091v	MSS 7, 091v	07-091v.jp2	[]
220	[]	Page 092r	MSS 7, 092r	07-092r.jp2	[]
221	[]	Page 092v	MSS 7, 092v	07-092v.jp2	[]
222	[]	Page 093r	MSS 7, 093r	07-093r.jp2	[]
223	[]	Page 093v	MSS 7, 093v	07-093v.jp2	[]
224	[]	Page 094r	MSS 7, 094r	07-094r.jp2	[]
225	[]	Page 094v	MSS 7, 094v	07-094v.jp2	[]
226	[]	Page 095r	MSS 7, 095r	07-095r.jp2	[]
227	[]	Page 095v	MSS 7, 095v	07-095v.jp2	[]
228	[]	Page 096r	MSS 7, 096r	07-096r.jp2	[]
229	[]	Page 096v	MSS 7, 096v	07-096v.jp2	[]
230	[]	Page 097r	MSS 7, 097r	07-097r.jp2	[]
231	[]	Page 097v	MSS 7, 097v	07-097v.jp2	[]
232	[]	Page 098r	MSS 7, 098r	07-098r.jp2	[]
233	[]	Page 098v	MSS 7, 098v	07-098v.jp2	[]
234	[]	Page 099r	MSS 7, 099r	07-099r.jp2	[]
235	[]	Page 099v	MSS 7, 099v	07-099v.jp2	[]
236	[]	Page 100r	MSS 7, 100r	07-100r.jp2	[]
237	[]	Page 100v	MSS 7, 100v	07-100v.jp2	[]
238	[]	Page 101r	MSS 7, 101r	07-101r.jp2	[]
239	[]	Page 101v	MSS 7, 101v	07-101v.jp2	[]
240	[]	Page 102r	MSS 7, 102r	07-102r.jp2	[]
241	[]	Page 102v	MSS 7, 102v	07-102v.jp2	[]
242	[]	Page 103r	MSS 7, 103r	07-103r.jp2	[]
243	[]	Page 103v	MSS 7, 103v	07-103v.jp2	[]
244	[]	Page 104r	MSS 7, 104r	07-104r.jp2	[]
245	[]	Page 104v	MSS 7, 104v	07-104v.jp2	[]
246	[]	Page 105r	MSS 7, 105r	07-105r.jp2	[]
247	[]	Page 105v	MSS 7, 105v	07-105v.jp2	[]
248	[]	Page 106r	MSS 7, 106r	07-106r.jp2	[]
249	[]	Page 106v	MSS 7, 106v	07-106v.jp2	[]
250	[]	Page 107r	MSS 7, 107r	07-107r.jp2	[]
251	[]	Page 107v	MSS 7, 107v	07-107v.jp2	[]
252	[]	Page 108r	MSS 7, 108r	07-108r.jp2	[]
253	[]	Page 108v	MSS 7, 108v	07-108v.jp2	[]
254	[]	Page 109r	MSS 7, 109r	07-109r.jp2	[]
255	[]	Page 109v	MSS 7, 109v	07-109v.jp2	[]
256	[]	Page 110r	MSS 7, 110r	07-110r.jp2	[]
257	[]	Page 110v	MSS 7, 110v	07-110v.jp2	[]
258	[]	Page 111r	MSS 7, 111r	07-111r.jp2	[]
259	[]	Page 111v	MSS 7, 111v	07-111v.jp2	[]
260	[]	Page 112r	MSS 7, 112r	07-112r.jp2	[]
261	[]	Page 112v	MSS 7, 112v	07-112v.jp2	[]
262	[]	Page 113r	MSS 7, 113r	07-113r.jp2	[]
263	[]	Page 113v	MSS 7, 113v	07-113v.jp2	[]
264	[]	Page 114r	MSS 7, 114r	07-114r.jp2	[]
265	[]	Page 114v	MSS 7, 114v	07-114v.jp2	[]
266	[]	Page 115r	MSS 7, 115r	07-115r.jp2	[]
267	[]	Page 115v	MSS 7, 115v	07-115v.jp2	[]
268	[]	Page 116r	MSS 7, 116r	07-116r.jp2	[]
269	[]	Page 116v	MSS 7, 116v	07-116v.jp2	[]
270	[]	Page 117r	MSS 7, 117r	07-117r.jp2	[]
271	[]	Page 117v	MSS 7, 117v	07-117v.jp2	[]
272	[]	Page 118r	MSS 7, 118r	07-118r.jp2	[]
273	[]	Page 118v	MSS 7, 118v	07-118v.jp2	[]
274	[]	Page 119r	MSS 7, 119r	07-119r.jp2	[]
275	[]	Page 119v	MSS 7, 119v	07-119v.jp2	[]
276	[]	Page 120r	MSS 7, 120r	07-120r.jp2	[]
277	[]	Page 120v	MSS 7, 120v	07-120v.jp2	[]
278	[]	Page 121r	MSS 7, 121r	07-121r.jp2	[]
279	[]	Page 121v	MSS 7, 121v	07-121v.jp2	[]
280	[]	Page 122r	MSS 7, 122r	07-122r.jp2	[]
281	[]	Page 122v	MSS 7, 122v	07-122v.jp2	[]
282	[]	Page 123r	MSS 7, 123r	07-123r.jp2	[]
283	[]	Page 123v	MSS 7, 123v	07-123v.jp2	[]
284	[]	Page 124r	MSS 7, 124r	07-124r.jp2	[]
285	[]	Page 124v	MSS 7, 124v	07-124v.jp2	[]
286	[]	Page 125r	MSS 7, 125r	07-125r.jp2	[]
287	[]	Page 125v	MSS 7, 125v	07-125v.jp2	[]
288	[]	Page 126ar	MSS 7, 126ar	07-126ar.jp2	[]
289	[]	Page 126av	MSS 7, 126av	07-126av.jp2	[]
290	[]	Page 126br	MSS 7, 126br	07-126br.jp2	[]
291	[]	Page 126bv	MSS 7, 126bv	07-126bv.jp2	[]
292	[]	Page 126cr	MSS 7, 126cr	07-126cr.jp2	[]
293	[]	Page 126cv	MSS 7, 126cv	07-126cv.jp2	[]
294	[]	Page 126dr	MSS 7, 126dr	07-126dr.jp2	[]
295	[]	Page 126dv	MSS 7, 126dv	07-126dv.jp2	[]
296	[]	Page 126er	MSS 7, 126er	07-126er.jp2	[]
297	[]	Page 126ev	MSS 7, 126ev	07-126ev.jp2	[]
298	[]	Page 126r	MSS 7, 126r	07-126r.jp2	[]
299	[]	Page 126v	MSS 7, 126v	07-126v.jp2	[]
300	[]	Page 127r	MSS 7, 127r	07-127r.jp2	[]
301	[]	Page 127v	MSS 7, 127v	07-127v.jp2	[]
302	[]	Page 128r	MSS 7, 128r	07-128r.jp2	[]
303	[]	Page 128v	MSS 7, 128v	07-128v.jp2	[]
304	[]	Page 129r	MSS 7, 129r	07-129r.jp2	[]
305	[]	Page 129v	MSS 7, 129v	07-129v.jp2	[]
306	[]	Page 130r	MSS 7, 130r	07-130r.jp2	[]
307	[]	Page 130v	MSS 7, 130v	07-130v.jp2	[]
308	[]	Page 131r	MSS 7, 131r	07-131r.jp2	[]
309	[]	Page 131v	MSS 7, 131v	07-131v.jp2	[]
310	[]	Page 132r	MSS 7, 132r	07-132r.jp2	[]
311	[]	Page 132v	MSS 7, 132v	07-132v.jp2	[]
312	[]	Page 133r	MSS 7, 133r	07-133r.jp2	[]
313	[]	Page 133v	MSS 7, 133v	07-133v.jp2	[]
314	[]	Page 134r	MSS 7, 134r	07-134r.jp2	[]
315	[]	Page 134v	MSS 7, 134v	07-134v.jp2	[]
316	[]	Page 135r	MSS 7, 135r	07-135r.jp2	[]
317	[]	Page 135v	MSS 7, 135v	07-135v.jp2	[]
318	[]	Page 136r	MSS 7, 136r	07-136r.jp2	[]
319	[]	Page 136v	MSS 7, 136v	07-136v.jp2	[]
320	[]	Page 137r	MSS 7, 137r	07-137r.jp2	[]
321	[]	Page 137v	MSS 7, 137v	07-137v.jp2	[]
322	[]	Page 138r	MSS 7, 138r	07-138r.jp2	[]
323	[]	Page 138v	MSS 7, 138v	07-138v.jp2	[]
324	[]	Page 139r	MSS 7, 139r	07-139r.jp2	[]
325	[]	Page 139v	MSS 7, 139v	07-139v.jp2	[]
326	[]	Page 140r	MSS 7, 140r	07-140r.jp2	[]
327	[]	Page 140v	MSS 7, 140v	07-140v.jp2	[]
328	[]	Page 141r	MSS 7, 141r	07-141r.jp2	[]
329	[]	Page 141v	MSS 7, 141v	07-141v.jp2	[]
330	[]	Page 142r	MSS 7, 142r	07-142r.jp2	[]
331	[]	Page 142v	MSS 7, 142v	07-142v.jp2	[]
332	[]	Page 143r	MSS 7, 143r	07-143r.jp2	[]
333	[]	Page 143v	MSS 7, 143v	07-143v.jp2	[]
334	[]	Page 144r	MSS 7, 144r	07-144r.jp2	[]
335	[]	Page 144v	MSS 7, 144v	07-144v.jp2	[]
336	[]	Page 145r	MSS 7, 145r	07-145r.jp2	[]
337	[]	Page 145v	MSS 7, 145v	07-145v.jp2	[]
338	[]	Page 146r	MSS 7, 146r	07-146r.jp2	[]
339	[]	Page 146v	MSS 7, 146v	07-146v.jp2	[]
340	[]	Page 147r	MSS 7, 147r	07-147r.jp2	[]
341	[]	Page 147v	MSS 7, 147v	07-147v.jp2	[]
342	[]	Page 148r	MSS 7, 148r	07-148r.jp2	[]
343	[]	Page 148v	MSS 7, 148v	07-148v.jp2	[]
344	[]	Page 149r	MSS 7, 149r	07-149r.jp2	[]
345	[]	Page 149v	MSS 7, 149v	07-149v.jp2	[]
346	[]	Page 150r	MSS 7, 150r	07-150r.jp2	[]
347	[]	Page 150v	MSS 7, 150v	07-150v.jp2	[]
348	[]	Page 151r	MSS 7, 151r	07-151r.jp2	[]
349	[]	Page 151v	MSS 7, 151v	07-151v.jp2	[]
350	[]	Page 152r	MSS 7, 152r	07-152r.jp2	[]
351	[]	Page 152v	MSS 7, 152v	07-152v.jp2	[]
352	[]	Page 153r	MSS 7, 153r	07-153r.jp2	[]
353	[]	Page 153v	MSS 7, 153v	07-153v.jp2	[]
354	[]	Page 154r	MSS 7, 154r	07-154r.jp2	[]
355	[]	Page 154v	MSS 7, 154v	07-154v.jp2	[]
356	[]	Page 155r	MSS 7, 155r	07-155r.jp2	[]
357	[]	Page 155v	MSS 7, 155v	07-155v.jp2	[]
358	[]	Page 156r	MSS 7, 156r	07-156r.jp2	[]
359	[]	Page 156v	MSS 7, 156v	07-156v.jp2	[]
360	[]	Page 157r	MSS 7, 157r	07-157r.jp2	[]
361	[]	Page 157v	MSS 7, 157v	07-157v.jp2	[]
362	[]	Page 158r	MSS 7, 158r	07-158r.jp2	[]
363	[]	Page 158v	MSS 7, 158v	07-158v.jp2	[]
364	[]	Page 159r	MSS 7, 159r	07-159r.jp2	[]
365	[]	Page 159v	MSS 7, 159v	07-159v.jp2	[]
366	[]	Page 160r	MSS 7, 160r	07-160r.jp2	[]
367	[]	Page 160v	MSS 7, 160v	07-160v.jp2	[]
368	[]	Page 161r	MSS 7, 161r	07-161r.jp2	[]
369	[]	Page 161v	MSS 7, 161v	07-161v.jp2	[]
370	[]	Page 162r	MSS 7, 162r	07-162r.jp2	[]
371	[]	Page 162v	MSS 7, 162v	07-162v.jp2	[]
372	[]	Page 163r	MSS 7, 163r	07-163r.jp2	[]
373	[]	Page 163v	MSS 7, 163v	07-163v.jp2	[]
374	[]	Page 164r	MSS 7, 164r	07-164r.jp2	[]
375	[]	Page 164v	MSS 7, 164v	07-164v.jp2	[]
376	[]	Page 165r	MSS 7, 165r	07-165r.jp2	[]
377	[]	Page 165v	MSS 7, 165v	07-165v.jp2	[]
378	[]	Page 166r	MSS 7, 166r	07-166r.jp2	[]
379	[]	Page 166v	MSS 7, 166v	07-166v.jp2	[]
380	[]	Page 167r	MSS 7, 167r	07-167r.jp2	[]
381	[]	Page 167v	MSS 7, 167v	07-167v.jp2	[]
382	[]	Page 168r	MSS 7, 168r	07-168r.jp2	[]
383	[]	Page 168v	MSS 7, 168v	07-168v.jp2	[]
384	[]	Page 169r	MSS 7, 169r	07-169r.jp2	[]
385	[]	Page 169v	MSS 7, 169v	07-169v.jp2	[]
386	[]	Page 170r	MSS 7, 170r	07-170r.jp2	[]
387	[]	Page 170v	MSS 7, 170v	07-170v.jp2	[]
388	[]	Page 171r	MSS 7, 171r	07-171r.jp2	[]
389	[]	Page 171v	MSS 7, 171v	07-171v.jp2	[]
390	[]	Page 172r	MSS 7, 172r	07-172r.jp2	[]
391	[]	Page 172v	MSS 7, 172v	07-172v.jp2	[]
392	[]	Page 173r	MSS 7, 173r	07-173r.jp2	[]
393	[]	Page 173v	MSS 7, 173v	07-173v.jp2	[]
394	[]	Page 174r	MSS 7, 174r	07-174r.jp2	[]
395	[]	Page 174v	MSS 7, 174v	07-174v.jp2	[]
396	[]	Page 175r	MSS 7, 175r	07-175r.jp2	[]
397	[]	Page 175v	MSS 7, 175v	07-175v.jp2	[]
398	[]	Page 176r	MSS 7, 176r	07-176r.jp2	[]
399	[]	Page 176v	MSS 7, 176v	07-176v.jp2	[]
400	[]	Page 177r	MSS 7, 177r	07-177r.jp2	[]
401	[]	Page 177v	MSS 7, 177v	07-177v.jp2	[]
402	[]	Page 178r	MSS 7, 178r	07-178r.jp2	[]
403	[]	Page 178v	MSS 7, 178v	07-178v.jp2	[]
404	[]	Page 179r	MSS 7, 179r	07-179r.jp2	[]
405	[]	Page 179v	MSS 7, 179v	07-179v.jp2	[]
406	[]	Page 180r	MSS 7, 180r	07-180r.jp2	[]
407	[]	Page 180v	MSS 7, 180v	07-180v.jp2	[]
408	[]	Page 181r	MSS 7, 181r	07-181r.jp2	[]
409	[]	Page 181v	MSS 7, 181v	07-181v.jp2	[]
410	[]	Page 182r	MSS 7, 182r	07-182r.jp2	[]
411	[]	Page 182v	MSS 7, 182v	07-182v.jp2	[]
412	[]	Page 183r	MSS 7, 183r	07-183r.jp2	[]
413	[]	Page 183v	MSS 7, 183v	07-183v.jp2	[]
414	[]	Page 184r	MSS 7, 184r	07-184r.jp2	[]
415	[]	Page 184v	MSS 7, 184v	07-184v.jp2	[]
416	[]	Page 185r	MSS 7, 185r	07-185r.jp2	[]
417	[]	Page 185v	MSS 7, 185v	07-185v.jp2	[]
418	[]	Page 186r	MSS 7, 186r	07-186r.jp2	[]
419	[]	Page 186v	MSS 7, 186v	07-186v.jp2	[]
420	[]	Page 187r	MSS 7, 187r	07-187r.jp2	[]
421	[]	Page 187v	MSS 7, 187v	07-187v.jp2	[]
422	[]	Page 188r	MSS 7, 188r	07-188r.jp2	[]
423	[]	Page 188v	MSS 7, 188v	07-188v.jp2	[]
424	[]	Page 189r	MSS 7, 189r	07-189r.jp2	[]
425	[]	Page 189v	MSS 7, 189v	07-189v.jp2	[]
426	[]	Page 190r	MSS 7, 190r	07-190r.jp2	[]
427	[]	Page 190v	MSS 7, 190v	07-190v.jp2	[]
428	[]	Page 191r	MSS 7, 191r	07-191r.jp2	[]
429	[]	Page 191v	MSS 7, 191v	07-191v.jp2	[]
430	[]	Page 192r	MSS 7, 192r	07-192r.jp2	[]
431	[]	Page 192v	MSS 7, 192v	07-192v.jp2	[]
432	[]	Page 193r	MSS 7, 193r	07-193r.jp2	[]
433	[]	Page 193v	MSS 7, 193v	07-193v.jp2	[]
434	[]	Page 194r	MSS 7, 194r	07-194r.jp2	[]
435	[]	Page 194v	MSS 7, 194v	07-194v.jp2	[]
436	[]	Page 195r	MSS 7, 195r	07-195r.jp2	[]
437	[]	Page 195v	MSS 7, 195v	07-195v.jp2	[]
438	[]	Page 196r	MSS 7, 196r	07-196r.jp2	[]
439	[]	Page 196v	MSS 7, 196v	07-196v.jp2	[]
440	[]	Page 197r	MSS 7, 197r	07-197r.jp2	[]
441	[]	Page 197v	MSS 7, 197v	07-197v.jp2	[]
442	[]	Page 198r	MSS 7, 198r	07-198r.jp2	[]
443	[]	Page 198v	MSS 7, 198v	07-198v.jp2	[]
444	[]	Page 199r	MSS 7, 199r	07-199r.jp2	[]
445	[]	Page 199v	MSS 7, 199v	07-199v.jp2	[]
446	[]	Page 200r	MSS 7, 200r	07-200r.jp2	[]
447	[]	Page 200v	MSS 7, 200v	07-200v.jp2	[]
448	[]	Page 201r	MSS 7, 201r	07-201r.jp2	[]
449	[]	Page 201v	MSS 7, 201v	07-201v.jp2	[]
450	[]	Page 202r	MSS 7, 202r	07-202r.jp2	[]
451	[]	Page 202v	MSS 7, 202v	07-202v.jp2	[]
452	[]	Page 203r	MSS 7, 203r	07-203r.jp2	[]
453	[]	Page 203v	MSS 7, 203v	07-203v.jp2	[]
454	[]	Page 204r	MSS 7, 204r	07-204r.jp2	[]
455	[]	Page 204v	MSS 7, 204v	07-204v.jp2	[]
456	[]	Page 205r	MSS 7, 205r	07-205r.jp2	[]
457	[]	Page 205v	MSS 7, 205v	07-205v.jp2	[]
458	[]	Page 206r	MSS 7, 206r	07-206r.jp2	[]
459	[]	Page 206v	MSS 7, 206v	07-206v.jp2	[]
460	[]	Page 207r	MSS 7, 207r	07-207r.jp2	[]
461	[]	Page 207v	MSS 7, 207v	07-207v.jp2	[]
462	[]	Page 208r	MSS 7, 208r	07-208r.jp2	[]
463	[]	Page 208v	MSS 7, 208v	07-208v.jp2	[]
464	[]	Page 209r	MSS 7, 209r	07-209r.jp2	[]
465	[]	Page 209v	MSS 7, 209v	07-209v.jp2	[]
466	[]	Page 210r	MSS 7, 210r	07-210r.jp2	[]
467	[]	Page 210v	MSS 7, 210v	07-210v.jp2	[]
468	[]	Page 211r	MSS 7, 211r	07-211r.jp2	[]
469	[]	Page 211v	MSS 7, 211v	07-211v.jp2	[]
470	[]	Page 212r	MSS 7, 212r	07-212r.jp2	[]
471	[]	Page 212v	MSS 7, 212v	07-212v.jp2	[]
472	[]	Page 213r	MSS 7, 213r	07-213r.jp2	[]
473	[]	Page 213v	MSS 7, 213v	07-213v.jp2	[]
474	[]	Page 214r	MSS 7, 214r	07-214r.jp2	[]
475	[]	Page 214v	MSS 7, 214v	07-214v.jp2	[]
476	[]	Page 215r	MSS 7, 215r	07-215r.jp2	[]
477	[]	Page 215v	MSS 7, 215v	07-215v.jp2	[]
478	[]	Page 216r	MSS 7, 216r	07-216r.jp2	[]
479	[]	Page 216v	MSS 7, 216v	07-216v.jp2	[]
480	[]	Page 217r	MSS 7, 217r	07-217r.jp2	[]
481	[]	Page 217v	MSS 7, 217v	07-217v.jp2	[]
482	[]	Page 218r	MSS 7, 218r	07-218r.jp2	[]
483	[]	Page 218v	MSS 7, 218v	07-218v.jp2	[]
484	[]	Page 219r	MSS 7, 219r	07-219r.jp2	[]
485	[]	Page 219v	MSS 7, 219v	07-219v.jp2	[]
486	[]	Page 220r	MSS 7, 220r	07-220r.jp2	[]
487	[]	Page 220v	MSS 7, 220v	07-220v.jp2	[]
488	[]	Page 221r	MSS 7, 221r	07-221r.jp2	[]
489	[]	Page 221v	MSS 7, 221v	07-221v.jp2	[]
490	[]	Page 222r	MSS 7, 222r	07-222r.jp2	[]
491	[]	Page 222v	MSS 7, 222v	07-222v.jp2	[]
492	[]	Page 223r	MSS 7, 223r	07-223r.jp2	[]
493	[]	Page 223v	MSS 7, 223v	07-223v.jp2	[]
494	[]	Page 224r	MSS 7, 224r	07-224r.jp2	[]
495	[]	Page 224v	MSS 7, 224v	07-224v.jp2	[]
496	[]	Page 225r	MSS 7, 225r	07-225r.jp2	[]
497	[]	Page 225v	MSS 7, 225v	07-225v.jp2	[]
498	[]	Page 226r	MSS 7, 226r	07-226r.jp2	[]
499	[]	Page 226v	MSS 7, 226v	07-226v.jp2	[]
500	[]	Page 227r	MSS 7, 227r	07-227r.jp2	[]
501	[]	Page 227v	MSS 7, 227v	07-227v.jp2	[]
502	[]	Page 228r	MSS 7, 228r	07-228r.jp2	[]
503	[]	Page 228v	MSS 7, 228v	07-228v.jp2	[]
504	[]	Page 229r	MSS 7, 229r	07-229r.jp2	[]
505	[]	Page 229v	MSS 7, 229v	07-229v.jp2	[]
506	[]	Page 230r	MSS 7, 230r	07-230r.jp2	[]
507	[]	Page 230v	MSS 7, 230v	07-230v.jp2	[]
508	[]	Page 231r	MSS 7, 231r	07-231r.jp2	[]
509	[]	Page 231v	MSS 7, 231v	07-231v.jp2	[]
510	[]	Page 232r	MSS 7, 232r	07-232r.jp2	[]
511	[]	Page 232v	MSS 7, 232v	07-232v.jp2	[]
512	[]	Page 233r	MSS 7, 233r	07-233r.jp2	[]
513	[]	Page 233v	MSS 7, 233v	07-233v.jp2	[]
514	[]	Page 234r	MSS 7, 234r	07-234r.jp2	[]
515	[]	Page 234v	MSS 7, 234v	07-234v.jp2	[]
516	[]	Page 235r	MSS 7, 235r	07-235r.jp2	[]
517	[]	Page 235v	MSS 7, 235v	07-235v.jp2	[]
518	[]	Page 236r	MSS 7, 236r	07-236r.jp2	[]
519	[]	Page 236v	MSS 7, 236v	07-236v.jp2	[]
520	[]	Page 237r	MSS 7, 237r	07-237r.jp2	[]
521	[]	Page 237v	MSS 7, 237v	07-237v.jp2	[]
522	[]	Page 238r	MSS 7, 238r	07-238r.jp2	[]
523	[]	Page 238v	MSS 7, 238v	07-238v.jp2	[]
525	[]	Article 1. Letter from Philip Henslowe to Edward Alleyn about acquiring the reversion of the Mastership of the Royal Game of Bears, etc., from Queen Elizabeth I, June 4, 1598,	MSS 2, Article 1, 01r	02-001-01r.jp2	[]
965	[]	Page 022r	MSS 8, 022r	08-022r.jp2	[]
966	[]	Page 022v	MSS 8, 022v	08-022v.jp2	[]
967	[]	Page 023r	MSS 8, 023r	08-023r.jp2	[]
526	[]	Article 2. Letter from Arthur Langworth to Edward Alleyn about acquiring the reversion of the Mastership of the Royal Game of Bears, etc., June, 1598.	MSS 2, Article 2, 01r	02-002-01r.jp2	[]
527	[]	Article 3. Letter from John Dorrington to Philip Henslowe about Queen Elizabeth I's order for games, May 1600.	MSS 2, Article 3, 01r	02-003-01r.jp2	[]
528	[]	Article 4. Acquittance from Richard Lefwicke to Philip Henslowe for rent on the Bear Garden, Jan. 1, 1601/2.	MSS 2, Article 4, 01r	02-004-01r.jp2	[]
529	[]	Article 5. Letters Patent from King James I to Philip Henslowe and Edward Alleyn for the Mastership of the Royal Game of bears, bulls and mastiff dogs, Nov. 24, 1604. See Digital Essays.	MSS 2, Article 5, 01r	02-005-01r.jp2	[]
530	[]	Article 6. Acquittance form Sir Wiiliam Seward to Philip Henslowe and Edward Alleyn for the assignment of the patent of the Mastership of the Royal Game of Bears, etc., Nov. 28, 1604.	MSS 2, Article 6, 01r	02-006-01r.jp2	[]
531	[]	Article 8. Letter from Philip Henslowe and Edward Alleyn to Christopher Goffe authorising him to acquire dogs for the Royal Game, June, 1607.	MSS 2, Article 8, 01r	02-008-01r.jp2	[]
532	[]	Article 9. Petition of Philip Henslowe and Edward Alleyn to King James I complaining of the high cost of their office and their loss of the license to bait on Sundays and of the loss of bears in a recent bait in front of King James and King Christian IV of Denmark, and requesting a full licence and further fees (three copies), c. 1607.	MSS 2, Article 9, 01r	02-009-01r.jp2	[]
533	[]	Article 10. Rough memorandum-book, containing the receipts and payments of a travelling bear-ward employed by Philip Henslowe and Edward Alleyn, Aug. 13-Sept. 20, 1608.	MSS 2, Article 10, 01r	02-010-01r.jp2	[]
534	[]	Article 11. Letter from Henry Middleton to Edward Alleyn asking to return a bear, with rerference to Sir Thomas Middleton, Mar. 9, 1608/9.	MSS 2, Article 11, 01r	02-011-01r.jp2	[]
535	[]	Article 12. Letter from Thomas Bowker to Edward Alleyn about a dog, with numerous notes on the verso by Alleyn of payments, including for a book of Shakespeare's Sonnets, June 19, 1609.	MSS 2, Article 12, 01r	02-012-01r.jp2	[]
536	[]	Article 13. Letter from Edward Barrett to Edward Alleyn about animals for the Royal Game, no date.	MSS 2, Article 13, 01r	02-013-01r.jp2	[]
537	[]	Article 14. Letter from John Ithell about animals, Oct. 30, 1610.	MSS 2, Article 14, 01r	02-014-01r.jp2	[]
538	[]	Article 15. Depositions of Bryan Bradley and Richard Tyler, servants of Henslowe and Alleyn, who were mistreated by Dr Steward, a magistrate in Hampshire, who locked them up as highwaymen while on Royal Game business, 1611.	MSS 2, Article 15, 01r	02-015-01r.jp2	[]
539	[]	Article 16. Statement of the case against Dr Steward, as above, 1611.	MSS 2, Article 16, 01r	02-016-01r.jp2	[]
540	[]	Article 17. Letter from Edward Russell, third Earl of Bedford, to Edward Alleyn about the taking up of his dog, April 13, 1612.	MSS 2, Article 17, 01r	02-017-01r.jp2	[]
541	[]	Article 18. Bargain and sale of a male lion by Thomas Morris and William Grove to William Peadle, April 13, 1612.	MSS 2, Article 18, 01r	02-018-01r.jp2	[]
542	[]	Article 19. Commission from Philip Henslowe and Edward Alleyn to empower John Morgan, Richard Tyler and Bryan Bradley to acquire animals for the Royal Game, April 18, 1612.	MSS 2, Article 19, 01r	02-019-01r.jp2	[]
543	[]	Article 20. Petition from Philip Henslowe and Edward Alleyn to the same effect as Article 9 above, listing £200 loss of animals in baiting before Henri de la Tour, Duc de Bouillon, 1612.	MSS 2, Article 20, 01r	02-020-01r.jp2	[]
544	[]	Article 21. Warrant from Thomas Dutton, Thomas Brooke, and Thomas Marburie, justices of Cheshire, to assist Thomas Radford to take up animals for the Royal Game, May 3, 1613.	MSS 2, Article 21, 01r	02-021-01r.jp2	[]
545	[]	Article 22. Warrant from John Ireland, Edward Stanley, and John Ashton, justices of Lancashire, to the same effect, May 19, 1613.	MSS 2, Article 22, 01r	02-022-01r.jp2	[]
546	[]	Article 23. Letter from George Brake to Philip Henslowe about the injuries to Henslowe's servants James Starkey, Thomas Radford and John Pott who were assaulted in Chester while trying to exercise the commission for the Royal Game, May 19, 1613.	MSS 2, Article 23, 01r	02-023-01r.jp2	[]
547	[]	Article 24. Deposition of Richard Barrowe, Anne Hall and others relatitve to the assault by Richard Penketh and others upon James Starkey, Thomas Radford, and John Pott, May 30, 1613.	MSS 2, Article 24, 01r	02-024-01r.jp2	[]
548	[]	Article 25. Bond from Thomas Radford to Philip Henslowe for the commission to take up animals for the Royal Game, June 7, 1613.	MSS 2, Article 25, 01r	02-025-01r.jp2	[]
549	[]	Article 26. Draft and fair copy petitions from Philip Henslowe and Edward Alleyn to Thomas Howard, Earl of Suffolk and the Lord Chamberlain, complaining of the ill treatment of their servants in the west country by Sir Morris Barlet, a justice of the peace, and assaults committed by others, and asking for the arrest of the offenders, June-July, 1613.	MSS 2, Article 26, 01r	02-026-01r.jp2	[]
550	[]	Article 27. Letter from Thomas Howard, Earl of Suffolk and the Lord Chamberlain, to Thomas Dutton, Thomas Brooke, and other justices of the peace in Chester and Lancaster, requesting that they punish the offenders in the above matter, July 13, 1613.	MSS 2, Article 27, 01r	02-027-01r.jp2	[]
551	[]	Article 28. Letter from Thomas Dutton and Thomas Brooke to Thomas Howard, Earl of Suffolk and the Lord Chamberlain, in answer to the above, Aug. 16, 1613.	MSS 2, Article 28, 01r	02-028-01r.jp2	[]
552	[]	Article 29. Letter from Thomas Dutton and Thomas Brooke to Philip Henslowe informing him of the charge of felony made against his deputiesby John Venables and their failure to bring about a compromise, Aug. 17, 1613.	MSS 2, Article 29, 01r	02-029-01r.jp2	[]
553	[]	Article 30. Declaration by Thomas Radford that for the annual receipt of a mastiff dog for the King's use from the townsmen of Manchester in Lancashire, Radford promises not to take up any more of their animals, c. 1613.	MSS 2, Article 30, 01r	02-030-01r.jp2	[]
554	[]	Article 31. Letter from Anthony Cooke to Thomas Howard defending himself against charges of opposing the taking up of animals by Bear Garden officials, pre-1616.	MSS 2, Article 31, 01r	02-031-01r.jp2	[]
555	[]	Article 32. Letter from Meredith Morgan to Philip Henslowe asking him to receive a wolf, pre-1616.	MSS 2, Article 32, 01r	02-032-01r.jp2	[]
556	[]	Article 33. Letter from Thomas Yonge (or Young) to Edward Alleyn or Philip Henslowe about providing dogs, Aug. 24, pre-1616.	MSS 2, Article 33, 01r	02-033-01r.jp2	[]
557	[]	Article 34. Petition to William Herbert, third Earl of Pembroke, the Lord Chamberlain, from Edward Alleyn in answer to a petition against him relating to the the baiting of bears, c. 1617-19.	MSS 2, Article 34, 01r	02-034-01r.jp2	[]
558	[]	Article 35. Statement in the hand of Edward Alleyn of matters in dispute between himself and Jacob Meade relative to the Bear Garden, the stock of animals, and other matters appertaining to the estate of Philip Henslowe, c. 1617-19.	MSS 2, Article 35, 01r	02-035-01r.jp2	[]
559	[]	Article 36. Letter from John Nurse to Edward Alleyn about baiting and dated receipts, June 23, 1625-July 14, 1626.	MSS 2, Article 36, 01r	02-036-01r.jp2	[]
560	[]	Article 37. Petition to the Privy Council and the Commissioners of the Treasury from Edward Alleyn asking for payment in arrears for Royal Game expenses, no date.	MSS 2, Article 37, 01r	02-037-01r.jp2	[]
561	[]	Article 38. Letter from Sir William Fawnte (or Faunt) to Edward Alleyn discussing Fawnte's stock of dogs, no date.	MSS 2, Article 38, 01r	02-038-01r.jp2	[]
562	[]	Article 39. Letter from Sir William Fawnte (or Faunt) to Edward Alleyn, asking for male black bear cubs, no date.	MSS 2, Article 39, 01r	02-039-01r.jp2	[]
563	[]	Article 40. Letter from Sir William Fawnte (or Faunt) to Edward Alleyn, asking for a male bear cub, Nov. 9 (no year).	MSS 2, Article 40, 01r	02-040-01r.jp2	[]
564	[]	Article 41. Advertisement for the Bear Garden of a match: between dogs and a single bear; to 'wearie a bull dead at the stake'; 'sport with the horse and ape'; and the whipping of the blind bear, c. 1603-1625.	MSS 2, Article 41, 01r	02-041-01r.jp2	[]
565	[]	Article 42. Advertisement of a general prize for markmanship contests in St George's Fields using Muskets or Long Bows and arrows, with a list of prizes, Aug 21, c. 1603-1646.	MSS 2, Article 42, 01r	02-042-01r.jp2	[]
567	[]	Article 1. Letter from Alexander White to Philip Henslowe, Feb. 21, 1576/7.	MSS 3, Article 1, 01r	03-001-01r.jp2	[]
568	[]	Article 2. Letter from Thomas Keys to Alexander Whyt (or White), April 7, c. 1580-1600.	MSS 3, Article 2, 01r	03-002-01r.jp2	[]
569	[]	Article 3. Letter from The Privy Council to various Aldermen for the relief of John Alleyn aginst Thomas Martin, July 14, 1589.	MSS 3, Article 3, 01r	03-003-01r.jp2	[]
570	[]	Article 4. Letter from Charles Howard, Lord Howard of Effingham, to William Drewry, in regards to the above, Dec. 1589.	MSS 3, Article 4, 01r	03-004-01r.jp2	[]
571	[]	Article 5. Letter from Francis Henslowe to Philip Henslowe for a loan, c. 1590.	MSS 3, Article 5, 01r	03-005-01r.jp2	[]
572	[]	Article 6. Letter from William Henlsowe to Philip Henslowe about an action at law, Dec. 7, 1592.	MSS 3, Article 6, 01r	03-006-01r.jp2	[]
573	[]	Article 7. Letter from William Crowe to Patrick Brewe, Jan. 12, 1592/3.	MSS 3, Article 7, 01r	03-007-01r.jp2	[]
574	[]	Article 8. Love verses, beginning, 'Can she excuse my wronges with vertious cloke?', 1596.	MSS 3, Article 8, 01r	03-008-01r.jp2	[]
575	[]	Article 9. Letter from John Langworth to Edward Alleyn about land, Feb. 6, 1598/9.	MSS 3, Article 9, 01r	03-009-01r.jp2	[]
576	[]	Article 10. Letter from John Alleyn to Mr Brune or Burne asking for his daughter in marriage, no date.	MSS 3, Article 10, 01r	03-010-01r.jp2	[]
577	[]	Article 11. Letter from Edward Alleyn to John Page about land, July 15, 1602.	MSS 3, Article 11, 01r	03-011-01r.jp2	[]
578	[]	Article 12. Letter from John Page to Edward Alleyn about land, July 17, 1602.	MSS 3, Article 12, 01r	03-012-01r.jp2	[]
579	[]	Article 13. Letter from Mercury Patten to Philip Henslowe about a dispute, Sept 26, 1603.	MSS 3, Article 13, 01r	03-013-01r.jp2	[]
580	[]	Article 14. Letter from John Page to Edward Alleyn, about the purchase of Riches manor, Jan. 28, 1640.	MSS 3, Article 14, 01r	03-014-01r.jp2	[]
581	[]	Article 15. Letter from Sir Francis Calton to Mr Harris, about his property in Dulwich, c. 1605.	MSS 3, Article 15, 01r	03-015-01r.jp2	[]
582	[]	Article 16. Sir Francis Calton to Edward Alleyn, lamenting 'cosening knaveries' and asking for an advance, with a draft letter from Alleyn about the sale of the parsonage of Firle on the verso, Dec. 24, 1605.	MSS 3, Article 16, 01r	03-016-01r.jp2	[]
583	[]	Article 17. Letter from John Poyntz to Edward Alleyn asking for return of his lute, March 6, 1605/6.	MSS 3, Article 17, 01r	03-017-01r.jp2	[]
584	[]	Article 18. Letter from Sir Francis Calton to Edward Alleyn asking for money, July 7, 1607.	MSS 3, Article 18, 01r	03-018-01r.jp2	[]
585	[]	Article 19. Letter from the same to the same, Oct. 3, 1607.	MSS 3, Article 19, 01r	03-019-01r.jp2	[]
586	[]	Article 20. Letter from the same to the same, Jan. 22, 1607/8.	MSS 3, Article 20, 01r	03-020-01r.jp2	[]
587	[]	Article 21. Letter from the same to the same, 1608.	MSS 3, Article 21, 01r	03-021-01r.jp2	[]
588	[]	Article 22. Letter from the same to the same, April 12, 1608.	MSS 3, Article 22, 01r	03-022-01r.jp2	[]
589	[]	Article 23. Letter from the same to the same, April 19, 1608.	MSS 3, Article 23, 01r	03-023-01r.jp2	[]
590	[]	Article 24. Letter from the same to the same, April 25, 1608.	MSS 3, Article 24, 01r	03-024-01r.jp2	[]
591	[]	Article 25. Letter from the same to the same, June 15, 1608.	MSS 3, Article 25, 01r	03-025-01r.jp2	[]
592	[]	Article 26. Letter from Sir Francis Calton to Thomas Bolton, the scrivener, about money, July 8, 1608.	MSS 3, Article 26, 01r	03-026-01r.jp2	[]
593	[]	Article 27. Letter from Sir Francis Calton to Edward Alleyn asking for money, Sept. 3, 1608.	MSS 3, Article 27, 01r	03-027-01r.jp2	[]
594	[]	Article 28. Letter from the same to the same, Oct. 14, 1608.	MSS 3, Article 28, 01r	03-028-01r.jp2	[]
595	[]	Article 29. Letter from the same to the same, Oct. 26, 1608.	MSS 3, Article 29, 01r	03-029-01r.jp2	[]
596	[]	Article 30. Letter from the same to the same, Nov. 8, 1608.	MSS 3, Article 30, 01r	03-030-01r.jp2	[]
597	[]	Article 31. Letter from the same to the same, Dec. 30, 1608.	MSS 3, Article 31, 01r	03-031-01r.jp2	[]
598	[]	Article 32. Letter from Matthias Alleyn to Edward Alleyn, with acquittances from Thomas Garland to Henslowe and Alleyn for rent, Jan. 10, 1608/9-Oct. 14, 1610. See below, Muniment 31.	MSS 3, Article 32, 01r	03-032-01r.jp2	[]
599	[]	Article 33. Letter from John Langworth to Philip Henslowe about tithes, Mar. 12, 1608/9.	MSS 3, Article 33, 01r	03-033-01r.jp2	[]
968	[]	Page 023v	MSS 8, 023v	08-023v.jp2	[]
969	[]	Page 024r	MSS 8, 024r	08-024r.jp2	[]
600	[]	Article 34. Letter from R. Redmer [possibly the stationer Richard Redmer] to Edward Alleyn about the terms of their agreement, July, 1609.	MSS 3, Article 34, 01r	03-034-01r.jp2	[]
601	[]	Article 35. Letter from the same to the same, Jan. 24 (no year).	MSS 3, Article 35, 01r	03-035-01r.jp2	[]
602	[]	Article 36. Letter from the same to the same, May 27 (no year).	MSS 3, Article 36, 01r	03-036-01r.jp2	[]
603	[]	Article 37. Letter from the same to the same, no date.	MSS 3, Article 37, 01r	03-037-01r.jp2	[]
604	[]	Article 38. Letter from Sir Francis Calton to Edward Alleyn about a bargain in Hampshire, c. 1609.	MSS 3, Article 38, 01r	03-038-01r.jp2	[]
605	[]	Article 39. Letter from the same to the same asking for a loan, Aug. 18, 1609.	MSS 3, Article 39, 01r	03-039-01r.jp2	[]
606	[]	Article 40. Letter from the same to the same, Sept. 29, 1609.	MSS 3, Article 40, 01r	03-040-01r.jp2	[]
607	[]	Article 41. Letter from the same to the same, Oct. 22, 1609.	MSS 3, Article 41, 01r	03-041-01r.jp2	[]
608	[]	Article 42. Letter from William Spender to Philip Henslowe, Roger Cole and other churchwardens at St Saviour's, Southwark, for relief from poverty, c. 1609	MSS 3, Article 42, 01r	03-042-01r.jp2	[]
609	[]	Article 43. Letter from Sir Francis Calton to Edward Alleyn, asking for a loan, April 30, 1610.	MSS 3, Article 43, 01r	03-043-01r.jp2	[]
610	[]	Article 44. Letter from the same to the same concerning Calton's daughter's marriage, May 9, 1611.	MSS 3, Article 44, 01r	03-044-01r.jp2	[]
611	[]	Article 45. Letter from the same to the same about the same, May 12, 1611.	MSS 3, Article 45, 01r	03-045-01r.jp2	[]
612	[]	Article 46. Letter from Edward Alleyn to Sir Francis Calton about money, May, 1611.	MSS 3, Article 46, 01r	03-046-01r.jp2	[]
613	[]	Article 47. Letter from Sir Francis Calton to Edward Alleyn, May, 1611.	MSS 3, Article 47, 01r	03-047-01r.jp2	[]
614	[]	Article 48. Letter to Thomas Calton about the sale of property to Alleyn, May 19, 1611.	MSS 3, Article 48, 01r	03-048-01r.jp2	[]
615	[]	Article 49. Letter from Richard Forkench to Edward Alleyn about a bond, Nov. 1, 1611.	MSS 3, Article 49, 01r	03-049-01r.jp2	[]
616	[]	Article 50. Letter from John Herborne to Edward Alleyn about property in Dulwich, Jan. 3, 1611/12	MSS 3, Article 50, 01r	03-050-01r.jp2	[]
617	[]	Article 51. Letter from Sir Francis Calton to Edward Alleyn, asking for a loan, March 18, 1611/12.	MSS 3, Article 51, 01r	03-051-01r.jp2	[]
618	[]	Article 52. Letter from the same to the same about a purchase, March 31, 1612.	MSS 3, Article 52, 01r	03-052-01r.jp2	[]
619	[]	Article 53. Letter from the same to the same with acquittance dated March 31, 1612.	MSS 3, Article 53, 01r	03-053-01r.jp2	[]
620	[]	Article 54. Letter from the same to the same about leases in Kennington, Aug. 15, 1612.	MSS 3, Article 54, 01r	03-054-01r.jp2	[]
621	[]	Article 55. Letter from the same to the same, no date.	MSS 3, Article 55, 01r	03-055-01r.jp2	[]
622	[]	Article 56. Letter from Elizabeth Socklen to Edward Alleyn, Sept. 22, 1612.	MSS 3, Article 56, 01r	03-056-01r.jp2	[]
623	[]	Article 57. Letter from John Townley to Edward Alleyn asking for help with house repair, Nov. 10, 1612.	MSS 3, Article 57, 01r	03-057-01r.jp2	[]
624	[]	Article 58. Sir Francis Calton to Edward Alleyn about Kennington manor, March 3, 1612/13.	MSS 3, Article 58, 01r	03-058-01r.jp2	[]
625	[]	Article 59. Letter from the same to the same about the purchase of land from Sir Edward Duke, c. 1613.	MSS 3, Article 59, 01r	03-059-01r.jp2	[]
626	[]	Article 60. Letter from Edward Alleyn to Sir Francis Calton about money, c. 1613.	MSS 3, Article 60, 01r	03-060-01r.jp2	[]
627	[]	Article 61. Letter from John Benson to Edward Alleyn, about glazing a Dulwich building, no date, with acquittance dated May 14, 1614.	MSS 3, Article 61, 01r	03-061-01r.jp2	[]
628	[]	Article 62. Letter from the same to the same, April 22, 1614.	MSS 3, Article 62, 01r	03-062-01r.jp2	[]
629	[]	Article 63. A. P. to Philip(?) Henslowe, complaining about malicious reports, no date.	MSS 3, Article 63, 01r	03-063-01r.jp2	[]
630	[]	Article 64. Letter from Samuel Jeynens to Edward Alleyn about chartity towards Chelsea College, c. 1615-1620.	MSS 3, Article 64, 01r	03-064-01r.jp2	[]
631	[]	Article 65. Letter from Samuel Jeynens to the Recorder and Lord Mayor of London, Sir Thomas Middleton, and the Lady Weild (or Weld), about contributing to the completion of Chelsea College, c. 1615-1620.	MSS 3, Article 65, 01r	03-065-01r.jp2	[]
632	[]	Article 66. Letter from Cornelius Lymer to Edward Alleyn agreeing to preach at the consecration of Dulwich Chapel on Sept. 1, July 22, 1616.	MSS 3, Article 66, 01r	03-066-01r.jp2	[]
633	[]	Article 67. Letter from the parishioners of St Giles, Cripplegate, to Edward Alleyn thanking him for his 'bouneous graunt', Sept. 14, 1616.	MSS 3, Article 67, 01r	03-067-01r.jp2	[]
634	[]	Article 68. Letter from Thomas Howard, Earl of Arundell to Edward Alleyn asking for the placement of a 'poore fatherles boy' at Alleyn's College, Sept. 17, 1616.	MSS 3, Article 68, 01v	03-068-01v.jp2	[]
635	[]	Article 69. Letter from the Stephen Gosson, Rector, and parishioners of St Botolph's, Bishopsgate, to Edward Alleyn presenting three candidates for Alleyn's almshouses, Sept. 29, 1616.	MSS 3, Article 69, 01r	03-069-01r.jp2	[]
636	[]	Article 70. Letter from Stephen Gosson, Rector of St Botolph's, Bishopsgate, to Edward Alleyn offering his personal view of the three almshouse candidates, Oct. 2, 1616.	MSS 3, Article 70, 01r	03-070-01r.jp2	[]
637	[]	Article 71. Letter from the Churchwardens and others of the liberty of the Clink to Edward Alleyn, presenting a candidate for the almshouse, and including eight lines of complimentary doggerel, beginning, 'As god did move your mynd to build, c. 1616.	MSS 3, Article 71, 01r	03-071-01r.jp2	[]
638	[]	Article 72. Letter frrom Thomas Chard to Edward Alleyn detailing his desperate situation in Ludgate prison and asking for release, April 14, 1617.	MSS 3, Article 72, 01r	03-072-01r.jp2	[]
639	[]	Article 73. Letter from Richard Barlow to Edward Alleyn giving his reasons for declining the offer of the ushership of Dulwich College, May 12, 1617.	MSS 3, Article 73, 01r	03-073-01r.jp2	[]
640	[]	Article 74. Letter from Robert Earle to Edward Alleyn complaining of his dealings with Jack Stanton in connection with a lease, June 24, 1617.	MSS 3, Article 74, 01r	03-074-01r.jp2	[]
641	[]	Article 75. Letter from Robert Newman to Edward Alleyn about the success of his lawsuit, July 27, 1617.	MSS 3, Article 75, 01r	03-075-01r.jp2	[]
642	[]	Article 76. Letter from Stephen Gosson, Rector, and parishioners of St Botolph's to Edward Alleyn, presenting three children for Alleyn's school, Aug. 7, 1617.	MSS 3, Article 76, 01r	03-076-01r.jp2	[]
643	[]	Article 77. Letter from Richard Meridall to Joan Alleyn, with laudatory verses, beginning, 'Loe heare shee dwells, whome virtue doeth imbrace', no date.	MSS 3, Article 77, 01r	03-077-01r.jp2	[]
644	[]	Article 78. Letter from Stephen Gosson, Rector, and parishioners of St Botolph's to Edward Alleyn, presenting a candidate for Alleyn's almshouse, Sept. 1, 1617.	MSS 3, Article 78, 01r	03-078-01r.jp2	[]
645	[]	Article 79. Letter from John Warner to Edward Alleyn, recommending Mr Streatinge to Alleyn, Jan. 17, 1617/18.	MSS 3, Article 79, 01r	03-079-01r.jp2	[]
646	[]	Article 80. Letter from John Northe to Edward Alleyn about the making of tiles, April 22, 1618.	MSS 3, Article 80, 01r	03-080-01r.jp2	[]
647	[]	Article 81. Letter from Thomas Grymes to Edward Alleyn about the Commissioners for New Biuldings, Aug. 25, 1618.	MSS 3, Article 81, 01r	03-081-01r.jp2	[]
648	[]	Article 82. Letter from Edward Ferrers to Edward Alleyn, April 13, 1619.	MSS 3, Article 82, 01r	03-082-01r.jp2	[]
649	[]	Article 83. Letter from Thomas Bolton, the scrivener, to Edward Alleyn asking for bail from Marshalsea prison, April 14, 1619.	MSS 3, Article 83, 01r	03-083-01r.jp2	[]
650	[]	Article 84. Petition to Sir Francis Bacon, Lord Verulam and the Lord Chancellor, from Vrsley (or Ursula) Sherberyd, asking to be recommended for Alleyn's almshouse, Oct. 7, 1615.	MSS 3, Article 84, 01r	03-084-01r.jp2	[]
651	[]	Article 85. Letter from Rev. John Harrison to Edward Alleyn excusing himself for having secretly married Alleyn's kinswoman, c. 1620.	MSS 3, Article 85, 01r	03-085-01r.jp2	[]
652	[]	Article 86. Letter from the same to the same, asking Alleyn to be godfather to Harrison's son, c. 1620.	MSS 3, Article 86, 01r	03-086-01r.jp2	[]
653	[]	Article 87. Letter from the same to the same, in answer to a refusal of the above request, c. 1620.	MSS 3, Article 87, 01r	03-087-01r.jp2	[]
654	[]	Article 88. Letter from Thomas Burnet to Mr. Scheargene Owein asking him to secure from Alleyn payment for the purchase of Henslowe's place as Gentleman Sewer, c. 1621.	MSS 3, Article 88, 01r	03-088-01r.jp2	[]
655	[]	Article 89. Letter from Alexander Nairne to Edward Alleyn on the same subject, July 21, 1621.	MSS 3, Article 89, 01r	03-089-01r.jp2	[]
656	[]	Article 90. Petition to John Wililams, Bishop of Lincoln and Lord Keeper, from John Jones to be recommended for Alleyn's almshouse, c. Aug. 3-Nov. 10, 1621.	MSS 3, Article 90, 01r	03-090-01r.jp2	[]
657	[]	Article 91. Letter from Stephen Gosson, Rector, and parishioners of St Botolph's, Bishopsgate, to Edward Alleyn, presenting four poor children for Dulwich College, March 17, 1621/2.	MSS 3, Article 91, 01r	03-091-01r.jp2	[]
658	[]	Article 92. Letter from Sir Francis Calton to Edward Alleyn about losses for Kennington manor, May 12, 1623.	MSS 3, Article 92, 01r	03-092-01r.jp2	[]
659	[]	Article 93. Letter from Edward Alleyn to Sir Francis Calton in answer to charges of hard dealing with respect to Dulwch and Kennington manors, c. 1623.	MSS 3, Article 93, 01r	03-093-01r.jp2	[]
660	[]	Article 94. Letter from John Luntley to Edward Alleyn about rent of tenements on the Bankside, Jan. 8, 1623/4.	MSS 3, Article 94, 01r	03-094-01r.jp2	[]
661	[]	Article 95. Letter from Robert Newman to Edward Alleyn thanking him for his good cheer, March 1, 1623/4.	MSS 3, Article 95, 01r	03-095-01r.jp2	[]
662	[]	Article 96. Letter from Henry Gibb, Groom of the Bedchamber to King James I, to Edward Alleyn, thanking him for enrolling a recommended boy in Dulwich College, July 23, 1624.	MSS 3, Article 96, 01r	03-096-01r.jp2	[]
663	[]	Article 97. Letter from Sir John Hungerford to Edward Alleyn to recommend Alleyn's 'project' to King James I, c. 1624.	MSS 3, Article 97, 01r	03-097-01r.jp2	[]
664	[]	Article 98. Letter from Ambrose Wheeler, George Lowe, and George Handcoke to Edward Alleyn about his breaking his bargain with them, c. 1624.	MSS 3, Article 98, 01r	03-098-01r.jp2	[]
665	[]	Article 99. Letter from Ambrose Wheeler to Edward Alleyn entreating him to meet them in Chancery to declare his intentions in the 'busines', 1624.	MSS 3, Article 99, 01r	03-099-01r.jp2	[]
666	[]	Article 100. Letter from William Hervey to Edward Alleyn for permission to enclose a small parcel of land, Aug. 27, 1624.	MSS 3, Article 100, 01r	03-100-01r.jp2	[]
667	[]	Article 101. Letter form E. Skory to Edward Alleyn about various issues, Jan. 12, 1624/5.	MSS 3, Article 101, 01r	03-101-01r.jp2	[]
668	[]	Article 102. Letter from William Beecher to Edward Alleyn presenting a candidate for the almshouse, with a draft letter regarding money on the versos by Alleyn to his father-in-law John Donne, complaining about Donne's 'manie vnkind passages' and especially the 'vnkind, vnexspecketed and vndeserved deniall of yt comon curtesie afforded to a frend'', c. 1625.	MSS 3, Article 102, 01r	03-102-01r.jp2	[]
669	[]	Article 103. Letter from Sir Thomas Grymes to Edward Alleyn about a bond, Feb. 4, 1624/5.	MSS 3, Article 103, 01r	03-103-01r.jp2	[]
670	[]	Article 104. Letter from Leonell Tychebourne to Edward Alleyn asking for a loan, Oct. 10, 1625.	MSS 3, Article 104, 01r	03-104-01r.jp2	[]
671	[]	Article 105. Letter from George Cole to Edward Alleyn about debts, Feb. 16, 1625/6.	MSS 3, Article 105, 01r	03-105-01r.jp2	[]
672	[]	Article 106. Letter from George Paule to Edward Alleyn about the value of the Kennington leases, with a draft on the verso in Alleyn's hand about the clauses in Dulwich College statutes, June 26, 1626.	MSS 3, Article 106, 01r	03-106-01r.jp2	[]
673	[]	Article 107. Letter from John Goodman to Edward Alleyn, with notes of Alleyn's financial matters on the verso, July 11, 1626.	MSS 3, Article 107, 01r	03-107-01r.jp2	[]
674	[]	Article 108. Letter from Henry Underwood to Edward Alleyn, Oct. 14, 1626.	MSS 3, Article 108, 01r	03-108-01r.jp2	[]
675	[]	Article 109. Nine letters from Edward Alleyn of Newport Pagnell to his cousin Edward Alleyn, with a draft of a clause of Dulwich College statutes on one verso, c. 1616,	MSS 3, Article 109, 01r	03-109-01r.jp2	[]
676	[]	Article 110. Two letters from Matthias Alleyn to Edward Alleyn, April 20, March 10 (no year).	MSS 3, Article 110, 01v	03-110-01v.jp2	[]
833	[]	Article 137. Poem addressed to Edward Alleyn, no date.	MSS 1, Article 137, 01r	01-137-01r.jp2	[]
677	[]	Article 111. Two letters from Dorothy Calton to Edward Alleyn asking for a loan, no dates, with acquittance dated March 20 (no year).	MSS 3, Article 111, 01r	03-111-01r.jp2	[]
678	[]	Article 112. Petition from Frances Davys to Edward Alleyn for the grant of an almshouse in St Giles, Cripplegate, with a letter on the verso from Alleyn to John Millin about the almshouse , no date.	MSS 3, Article 112, 01r	03-112-01r.jp2	[]
679	[]	Article 113. Letter from Isabell Found to Edward Alleyn asking to become an almswoman,no date.	MSS 3, Article 113, 01r	03-113-01r.jp2	[]
680	[]	Article 114. Letter from William Hull to Edward Alleyn asking for a loan, no date.	MSS 3, Article 114, 01r	03-114-01r.jp2	[]
681	[]	Article 115. Letter from Richard Kippeis to Edward Alleyn asking for reimbursement of a payment to Lady Derby, no date.	MSS 3, Article 115, 01r	03-115-01r.jp2	[]
682	[]	Article 116. Letter from Innocent Lanier to Edward Alleyn asking for more of his medicinal 'powder', no date.	MSS 3, Article 116, 01r	03-116-01r.jp2	[]
683	[]	Article 117. Letter from Innocent Lanier to Sir Francis Calton about their bargain relating to Alleyn, no date.	MSS 3, Article 117, 01r	03-117-01r.jp2	[]
684	[]	Article 118. Letter from E. Philippes to Edward Alleyn thanking him for a gift, no date.	MSS 3, Article 118, 01r	03-118-01r.jp2	[]
685	[]	Article 119. Letter from Anne Poyntz to Edward Alleyn asking for a loan, no date.	MSS 3, Article 119, 01r	03-119-01r.jp2	[]
686	[]	Article 120. Letter from Joan Ratcliff to Edward Alleyn asking for aid, no date.	MSS 3, Article 120, 01r	03-120-01r.jp2	[]
687	[]	Article 121. Letter from Joan Ratcliff to Edward Alleyn asking for assitance, no date.	MSS 3, Article 121, 01r	03-121-01r.jp2	[]
688	[]	Article 122. Letter from Martha and John Stocke to their landlord Edward Alleyn, complaining of encroachments on their property, April 19, 1619.	MSS 3, Article 122, 01r	03-122-01r.jp2	[]
689	[]	Article 123. Letter from William Style to Edward Alleyn, concerning the theft of a horse, no date.	MSS 3, Article 123, 01r	03-123-01r.jp2	[]
690	[]	Article 124. Letter from Julian Tyson to Edward Alleyn asking for assistance, no date.	MSS 3, Article 124, 01r	03-124-01r.jp2	[]
691	[]	Article 125. Letter, unsigned, on matters in dispute relating to leases in Dulwich, no date.	MSS 3, Article 125, 01r	03-125-01r.jp2	[]
692	[]	Article 126. Letter, unsigned, on the inspection of weights and measures, no date.	MSS 3, Article 126, 01r	03-126-01r.jp2	[]
693	[]	Article 127. Letter, unsigned, to a woman by a 'pore sheppard'.	MSS 3, Article 127, 01r	03-127-01r.jp2	[]
694	[]	Article 128. Hymn, in the hand of Edward Alleyn, beginning, 'O prayse ye Lord ye seruantes all', six verses, no date	MSS 3, Article 128, 01r	03-128-01r.jp2	[]
695	[]	Article 129. List, in the hand of J. O Halliwell (afterwards Halliwell-Phillips) of thirty-six letters and papers which originally formed part of the Dulwich Library collection and were restored by him to the College, March 20, 1843 these [items are now bound in their proper order].	MSS 3, Article 129, 01r	03-129-01r.jp2	[]
697	[]	Article 1. Letter from Thomas Phillipson to Francis -----ton, possibly concerning Will Kemp, Aug. 3, 1559.	MSS 1, Article 1, 01r	01-001-01r.jp2	[]
698	[]	Article 2. Deed of sale of playbooks, costumes and other theatrical property by Richard Jones to Edward Alleyn, Jan. 3, 1588/9.	MSS 1, Article 2, 01r	01-002-01r.jp2	[]
699	[]	Article 3. Deed of sale of a costume by William Wardelo to John Alleyn, Aug. 8, 1589.	MSS 1, Article 3, 01r	01-003-01r.jp2	[]
700	[]	Article 4. Deed of sale of a costume by Isaacke Burges to John Alleyn, Nov. 23, 1590.	MSS 1, Article 4, 01r	01-004-01r.jp2	[]
701	[]	Article 5. Deed of sale of a costume by John Clyffe to John Alleyn, May 6, 1591.	MSS 1, Article 5, 01r	01-005-01r.jp2	[]
702	[]	Article 6. Letter from W. P. to Edward Alleyn about a theatrical wager, with six lines of verse beginning 'Deny me not, sweete Nedd, the wager's downe', c. 1590. See Digital Essays.	MSS 1, Article 6, 01r	01-006-01r.jp2	[]
703	[]	Article 7. Seventeen lines of verse to 'Sweete Nedde', no date [J. P. Collier forgery].	MSS 1, Article 7, 01r	01-007-01r.jp2	[]
704	[]	Article 8. Letter from Richard Jones to Edward Alleyn, relating to pawned costumes, c. Feb. 1591 or 1592.	MSS 1, Article 8, 01r	01-008-01r.jp2	[]
705	[]	Article 9. Letter from Edward Alleyn to his wife Joan, his 'good sweett harte and loving mouse', May 2, 1593.	MSS 1, Article 9, 01r	01-009-01r.jp2	[]
706	[]	Article 10. Letter from Philip Henslowe to Edward Alleyn, sending his regards, July 5, 1593.	MSS 1, Article 10, 01r	01-010-01r.jp2	[]
707	[]	Article 11. Letter from Edward Alleyn to his wife Joan, 'his good sweett mouse', c. July 24, 1593.	MSS 1, Article 11, 01r	01-011-01r.jp2	[]
708	[]	Article 12. Letter from Philip Henslowe to Edward Alleyn about the plague, c. Aug. 1593.	MSS 1, Article 12, 01r	01-012-01r.jp2	[]
709	[]	Article 13. Letter from Philip Henslowe to Edward Alleyn about the plague, Aug. 14, 1593	MSS 1, Article 13, 01r	01-013-01r.jp2	[]
710	[]	Article 14. Letter from Philip Henslowe to Edward Alleyn about the plague, with a drawing of a stage design on 2r, Sept. 28, 1593	MSS 1, Article 14, 01r	01-014-01r.jp2	[]
711	[]	Article 15. Letter from John Pyk, written out by Thomas Downton, to Mistress Alleyn, no date.	MSS 1, Article 15, 01r	01-015-01r.jp2	[]
712	[]	Article 16. Petition to the Privy Council from the Lord Strange's Men to allow them to reopen the Rose Theatre, and thereby alleviate the financial losses by the company and by Thames watermen, c. 1593.	MSS 1, Article 16, 01r	01-016-01r.jp2	[]
713	[]	Article 17. Petition to Charles Howard, Lord Admiral from Thames watermen to reopen the Rose theatre and relieve their poverty, c. 1593.	MSS 1, Article 17, 01r	01-017-01r.jp2	[]
714	[]	Article 18. Warrant from the Privy Council to re-open the Rose Theatre, c. April, 1594.	MSS 1, Article 18, 01r	01-018-01r.jp2	[]
715	[]	Article 19. Letter from Richard Veale to Philip Henslowe about the Lord Chamberlain's Men, May 3, 1596 [J. P. Collier forgery].	MSS 1, Article 19, 01r	01-019-01r.jp2	[]
716	[]	Article 20. Complaint of the Inhabitants of Southwark, July 1596 [J. P. Collier forgery].	MSS 1, Article 20, 01r	01-020-01r.jp2	[]
717	[]	Article 21. Petition to Henry Carey, Lord Hunsdon and the Lord Chamberlain from Richard Topping about Thomas Lodge's debts, c. 1596.	MSS 1, Article 21, 01r	01-021-01r.jp2	[]
718	[]	Article 22. Petition to George Carey, second Lord Hunsdon and the Lord Chamberlain, from Richard Topping about Thomas Lodge's debts, Jan. 29, 1597/8.	MSS 1, Article 22, 01r	01-022-01r.jp2	[]
719	[]	Article 23. Answer of Philip Henslowe to the preceding, c. 1598.	MSS 1, Article 23, 01r	01-023-01r.jp2	[]
720	[]	Article 24. Letter from Philip Henslowe to Edward Alleyn on the death of Gabriel Spenser, slain by Ben Jonson in a duel in Hoxton fields, Sept. 26, 1598.	MSS 1, Article 24, 01r	01-024-01r.jp2	[]
721	[]	Article 25. Bond from Richard Bradshawe, Byrcot Byrde and Robert Archer to William Bird, March 2, 1599.	MSS 1, Article 25, 01r	01-025-01r.jp2	[]
722	[]	Article 26. Letter from Robert Shaa (or Shaw) to Philip Henslowe to commission the play [The Second Part of Henry Duke of Richmond]from Robert Wilson, with one act outlined on the verso, Nov. 8, 1599.	MSS 1, Article 26, 01r	01-026-01r.jp2	[]
723	[]	Article 27. Warrant from Charles Howard, Earl of Nottingham, the Lord High Admiral, to the Justices of Middlesex to allow construction of the Fortune Theatre, Jan. 12, 1599/1600.	MSS 1, Article 27, 01r	01-027-01r.jp2	[]
724	[]	Article 28. Address of Finsbury inhabitants to the Privy Council cetifying their willingness to allow the construction of the Fortune Theatre, c. Jan., 1600.	MSS 1, Article 28, 01r	01-028-01r.jp2	[]
725	[]	Article 29. Warrant from the Privy Council to the Justices of Middlesex to to allow the construction of the Fortune Theatre, April 8, 1600.	MSS 1, Article 29, 01r	01-029-01r.jp2	[]
726	[]	Article 30. An Inventory of Theatrical Costumes in the hand of Edward Alleyn, c. 1590-1600. See Digital Essays.	MSS 1, Article 30, 01r	01-030-01r.jp2	[]
727	[]	Article 31. Letter from Robert Shaa (or Shaw) to Philip Henslowe to pay the authors,including Robert Wilson, of the play Fair Constance of Rome, no date.	MSS 1, Article 31, 01r	01-031-01r.jp2	[]
728	[]	Article 32. Letter from Samuel Rowley to Philip Henslowe to commission the play The Conquest of the Indies, co-written by Robert Wilson, c. April 4, 1601.	MSS 1, Article 32, 01r	01-032-01r.jp2	[]
729	[]	Article 33. Letter from Samuel Rowley to Philip Henslowe about the play John of Gaunt, no date.	MSS 1, Article 33, 01r	01-033-01r.jp2	[]
730	[]	Article 34. Letter from Samuel Rowley (or Rowley) to Philip Henslowe about the dramatists John Daye and William Haughton, no date.	MSS 1, Article 34, 01r	01-034-01r.jp2	[]
731	[]	Article 35. Letter from Samuel Rowley (or Rowley) to Philip Henslowe about the dramatists John Daye and William Haughton and the plays Six Yeomen(?) of the West and The Conquest of the Indies, no date, with verses by John Day on the verso.	MSS 1, Article 35, 01r	01-035-01r.jp2	[]
732	[]	Article 36. Letter from Robert Shaa (or Shaw) to Philip Henslowe about the play Too Good to be True, no date.	MSS 1, Article 36, 01r	01-036-01r.jp2	[]
733	[]	Article 37. Acquittance from William Playstowe to Philip Henslowe for one month's pay to Edmund Tilney, Master of the Revels, Aug. 4, 1602.	MSS 1, Article 37, 01r	01-037-01r.jp2	[]
734	[]	Article 38. Letter from Joan Alleyn to Edward Alleyn about the plague and other matters, Oct. 21, 1603.	MSS 1, Article 38, 01r	01-038-01r.jp2	[]
735	[]	Article 39. Letter from the Privy Council to the Lord Mayor and Justices of Middlesex to permit the three companies of players for the King, Queen and Prince to play only at the Globe, Fortune and Curtain theatres, except in times of plague, April 9, 1604.	MSS 1, Article 39, 01r	01-039-01r.jp2	[]
736	[]	Article 40. Letter from Ludovic Stuart, Duke of Lennox, to various officials in support of his players, Oct. 13, 1604.	MSS 1, Article 40, 01r	01-040-01r.jp2	[]
737	[]	Article 41. Power of attorney from Abraham Sauere (or Sawyer) to Francis Henslowe, relating to the Duke of Lennox, Mar. 1, 1604/5.	MSS 1, Article 41, 01r	01-041-01r.jp2	[]
738	[]	Article 42. Bond from Francis Henslowe to Philip Henslowe relating to the Duke of Lennox's Men, Mar. 16, 1605.	MSS 1, Article 42, 01r	01-042-01r.jp2	[]
739	[]	Article 43. Bond from Daniel, William, and Edmond Gill, to Katherine and Gill Moore and others, Dec. 19, 1605.	MSS 1, Article 43, 01r	01-043-01r.jp2	[]
740	[]	Article 44. Similar bond, Dec. 19, 1605.	MSS 1, Article 44, 01r	01-044-01r.jp2	[]
741	[]	Article 45. Note by Abraham Sauere (or Sawyer) to Philip Henslowe, Mar. 11, 1605/6.	MSS 1, Article 45, 01r	01-045-01r.jp2	[]
742	[]	Article 46. Letter from William Noreis (or Norris) to Edward Alleyn, June 1, 1608.	MSS 1, Article 46, 01r	01-046-01r.jp2	[]
743	[]	Article 47. Assessment of the state of the Clink Liberty, no date.	MSS 1, Article 47, 01r	01-047-01r.jp2	[]
744	[]	Article 48. Assessment of the state of the Clink Liberty, including a list of residents, with a list of residents, March 1608/9.	MSS 1, Article 48, 01r	01-048-01r.jp2	[]
745	[]	Article 49. Brief note on the poor book of the Clink Liberty, with a list of residents [Shakespeare's name forged by J. P. Collier], April 6, 1609.	MSS 1, Article 49, 02r	01-049-02r.jp2	[]
746	[]	Article 50. Account of the poor book of the Clink Liberty, Oct. 14, 1609.	MSS 1, Article 50, 01r	01-050-01r.jp2	[]
747	[]	Article 51. Things necessary for the government of the Clink Liberty, c. 1609.	MSS 1, Article 51, 01r	01-051-01r.jp2	[]
748	[]	Article 52. Remembrance of a gift from the Company of Leathersellers to the poor of St. Saviour's parish, c. 1609.	MSS 1, Article 52, 01r	01-052-01r.jp2	[]
749	[]	Article 53. Letter from Patrick Brewe to Edward Alleyn, about the sale of the Gill family's property, April 6, 1609.	MSS 1, Article 53, 01r	01-053-01r.jp2	[]
750	[]	Article 54. Letter from Patrick Brewe to Edward Alleyn, Aug. 3, 1609.	MSS 1, Article 54, 01r	01-054-01r.jp2	[]
751	[]	Article 55. Letter from Patrick Brewe to Edward Alleyn, Dec. 9, 1609.	MSS 1, Article 55, 01r	01-055-01r.jp2	[]
752	[]	Article 56. Directions for Sir Jeremy Turnour relating to the Fortune Theatre, with a list of Edward Alleyn's deeds on the verso, c. March 1609-10.	MSS 1, Article 56, 01r	01-056-01r.jp2	[]
753	[]	Article 57. Directions to the Commissioners relating to the above, c. March 1609-10.	MSS 1, Article 57, 01r	01-057-01r.jp2	[]
754	[]	Article 58. Bargain and sale of lands and tenements by Philip Moore and others relating to the Fortune Theatre, March 7, 1609/10.	MSS 1, Article 58, 01r	01-058-01r.jp2	[]
755	[]	Article 59. Bargain and sale of lands and tenements by William Clarke and others relating to the Fortune Theatre, March 7, 1609/10.	MSS 1, Article 59, 01r	01-059-01r.jp2	[]
756	[]	Article 60. Bargain and sale of lands and tenements by Hugh Cannell and others relating to the Fortune Theatre, March 7, 1609/10.	MSS 1, Article 60, 01r	01-060-01r.jp2	[]
757	[]	Article 61. Bargain and sale of lands and tenements by David Qualtroughe and others relating to the Fortune Theatre, March 7, 1609/10.	MSS 1, Article 61, 01r	01-061-01r.jp2	[]
758	[]	Article 62. Power of attorney from Daniel Gill and others relating to the Fortune Theatre, March 14, 1609.	MSS 1, Article 62, 01r	01-062-01r.jp2	[]
759	[]	Article 63. Acquittance from Sir William Norris to Edward Alleyn for rent relating to lands near the Fortune Theatre, March 17, 1609/10.	MSS 1, Article 63, 01r	01-063-01r.jp2	[]
760	[]	Article 64. Acquittance from Edmond Gill to Edward Alleyn relating to the Fortune Theatre. May 18, 1610.	MSS 1, Article 64, 01r	01-064-01r.jp2	[]
761	[]	Article 65. Affidavits of Edmond Gill and others relating to the Fortune Theatre, June 29, 1610.	MSS 1, Article 65, 01r	01-065-01r.jp2	[]
762	[]	Article 66. Letter from Robert Browne to Edward Alleyn, April 11, 1612.	MSS 1, Article 66, 01r	01-066-01r.jp2	[]
763	[]	Article 67. Letter from Charles Massey to Edward Alleyn about Massey's debts, c. 1613.	MSS 1, Article 67, 01r	01-067-01r.jp2	[]
764	[]	Article 68. Letter from Nathan Field, Robert Daborne and Philip Massinger to Philip Henslow asking for payment for a play co-written with John Fletcher, with the payment to be used for bail, c. 1614.	MSS 1, Article 68, 01r	01-068-01r.jp2	[]
765	[]	Article 69. Letter from Nathan Field to Philip Henslowe for a loan for bail, no date.	MSS 1, Article 69, 01r	01-069-01r.jp2	[]
766	[]	Article 70. Memorandum between Robert Daborne and Philip Henslowe for the composition of Machiavel and the Devil, April 17, 1613. See Digital Essays.	MSS 1, Article 70, 01r	01-070-01r.jp2	[]
767	[]	Article 71. Bond between between Robert Daborne and Philip Henslowe for the composition of Machiavel and the Devil, April 17, 1613. See Digital Essays.	MSS 1, Article 71, 01r	01-071-01r.jp2	[]
768	[]	Article 72. Letter from Robert Daborne to Philip Henslowe for a loan, April 25, 1613.	MSS 1, Article 72, 01r	01-072-01r.jp2	[]
769	[]	Article 73. Letter from Robert Daborne to Philip Henslowe about composition of plays, May 3, 1613.	MSS 1, Article 73, 01r	01-073-01r.jp2	[]
770	[]	Article 74. Letter from Robert Daborne to Philip Henslowe about composition of plays, May 8, 1613.	MSS 1, Article 74, 01r	01-074-01r.jp2	[]
771	[]	Article 75. Letter from Robert Daborne to Philip Henslowe about reading his new play to the company, May 16, 1613.	MSS 1, Article 75, 01r	01-075-01r.jp2	[]
772	[]	Article 76. Letter from Robert Daborne to Philip Henslowe discussing Philip Massinger's salary and the forthcoming revival of Eastward Ho, c. 1613.	MSS 1, Article 76, 01r	01-076-01r.jp2	[]
773	[]	Article 77. Acquittance from Robert Daborne to Philip Henslowe for part payment of the play Machiavel and the Devil, May 19, 1613.	MSS 1, Article 77, 01r	01-077-01r.jp2	[]
774	[]	Article 78. Letter from Robert Daborne to Philip Henslowe about his collaboration with Cyril Tourneur on The Arraignment of London, June 5, 1613.	MSS 1, Article 78, 01r	01-078-01r.jp2	[]
775	[]	Article 79. Letter from Robert Daborne to Philip Henslowe about composition of plays, June 10, 1613.	MSS 1, Article 79, 01r	01-079-01r.jp2	[]
776	[]	Article 80. Letter from Robert Daborne to Philip Henslowe about composition of plays and part payment for The Arraignment of London, June 18, 1613.	MSS 1, Article 80, 01r	01-080-01r.jp2	[]
777	[]	Article 81. Letter from Robert Daborne to Philip Henslowe about the plays Machiavel and the Devil and The Arraignment of London, June 25, 1613.	MSS 1, Article 81, 01r	01-081-01r.jp2	[]
778	[]	Article 82. Letter from Robert Daborne to Philip Henslowe about composition of plays, July 16, 1613.	MSS 1, Article 82, 01r	01-082-01r.jp2	[]
779	[]	Article 83. Letter from Robert Daborne to Philip Henslowe about debts, July 30, 1613.	MSS 1, Article 83, 01r	01-083-01r.jp2	[]
780	[]	Article 84. Letter from Robert Daborne to Philip Henslowe about the terms of commissioning The Bellman of London, Aug. 23, 1613.	MSS 1, Article 84, 01r	01-084-01r.jp2	[]
781	[]	Article 85. Letter from Robert Daborne to Philip Henslowe threatening to take new play to the King's Men, Oct. 14, 1613.	MSS 1, Article 85, 01r	01-085-01r.jp2	[]
782	[]	Article 86. Letter from Robert Daborne to Philip Henslowe threatening to take new play to the King's Men, Oct. 29, 1613.	MSS 1, Article 86, 01r	01-086-01r.jp2	[]
783	[]	Article 87. Letter from Robert Daborne to Philip Henslowe about composition of plays, Nov. 5, 1613.	MSS 1, Article 87, 01r	01-087-01r.jp2	[]
784	[]	Article 88. Letter from Robert Daborne to Philip Henslowe about Ben Jonson's play [Bartholomew Fair?], Nov. 13, 1613.	MSS 1, Article 88, 01r	01-088-01r.jp2	[]
785	[]	Article 89. Letter from Robert Daborne to Philip Henslowe about Henslowe's threatened breach of promise suit, Nov. 13, 1613. See Digital Essays.	MSS 1, Article 89, 01r	01-089-01r.jp2	[]
786	[]	Article 90. Letter from Robert Daborne to Philip Henslowe about a loan, Nov. 27, 1613.	MSS 1, Article 90, 01r	01-090-01r.jp2	[]
787	[]	Article 91. Letter from Robert Daborne to Philip Henslowe on composition of plays, Dec. 9, 1613.	MSS 1, Article 91, 01r	01-091-01r.jp2	[]
788	[]	Article 92. Bond from Robert Daborne to Philip Henslowe for the composition of The Owl, Dec. 10, 1613.	MSS 1, Article 92, 01r	01-092-01r.jp2	[]
789	[]	Article 93. Acquittance from Robert Daborne to Philip Henslowe for part payment for The Owl, Dec. 24, 1613.	MSS 1, Article 93, 01r	01-093-01r.jp2	[]
790	[]	Article 94. Letter from Robert Daborne to Philip Henslowe about the reading of the new play, Dec. 31, 1613.	MSS 1, Article 94, 01r	01-094-01r.jp2	[]
791	[]	Article 95. Letter from Robert Daborne to Philip Henslowe about a loan, c. 1614.	MSS 1, Article 95, 01r	01-095-01r.jp2	[]
792	[]	Article 96. Letter from Robert Daborne to Philip Henslowe about compsotion of plays, c. March 11, 1613/4.	MSS 1, Article 96, 01r	01-096-01r.jp2	[]
793	[]	Article 97. Letter from Robert Daborne to Philip Henslowe about final payment for a completed play, March 28, 1613, with payment to commission the play The She Saint.	MSS 1, Article 97, 01r	01-097-01r.jp2	[]
794	[]	Article 98. Letter from Robert Daborne to Philip Henslowe for a loan, August 2, 1613.	MSS 1, Article 98, 01r	01-098-01r.jp2	[]
949	[]	Page 014r	MSS 8, 014r	08-014r.jp2	[]
950	[]	Page 014v	MSS 8, 014v	08-014v.jp2	[]
951	[]	Page 015r	MSS 8, 015r	08-015r.jp2	[]
795	[]	Article 99. Letter from Robert Daborne to Edward Griffin for a loan, c. 1614.	MSS 1, Article 99, 01r	01-099-01r.jp2	[]
796	[]	Article 100. Letter from Nathan Field to Philip Henslowe about a play to be co-written with Robert Daborne, c. 1613.	MSS 1, Article 100, 01r	01-100-01r.jp2	[]
797	[]	Article 101. Small memorandum book chiefly in the hand of Edward Alleyn listing building accounts, 1614-1615.	MSS 1, Article 101, 01r	01-101-01r.jp2	[]
798	[]	Article 102. Bond from Robert Daborne and Philip Massinger to Philip Henslowe, July 4, 1615.	MSS 1, Article 102, 01r	01-102-01r.jp2	[]
799	[]	Article 103. Letter from John Marston to Philip Henslowe, no date [J. P. Collier forgery].	MSS 1, Article 103, 01r	01-103-01r.jp2	[]
800	[]	Article 104. Letter from Wiliam Bird to Edward Alleyn about John Russell's gathering of theatre income, no date.	MSS 1, Article 104, 01r	01-104-01r.jp2	[]
801	[]	Article 105. Letter from William Bird to Philip Henslowe for a loan, no date.	MSS 1, Article 105, 01r	01-105-01r.jp2	[]
802	[]	Article 106. Articles of grievance and oppression against Philip Henslowe from his acting company, c. 1615.	MSS 1, Article 106, 01r	01-106-01r.jp2	[]
803	[]	Article 107. Articles of agreement between Edward Alleyn and Jacob Meade, William Rowley, Robert Palllant and other actors relating to their use of the Hope Theatre, March 20, 1615/6.	MSS 1, Article 107, 01r	01-107-01r.jp2	[]
804	[]	Article 108. Letter from Thomas Dekker to Edward Alleyn containing some verses (now lost), Sept 12, 1616.	MSS 1, Article 108, 01r	01-108-01r.jp2	[]
805	[]	Article 109. Letter from Thomas Dekker to Edward Alleyn sending him thanks, c. 1616.	MSS 1, Article 109, 01r	01-109-01r.jp2	[]
806	[]	Article 110. Letter from Philip Henslowe's acting company (Joseph Meade and others) to Edward Alleyn about their loss of the use of the Hope Theatre and requesting a loan, c. 1616	MSS 1, Article 110, 01r	01-110-01r.jp2	[]
807	[]	Article 111. Fragment of a letter to Edward Alleyn, no date.	MSS 1, Article 111, 01r	01-111-01r.jp2	[]
808	[]	Article 112. Letter from Haris Joones (or Jones) to Edward Alleyn, no date.	MSS 1, Article 112, 01r	01-112-01r.jp2	[]
809	[]	Article 113. Acquittance from Wililam Gore to Mathias Alleyn about the Fortune Theatre, November 8, 1632.	MSS 1, Article 113, 01r	01-113-01r.jp2	[]
810	[]	Article 114. Certificate from Dulwich College to the Lord Keeper relating to the Fortune Theatre, Sept 4, 1637.	MSS 1, Article 114, 01r	01-114-01r.jp2	[]
811	[]	Article 115. Bill in Chancery from Dulwich College against Margaret Gray and others relating to the Fortune Theatre, November, 1637.	MSS 1, Article 115, 01r	01-115-01r.jp2	[]
812	[]	Article 116. License from the the Master and Warden of Dulwich College to Tobias Lisle relating to the Fortune Theatre, July 15, 1639.	MSS 1, Article 116, 01r	01-116-01r.jp2	[]
813	[]	Article 117. Acquittance from the Master and Warden of Dulwich College to Tobias Lisle relating to the Fortune Theatre, July 22, 1639.	MSS 1, Article 117, 01r	01-117-01r.jp2	[]
814	[]	Article 118. Petition from Dulwich College to Sir Edward Littleton, Lord Keeper, against John Beale relating to the Fortune Theatre, Feb. 9, 1640/1.	MSS 1, Article 118, 01r	01-118-01r.jp2	[]
815	[]	Article 119. Bill in Chancery by Dulwich College against John Beale relating to the Fortune Theatre, 1640.	MSS 1, Article 119, 01r	01-119-01r.jp2	[]
816	[]	Article 120. Order of court in a suit between Margaret Gray and Matthias Alleyn and others relating to the Fortune Theatre, July 9, 1641.	MSS 1, Article 120, 01r	01-120-01r.jp2	[]
817	[]	Article 121. Orders of court and the papers in a suit between Tobias Lisle and Dulwich College relating to the Fortune Theatre, Nov. 28, 1645-Nov. 26, 1646.	MSS 1, Article 121, 01r	01-121-01r.jp2	[]
818	[]	Article 122. Orders of court in a suit between Dulwich College and Tobias Lisle and others relating to the Fortune Theatre, Oct. 16, 1647-Nov. 24, 1649.	MSS 1, Article 122, 01r	01-122-01r.jp2	[]
819	[]	Article 123. Order of court regarding a lawsuit between Dulwich College and John Rhodes relating to the Fortune Theatre, Feb. 1, 1649/50.	MSS 1, Article 123, 01r	01-123-01r.jp2	[]
820	[]	Article 124. Report of Edward Jerman and John Tanner relating to the Fortune Theatre, July 18, 1656.	MSS 1, Article 124, 01r	01-124-01r.jp2	[]
821	[]	Article 125. Order of the Court of Assistants of Dulwich College relating to the Fortune Theatre, Mar. 5, 1659/60	MSS 1, Article 125, 01r	01-125-01r.jp2	[]
822	[]	Article 126. Order of the same for the sale of metreials of the Fortune Theatre, March 4, 1660/61.	MSS 1, Article 126, 01r	01-126-01r.jp2	[]
823	[]	Article 127. Memorandum of a contract for the purchase of the materials and lands of the Fortune Theatre by William Beaven from Dulwich College, March 16, 1660/1.	MSS 1, Article 127, 01r	01-127-01r.jp2	[]
824	[]	Article 128. Acquittance from Dulwich College to William Beaven for the purchase of the materials of the Fortune Theatre, July 8, 1661.	MSS 1, Article 128, 01r	01-128-01r.jp2	[]
825	[]	Article 129. Memorandum for a lease from Dulwich College to William Beaven for the lands of the Fortune Theatre, July 24, 1661.	MSS 1, Article 129, 01r	01-129-01r.jp2	[]
826	[]	Article 130. Acquittance from Dulwich College to William Beaven relating to the Fortune Theatre, July 26, 1661.	MSS 1, Article 130, 01r	01-130-01r.jp2	[]
827	[]	Article 131. Bill in Chancery of Will Beaven against Dulwich College relating to the Fortune Theatre, Nov., 1661.	MSS 1, Article 131, 01r	01-131-01r.jp2	[]
828	[]	Article 132. Decree in Chancery to Dulwich College towards William Beaven, Nov. 21, 1661.	MSS 1, Article 132, 01r	01-132-01r.jp2	[]
829	[]	Article 133. Order of the court of assistants at Dulwich college for a lease to William Beaven relating to the Fortune Theatre, March 4, 1661/62.	MSS 1, Article 133, 01r	01-133-01r.jp2	[]
830	[]	Article 134. Acquittance from Dulwich College to William Beaven relating to the Fortune Theatre, July 28, 1662.	MSS 1, Article 134, 01r	01-134-01r.jp2	[]
831	[]	Article 135. A Translation in verse in the hand of Ben Jonson of Martial's epigram ('The things that make the happier life are these'), no date. See Digital Essays.	MSS 1, Article 135, 01r	01-135-01r.jp2	[]
832	[]	Article 136. A copy, in the hand of Ben Jonson of Sir Henry Wotton's poem 'How happy is he born and taught', no date. See Digital Essays.	MSS 1, Article 136, 01r	01-136-01r.jp2	[]
952	[]	Page 015v	MSS 8, 015v	08-015v.jp2	[]
953	[]	Page 016r	MSS 8, 016r	08-016r.jp2	[]
954	[]	Page 016v	MSS 8, 016v	08-016v.jp2	[]
834	[]	Article 138. Copy of the part of Orlando in Robert Greene's play Orlando Furioso, no date. See Digital Essays.	MSS 1, Article 138, 01r	01-138-01r.jp2	[]
835	[]	Article 139. A dramatic dialogue, probably played as an interlude, no date ['Kitt Marlowe' added in a later hand on the verso], no date.	MSS 1, Article 139, 01r	01-139-01r.jp2	[]
836	[]	Article 140. Seven stanzas in praise of tailors, no date.	MSS 1, Article 140, 01r	01-140-01r.jp2	[]
837	[]	Article 141. Dialogue of love between a man and a boy, no date.	MSS 1, Article 141, 01r	01-141-01r.jp2	[]
838	[]	Article 142. Ballad, without title, of the 'Bonny Wench of Adlington', no date.	MSS 1, Article 142, 01r	01-142-01r.jp2	[]
839	[]	Article 143. Poem of a jealous husband outwitted, in twenty-one stanzas, no date.	MSS 1, Article 143, 01r	01-143-01r.jp2	[]
841	[]	1. Bargain and sale by Rauf Symondes to Thomas Langham of three tenements in Golding Lane and Whitecross Street, July 12, 1546.	Muniments, Series 1, Group 1, 01r	mun-01-001-01r.jp2	[]
842	[]	2. Bargain and sale by Thomas and Robert Langham to William Gill of three tenements in Golding Lane and Whitecross Street, Jan. 29, 1566.	Muniments, Series 1, Group 2, 01r	mun-01-002-01r.jp2	[]
843	[]	3. Bargain and sale by Thomas and Robert Langham to William Gill for three tenements in Golding Lane and Whitecross Street, Jan. 29, 1566.	Muniments, Series 1, Group 3, 01r	mun-01-003-01r.jp2	[]
844	[]	4. Feoffment from Thomas and Robert Langham to William Gill for three tenements in Golding Lane and Whitecross Street, Jan. 29, 1566.	Muniments, Series 1, Group 4, 01r	mun-01-004-01r.jp2	[]
845	[]	5. Fine by Thomas and Elizabeth Langham to Willliam Gill for three tenements in Golding Lane and Whitecross Street, 1568.	Muniments, Series 1, Group 5, 01r	mun-01-005-01r.jp2	[]
846	[]	6. Fine by Thomas and Elizabeth Langham to Willliam Gill for three tenements in Golding Lane and Whitecross Street, 1568.	Muniments, Series 1, Group 6, 01r	mun-01-006-01r.jp2	[]
847	[]	7. Letters Patent of Queen Elizabeth I giving Raphe Bowes the office of the Mastership of the Royal Game of Bears, Bulls and Mastiff Dogs, June 2, 1573.	Muniments, Series 1, Group 7, 01r	mun-01-007-01r.jp2	[]
848	[]	8. Lease from Ambrose Nicholas, William Boxe and others to William Griffin of a messuage called the ''Little Rose', Nov. 20, 1574.	Muniments, Series 1, Group 8, 01r	mun-01-008-01r.jp2	[]
849	[]	9. Will of William Gill bequeathing tenements in Golding Lane to Katherine and Daniel Gill and others, April 21, 1575.	Muniments, Series 1, Group 9, 01r	mun-01-009-01r.jp2	[]
850	[]	10. Assignment by William Griffen to Robert Withens of the lease of the 'Liitle Rose', Dec. 11, 1579.	Muniments, Series 1, Group 10, 01r	mun-01-010-01r.jp2	[]
851	[]	11. Power of attorney from Daniel Gill and his son Daniel to Patrick Brewe relating to the deeds of tenements in Golding Lane, Feb. 14, 1580.	Muniments, Series 1, Group 11, 01r	mun-01-011-01r.jp2	[]
852	[]	12. Lease from Daniel Gill to Patrick Brewe of messuages on Golding Lane and Whitecrosse Street, July 11, 1584.	Muniments, Series 1, Group 12, 01r	mun-01-012-01r.jp2	[]
853	[]	13. Lease from Daniel Gill to Patrick Brewe of messuages on Golding Lane and Whitecrosse Street, July 11, 1584.	Muniments, Series 1, Group 13, 01r	mun-01-013-01r.jp2	[]
854	[]	14. Feoffment from Daniel Gill to his son Daniel of the same messauges, Oct. 10, 1584.	Muniments, Series 1, Group 14, 01r	mun-01-014-01r.jp2	[]
855	[]	15. Assignment by Robert Withens to Philip Henslowe of the lease of the 'Little Rose' , March 24, 1584/5.	Muniments, Series 1, Group 15, 01r	mun-01-015-01r.jp2	[]
856	[]	16. Deed of partnership between Philip Henslowe and John Cholmley for a parcel of ground on the Bankside and in a playhouse [the Rose] to be erected thereon, with details of how receipts are to be paid, Jan. 10, 1586/7. See Digital Essays.	Muniments, Series 1, Group 16, 01r	mun-01-016-01r.jp2	[]
857	[]	17. Will of Daniel Gill bequeathing his lands in trust to his family, May 25, 1592.	Muniments, Series 1, Group 17, 01r	mun-01-017-01r.jp2	[]
858	[]	18. Letters Patent of Queen Elizabeth I granting to Philip Henslowe the office of the Mastership of the Royal Game of Bears, Bulls and Mastiff Dogs (not executed), before June, 1598.	Muniments, Series 1, Group 18, 01r	mun-01-018-01r.jp2	[]
859	[]	19. Warrant from Jacob Meade, Master of the Royal Game of Bears, Bulls and Mastiff Dogs, commissioning John Cullyver to act as his deputy, Nov. 24, 1599.	Muniments, Series 1, Group 19, 01r	mun-01-019-01r.jp2	[]
860	[]	20. Assignment by Patrick Brewe to Edward Alleyn of the lease from Daniel Gill, relating to 12 and 13 above, Dec. 22, 1599.	Muniments, Series 1, Group 20, 01r	mun-01-020-01r.jp2	[]
861	[]	21. Draft of the preceding assignment, no date.	Muniments, Series 1, Group 21, 01r	mun-01-021-01r.jp2	[]
862	[]	22. Contract by Peter Streete, carpenter, with Philip Henslowe and Edward Alleyn to erect for the sum of £440 a 'new howse and stadge for a Plaiehowse [the Fortune] . . . nere Golding Lane', to have the same dimensions, as given, as the Globe Theatre, Jan. 8, 1599/1600, with acquittances on the verso dated Jan. 8, 1599-June 11, 1600. See Digital Essays.	Muniments, Series 1, Group 22, 01r	mun-01-022-01r.jp2	[]
863	[]	23. Lease from Daniel, William and Edmond Gill to John Garrett for rent of the premises as 12 and 13 above, June 30, 1601.	Muniments, Series 1, Group 23, 01r	mun-01-023-01r.jp2	[]
864	[]	24. Lease from Daniel, William and Edmond Gill to John Garrett for rent of the premises as 12 and 13 above, June 30, 1601.	Muniments, Series 1, Group 24, 01r	mun-01-024-01r.jp2	[]
865	[]	25. Letters Patent of King James I, granting to John Dorrington the office of the Mastership of the Royal Game of Bears, Bulls and Mastiff Dogs, July 14, 1603.	Muniments, Series 1, Group 25, 01r	mun-01-025-01r.jp2	[]
866	[]	26. Bond from Abraham Sauere (or Sawyer) to Francis Henslowe and James Browne to secure a payment to Joshua Speed, Oct. 25, 1604.	Muniments, Series 1, Group 26, 01r	mun-01-026-01r.jp2	[]
867	[]	27. Award by William Norres (or Norris) and others in a dispute with Daniel Gill and family relating to tenements in Golding Lane and Whitecrosse Street, Dec. 19, 1605.	Muniments, Series 1, Group 27, 01r	mun-01-027-01r.jp2	[]
868	[]	28. Award by William Norres (or Norris) and others in a dispute with Daniel Gill and family relating to tenements in Golding Lane and Whitecrosse Street, Dec. 19, 1605.	Muniments, Series 1, Group 28, 01r	mun-01-028-01r.jp2	[]
955	[]	Page 017r	MSS 8, 017r	08-017r.jp2	[]
956	[]	Page 017v	MSS 8, 017v	08-017v.jp2	[]
957	[]	Page 018r	MSS 8, 018r	08-018r.jp2	[]
869	[]	29. Award by William Norres (or Norris) and others in a dispute with Daniel Gill and family relating to tenements in Golding Lane and Whitecrosse Street, Dec. 19, 1605.	Muniments, Series 1, Group 29, 01r	mun-01-029-01r.jp2	[]
870	[]	30. Lease from Thomas Towne to William Pearis of a tenement in Lambeth marsh, May 5, 1607.	Muniments, Series 1, Group 30, 01r	mun-01-030-01r.jp2	[]
871	[]	31. Lease from Thomas Garland to Philip Henslowe and Edward Alleyn for pastures in Lambeth called 'Long Slippe', June 28, 1608.	Muniments, Series 1, Group 31, 01r	mun-01-031-01r.jp2	[]
872	[]	32. Grant from Edward Alleyn to Thomas and Agnes Towne of an annuity for Dulwich manor and lands and the surrender of Kennington manor and lands, Oct. 28, 1608.	Muniments, Series 1, Group 32, 01r	mun-01-032-01r.jp2	[]
873	[]	33. Lease from Philip Henslowe and Edward Alleyn to Thomas Downton for one-eighth of a fourth part of income from the Fortune Theatre (not executed), 1608.	Muniments, Series 1, Group 33, 01r	mun-01-033-01r.jp2	[]
874	[]	34. Lease from Philip Henslowe and Edward Alleyn to Thomas Downton for one-eighth of a fourth part of income from the Fortune Theatre (not executed), 1608.	Muniments, Series 1, Group 34, 01r	mun-01-034-01r.jp2	[]
875	[]	35. Lease from Edward Alleyn to Edmond Williams of two messuages in Whitecrosse Street, Feb. 28, 1609/10.	Muniments, Series 1, Group 35, 01r	mun-01-035-01r.jp2	[]
876	[]	36. Assignment by John Garratt to Edward Alleyn of his reversion of the lease of messuages in Golding Lane and Whitecross Street, as 23 and 24 above, May 1, 1610.	Muniments, Series 1, Group 36, 01r	mun-01-036-01r.jp2	[]
877	[]	37. Assignment by Edward Alleyn to Philip Henslowe of the same, May 4, 1610.	Muniments, Series 1, Group 37, 01r	mun-01-037-01r.jp2	[]
878	[]	38. Bargain and sale by Daniel Gill and his family and others to Edward Alleyn for twelve tenements relating to the Fortune Theatre, May 30, 1610.	Muniments, Series 1, Group 38, 01r	mun-01-038-01r.jp2	[]
879	[]	39. Bond from the same parties to Edward alleyn to observe covenants as above, May 30, 1610.	Muniments, Series 1, Group 39, 01r	mun-01-039-01r.jp2	[]
880	[]	40. Bond from Edward Alleyn and Thomas Towne to Edmond Gill, June 2, 1610.	Muniments, Series 1, Group 40, 01r	mun-01-040-01r.jp2	[]
881	[]	41. Bond from Edward Alleyn to Edmond Gill, Sept. 29, 1610.	Muniments, Series 1, Group 41, 01r	mun-01-041-01r.jp2	[]
882	[]	42. Release from Daniel Gill and others as above 38 to Edward Alleyn of all rents and arrears, June 4, 1610.	Muniments, Series 1, Group 42, 01r	mun-01-042-01r.jp2	[]
883	[]	43. Fine by the same to Edward Alleyn of messuages and gardens, 1610.	Muniments, Series 1, Group 43, 01r	mun-01-043-01r.jp2	[]
884	[]	44. Fine by the same to Edward Alleyn of messuages and gardens, 1610.	Muniments, Series 1, Group 44, 01r	mun-01-044-01r.jp2	[]
885	[]	45. Release by Daniel and Katherine Gill and others as above 38, Oct. 20, 1610.	Muniments, Series 1, Group 45, 01r	mun-01-045-01r.jp2	[]
886	[]	46. Warrant from Philip Henslowe and Edward Alleyn, joint Masters of the Royal Game of Bears, Bulls and Mastiff Dogs, to commission Thomas Radford as their deputy, May 11, 1611.	Muniments, Series 1, Group 46, 01r	mun-01-046-01r.jp2	[]
887	[]	47. Bond from John Townsend, William Barksted, Joseph Taylor and other actors to Philip Henslowe to perform 'certen articles', Aug. 29, 1611.	Muniments, Series 1, Group 47, 01r	mun-01-047-01r.jp2	[]
888	[]	48. Lease from Edward Alleyn to Robert Johnson of a tenement in Golding Lane, Jan. 6, 1612/13.	Muniments, Series 1, Group 48, 01r	mun-01-048-01r.jp2	[]
889	[]	49. Contract of Gilbert Katherens, carpenter, with Philip Henslowe and Jacob Meade to pull down the old Bear Garden and to build another playhouse [the Hope], to be used for playing and for blood sports, to be the same dimensions, as given, as the Swan Theatre, Aug. 29, 1613.	Muniments, Series 1, Group 49, 01r	mun-01-049-01r.jp2	[]
890	[]	50. Bond from Gilbert Katherens to Philip Henslowe and Jacob Meade to observe the covenants in the preceding contract, Aug. 29, 1613.	Muniments, Series 1, Group 50, 01r	mun-01-050-01r.jp2	[]
891	[]	51. Articles between Gilbert Katherens and John Browne whereby the latter covenants to make the brickwork of a playhouse [the Hope] in the same dimensions of the Swan, and to be built upon the place of the Bear Garden, Sept. 8, 1613.	Muniments, Series 1, Group 51, 01r	mun-01-051-01r.jp2	[]
892	[]	52. Articles on the part and behalf of Philip Henslowe and Jacob Meade relating to their acting company, represented by Nathan Field, c. 1613.	Muniments, Series 1, Group 52, 01r	mun-01-052-01r.jp2	[]
893	[]	53. Assignment by Agnes, widow of Philip Henslowe to Gregory Franklin and John Hammond of leases from Edward Alleyn to Philip Henslowe of a moiety of the Fortune Theatre for twenty-four years, and of messuages in the Clink from others, Feb. 15, 1616.	Muniments, Series 1, Group 53, 01r	mun-01-053-01r.jp2	[]
894	[]	54. Lease from Edward Alleyn to Henry Smith of a messuage in Golding Lane, April 24, 1618, with note of surrender dated Aug. 4, 1621 on verso.	Muniments, Series 1, Group 54, 01r	mun-01-054-01r.jp2	[]
895	[]	55. Lease from Edward Alleyn to Richard Hudson of a messauge in Golding Lane 'to have a dore way or passage towardes the playhows', July 1, 1618.	Muniments, Series 1, Group 55, 01r	mun-01-055-01r.jp2	[]
896	[]	56. Lease from Edward Alleyn of Dulwich to Edward Juby, William Bird, Frank Grace, Richard Gunnell, Charles Massey, Wiliam Stratford, William Cartwright, Richard Price, William Parre, and Richard Fowler of the Fortune Theatre, with terms listed, Oct. 31, 1618.	Muniments, Series 1, Group 56, 01r	mun-01-056-01r.jp2	[]
897	[]	57. Bond from the lessees as above to Edward Alleyn to observe convenants, Oct. 31, 1618.	Muniments, Series 1, Group 57, 01r	mun-01-057-01r.jp2	[]
898	[]	58. Lease from Edward Alleyn of Dulwich to Charles Massey of one twenty-fourth part of the ground and tenements where the Fortune Theatre stood, to be used for the construction of a new [Fortune] theatre, May 20, 1622.	Muniments, Series 1, Group 58, 01r	mun-01-058-01r.jp2	[]
899	[]	59. Lease from Edward Alleyn to Richard Price of one twenty-fourth part of the same ground and tenements, May 20, 1622.	Muniments, Series 1, Group 59, 01r	mun-01-059-01r.jp2	[]
958	[]	Page 018v	MSS 8, 018v	08-018v.jp2	[]
959	[]	Page 019r	MSS 8, 019r	08-019r.jp2	[]
960	[]	Page 019v	MSS 8, 019v	08-019v.jp2	[]
961	[]	Page 020r	MSS 8, 020r	08-020r.jp2	[]
962	[]	Page 020v	MSS 8, 020v	08-020v.jp2	[]
963	[]	Page 021r	MSS 8, 021r	08-021r.jp2	[]
964	[]	Page 021v	MSS 8, 021v	08-021v.jp2	[]
900	[]	60. Lease from Edward Alleyn to William Gwalter for a sixth part of the ground and tenements as above, May 20, 1622, with endorsement of the surrender of the lease, with further one-sixth part to William Gwalter and another lease to Robert Leigh, June 19, 1623.	Muniments, Series 1, Group 60, 01r	mun-01-060-01r.jp2	[]
901	[]	61. Lease from Edward Alleyn to William Gwalter for a sixth part of the ground and tenements as above, May 20, 1622, with endorsement of the surrender of the lease, with further one sixth part to William Gwalter and another lease to Robert Leigh, June 19, 1623.	Muniments, Series 1, Group 61, 01r	mun-01-061-01r.jp2	[]
902	[]	62. Lease from Edward Alleyn to Anthony Jarman for a twelfth part of the premises as above, paying towards the erection of a new playhouse, May 20, 1622.	Muniments, Series 1, Group 62, 01r	mun-01-062-01r.jp2	[]
903	[]	63. Lease from Edward Alleyn to Margaret Grey of a twelfth part of the new [Fortune] Theatre, with a taphouse belonging to the same and five other tenements, Jan. 29, 1623/4.	Muniments, Series 1, Group 63, 01r	mun-01-063-01r.jp2	[]
904	[]	64. Lease from Edward Alleyn to George Bosgrave of half a twelfth part of the premises as above, Feb. 20, 1623/4.	Muniments, Series 1, Group 64, 01r	mun-01-064-01r.jp2	[]
905	[]	65. Extract from the roll of the Court Baron of the Mayor and citizens of London, lords of the manor of Finsbury, of the evidence of Thomas and Matthias Alleyn of Dulwich College concerning the lands and tenements of the Foturne Theatre bequeathed by Edward Alleyn to the College, Oct. 6, 1629.	Muniments, Series 1, Group 65, 01r	mun-01-065-01r.jp2	[]
906	[]	66. Bill in Chancery of Thomas (or Tobias) Lisle against Dulwich College relating to the rents for the lands and tenements of the Foturne Theatre, Nov. 26, 1646.	Muniments, Series 1, Group 66, 01r	mun-01-066-01r.jp2	[]
907	[]	67. Bill in Chancery of Dulwich College against Tobias Lisle and Thomas Grymes, relating to the above, 1647, 1649.	Muniments, Series 1, Group 67, 01r	mun-01-067-01r.jp2	[]
908	[]	68. Bill in Chancery of Dulwich College against Tobias Lisle and Thomas Grymes, relating to the above, 1647, 1649.	Muniments, Series 1, Group 68, 01r	mun-01-068-01r.jp2	[]
909	[]	69. Bill in Chancery of Dulwich College against Tobias Lisle and Thomas Grymes, relating to the above, 1647, 1649.	Muniments, Series 1, Group 69, 01r	mun-01-069-01r.jp2	[]
910	[]	70. Answer of Thomas Alleyn, Master of Dulwich College to the complaint of Arthur Minshawe and others relating to Tobias Lisle, Nov. 1649.	Muniments, Series 1, Group 70, 01r	mun-01-070-01r.jp2	[]
911	[]	71. Bill in Chancery of William Beaven against Dulwich College as above, Nov. 1661.	Muniments, Series 1, Group 71, 01r	mun-01-071-01r.jp2	[]
912	[]	72. Draft of a lease from Dulwich College to William Beaven of nineteen messuages built on the ground of the demolished Fortune Theatre, March 1661/2.	Muniments, Series 1, Group 72, 01r	mun-01-072-01r.jp2	[]
914	[]	331. Letters Patent of King Henry VIII granting to Thomas Calton the manor and lands of Dulwich, Oct. 11, 1544.	Muniments, Series 3, Group 331, 01r	mun-03-331-01r.jp2	[]
915	[]	383. Letters Patent of Queen Elizabeth I granting to Francis Calton the livery of the manor and lands of Dulwich, Feb. 1, 1587.	Muniments, Series 3, Group 383, 01r	mun-03-383-01r.jp2	[]
916	[]	558. Indenture of contract between Edward Alleyn and John Benson, bricklayer, for the construction of Dulwich College, Chapel and twelve almshouses, May 17, 1613, with acquainttances from June 19, 1612-April 22, 1614 on the verso.	Muniments, Series 3, Group 558, 01r	mun-03-558-01r.jp2	[]
917	[]	581. Letters Patent of King James I to Edward Alleyn for the foundation of Dulwich College, June 21, 1619, detailing the purchase of the lands and property.	Muniments, Series 3, Group 581, 01r	mun-03-581-01r.jp2	[]
918	[]	584. Deed of Foundation by Edward Alleyn by virtue of the Letters Patent as 581 above, of a college to be called and named 'The College of God's Gift in Dulwich in the County of Surrey', and to consist of one master, one warden, four fellows, six poor brethren, six poor sisters and twelve poor scholars, Sept. 1619; signed by Francis Bacon, Thomas Howard, Edward Cecil, Inigo Jones and others. See Digital Essays.	Muniments, Series 3, Group 584, 01r	mun-03-584-01r.jp2	[]
919	[]	586. Covenant by Edward Alleyn to levy a fine to William Allen and William Austen for the use of lands and messuages in Lambeth and Camberwell by himself and afterward to Dulwich College forever, April 24, 1620.	Muniments, Series 3, Group 586, 01r	mun-03-586-01r.jp2	[]
920	[]	587. Covenant by Edward Alleyn to levy a fine to William Allen and William Austen for the use of lands and messuages in Lambeth and Camberwell by himself and and afterward to Dulwich College forever, April 24, 1620.	Muniments, Series 3, Group 587, 01r	mun-03-587-01r.jp2	[]
921	[]	594. The Original Book of the Statutes and Ordinances of the College of God's Gift in Dulwich, Sept. 29, 1626, with an additional clause dated Nov. 20, 1626.	Muniments, Series 3, Group 594, 01r	mun-03-594-01r.jp2	[]
923	[]	Page 001r	MSS 8, 001r	08-001r.jp2	[]
924	[]	Page 001v	MSS 8, 001v	08-001v.jp2	[]
925	[]	Page 002r	MSS 8, 002r	08-002r.jp2	[]
926	[]	Page 002v	MSS 8, 002v	08-002v.jp2	[]
927	[]	Page 003r	MSS 8, 003r	08-003r.jp2	[]
928	[]	Page 003v	MSS 8, 003v	08-003v.jp2	[]
929	[]	Page 004r	MSS 8, 004r	08-004r.jp2	[]
930	[]	Page 004v	MSS 8, 004v	08-004v.jp2	[]
931	[]	Page 005r	MSS 8, 005r	08-005r.jp2	[]
932	[]	Page 005v	MSS 8, 005v	08-005v.jp2	[]
933	[]	Page 006r	MSS 8, 006r	08-006r.jp2	[]
934	[]	Page 006v	MSS 8, 006v	08-006v.jp2	[]
935	[]	Page 007r	MSS 8, 007r	08-007r.jp2	[]
936	[]	Page 007v	MSS 8, 007v	08-007v.jp2	[]
937	[]	Page 008r	MSS 8, 008r	08-008r.jp2	[]
938	[]	Page 008v	MSS 8, 008v	08-008v.jp2	[]
939	[]	Page 009r	MSS 8, 009r	08-009r.jp2	[]
940	[]	Page 009v	MSS 8, 009v	08-009v.jp2	[]
941	[]	Page 010r	MSS 8, 010r	08-010r.jp2	[]
942	[]	Page 010v	MSS 8, 010v	08-010v.jp2	[]
943	[]	Page 011r	MSS 8, 011r	08-011r.jp2	[]
944	[]	Page 011v	MSS 8, 011v	08-011v.jp2	[]
945	[]	Page 012r	MSS 8, 012r	08-012r.jp2	[]
946	[]	Page 012v	MSS 8, 012v	08-012v.jp2	[]
947	[]	Page 013r	MSS 8, 013r	08-013r.jp2	[]
948	[]	Page 013v	MSS 8, 013v	08-013v.jp2	[]
970	[]	Page 024v	MSS 8, 024v	08-024v.jp2	[]
971	[]	Page 025r	MSS 8, 025r	08-025r.jp2	[]
972	[]	Page 025v	MSS 8, 025v	08-025v.jp2	[]
973	[]	Page 026r	MSS 8, 026r	08-026r.jp2	[]
974	[]	Page 026v	MSS 8, 026v	08-026v.jp2	[]
975	[]	Page 027r	MSS 8, 027r	08-027r.jp2	[]
976	[]	Page 027v	MSS 8, 027v	08-027v.jp2	[]
977	[]	Page 028r	MSS 8, 028r	08-028r.jp2	[]
978	[]	Page 028v	MSS 8, 028v	08-028v.jp2	[]
979	[]	Page 029r	MSS 8, 029r	08-029r.jp2	[]
980	[]	Page 029v	MSS 8, 029v	08-029v.jp2	[]
981	[]	Page 030r	MSS 8, 030r	08-030r.jp2	[]
982	[]	Page 030v	MSS 8, 030v	08-030v.jp2	[]
983	[]	Page 031r	MSS 8, 031r	08-031r.jp2	[]
984	[]	Page 031v	MSS 8, 031v	08-031v.jp2	[]
985	[]	Page 032r	MSS 8, 032r	08-032r.jp2	[]
986	[]	Page 032v	MSS 8, 032v	08-032v.jp2	[]
987	[]	Page 033r	MSS 8, 033r	08-033r.jp2	[]
988	[]	Page 033v	MSS 8, 033v	08-033v.jp2	[]
989	[]	Page 034r	MSS 8, 034r	08-034r.jp2	[]
990	[]	Page 034v	MSS 8, 034v	08-034v.jp2	[]
991	[]	Page 035r	MSS 8, 035r	08-035r.jp2	[]
992	[]	Page 035v	MSS 8, 035v	08-035v.jp2	[]
993	[]	Page 036r	MSS 8, 036r	08-036r.jp2	[]
994	[]	Page 036v	MSS 8, 036v	08-036v.jp2	[]
995	[]	Page 037r	MSS 8, 037r	08-037r.jp2	[]
996	[]	Page 037v	MSS 8, 037v	08-037v.jp2	[]
997	[]	Page 038r	MSS 8, 038r	08-038r.jp2	[]
998	[]	Page 038v	MSS 8, 038v	08-038v.jp2	[]
999	[]	Page 039r	MSS 8, 039r	08-039r.jp2	[]
1000	[]	Page 039v	MSS 8, 039v	08-039v.jp2	[]
1001	[]	Page 040r	MSS 8, 040r	08-040r.jp2	[]
1002	[]	Page 040v	MSS 8, 040v	08-040v.jp2	[]
1003	[]	Page 041r	MSS 8, 041r	08-041r.jp2	[]
1004	[]	Page 041v	MSS 8, 041v	08-041v.jp2	[]
1005	[]	Page 042r	MSS 8, 042r	08-042r.jp2	[]
1006	[]	Page 042v	MSS 8, 042v	08-042v.jp2	[]
1007	[]	Page 043r	MSS 8, 043r	08-043r.jp2	[]
1008	[]	Page 043v	MSS 8, 043v	08-043v.jp2	[]
1009	[]	Page 044r	MSS 8, 044r	08-044r.jp2	[]
1010	[]	Page 044v	MSS 8, 044v	08-044v.jp2	[]
1011	[]	Page 045r	MSS 8, 045r	08-045r.jp2	[]
1012	[]	Page 045v	MSS 8, 045v	08-045v.jp2	[]
1013	[]	Page 046r	MSS 8, 046r	08-046r.jp2	[]
1014	[]	Page 046v	MSS 8, 046v	08-046v.jp2	[]
1015	[]	Page 047r	MSS 8, 047r	08-047r.jp2	[]
1016	[]	Page 047v	MSS 8, 047v	08-047v.jp2	[]
1017	[]	Page 048r	MSS 8, 048r	08-048r.jp2	[]
1018	[]	Page 048v	MSS 8, 048v	08-048v.jp2	[]
1019	[]	Page 049r	MSS 8, 049r	08-049r.jp2	[]
1020	[]	Page 049v	MSS 8, 049v	08-049v.jp2	[]
1021	[]	Page 050r	MSS 8, 050r	08-050r.jp2	[]
1022	[]	Page 050v	MSS 8, 050v	08-050v.jp2	[]
1023	[]	Page 051r	MSS 8, 051r	08-051r.jp2	[]
1024	[]	Page 051v	MSS 8, 051v	08-051v.jp2	[]
1025	[]	Page 052r	MSS 8, 052r	08-052r.jp2	[]
1026	[]	Page 052v	MSS 8, 052v	08-052v.jp2	[]
1027	[]	Page 053r	MSS 8, 053r	08-053r.jp2	[]
1028	[]	Page 053v	MSS 8, 053v	08-053v.jp2	[]
1029	[]	Page 054r	MSS 8, 054r	08-054r.jp2	[]
1030	[]	Page 054v	MSS 8, 054v	08-054v.jp2	[]
1031	[]	Page 055r	MSS 8, 055r	08-055r.jp2	[]
1032	[]	Page 055v	MSS 8, 055v	08-055v.jp2	[]
1033	[]	Page 056r	MSS 8, 056r	08-056r.jp2	[]
1034	[]	Page 056v	MSS 8, 056v	08-056v.jp2	[]
1035	[]	Page 057r	MSS 8, 057r	08-057r.jp2	[]
1036	[]	Page 057v	MSS 8, 057v	08-057v.jp2	[]
1037	[]	Page 058r	MSS 8, 058r	08-058r.jp2	[]
1038	[]	Page 058v	MSS 8, 058v	08-058v.jp2	[]
1039	[]	Page 059r	MSS 8, 059r	08-059r.jp2	[]
1040	[]	Page 059v	MSS 8, 059v	08-059v.jp2	[]
1041	[]	Page 060r	MSS 8, 060r	08-060r.jp2	[]
1042	[]	Page 060v	MSS 8, 060v	08-060v.jp2	[]
1043	[]	Page 061r	MSS 8, 061r	08-061r.jp2	[]
1044	[]	Page 061v	MSS 8, 061v	08-061v.jp2	[]
1045	[]	Page 062r	MSS 8, 062r	08-062r.jp2	[]
1046	[]	Page 062v	MSS 8, 062v	08-062v.jp2	[]
1048	[]	Page 001r	MSS 9, 001r	09-001r.jp2	[]
1049	[]	Page 001v	MSS 9, 001v	09-001v.jp2	[]
1050	[]	Page 002r	MSS 9, 002r	09-002r.jp2	[]
1051	[]	Page 002v	MSS 9, 002v	09-002v.jp2	[]
1052	[]	Page 003r	MSS 9, 003r	09-003r.jp2	[]
1053	[]	Page 003v	MSS 9, 003v	09-003v.jp2	[]
1054	[]	Page 004r	MSS 9, 004r	09-004r.jp2	[]
1055	[]	Page 004v	MSS 9, 004v	09-004v.jp2	[]
1056	[]	Page 005r	MSS 9, 005r	09-005r.jp2	[]
1057	[]	Page 005v	MSS 9, 005v	09-005v.jp2	[]
1058	[]	Page 006r	MSS 9, 006r	09-006r.jp2	[]
1059	[]	Page 006v	MSS 9, 006v	09-006v.jp2	[]
1060	[]	Page 007r	MSS 9, 007r	09-007r.jp2	[]
1061	[]	Page 007v	MSS 9, 007v	09-007v.jp2	[]
1062	[]	Page 008r	MSS 9, 008r	09-008r.jp2	[]
1063	[]	Page 008v	MSS 9, 008v	09-008v.jp2	[]
1064	[]	Page 009r	MSS 9, 009r	09-009r.jp2	[]
1065	[]	Page 009v	MSS 9, 009v	09-009v.jp2	[]
1066	[]	Page 010r	MSS 9, 010r	09-010r.jp2	[]
1067	[]	Page 010v	MSS 9, 010v	09-010v.jp2	[]
1068	[]	Page 011r	MSS 9, 011r	09-011r.jp2	[]
1069	[]	Page 011v	MSS 9, 011v	09-011v.jp2	[]
1070	[]	Page 012r	MSS 9, 012r	09-012r.jp2	[]
1071	[]	Page 012v	MSS 9, 012v	09-012v.jp2	[]
1072	[]	Page 013r	MSS 9, 013r	09-013r.jp2	[]
1073	[]	Page 013v	MSS 9, 013v	09-013v.jp2	[]
1074	[]	Page 014r	MSS 9, 014r	09-014r.jp2	[]
1075	[]	Page 014v	MSS 9, 014v	09-014v.jp2	[]
1076	[]	Page 015r	MSS 9, 015r	09-015r.jp2	[]
1077	[]	Page 015v	MSS 9, 015v	09-015v.jp2	[]
1078	[]	Page 016r	MSS 9, 016r	09-016r.jp2	[]
1079	[]	Page 016v	MSS 9, 016v	09-016v.jp2	[]
1080	[]	Page 017r	MSS 9, 017r	09-017r.jp2	[]
1081	[]	Page 017v	MSS 9, 017v	09-017v.jp2	[]
1082	[]	Page 018r	MSS 9, 018r	09-018r.jp2	[]
1083	[]	Page 018v	MSS 9, 018v	09-018v.jp2	[]
1084	[]	Page 019r	MSS 9, 019r	09-019r.jp2	[]
1085	[]	Page 019v	MSS 9, 019v	09-019v.jp2	[]
1086	[]	Page 020r	MSS 9, 020r	09-020r.jp2	[]
1087	[]	Page 020v	MSS 9, 020v	09-020v.jp2	[]
1088	[]	Page 021r	MSS 9, 021r	09-021r.jp2	[]
1089	[]	Page 021v	MSS 9, 021v	09-021v.jp2	[]
1090	[]	Page 022r	MSS 9, 022r	09-022r.jp2	[]
1091	[]	Page 022v	MSS 9, 022v	09-022v.jp2	[]
1092	[]	Page 023r	MSS 9, 023r	09-023r.jp2	[]
1093	[]	Page 023v	MSS 9, 023v	09-023v.jp2	[]
1094	[]	Page 024r	MSS 9, 024r	09-024r.jp2	[]
1095	[]	Page 024v	MSS 9, 024v	09-024v.jp2	[]
1096	[]	Page 025r	MSS 9, 025r	09-025r.jp2	[]
1097	[]	Page 025v	MSS 9, 025v	09-025v.jp2	[]
1098	[]	Page 026r	MSS 9, 026r	09-026r.jp2	[]
1099	[]	Page 026v	MSS 9, 026v	09-026v.jp2	[]
1100	[]	Page 027r	MSS 9, 027r	09-027r.jp2	[]
1101	[]	Page 027v	MSS 9, 027v	09-027v.jp2	[]
1102	[]	Page 028r	MSS 9, 028r	09-028r.jp2	[]
1103	[]	Page 028v	MSS 9, 028v	09-028v.jp2	[]
1104	[]	Page 029r	MSS 9, 029r	09-029r.jp2	[]
1105	[]	Page 029v	MSS 9, 029v	09-029v.jp2	[]
1106	[]	Page 030r	MSS 9, 030r	09-030r.jp2	[]
1107	[]	Page 030v	MSS 9, 030v	09-030v.jp2	[]
1108	[]	Page 031r	MSS 9, 031r	09-031r.jp2	[]
1109	[]	Page 031v	MSS 9, 031v	09-031v.jp2	[]
1110	[]	Page 032r	MSS 9, 032r	09-032r.jp2	[]
1111	[]	Page 032v	MSS 9, 032v	09-032v.jp2	[]
1112	[]	Page 033r	MSS 9, 033r	09-033r.jp2	[]
1113	[]	Page 033v	MSS 9, 033v	09-033v.jp2	[]
1114	[]	Page 034r	MSS 9, 034r	09-034r.jp2	[]
1115	[]	Page 034v	MSS 9, 034v	09-034v.jp2	[]
1116	[]	Page 035r	MSS 9, 035r	09-035r.jp2	[]
1117	[]	Page 035v	MSS 9, 035v	09-035v.jp2	[]
1118	[]	Page 036r	MSS 9, 036r	09-036r.jp2	[]
1119	[]	Page 036v	MSS 9, 036v	09-036v.jp2	[]
1120	[]	Page 037r	MSS 9, 037r	09-037r.jp2	[]
1121	[]	Page 037v	MSS 9, 037v	09-037v.jp2	[]
1122	[]	Page 038r	MSS 9, 038r	09-038r.jp2	[]
1123	[]	Page 038v	MSS 9, 038v	09-038v.jp2	[]
1124	[]	Page 039r	MSS 9, 039r	09-039r.jp2	[]
1125	[]	Page 039v	MSS 9, 039v	09-039v.jp2	[]
1126	[]	Page 040r	MSS 9, 040r	09-040r.jp2	[]
1127	[]	Page 040v	MSS 9, 040v	09-040v.jp2	[]
1128	[]	Page 041r	MSS 9, 041r	09-041r.jp2	[]
1129	[]	Page 041v	MSS 9, 041v	09-041v.jp2	[]
1130	[]	Page 042r	MSS 9, 042r	09-042r.jp2	[]
1131	[]	Page 042v	MSS 9, 042v	09-042v.jp2	[]
1132	[]	Page 043r	MSS 9, 043r	09-043r.jp2	[]
1133	[]	Page 043v	MSS 9, 043v	09-043v.jp2	[]
1134	[]	Page 044r	MSS 9, 044r	09-044r.jp2	[]
1135	[]	Page 044v	MSS 9, 044v	09-044v.jp2	[]
1136	[]	Page 045r	MSS 9, 045r	09-045r.jp2	[]
1137	[]	Page 045v	MSS 9, 045v	09-045v.jp2	[]
1138	[]	Page 046r	MSS 9, 046r	09-046r.jp2	[]
1139	[]	Page 046v	MSS 9, 046v	09-046v.jp2	[]
1140	[]	Page 047r	MSS 9, 047r	09-047r.jp2	[]
1141	[]	Page 047v	MSS 9, 047v	09-047v.jp2	[]
1142	[]	Page 048r	MSS 9, 048r	09-048r.jp2	[]
1143	[]	Page 048v	MSS 9, 048v	09-048v.jp2	[]
1144	[]	Page 049r	MSS 9, 049r	09-049r.jp2	[]
1145	[]	Page 049v	MSS 9, 049v	09-049v.jp2	[]
1146	[]	Page 050r	MSS 9, 050r	09-050r.jp2	[]
1147	[]	Page 050v	MSS 9, 050v	09-050v.jp2	[]
1148	[]	Page 051r	MSS 9, 051r	09-051r.jp2	[]
1149	[]	Page 051v	MSS 9, 051v	09-051v.jp2	[]
1150	[]	Page 052r	MSS 9, 052r	09-052r.jp2	[]
1151	[]	Page 052v	MSS 9, 052v	09-052v.jp2	[]
1152	[]	Page 053r	MSS 9, 053r	09-053r.jp2	[]
1153	[]	Page 053v	MSS 9, 053v	09-053v.jp2	[]
1154	[]	Page 054r	MSS 9, 054r	09-054r.jp2	[]
1155	[]	Page 054v	MSS 9, 054v	09-054v.jp2	[]
1156	[]	Page 055r	MSS 9, 055r	09-055r.jp2	[]
1157	[]	Page 055v	MSS 9, 055v	09-055v.jp2	[]
1158	[]	Page 056r	MSS 9, 056r	09-056r.jp2	[]
1159	[]	Page 056v	MSS 9, 056v	09-056v.jp2	[]
1160	[]	Page 057r	MSS 9, 057r	09-057r.jp2	[]
1161	[]	Page 057v	MSS 9, 057v	09-057v.jp2	[]
1162	[]	Page 058r	MSS 9, 058r	09-058r.jp2	[]
1163	[]	Page 058v	MSS 9, 058v	09-058v.jp2	[]
1164	[]	Page 059r	MSS 9, 059r	09-059r.jp2	[]
1165	[]	Page 059v	MSS 9, 059v	09-059v.jp2	[]
1166	[]	Page 060r	MSS 9, 060r	09-060r.jp2	[]
1167	[]	Page 060v	MSS 9, 060v	09-060v.jp2	[]
1168	[]	Page 061r	MSS 9, 061r	09-061r.jp2	[]
1169	[]	Page 061v	MSS 9, 061v	09-061v.jp2	[]
1170	[]	Page 062r	MSS 9, 062r	09-062r.jp2	[]
1171	[]	Page 062v	MSS 9, 062v	09-062v.jp2	[]
1173	[]	Page 01r	MSS 19, 01r	19-01r.jp2	[]
1174	[]	Page 01v	MSS 19, 01v	19-01v.jp2	[]
1175	[]	Page 02r	MSS 19, 02r	19-02r.jp2	[]
1176	[]	Page 02v	MSS 19, 02v	19-02v.jp2	[]
1177	[]	Page 03r	MSS 19, 03r	19-03r.jp2	[]
1178	[]	Page 03v	MSS 19, 03v	19-03v.jp2	[]
1180	[]	Page 00r	MSS 20, 00r	20-00r.jp2	[]
1181	[]	Page 00v	MSS 20, 00v	20-00v.jp2	[]
1182	[]	Page 01r	MSS 20, 01r	20-01r.jp2	[]
1183	[]	Page 01v	MSS 20, 01v	20-01v.jp2	[]
1184	[]	Page 02r	MSS 20, 02r	20-02r.jp2	[]
1185	[]	Page 02v	MSS 20, 02v	20-02v.jp2	[]
1186	[]	Page 03r	MSS 20, 03r	20-03r.jp2	[]
1187	[]	Page 03v	MSS 20, 03v	20-03v.jp2	[]
1188	[]	Page 04r	MSS 20, 04r	20-04r.jp2	[]
1189	[]	Page 04v	MSS 20, 04v	20-04v.jp2	[]
1190	[]	Page 05r	MSS 20, 05r	20-05r.jp2	[]
1191	[]	Page 05v	MSS 20, 05v	20-05v.jp2	[]
1192	[]	Page 06r	MSS 20, 06r	20-06r.jp2	[]
1193	[]	Page 06v	MSS 20, 06v	20-06v.jp2	[]
1194	[]	Page 07r	MSS 20, 07r	20-07r.jp2	[]
1195	[]	Page 07v	MSS 20, 07v	20-07v.jp2	[]
1196	[]	Page 08r	MSS 20, 08r	20-08r.jp2	[]
1197	[]	Page 08v	MSS 20, 08v	20-08v.jp2	[]
1198	[]	Page 09r	MSS 20, 09r	20-09r.jp2	[]
1199	[]	Page 09v	MSS 20, 09v	20-09v.jp2	[]
1200	[]	Page 10r	MSS 20, 10r	20-10r.jp2	[]
1201	[]	Page 10v	MSS 20, 10v	20-10v.jp2	[]
1202	[]	Page 11r	MSS 20, 11r	20-11r.jp2	[]
1203	[]	Page 11v	MSS 20, 11v	20-11v.jp2	[]
1204	[]	Page 12r	MSS 20, 12r	20-12r.jp2	[]
1205	[]	Page 12v	MSS 20, 12v	20-12v.jp2	[]
1206	[]	Page 13r	MSS 20, 13r	20-13r.jp2	[]
1207	[]	Page 13v	MSS 20, 13v	20-13v.jp2	[]
1208	[]	Page 14r	MSS 20, 14r	20-14r.jp2	[]
1209	[]	Page 14v	MSS 20, 14v	20-14v.jp2	[]
1210	[]	Page 15r	MSS 20, 15r	20-15r.jp2	[]
1211	[]	Page 15v	MSS 20, 15v	20-15v.jp2	[]
1212	[]	Page 16r	MSS 20, 16r	20-16r.jp2	[]
1213	[]	Page 16v	MSS 20, 16v	20-16v.jp2	[]
1214	[]	Page 17r	MSS 20, 17r	20-17r.jp2	[]
1215	[]	Page 17v	MSS 20, 17v	20-17v.jp2	[]
1216	[]	Page 18r	MSS 20, 18r	20-18r.jp2	[]
1217	[]	Page 18v	MSS 20, 18v	20-18v.jp2	[]
1218	[]	Page 19r	MSS 20, 19r	20-19r.jp2	[]
1219	[]	Page 19v	MSS 20, 19v	20-19v.jp2	[]
1220	[]	Page 20r	MSS 20, 20r	20-20r.jp2	[]
1221	[]	Page 20v	MSS 20, 20v	20-20v.jp2	[]
1222	[]	Page 21r	MSS 20, 21r	20-21r.jp2	[]
1223	[]	Page 21v	MSS 20, 21v	20-21v.jp2	[]
1224	[]	Page 22r	MSS 20, 22r	20-22r.jp2	[]
1225	[]	Page 22v	MSS 20, 22v	20-22v.jp2	[]
1226	[]	Page 23r	MSS 20, 23r	20-23r.jp2	[]
1227	[]	Page 23v	MSS 20, 23v	20-23v.jp2	[]
1228	[]	Page 24r	MSS 20, 24r	20-24r.jp2	[]
1229	[]	Page 24v	MSS 20, 24v	20-24v.jp2	[]
1230	[]	Page 25r	MSS 20, 25r	20-25r.jp2	[]
1231	[]	Page 25v	MSS 20, 25v	20-25v.jp2	[]
\.


--
-- Data for Name: cms_richtextpage; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.cms_richtextpage (page_ptr_id, body, subtitle) FROM stdin;
6	[{"id": "7974f092-00cb-41fa-aa1e-19303c2628f9", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057747607808\\">Project Director and Founder</h2>\\n                <p><strong>Grace Ioppolo</strong> is Professor of Shakespearean and Early Modern\\n                    Drama in the Department of English and American Literature at the University of\\n                    Reading. Her publications include <em>Dramatists and their Manuscripts in the\\n                        Age of Shakespeare, Jonson, Middleton and Heywood: Authorship, Authority and\\n                        the Playhouse</em> (2006) as well as <em>Revising Shakespeare</em>\\n                    (1991) and <em>Shakespeare Performed: Essays in Honor of R. A. Foakes</em>\\n                    (2000). She has produced critical editions of Shakespeare\\u2019s <em>King\\n                    Lear</em> and <em>Measure for Measure</em> and Middleton\\u2019s <em>Hengist, King of Kent</em> and has published numerous articles on\\n                    textual transmission and manuscript culture.</p>\\n                <p>With Peter Beal she has co-edited <em>Elizabeth I and the Culture of\\n                    Writing</em> (2007), a collection of essays on manuscripts written by, to, or\\n                    for Queen Elizabeth, and <em>English Manuscript Studies 1100-1700, 11:\\n                        Manuscripts and their Makers in the English Renaissance</em> (2002). She\\n                    is the General Editor of <em>The Complete Works of Thomas Heywood</em>, 10\\n                    volumes (forthcoming from Oxford University Press).</p>\\n                <p>She particularly welcomes students interested in post-graduate study of the\\n                    Henslowe-Alleyn archive in particular or in early modern theatre history,\\n                    manuscript study or archival research in general. She can be contacted at:\\n                    g.j.ioppolo@reading.ac.uk</p>\\n            \\n            \\n                <h2 id=\\"idm140057748586128\\">Project Photographer</h2>\\n                <p><strong>David Cooper</strong> graduated from Cambridge University with a PhD\\n                    in Organic Chemistry and did several years of research before becoming the\\n                    Librarian of Corpus Christi College in Oxford. During his long tenure there he\\n                    became interested in the development of modern techniques for the preservation\\n                    and handling of rare books and manuscripts.</p>\\n                <p>Eventually he was able to combine his professional concerns with his interest in\\n                    photography and set up and ran a project investigating methods for the\\n                    production of high-resolution images of fragile books and manuscripts. He was\\n                    instrumental in the design of specialist equipment for holding delicate books\\n                    during imaging and the establishment of procedures. At the conclusion of this\\n                    project he set up Digital Lightforms Ltd, which is dedicated to the production\\n                    of images of books and manuscripts within archives that do not have their own\\n                    facilities. He has worked in locations as diverse as St. Paul\\u2019s Cathedral and\\n                    the National Archives of Portugal in Lisbon as well as Dulwich College and has\\n                    also been a consultant in the setting up of imaging facilities in the Monastery\\n                    of St. Catherine on Mount Sinai. He can be contacted at:\\n                    david.cooper@digibus.demon.co.uk</p>\\n            \\n            \\n                <h2 id=\\"idm140057749093136\\">Technical Director</h2>\\n                <p><strong>Paul Vetch</strong> was a Research Fellow at the Department of Digital Humanities (DDH) at King\\u2019s College London, where he was involved in development\\n                    work, project management, technical infrastructure, and the teaching programme.\\n                    His primary responsibilities and research interests lay in interface and\\n                    interaction design, web-based annotation, and mechanisms for publishing on the\\n                    web. He spent several years running his own business designing websites built\\n                    around Content Management Systems (CMS) and has an advanced degree in medieval\\n                    English literature.</p>\\n                <p>Paul\\u2019s primary responsibility at DDH was in overseeing interface design and\\n                    addressing usability and accessibility requirements for over 50 web (and DVD/CD)\\n                    based digital humanities projects. He also managed DDH's considerable server\\n                    fabric, which provided safe long-term storage of several terabytes of archive\\n                    quality image and audio data in addition to numerous web-based research outputs.\\n                    Together with Paul Spence, Paul was responsible for the ongoing development of\\n                    the xMod XML publishing tool which was used to generate websites for the majority\\n                    of DDH's web-based research projects, including this one.</p>\\n                <p>Paul has spoken and written extensively on the application of Human-Computer\\n                    Interface theory and praxis to the particular challenges of the digital\\n                    humanities. In his research, he has focused on issues of usability and\\n                    accessibility (both practically and strategically) in Digital Humanities\\n                    projects, as well as user interaction, and rethinking the concept of the digital\\n                    edition to provide more meaningful interaction with users, primarily through\\n                    web-based annotation. He has also worked on modes of web-based\\n                    interaction, assessing the potential for the application of Web 2.0 technology\\n                    and methodology, both to the Digital Humanities and to the cultural heritage\\n                    sector more generally.</p>\\n            \\n            \\n                <h2 id=\\"idm140057747652448\\"> Advisory Board Members</h2>\\n                <p><strong>Peter Beal</strong>, FBA, FSA, is a Senior Research Fellow at the\\n                    Institute of English Studies, University of London. He is also a consultant to\\n                    Sotheby\\u2019s, where he was formerly a Director and for twenty-five years English\\n                    Manuscript Expert. He was elected a Fellow of the British Academy in 1993 and\\n                    was J. P. R. Lyell Reader in Bibliography at Oxford, 1995-96. His major\\n                    publications in the field of early modern manuscripts include <em>Index of\\n                        English Literary Manuscripts, 1450-1700</em> (4 volumes, 1980-93), <em>In Praise of Scribes: Manuscripts and their Makers in Seventeenth Century\\n                        England</em> (1998) and <em>A Dictionary of English Manuscript\\n                        Terminology 1450-2000</em> (2008). He is co-founder and co-editor of the\\n                    annual journal <em> English Manuscript Studies 1100-1700</em>. He is\\n                    currently building an AHRC-funded database <em>Catalogue of English Literary\\n                        Manuscripts 1450-1700 (CELM)</em>, which will be freely available online.\\n                    He can be contacted at: peter.beal@sas.ac.uk</p>\\n                <p><strong>Julian Bowsher</strong> studied Roman archaeology at London\\n                    University and spent a number of years in the near east working on Roman sites\\n                    including a 2nd century AD theatre. Since joining the Museum of London\\n                    Archaeology Service in 1986, where he is now a Senior Archaeologist, he has\\n                    concentrated on the Tudor and Stuart period, much of it in connection with\\n                    excavations in Greenwich and with playhouses and theatres in London. In addition\\n                    to his extensive work in excavating the site of the original Rose Playhouse on\\n                    London's Southbank, Julian has acted as advisor on the excavations in London\\u2019s\\n                    Shoreditch of the remains of The Theatre (1576), one of the first purpose-built\\n                    theatres in early modern England. His publications on early modern theatres and\\n                    audiences include \\u2018Marlowe and the Rose\\u2019, in <em>Constructing Christopher\\n                        Marlowe</em>, ed. J. A. Downie and J. T. Parnell (2000); \\u2018Holywell Priory\\n                    and The Theatre in Shoreditch, London\\u2019, <em>Archaeologist</em>, Vol. 11\\n                    (2007); \\u2018Encounters between actors, audience and archaeologists at the Rose\\n                    theatre, 1587-1989\\u2019, in <em>Contemporary and Historical Archaeology in\\n                    Theory</em>, ed. L. McAtackney, M. Palus, and A. Piccini (2007); and \\u2018The\\n                    Rose and its stages\\u2019 in <em>Shakespeare Survey</em>, Volume 60 (2007). He\\n                    has also published extensively on the near east, classical sites, and\\n                    numismatics. He discusses his excavations at the Rose in his book <em>The\\n                        Rose and the Globe - playhouses of Shakespeare's Bankside, Southwark:\\n                        excavations 1988-1991</em>, co-authored with his colleague Pat Miller and\\n                    published in 2009 by English Heritage and the Museum of London. He can be\\n                    contacted at: JBowsher@museumoflondon.org.uk</p>\\n                <p><strong>S. P. Cerasano </strong>is the Edgar W. B. Fairchild Professor of\\n                    Literature at Colgate University in Hamilton, New York, USA. The author of\\n                    numerous publications on drama and theatre history, she has edited Shakespeare\\u2019s\\n                        <em>The Merchant of Venice</em> (Routledge) and co-edited three books\\n                    with Marion Wynne-Davies, including <em>Renaissance Drama by Women</em>\\n                    (Routledge). She is currently the editor of the annual journal <em>Medieval\\n                        and Renaissance Drama in England</em>. She has been working on the lives\\n                    and careers of Philip Henslowe and Edward Alleyn for over twenty years and is\\n                    currently writing a book tentatively entitled <em>Philip Henslowe:\\n                        Elizabethan Theatre, the Court Servant, and the Great Diary</em>. She can be contacted at: scerasano@colgate.edu</p>\\n                <p><strong>R. A. Foakes</strong> was Professor Emeritus of English at the\\n                    University of California, Los Angeles, and at the University of Kent,\\n                    Canterbury, where he founded the English Department and later served as Dean of\\n                    the Faculty of Humanities. One of the world\\u2019s leading early modern theatre\\n                    historians, his 1960 landmark edition, with R. T. Rickert, of <em>Henslowe\\u2019s\\n                        Diary</em> (Cambridge University Press, reprinted in 2002) was followed\\n                    in 1970 by his photo-facsimile of <em>The Henslowe Papers</em> (Scolar\\n                    Press). He edited numerous plays by Shakespeare (for Arden, Cambridge, and\\n                    Penguin, among other presses) and other early modern dramatists, including\\n                    Tourneur and Fletcher, and in 1960 he prepared the Malone Society Reprints\\n                    edition of <em>The Telltale</em> from the manuscript at Dulwich College.\\n                    He was the author of numerous books, including <em>Shakespeare and\\n                    Violence</em> (2003), <em>Hamlet versus Lear: Cultural Politics and\\n                        Shakespeare\\u2019s Art</em> (1993), and <em>Shakespeare: The Dark Comedies\\n                        to the Last Plays\\u2014From Satire to Celebration</em> (1971), as well as a\\n                    wide range of scholarly articles. He was also a distinguished scholar of English\\n                    Romantic writers, most notably S. T. Coleridge, whose <em>Lectures 1808-1819\\n                        On Literature</em> he reconstructed and edited in two volumes for Princeton\\n                    University Press in 1987.</p>\\n                <p><strong>John Lavagnino</strong> is Reader in Digital Humanities at King's\\n                    College London. He studied physics at Harvard University and American literature\\n                    at Brandeis University, where he wrote his PhD dissertation on Vladimir Nabokov.\\n                    He has worked in atmospheric science at the Smithsonian Astrophysical\\n                    Observatory and in digital publishing for numerous organizations. He was one of\\n                    the general editors of the Oxford University Press edition of <em>The\\n                        Collected Works of Thomas Middleton</em> (2007), and is currently one of\\n                    the collaborators working on the forthcoming online <em>Catalogue of English\\n                        Literary Manuscripts 1450-1700</em>. He can be contacted at:\\n                    John.Lavagnino@kcl.ac.uk</p>\\n                <p><strong>Calista M. Lucy</strong>, MCILIP, Keeper of the Archives at Dulwich\\n                    College, started her working life at the London Library, followed by 13 years as\\n                    Information Co-ordinator in various parts of the Esso/Exxon operation in the UK.\\n                    Since 2001 she has worked at Dulwich College (www.dulwich.org.uk). She became\\n                    Keeper of the Archives in 2006. She co-ordinates loans from the collection,\\n                    curates exhibitions and writes biographies of Old Alleynians for the College.\\n                    Her unpublished dissertation is on the influence of Shakespeare's writing on\\n                    book titles. She introduced the Fortune Contract at the Fortune Theatre\\n                    Symposium at Shakespeare's Globe in November 2006. For digital photographs of\\n                    any of the Henslowe-Alleyn papers and for permission to reproduce them, please\\n                    contact her directly at: archives@dulwich.org.uk</p>\\n                <p><strong>Jan Piggott</strong>, MA (Oxon.), Ph.D. (Calif.), FSA, has been\\n                    associated with Dulwich College since 1972 as Assistant Master in the English\\n                    Department, as Head of English for ten years, and until 2006 as Keeper of the\\n                    Archives. He is the author of <em>Turner\\u2019s Vignettes</em> (Tate Gallery,\\n                    1993), <em>Shackleton, the Antarctic and Endurance</em> (Dulwich College,\\n                    2000), <em>Palace of the People: The Crystal Palace at Sydenham\\n                    1854-1936</em> (Hurst, 2004), and he contributed to <em>Wodehouse Goes to\\n                        School</em> (Porpoise, 1997). He has also written pamphlets on art,\\n                    architecture and literature. His book <em>Dulwich College: a History,\\n                        1616\\u20132008</em> was published by the College in June 2008. At the College\\n                    he was the curator of a number of exhibits on such alumni as Ernest Shackleton,\\n                    the writers P. G. Wodehouse and Raymond Chandler, and the film director Michael\\n                    Powell. He can be contacted at: janpiggott@f2s.com</p>\\n                <p><strong>H.R. Woudhuysen</strong> is Professor of English at University\\n                    College London. He is one of the General Editors of the third series Arden\\n                    Shakespeare for which he has edited <em>Love's Labour's Lost</em> and,\\n                    with Katherine Duncan-Jones, <em>The Narrative Poems</em>. His book <em>Sir Philip Sidney and the Circulation of Manuscripts, 1558-1640</em> was\\n                    published in 1996. He is currently working with Peter Beal and John Lavagnino on\\n                    the AHRC-funded project, the online <em>Catalogue of English Literary\\n                        Manuscripts 1450-1700</em>. Some of his recent scholarly articles have\\n                    discussed early modern writing tables, the handwriting of Queen Elizabeth I, the\\n                    foundations of Shakespeare's text, and the production, distribution, and\\n                    reception during the twentieth century of British second-hand booksellers\\u2019\\n                    catalogues. He is also a regular contributor to the <em>Times Literary\\n                        Supplement</em>. At present, he is working with Michael Suarez, SJ, as\\n                    co-general editor of <em>The Oxford Companion to the Book</em>, due for\\n                    publication early in 2010; this volume will be a million words long and will\\n                    attempt to cover all aspects of the book from ancient to modern times throughout\\n                    the world. He can be contacted at h.woudhuysen@ucl.ac.uk</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	\N
7	[{"id": "7ac50c69-62d2-4546-bdba-892ef99b4edd", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n                <h2 id=\\"idm140057750179120\\">Copyrights, Reproductions, and Permissions</h2>\\n                <p>All material in this website and electronic archive is copyrighted and cannot be\\n                    downloaded, reproduced, copied, circulated or otherwise used without permission\\n                    and acknowledgement.</p>\\n                <p>The copyright of all manuscripts in the Henslowe-Alleyn Papers belongs to the\\n                    Governors of Dulwich College.</p>\\n                <p>The copyright of all the photographs of the manuscripts in this website and\\n                    archive belongs to Dr David Cooper, who allows the Keeper of Manuscripts at\\n                    Dulwich College to adminster these copyrights.</p>\\n                <p>The copyright of digital essays, prefatory and other material belongs to the\\n                    authors.</p>\\n                <p>The website and electronic archive are copyright of King\\u2019s College London\\u2019s\\n                    Centre for Computing in the Humanities.</p>\\n                <p>For digital photographs or reproductions of any of the manuscripts, and for\\n                    permission to reproduce them in any format, please contact Mrs Calista Lucy,\\n                    Keeper of Manuscripts, Dulwich College, Dulwich Common, London SE21 7LD, UK;\\n                    Email: archives@dulwich.org.uk</p>\\n                <p>For information about the digital essays and other prefatory material, as well as\\n                    any other general issues relating to the Project, please contact Prof. Grace\\n                    Ioppolo, Department of English and American Literature, University of Reading,\\n                    Whiteknights, PO Box 218, Reading RG6 6AA, UK; Email: g.j.ioppolo@reading.ac.uk</p>\\n                <p>For information on the digital photography of manuscripts or the services\\n                    provided by Digital Lightforms, please contact Dr David Cooper, Email:\\n                    david.cooper@digibus.demon.co.uk</p>\\n                <p>For information on the design and construction of the website and electronic\\n                    archive, please contact Mr Paul Vetch, Centre for Computing in the Humanities,\\n                    King\\u2019s College London, 2nd Floor 26-29 Drury Lane, London WC2B 5RL, UK; Email:\\n                    paul.vetch@kcl.ac.uk</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	\N
8	[{"id": "c98c81e5-1cff-4c83-9f6f-4ecc216aa988", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n                <h2 id=\\"idm140057747606240\\">Acknowledgments</h2>\\n                <p>The members of the Henslowe-Alleyn Digitisation Project wish to express their\\n                    grateful thanks for funding to: The Leverhulme Trust, The British Academy, The\\n                    Thriplow Charitable Trust, The Pilgrim Trust, the Henry E. Huntington Library,\\n                    the Folger Shakespeare Library, the British and American Bibliographical\\n                    Societies, King's College London, and The University of Reading.</p>\\n                <p>For general support and advice we wish to thank the Governors and the entire\\n                    staff of Dulwich College, especially Graham Able, the former Headmaster, and\\n                    Joseph Spence, the current headmaster, as well as staff at: the Museum of\\n                    London; King\\u2019s College London\\u2019s Centre for Computing in the Humanities; and the\\n                    University of Reading\\u2019s Department of English and American Literature and the\\n                    office of Research and Enterprise. Special thanks are due to: Nicholas Barker,\\n                    Susan Brock, Christopher Clarkson, Philip Edwards, Andrew Gurr, Robert Harding,\\n                    Christopher Hardman, Shaun Horan, Peter Jolly, John Jowett, Richard Kuhta,\\n                    Jerome McGann, Alistair Morey, Alan H. Nelson, Nicholas Pickwoad, Carole Robb,\\n                    Gerry Taylor, Sir Brian Vickers, Heather Wolfe, Laetitia Yeandle, and Georgianna\\n                    Ziegler. For her innumerable contributions to the Project we remain especially\\n                    grateful to Gill Cooper.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	\N
5	[{"id": "5971f92c-34c7-4d99-96c3-e6c97e8908b0", "type": "paragraph", "value": "<p></p><h2>The Henslowe-Alleyn Papers, Past, Present and Future</h2><p>For over two hundred and fifty years, most of the Henslowe-Alleyn papers remained unbound and stored in the chest in which they had lain since the founding of the College by Edward Alleyn in 1619. Many individual documents, both large and small, were left in their original condition: folded up into small packets (a form of storage which preceded the use of envelopes). The volume comprising Henslowe\\u2019s Diary began to be borrowed from the library during the 18th and 19th centuries by the scholars Edmond Malone, John Payne Collier, and J. O. Halliwell-Phillips, among others. In fact, during this time, some of its pages were removed or otherwise destroyed (fragments have since been sold or auctioned and are now at the British Library, Bodleian Library, Belvoir Castle, and the Folger Shakespeare Library). In the early 19th century, staff at Dulwich were successful in reclaiming the play <i>The Telltale</i> and the plot of <i>the Second Part of the Seven Deadly Sins</i> from an auction, but over the years many other items were dispersed (and have not yet been definitively identified), including about one hundred play manuscripts and a number of printed books bequeathed to the College in 1687 by the actor and bibliophile William Cartwright the younger.</p><p>In the 1870s, the Governors of Dulwich College asked George Warner, an expert at the British Museum, to catalogue the manuscripts. Warner spent many years assessing the contents of the archive as he found it, expertly opening, repairing and ordering the documents in the archive, finally having them bound into a set of 36 volumes which he named the \\u2018Alleyn Papers\\u2019. He left the muniments, some of which are extremely large in size, unbound. In 1881, he published <i>The Catalogue of the Manuscripts and Muniments of Alleyn\\u2019s College of God\\u2019s Gift at Dulwich</i> (London: Longmans, Green, and Co.). Further discoveries at the archive were listed by Francis Bickley in the Second Series of <i>The Catalogue of the Manuscripts and Muniments of Alleyn\\u2019s College of God\\u2019s Gift at Dulwich</i> (London: privately printed, 1903).</p><p>Half of these manuscript volumes and most of the muniments concern the private affairs and non-theatrical businesses of the Henslowe and Alleyn families, as well as the history of Dulwich College since its inception. It is the other half of these volumes, representing the theatrical affairs of Henslowe and Alleyn, that are the subject of this website and electronic archive.</p><p>Less than half of the theatrical items in the Henslowe-Alleyn Papers have ever been transcribed, and these transcriptions are largely available only in out-of-print editions. R. A. Foakes\\u2019s 1977 photographic facsimile edition of two volumes of manuscripts (<i>The Henslowe Papers</i>) had a limited printing and only covers 20% of the relevant archive. The 2002 reprinting of Foakes\\u2019s standard 1961 edition of <i>Henslowe&#x27;s Diary</i> (Cambridge University Press) has widely encouraged scholars to pursue other material in the Dulwich archive. The archive is of value also to Museum of London archaeologists, who are now using new technology, such as radar scanning, to examine the original sites in Southwark and Shoreditch of various early modern playhouses, including the Theatre, the Globe, and the Rose, and who are radically re-evaluating their data about the building of these playhouses. Although transcriptions of the over 2200 pages of manuscripts are not yet available in this electronic archive and website, the members of the Henslowe-Alleyn Digitisation Project hope that making the manuscripts themselves available as photographic images will encourage further study and use of this very rich resource not just by literary, theatrical and manuscripts scholars, economic, social and regional historians and archaeologists but students, actors, directors and other theatre personnel, as well as all members of the general population of readers who are interested in the greatest age of English professional drama and theatrical production.</p><p>This Project is designed for research purposes only. For reasons of copyright, images and content are not downloadable from the website or the electronic archive, nor can any material be used, copied, circulated or reproduced in any format without permission and acknowledgement. The copyright of all the manuscripts in the Alleyn Papers belongs to the Governors of Dulwich College. For digital photographs or reproductions of any of the manuscripts, for permissions to reproduce them in any format, or for more information about the manuscript photography, the website and electronic archive, please use see Copyrights, Reproductions and Permissions.</p><p>The Project has been graciously supported by grants from The Leverhulme Trust, The British Academy, The Thriplow Charitable Trust, The Pilgrim Trust, the Henry E. Huntington Library, the Folger Shakepeare Library, the British and American Bibliographical Societies, and The University of Reading, for which the members of the Project remain very grateful.</p>"}]	
9	[{"id": "244e5981-4727-4b03-9287-e01a868787cf", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n  \\n  \\n    \\n      \\n       <h2 id=\\"idm140057750168432\\">The Scope of the Henslowe-Alleyn Digitisation Project</h2>\\n        <p>The Project has digitised over 2200 pages of manuscripts in the Henslowe-Alleyn Papers\\n          that discuss or concern theatrical matters, inlcuding:</p>\\n        <div class=\\"unorderedList\\"><div class=\\"t01\\"><ul><li>MS No. 1: Henslowe' s and Alleyn\\u2019s Letters and Papers on English Drama and Stage and\\n            the Fortune Theatre, 1559-1662 (all documents).</li><li>MS No. 2: Henslowe\\u2019s and Alleyn\\u2019s Letters and Papers as Joint Masters of the Royal\\n            Game of Bears, Bulls and Mastiff Dogs, 1598-1626 (all documents).</li><li>MS No. 3: Henslowe's and Alleyn's General Correspondence, 1577-1626 (all documents).</li><li>MS No. 5: Legal and Miscellaneous Papers of Edward Alleyn and his Family, 1612-1626\\n            (relevant documents).</li><li>MS No. 7: Henslowe\\u2019s Diary and Account-Book, 1592-1609 (all pages).</li><li>MS No. 8: Alleyn\\u2019s Memorandum Book, 1594-1616 (all pages).</li><li>MS No. 9: Alleyn\\u2019s Diary and Account-Book, 1617-1622 (all pages).</li><li>MS No. 19: The \\u2018Plot\\u2019 (prompter\\u2019s outline) of the play <em>The Second Part of the\\n              Seven Deadly Sins</em>.</li><li>MS No. 20: The text of the play <em>The Telltale</em> (all).</li><li>Muniments, Section 1: The Theatre and Bear Garden documents, 1546-1662 (all\\n            documents).</li><li>Muniments, Section 3: Dulwich College Documents, 1323-1626 (relevant\\n          documents).</li></ul></div></div>\\n        <p>Each page of these manuscripts (about 2200 pages in total) has been photographed in high\\n          resolution and is viewable in full using the tool \\u2018Zoomify\\u2019, with the capacity for zooming\\n          in and out. For ease of use, this electronic archive follows the cataloguing system of\\n          George Warner and Francis Bickley, as published in <em>The Catalogue of the Manuscripts\\n            and Muniments of Alleyn\\u2019s College of God\\u2019s Gift at Dulwich</em>, series 1 and 2\\n          (1881, 1903).</p>\\n        <p>Included at this preliminary stage of the website are digital essays on some of the most\\n          notable documents, including the contracts for the Rose and Fortune playhouses, Alleyn\\u2019s\\n          \\u2018part\\u2019 for the leading role in Thomas Greene\\u2019s play <em>Orlando Furioso</em>, the\\n          \\u2018Plot\\u2019 of <em>The Second Part of the Seven Deadly Sins</em>, representative pages\\n          from Henslowe\\u2019s 'Diary' and Alleyn\\u2019s 'Diary' and from their correspondence with dramatists\\n          and actors, as well as the manuscript of <em>The Telltale</em> and Ben Jonson\\u2019s\\n          autograph fair copies of two poems. Also included is the Foundation Deed for Dulwich\\n          College, which carries the signature of Francis Bacon and Inigo Jones, among others. These\\n          digital essays offer expert commentary on the manuscripts\\u2019 contents and contexts.</p>\\n      \\n    \\n  \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	\N
10	[{"id": "d75244ef-a7a4-427b-86eb-2cde9c15188b", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n               \\n                <h2 id=\\"idm140057749938448\\">The Scope of the Henslowe-Alleyn Papers</h2>\\n                <p>To begin with, Henslowe\\u2019s and Alleyn\\u2019s papers provide extensive, detailed, dated, and\\n                    unique information about their daily, weekly or annual employment of dramatists and actors\\n                    such as Ben Jonson, Thomas Middleton, George Chapman, Thomas Heywood, Philip Massinger,\\n                    Thomas Dekker, Cyril Tourneur, John Webster, Richard Burbage, Will Kemp and Nathan Field,\\n                    among numerous others. Although William Shakespeare is not mentioned, he belonged to\\n                    acting companies for which Henslowe commissioned plays or recorded income from play\\n                    performances. As Henslowe\\u2019s famous \\u2018Diary\\u2019, or account book, makes clear, he contracted or\\n                    staged over 325 plays, the texts of most of which are now lost. The 'Diary' thus greatly\\n                    enlarges our knowledge of the canons of particular dramatists such as Jonson, Heywood,\\n                    Chettle and Dekker, and establishes which authors wrote plays alone and how and when they\\n                    collaborated with others. Henslowe also provides our most significant records for early\\n                    modern performance schedules in general and in particular, especially in recording exactly\\n                    when and where acting companies performed, and on which dates they moved to the provinces\\n                    due to the closure of London playhouses in times of plague.</p>\\n                <p>However, Henslowe's 'Diary' is not the only treasure among these papers. Letters patent,\\n                    contracts, deeds, indentures, leases, depositions, travel diaries, personal letters,\\n                    memoranda, briefly scribbled notes and a very wide variety of other manuscripts fully\\n                    document Henslowe's and Alleyn's costs and revenues, and those of sharers, for all aspects\\n                    of London theatre production and provincial touring, including the development, design,\\n                    dimensions, construction and maintenance of public playhouses and blood sports arenas. The\\n                    costs of staging plays are especially well documented, such as the commission and purchase\\n                    of costumes, properties and sets from a variety of named tradesmen, as well as the loss of\\n                    income during the plague by those whose businesses depended on playhouse attendance, such as\\n                    'watermen', who rowed passengers across the Thames.</p>\\n                <p>More broadly, these extraordinary manuscripts explore the intersection between theatre\\n                    and the political, cultural, religious and social spheres of early modern England.\\n                    Henslowe and Alleyn document their personal and professional dealings with the most\\n                    powerful figures from the 1570s to the 1620s, including monarchs: Queen Elizabeth I, King\\n                    James I, Queen Anne, Prince Henry, and King Charles I; chancellors, Privy Councillors and\\n                    courtiers: Sir Robert Cecil (Secretary of State), Sir Thomas Howard (Lord Treasurer),\\n                    Charles Howard (Lord High Admiral), and William Herbert (Earl of Pembroke), as well as Sir\\n                    Francis Bacon (Lord Chancellor), Sir Edward Coke, Sir Christopher Hatton, Ferdinando\\n                    Stanley (Lord Strange), Thomas Sackville (Lord Buckhurst), George Villiers (Duke of\\n                    Buckingham), and Henry Carey (the Lord Chamberlain and patron of Shakespeare\\u2019s acting\\n                    company). Also included are the Master of the Rolls, Sir Julius Caesar; church leaders\\n                    such as various Bishops of London, and John Donne, Dean of St Paul\\u2019s; foreign ambassadors,\\n                    with the notorious Count Gondomar among them; local London officials such as Lord Mayors\\n                    and Sheriffs; and the Masters of the Revels, Sir Edmund Tilney and George Buc. Other\\n                    notable figures whose autograph papers are in the archive include Stephen Gosson, the\\n                    polemicist and supposed scourge of the early modern stage.</p>\\n                <p>In addition to their theatrical enterprises, Henslowe and Alleyn were shrewd investors in\\n                    a number of businesses. As property developers, they purchased numerous parcels of land\\n                    and leased commercial buildings throughout London, particularly in Southwark, Bishopsgate,\\n                    Cripplegate, Shoreditch and Dulwich, as well as in York and Surrey. In fact, these records\\n                    provide a virtual map of several London neighbourhoods. Henslowe particularly excelled in\\n                    venture capitalism, earning income through banking, pawnbrokerage, mining iron ore,\\n                    forestry and the marketing of Ashdown forest timber. But not all this financial success\\n                    was for their own benefit: both men served as church-wardens and governors of various\\n                    parishes, schools, and other institutions, through which they offered charity to the poor,\\n                    sick or destitute, including colleagues imprisoned for debt. Alleyn's Diary especially\\n                    documents his generosity in founding the Chapel and College of God's Gift, designed to\\n                    educate twelve 'poor scholars', and the construction of adjacent almshouses for twelve\\n                    elderly men and women. Even the beginnings of the Dulwich Picture Gallery are chronicled\\n                    here.</p>\\n                <p>All the detailed financial records of these enterprises, which illuminate a wide range of\\n                    early modern economic, social, educational, regional, architectural and archaeological\\n                    history, are also housed at Dulwich College. In sum, this manuscript archive is a rich,\\n                    invaluable and unique part of English culture and heritage.</p>\\n            \\n            \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	\N
12	[{"id": "8424c1eb-604e-4b6e-b4f0-751abab9ed9b", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->                                                                                                                                                               \\n                                                                                                                                                                    \\n                                                                                                                                                                          \\n                                                                                                                                                                          \\n                                                                                                                                 \\n                                                                                                                                  \\n                                                                                                                                                                  \\n                <p><a href=\\"images/pubimg/full/.\\" class=\\"s03 x87\\"><span>\\u00a0</span><img src=\\"images/pubimg/thumb/thm_.\\" class=\\"s01\\" /></a>During the summer of 1605, at the age of 38, Edward Alleyn began to negotiate                       \\n                    with Sir Francis Calton, a member of a prominent City goldsmith\\u2019s family who was                                                                            \\n                    knighted in 1605 and became Lord Mayor in 1612, for the manor of Dulwich,                                                                                   \\n                    including \\u2018the wodes upon the waste\\u2019. Calton\\u2019s grandfather Thomas had been given                                                                            \\n                    a lease of the manor at Dulwich by Letters Patent from Henry VIII in 1544, and                                                                              \\n                    Sir Francis had inherited it at the age of ten in 1575. On October 3, Alleyn                                                                                \\n                    bought the manor for \\u00a35,000 (\\u00a3717,568 in today\\u2019s money), agreeing payments over                                                                             \\n                    seven years; on the back of the document Alleyn wrote notes of his financial                                                                                \\n                    resources, including his share of theatrical wardrobe, worth \\u00a3100. A Deed of                                                                                \\n                    Sale of 1606 includes Camberwell and its advowson (i.e., the right of choosing                                                                              \\n                    the vicar). In 1606 Alleyn is styled Lord of the Manor of Dulwich: he sold                                                                                  \\n                    another of his manors, at Kennington, to Calton for \\u00a32,000 in 1609.</p>                                                                                     \\n                <p>Alleyn bought further acres and messuages (i.e., houses) on the Dulwich estate                                                                               \\n                    from Sir Edmond Bowyer, a Dulwich resident who was sheriff of Surrey in 1600 and                                                                            \\n                    its Member of Parliament in 1603, and more from Calton in the years 1606-14.                                                                                \\n                    Eventually the estate amounted to 1,100 acres and extended, as it does today,                                                                               \\n                    from Denmark Hill to what are now the Crystal Palace grounds on Sydenham Hill,                                                                              \\n                    in between the \\u2018Lordships\\u2019 Lane (indicating the manorial boundary) on the east                                                                              \\n                    and Croxted (meaning \\u2018crooked street\\u2019) Lane on the west. Until about 1614 Alleyn                                                                            \\n                    is believed to have remained resident at Bankside, where letters are addressed                                                                              \\n                    to him, but after this date he began to be habitually styled as \\u2018Edward Alleyn                                                                              \\n                    of Dulwich, Esquire\\u2019.</p>                                                                                                                                   \\n                <p><a href=\\"images/pubimg/full/.\\" class=\\"s04 x87\\"><span>\\u00a0</span><img src=\\"images/pubimg/thumb/thm_.\\" class=\\"s02\\" /></a>Alleyn thought first of founding a Hospital (presumably on account of the                                                                                    \\n                    Plague), but next proposed to commemorate himself by a Foundation to be called                                                                              \\n                    \\u2018Alleyn\\u2019s College of God\\u2019s Gift\\u2019. This Foundation was to be in two parts: one                                                                               \\n                    charitable (or \\u2018eleemosynary\\u2019) and the other educational, on one site, and                                                                                  \\n                    sharing a chapel. The College was designed by Alleyn to benefit the four                                                                                    \\n                    parishes associated with his career: St Botolph\\u2019s, Bishopgate (where he grew up,                                                                            \\n                    and where he still owned property and had endowed almshouses); St Giles,                                                                                    \\n                    Cripplegate (where the Fortune theatre lay just outside the City), which from                                                                               \\n                    1773 by a boundary change became St Luke\\u2019s, Finsbury; St Saviour\\u2019s Southwark,                                                                               \\n                    near the Bankside (the site of his house, as well as the Rose, Bear Garden and                                                                              \\n                    Hope theatres); and St Giles, Camberwell (which included the manor of Dulwich).                                                                             \\n                    Three 'poor scholars' were to join the College from each parish, along with three                                                                           \\n                    'poor brethren' or 'sisters'. The Poor Scholars, aged between six and eighteen,                                                                             \\n                    were to be educated by resident Fellows.</p>                                                                                                                \\n                <p>From his letters to Calton, it is clear that Alleyn felt that he had been denied                                                                             \\n                    the opportunity of advanced education: a draft letter apologises that he cannot                                                                             \\n                    reply in the same style, saying that he writes himself \\u2018now with so much                                                                                    \\n                    scholarship for I Have none at all\\u2019. Alleyn could not have been blind to the                                                                                \\n                    effect of education and culture on his successful contemporaries: it is even                                                                                \\n                    possible that he was inspired by the glittering theatrical career of the                                                                                    \\n                    playwright Christopher Marlowe, the author of Alleyn\\u2019s most celebrated roles.                                                                               \\n                    Marlowe rose by the type of charitable patronage envisioned by Alleyn, which was                                                                            \\n                    not only intended to school his Poor Scholars but to send them to university                                                                                \\n                    with scholarships from the College.</p>                                                                                                                     \\n                <p>For the architecture and constitution of the College of God\\u2019s Gift, Alleyn                                                                                   \\n                    followed a Dutch prototype, that of the <em>Orphanoconium</em> and                                                                            \\n                        <em>Gerontocomium</em> at Amsterdam, a group of almshouses for                                                                            \\n                    young and old founded in 1530 and formed around a courtyard; he had a transcript                                                                            \\n                    of their statutes. Alleyn visited schools and hospitals in England to study                                                                                 \\n                    statutes and syllabuses, and also the catering arrangements. The course of                                                                                  \\n                    instruction was to follow that of the \\u2018free grammar Scholes of Westminster and                                                                              \\n                    St. Paules\\u2019. He investigated the syllabus at Dean Colet\\u2019s St Paul\\u2019s, which he                                                                               \\n                    visited twice. The speech days he wished to be modelled on those at Westminster                                                                             \\n                    and Merchant Taylors. Eventually it was decided that the boys were to study                                                                                 \\n                    \\u2018good and sound learning, writing, reading, grammar, musique and good manners\\u2019.                                                                             \\n                    This curriculum was to include \\u2018the rule and precepts of the grammar allowed in                                                                             \\n                    England\\u2019.</p>                                                                                                                                               \\n                <p>The College\\u2019s statutes, plate and ready money were to be kept in Alleyn\\u2019s massy                                                                              \\n                    oak \\u2018comon chest\\u2019, dated 1616, clamped with great iron bands and studded with                                                                               \\n                    great iron nails, in the treasure chamber above the \\u2018great porch\\u2019 in the tower.                                                                             \\n                    Restored in 1879, it stands today in the Lower Hall at the new College (built in                                                                            \\n                    1858 on a site a half mile from the original College). The elaborate statutes                                                                               \\n                    for the smooth running of the College included not only educational guidelines                                                                              \\n                    but the uniform for scholars\\u2014an uppercoat of \\u2018good cloth of sad color\\u2019 and black                                                                            \\n                    caps--as well as arrangements for laundry and the hiring of a ploughboy. The                                                                                \\n                    diet was to consist of loaves, boiled beef, cheese, fish, with apple and pear                                                                               \\n                    pies; all of this was to be increased on \\u2018gawdy daies\\u2019, and on three days a week                                                                            \\n                    the poor scholars were to have \\u2018beere without stint\\u2019. The pensioners had chores                                                                             \\n                    of sweeping and weeding, and one was to act as Matron for the schoolboys. There                                                                             \\n                    was a stocks as penalty for drunkenness, situated by the gates of the Old                                                                                   \\n                    College on the former village green. There was to be no gambling, and no weapons                                                                            \\n                    were to be kept in the College.</p>                                                                                                                         \\n                <p>In May 1613 Alleyn settled with John Benson of Westminster to construct \\u2018a                                                                                   \\n                    certaine building of brick\\u2019 for \\u2018a chappell, a scholehowse and twelve almshowes\\u2019                                                                            \\n                    (Muniment 3, <a href=\\"/images/Muniments-Series-1/Group-003/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/003/01r</a>). The chapel was built before the rest of the College as if for\\n                    its symbolism at the heart of the College, and was consecrated and dedicated on                                                                             \\n                    Alleyn\\u2019s fiftieth birthday, September 1, 1616. The Archbishop of Canterbury                                                                                 \\n                    performed the ceremony. Meanwhile, construction on the school and almshouses                                                                                \\n                    continued until 1619.</p>                                                                                                                                   \\n                <p>The Foundation was not formally constituted until June 21, 1619, when James I                                                                                \\n                    signed the Letters Patent. This document gave Alleyn authority to set his                                                                                   \\n                    statutes and established both branches of the charity as \\u2018one Body Corporate and                                                                            \\n                    Politiq and one perpetual Coyminallty to have perpetuall succession for ever to                                                                             \\n                    endure\\u2019. On September 13, 1619, the great actor read aloud his Deed of                                                                                      \\n                    Foundation (Muniment 584, <a href=\\"/images/Muniments-Series-3/Group-584/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-3/584/01r</a>) in the College Chapel and hosted a celebratory   \\n                    dinner for its signatories, including Sir Francis Bacon (the Chancellor, Lord                                                                               \\n                    Verulam), Thomas Howard (Earl of Arundel) and Inigo Jones (the King\\u2019s Surveyor                                                                              \\n                    and a distinguished architect, whose plans may have featured in the design for                                                                              \\n                    Dulwich College). Reconstituted by an Act of Parliament as a school mostly for                                                                              \\n                    fee-payers in 1856, and soon outdoing famous \\u2018Public Schools\\u2019, Dulwich College                                                                              \\n                    continues with Scholarships to commemorate the noble aspirations of its founder,                                                                            \\n                    Edward Alleyn.</p>                                                                                                                                          \\n                <p>For further discussion, see the digital essays \\u2018The Foundation Deed of Dulwich                                                                               \\n                    College\\u2019 and \\u2018The Diary of Edward Alleyn\\u2019 as well as the book <em>Dulwich                                                                                \\n                    College: a History, 1616-2008</em>, by Jan Piggott (London: Dulwich College, 2008).</p>                                                                  \\n                                                                                                                                                                                \\n                                                                                                                                                                          \\n                                                                                                                                                                         \\n                                                                                                                                                                         \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	\N
13	[{"id": "877526b9-ff81-4b73-9381-6379031044e2", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057748579776\\">Philip Henslowe (c. 1555-1616)</h2>\\n                <p>Theatrical financier and court servant, Philip Henslowe was the owner of the Rose\\n                    Playhouse (in use principally from 1587-1600) where Christopher Marlowe\\u2019s most\\n                    popular plays\\u2014including <em>Doctor Faustus</em> and <em>Tamburlaine the\\n                        Great</em>\\u2014were performed. In addition to the Rose, Henslowe was\\n                    part-owner of two later playhouses, the Fortune (1600) and the Hope (1613), the\\n                    latter of which doubled as a bear-baiting arena. As was typical of entrepreneurs\\n                    during the period, Henslowe\\u2019s business investments were diverse, ranging from\\n                    starch-making to rental properties; for a time he also ran a pawn-broking\\n                    business.</p>\\n                <p>As a theatrical financier Henslowe supported several acting companies, most\\n                    notably the Lord Admiral\\u2019s Men (later re-titled the Prince\\u2019s-Palsgrave\\u2019s Men).\\n                    Alongside his son-in-law, the actor Edward Alleyn, Henslowe supplied funding for\\n                    the purchase of play texts, costumes, and stage properties, and he also paid\\n                    licensing fees to the Master of the Revels. Consequently, Henslowe\\u2019s well-known\\n                    diary (Dulwich MSS 7)\\u2014an account book spanning the period from\\n                    1593-1603\\u2014provides an unprecedented glimpse into the theatrical world of its\\n                    time.</p>\\n                <p>Henslowe\\u2019s court positions\\u2014first as a Groom of the Chamber under Queen Elizabeth\\n                    I and later, as Sewer (i.e., steward) to King James I\\u2014brought him into the realm\\n                    of some prominent patrons of theatrical companies, including Charles Howard, the\\n                    Lord Admiral, and George Carey, the Lord Chamberlain and patron of Shakespeare\\u2019s\\n                    company. Doubtless, such contacts also helped the players\\u2019 cause as they\\n                    struggled to maintain a professional presence in London where they were under\\n                    constant censure from the local authorities. Moreover, Henslowe\\u2019s court contacts\\n                    were probably of use in 1604 when he and Alleyn finally acquired the patent for\\n                    the lucrative Mastership of the Bulls, Bears, and Mastiff Dogs, an office they\\n                    had been seeking for some time.</p>\\n                <p>Despite the fact that the acting companies occupying the Theatre and Globe\\n                    playhouses have traditionally been conceived of as competition for the Rose and\\n                    Fortune, Henslowe and Alleyn did not always conduct their theatrical affairs in\\n                    a realm separate from others. In fact, there is much evidence to suggest the\\n                    opposite\\u2014that Henslowe and Alleyn would certainly have been acquainted with\\n                    William Shakespeare and other members of the Lord Chamberlain\\u2019s-King\\u2019s Men. In\\n                    June, 1594, when the playhouses were closed owing to plague, the Lord\\n                    Chamberlain\\u2019s Men performed briefly along with the Admiral\\u2019s Men at a theatre in\\n                    Newington Butts, located just south of the City. Here, amongst the lists of\\n                    plays commonly associated with the Admiral\\u2019s Men, Henslowe recorded three\\n                    performances\\u2014of \\u201chamlet\\u201d (9 June), \\u201cthe tamynge of A shrowe\\u201d (11 June), and\\n                    \\u201c[Titus] andronicous\\u201d (12 June)\\u2014which bear a marked similarity to the titles of\\n                    Shakespeare\\u2019s plays. Also, Ben Jonson, whose plays are frequently associated\\n                    with the Chamberlain\\u2019s-King\\u2019s Men, was paid by Henslowe and the Admiral\\u2019s Men in\\n                    June 1602 to write a play called \\u201cRichard crockbacke\\u201d (based on the history of\\n                    Richard III). Not least of all, the Henslowe-Alleyn families and William\\n                    Shakespeare lived, for years, in Southwark where Henslowe and Alleyn were well\\n                    known, not only for their many business investments, but because both held local\\n                    offices as churchwardens in St. Saviour\\u2019s parish and governors of the parish\\n                    school.</p>\\n                <p>Philip Henslowe died in 1616, leaving a substantial estate to Agnes, his wife of\\n                    many years. When Agnes died, just a year later, the estate passed to Agnes\\u2019s\\n                    daughter Joan and her husband Edward Alleyn. Over time, it became absorbed into\\n                    the foundation Alleyn established in 1619\\u2014The College of God\\u2019s Gift at\\n                    Dulwich\\u2014now known as Dulwich College.</p>\\n            \\n            \\n                <h2 id=\\"idm140057747528128\\">Edward Alleyn (1566-1626)</h2>\\n\\n                <p><a href=\\"images/pubimg/full/.\\" class=\\"s03 x87\\"><span>\\u00a0</span><img src=\\"images/pubimg/thumb/thm_.\\" class=\\"s01\\" /></a>Edward Alleyn was an English actor, entrepreneur, and the founder of Dulwich\\n                    College. He was born in London, the son of a prominent innholder and porter to\\n                    the Queen. His older brother, who acted for a short time, was servant to Lord\\n                    Sheffield. By 1586 Edward was a player with the Earl of Worcester\\u2019s Men. Two\\n                    years later, Alleyn and his brother were joint-owners of playbooks and various\\n                    theatrical properties. By 1592, Alleyn was lauded as one of the greatest actors\\n                    of his time, his reputation being largely earned through his performances in\\n                    Christopher Marlowe\\u2019s plays. Alleyn certainly performed the roles of\\n                        <em>Tamburlaine</em> and <em>Doctor Faustus,</em> and he\\n                    probably also played Barabas in <em>The Jew of Malta</em>. Known primarily\\n                    as a tragedian, Alleyn\\u2019s style was powerful and charismatic.</p>\\n                <p>Alleyn\\u2019s financial investments were largely, but not wholly, in the area of the\\n                    entertainment business. Together with his business partner and father-in-law\\n                    Philip Henslowe (owner of the Rose Playhouse), Alleyn helped to manage the Lord\\n                    Admiral's Men during the early 1590's. Alleyn may also have managed the Rose in\\n                    Henslowe's absence, and both men co-owned the Fortune and Hope playhouses and\\n                    the Bear Garden. In 1604 Alleyn and Henslowe also acquired the patent for the\\n                    Mastership of the Bears, Bulls, and Mastiff Dogs, which Alleyn enjoyed until his\\n                    death. Alleyn also held property in London, Middlesex, Southwark, and Dulwich.\\n                    By 1606 he had purchased Dulwich Manor on which he constructed an orphanage and\\n                    pensioner\\u2019s home called \\u2018The College of God\\u2019s Gift at Dulwich\\u2019. The formal\\n                    ceremony for the founding of the college took place in September, 1619. The\\n                    foundation deed was signed by some very prominent persons of the day, including\\n                    the Archbishop of Canterbury. </p>\\n                <p>Alleyn\\u2019s first wife was Joan Woodward, Henslowe\\u2019s stepdaughter, whom he married\\n                    in 1592. Upon her death in 1623 Alleyn married Constance Donne, the daughter of\\n                    John Donne, the poet and Dean of St. Paul\\u2019s Cathedral. In 1626, he wrote a will\\n                    leaving his entire estate to Dulwich College. Alleyn had no children by either\\n                    wife. At the time of his death Alleyn was the most prominent actor-entrepreneur\\n                    of his age. His social contacts included many leaders of the church and\\n                    government, including Francis Bacon, Sir Julius Caesar, and Lancelot\\n                    Andrews.</p>\\n                <p>For futher information, see the entries for Henslowe and Alleyn by S. P. Cerasano\\n                    in the <em>Oxford Dictionary of National Biography</em>.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	\N
15	[{"id": "3995e41b-cc28-4d8d-90bc-8e30e275830d", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057750172608\\">Muniment 16 (<a href=\\"/images/Muniments-Series-1/Group-016/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/016/01r</a>)</h2>\\n                <p><strong>Henslowe and the Rose</strong></p>\\n                <p>Philip Henslowe was a successful entrepreneur who amassed a large property\\n                    portfolio, largely in London\\u2019s Bankside, including residential and commercial\\n                    properties such as playhouses, bear-baiting arenas, and inns. An extensive\\n                    archaeological excavation uncovered the remains of one of these commercial\\n                    properties, the Rose Playhouse, between 1988 and 1989. The evidence of fresh\\n                    documentary research, undertaken to accompany the archaeological work, proves\\n                    that Henslowe was not a ruthless, greedy and illiterate bully, as some\\n                    historians have argued. Instead, he was an educated, cultured, and benevolent,\\n                    but prudent, theatrical \\u2018angel\\u2019 who exerted great care in establishing,\\n                    maintaining and managing this successful theatrical venue for the good of his\\n                    employees, associates and customers, as well as his investors.<sup><a class=\\"fnLink\\" href=\\"#fn01\\" id=\\"fnLink01\\">1</a></sup></p>\\n                <p>Henslowe was born about 1555 and appears to have been in London by early 1576. He\\n                    may have been in the Bankside area even before 1579, when he married Agnes\\n                    Woodward at St Saviour\\u2019s church. <sup><a class=\\"fnLink\\" href=\\"#fn02\\" id=\\"fnLink02\\">2</a></sup>Muniments 86 and 87, dating from\\n                    1584, contain the first notification of his business interests in the area. As\\n                    Muniment 15 (<a href=\\"/images/Muniments-Series-1/Group-015/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/015/01r</a>)\\n                    shows, in the following year, 1585, he bought the lease on 24 March\\n                    of a plot in Bankside called the Little Rose Estate, the freehold of which was\\n                    owned by the parish of St Mildred\\u2019s, Bread Street, London. </p>\\n                <p>The estate straddled Rose Alley, then only a short stretch next to the river, and\\n                    the lease documents describe a \\u2018cottage\\u2019 and a small \\u2018garden\\u2019 to the west of the\\n                    alley and a much larger \\u2018garden\\u2019, stretching down to Maiden Lane, now Park\\n                    Street, on its eastern side.<sup><a class=\\"fnLink\\" href=\\"#fn03\\" id=\\"fnLink03\\">3</a></sup> The description of the property was\\n                    repeated through the whole series of deeds without change, as was common\\n                    practice in series of property deeds at this time and later. The description was\\n                    probably accurate at the time of the first deed but may have been already\\n                    anachronistic by the time of Henslowe\\u2019s lease. Muniment 16, the \\u2018partnership\\u2019 document of 1587 (<a href=\\"/images/Muniments-Series-1/Group-016/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/016/01r</a>) describes a building \\u2018at the southern end\\u2019\\n                    inhabited by one John Cholmley. This building, which was found in the\\n                    excavations, is clearly illustrated in John Norden\\u2019s map of 1593 <sup><a class=\\"fnLink\\" href=\\"#fn04\\" id=\\"fnLink04\\">4</a></sup> in the south west corner of the plot. The\\n                    same map also shows another building in the south east corner, although this was\\n                    not uncovered within the limits of the excavation. However, another building\\n                    just north of Cholmley\\u2019s House that appears to have been demolished just before\\n                    the playhouse was built was also found in the excavations.</p>\\n                <p>The other prominent features seen on Norden\\u2019s map are the ditches, or sewers\\n                    relating to water, rather than waste, drainage, next to the site. The most\\n                    prominent was that along Maiden Lane, but there were two either side of the\\n                    Little Rose Estate that must also have served as property boundaries. Neither\\n                    the ditch on the west--in the position of the later Rose Alley--nor the one on\\n                    the east extended as far north as the river.</p>\\n                <p>Henslowe leased the estate for nearly two years before he began building a\\n                    playhouse there. Apart from rental income, it is not known exactly what he did\\n                    there or how long he might have been thinking about building a playhouse. By the\\n                    time that the famous \\u2018partnership agreement\\u2019 was signed on 10 January 1587, the\\n                    playhouse foundations had been started. More importantly, Henslowe dug another\\n                    east-west ditch to enclose a 94-foot square area at the southern end of the\\n                    estate specifically as a playhouse site. Dimensions provided in the lease\\n                    documents reveal that the \\u2018playhouse plot\\u2019 comprised just under a quarter of the\\n                    area of the entire estate.</p>\\n                <p>The new venture was generally referred to as \\u2018the playhouse\\u2019 and only later as\\n                    the Rose, presumably deriving from the estate, the small stretch of alley and an\\n                    earlier inn on the river bank. It is not known whether Henslowe or his friend\\n                    and neighbour, the carpenter John Griggs, or someone else designed it, for there\\n                    is no surviving building contract as there are for his later ventures, the\\n                    Fortune and the Hope (Muniments 22, 49, 51, (<a href=\\"/images/Muniments-Series-1/Group-022/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/022/01r</a><a href=\\"/images/Muniments-Series-1/Group-049/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/049/01r</a>(<a href=\\"/images/Muniments-Series-1/Group-051/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/051/01r</a>). In fact the \\u2018partnership agreement\\u2019 between Henslowe and Cholmley\\n                    in Muniment 16 is not a building contract but an agreement for what today would\\n                    be termed a \\u2018catering franchise\\u2019.</p>\\n                <p><strong>Muniment 16</strong> (<a href=\\"/images/Muniments-Series-1/Group-016/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/016/01r</a>)</p>\\n                <p>This \\u2018muniment\\u2019, a legal document composed for the purpose of detailing and\\n                    preserving specific rights and/or privileges, is one of the few surviving\\n                    manuscipts from the early modern period detailing a theatrical partnership. This\\n                    attractive document is written in professional, \\u2018secretary\\u2019 handwriting, with a\\n                    highly-embellished opening line. Slashes were made at the bottom of the document\\n                    in preparation for a seal, but there is no evidence that a seal was ever\\n                    appended. Its ornate form and its carefully-worded content suggest that this\\n                    agreement was important to both parties.</p>\\n                <p>This is the second of two copies, or, more specifically, it is the lower portion\\n                    of a vellum sheet on which both copies would have been written. The first copy,\\n                    originally located at the top of the sheet, would have been held by Cholmley.\\n                    This second copy, which was Henslowe\\u2019s, notes that \\u2018Jones\\u2019 was the scrivener who\\n                    prepared the document, and it is signed by \\u2018Edward Pryce\\u2019 who witnessed the\\n                    agreement. John Cholmley endorsed the document on the verso (<a href=\\"/images/Muniments-Series-1/Group-016/01v.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/016/01v</a>): \\u2018By me, John\\n                    Cholmley, grocer\\u2019, and near it Henslowe also inscribed \\u2018Jo: Chollmley\\u2019. Also\\n                    mentioned in the deed is the builder John Griggs, who undertook the renovation\\n                    of the playhouse five years later in 1592. </p>\\n                <p>This muniment gives the basic details of the venture: the professional status of\\n                    the partners, the dimensions the Rose site, described here as ninety-four feet\\n                    square, \\u2018little more or less\\u2019, the fact that Cholmley already enjoyed the use of\\n                    a tenement that was standing on the southern end of the Little Rose at the time\\n                    the deed was drawn up, and the length of time that the agreement would be in\\n                    effect--from the signing until mid-June, 1595. Cholmley was to pay Henslowe \\u00a3816\\n                    in instalments over the course of eight and a quarter years, but not starting\\n                    until 25 June, the feast day of St John the Baptist. This clearly shows that\\n                    Henslowe had enough ready money to finance the bulk of construction costs\\n                    himself. In return, Cholmley was to receive a half-share in the profits of the\\n                    plays, and have exclusive right to the catering and victualling of the\\n                    enterprise run from his house. Moreover, both men would be allowed to admit\\n                    their friends to performances without charging admission fees. Henslowe would\\n                    finance the construction of the playhouse, and pay all rents as of September\\n                    1587, suggesting that this was the target date for the Rose\\u2019s opening. <sup><a class=\\"fnLink\\" href=\\"#fn05\\" id=\\"fnLink05\\">5</a></sup>According to the deed, although Cholmley\\n                    and Henslowe would share maintenance expenses of the playhouse thereafter, and\\n                    throughout the period covered by the agreement, Henslowe appears to have\\n                    financed all of the major expenses long before the playhouse was operable.</p>\\n                <p>The agreement, therefore, represents an attempt to defray costs but indicates\\n                    also that Cholmley certainly expected handsome financial returns for his outlay.\\n                    Although the only other mention of Cholmley amongst the Henslowe-Alleyn papers\\n                    after 1587 is an inscription of his surname on folio 1 of Henslowe\\u2019s \\u2018Diary\\u2019,\\n                    there is no reason to assume that the victualling of the playhouse, or\\n                    Cholmley\\u2019s annual payments, did not continue until at least 1595. Cholmley had\\n                    effectively bought the victualling franchise in 1587, which would explain the\\n                    absence of any \\u2018victualling income\\u2019 in Henslowe\\u2019s papers. The only question we\\n                    might ask is what arrangements were made after 1595 for victualling the\\n                    playhouse. Perhaps there was another such contract.</p>\\n                <p><strong>Evidence from the Excavations</strong></p>\\n                <p>Unlike a proper \\u2018building contract\\u2019, for example for the Fortune and Hope, the\\n                    'partnership agreement\\u2019 itself does not, in fact, provide any details at all on\\n                    the construction or appearance of the Rose itself. The excavations, however,\\n                    revealed two phases of building, the first of which we assume is the original\\n                    playhouse put up in 1587. This was a simple regular fourteen-sided polygon\\n                    comprising probably three tiers of galleries surrounding an open yard into which\\n                    a stage projected from the north. There was no evidence that the stage had any\\n                    cover. The area of galleries behind the stage was presumably occupied by the\\n                    \\u2018tiring house\\u2019 and other management / actors' areas. The main entrance was from\\n                    Maiden Lane to the south. Although there might have been another, private\\n                    entrance, to the rear, in the north, there was no room for any other access, and\\n                    no trace of anything interpreted as \\u2018external stair towers\\u2019 was found in the\\n                    excavations. </p>\\n                <p>The playhouse appears to have been used exactly as Henslowe and Cholmley\\n                    specified in the \\u2018partnership agreement\\u2019: they would \\u2018permitte suche personne\\n                    and personnes players to use exersyse [and] play in the said playe house\\u2019;\\n                    further, it was to host any \\u2018playe or enterlude\\u2019. It was most likely a\\n                    successful venture, judging from the fact that the excavations found evidence\\n                    for some wear and tear and minor maintenance of the building during this period.\\n                    But, contrary to some historians\\u2019 conjectures, there is no documentary or\\n                    archaeological evidence whatsoever to suggest that the building was used for any\\n                    form of baiting bears, bulls or any other type of animal.<sup><a class=\\"fnLink\\" href=\\"#fn06\\" id=\\"fnLink06\\">6</a></sup>\\n                </p>\\n                <p>Henslowe began his famous \\u2018Diary\\u2019 (MSS 7, <a href=\\"/images/MSS-7/001r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/001r</a>) in January 1592, so we have from this\\n                    date a detailed knowledge of his expenditures and revenues for the Rose.\\n                    Henslowe most likely kept accounts before this year, but they have not survived\\n                    and although much has been made of such an absence, it should be remembered that\\n                    no other similar accounts survive for any other playhouse of the period. One of\\n                    the first entries in the \\u2018Diary\\u2019 is an account of what Henslowe had \\u2018layd owt a\\n                    bowte my playe howsse in the yeare of or lord 1592\\u2019 (<a href=\\"/images/MSS-7/004r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/004r</a> <a href=\\"/images/MSS-7/004v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/004v</a> <a href=\\"/images/MSS-7/005r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/005r</a> <a href=\\"/images/MSS-7/005v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/005v</a> <a href=\\"/images/MSS-7/006r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/006r</a> <a href=\\"/images/MSS-7/006v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/006v</a>). This is an itemised expenditure of building\\n                    materials and costs totalling over \\u00a3105 whose purpose had never been fully\\n                    understood; speculation ranged from repairs to rebuilding</p>\\n                <p>However, the archaeological excavations revealed the answer as a partial\\n                    rebuilding of the playhouse that we have defined as Phase 2. Essentially it was\\n                    the northern, stage, area that was remodelled. The stage itself was rebuilt with\\n                    more of a \\u2018thrust\\u2019 into the yard and, crucially, was now provided with a roof,\\n                    or \\u2018cover\\u2019, held up by two columns. This also required the widening out of the\\n                    galleries on either side to cater for sight lines from the upper galleries,\\n                    creating a \\u2018horseshoe\\u2019 shaped building. There was a slight increase in the yard\\n                    capacity, although the increase in gallery capacity cannot be known, as there is\\n                    no information on the disposition of seating or access that might allow us to\\n                    gauge what internal space was available for alteration. </p>\\n                <p>Henslowe\\u2019s expenditure on building materials at the Rose in 1592 reveals his\\n                    attempts to keep pace with the fashions of theatrical presentation. This was\\n                    clearly a period of competition, for the Theatre in Shoreditch underwent\\n                    'further building and Reparacions\\u2019 at precisely the same time.<sup><a class=\\"fnLink\\" href=\\"#fn07\\" id=\\"fnLink07\\">7</a></sup>\\n                    Further structural expenditure by Henslowe at the Rose in 1595 ( Henslowe's Diary,\\n                    (<a href=\\"/images/MSS-7/002v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/002v</a>) relates probably to alterations that may have been largely cosmetic\\n                    (and are not apparent in the archaeological record), and made probably in\\n                    reaction to the recently built Swan playhouse farther up the river.</p>\\n                <p>Although Henslowe was clearly displaying a competitive spirit, the impetus for\\n                    enhanced staging capabilities or special effects probably arose from his\\n                    discussion with the playwrights and actors in terms of what was deliverable.\\n                    There may have been a short cantilevered canopy over the first stage, but a\\n                    permanent structure would undoubtedly allow descents on to the stage; for\\n                    example, Henslowe paid for (new?) pulleys in 1602 (Henslowe Diary, <a href=\\"/images/MSS-7/116v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/116v</a>). The\\n                    addition of a roof may even have revealed a concern for the actors, although the\\n                    cynical would say it was more likely Henslowe\\u2019s concern for their expensive\\n                    costumes.</p>\\n                <p>The cost of construction at the time was commonly offset by the re-use of\\n                    building materials. Until inflation caused a reversal in the 19th century,\\n                    material was a far more expensive component in a building project than labour.\\n                    The clearest example perhaps is the second-hand timber, albeit from a former\\n                    playhouse, used to build the Globe. The Fortune contract (Muniment 22, <a href=\\"/images/Muniments-Series-1/Group-022/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/022/01r</a>) is specific in its order for \\u2018good stronge and substancyall newe\\n                    timber\\u2019, and this may be an implied criticism of the re-used timber employed at\\n                    the rival Globe the year before. Nevertheless, Henslowe did not have such qualms\\n                    earlier when he built the \\u2018penthowsse shed\\u2019 by the back door of the remodelled\\n                    Rose in 1592 out of \\u2018owld tymber' (Henslowe Diary, <a href=\\"/images/MSS-7/005v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/005v</a>). Later, as its building\\n                    contract makes clear, the Hope was to be largely constructed from re-used\\n                    materials: that from the old bear garden and adjoining stable and more \\u2018olde\\n                    tymber\\u2019 bought by Henslowe from a demolished property in Thames Street.\\n                    Archaeological evidence from the Rose excavation found that recycled ship\\n                    timbers were used and that the thatch was cheaper straw rather than good reed.\\n                    Conversely though, the laths found were of good heartwood rather than sapwood.</p>\\n                <p>Competition from the new Globe may have been one of the factors for moving\\n                    operations to the Fortune in 1600. The Diary shows that the Rose was only used\\n                    intermittently until 1603 and in that year Henslowe opened negotiations for a\\n                    renewal of his lease of the Little Rose estate, due to expire at Michelmas 1605.\\n                    He was told that the annual rent for the entire estate was to be increased\\n                    almost threefold to \\u00a320 and that he would be required to spend 100 marks on the\\n                        building.<sup><a class=\\"fnLink\\" href=\\"#fn08\\" id=\\"fnLink08\\">8</a></sup></p>\\n                <p>Henslowe responded that he would rather pull down the playhouse than accept such\\n                    terms (Henslowe's Diary, <a href=\\"/images/MSS-7/114v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/114v</a>). In fact, Henslowe\\u2019s interest in the Rose had\\n                    diminished to such an extent that from October 1600 onwards he was continually\\n                    fined by the Surrey and Kent Commissioners of Sewers for not maintaining the\\n                    sewer ditch on Maiden Lane.<sup><a class=\\"fnLink\\" href=\\"#fn09\\" id=\\"fnLink09\\">9</a></sup>\\n                </p>\\n                <p>By this time Henslowe was quite a wealthy man, but his boast to pull down the\\n                    Rose was an empty one as he did not carry out his threat. The Rose was clearly\\n                    still standing when the Sewer Commission revisited the site in January 1606, at\\n                    which time it was back in the hands of St Mildred\\u2019s Parish. However, by April of\\n                    that year, the Commission referred to the sewer ditch \\u2018by the Late playhouse in\\n                    maidelane called the Rose\\u2019, which suggests that it had been demolished. <sup><a class=\\"fnLink\\" href=\\"#fn10\\" id=\\"fnLink10\\">10</a></sup></p>\\n                <p>The archaeological evidence suggests that rather than being wantonly demolished,\\n                    the Rose was carefully dismantled, as would be expected, for the retrieval of\\n                    building material. Very little brickwork or timber was left on the site, most of\\n                    the latter being the re-used pieces noted above. It is assumed that the great\\n                    amount of broken lath and plaster found in the Rose yard was material from the\\n                    demolished stage roof. Such ephemeral material was unlikely to be salvaged for\\n                    re-use, and such demolition was clearly associated with the parish\\u2019s plans for\\n                    redevelopment of the site. </p>\\n                <p>Both the Rose and the Fortune appear to have been popular and successful\\n                    theatrical venues. In investing in these and other properties, Henslowe\\n                    possessed undoubted business acumen. The elevated positions he attained at\\n                    parish and court level testify to the esteem in which he was held. There is no\\n                    evidence that he was not interested in the drama that he provided for thousands\\n                    of London playgoers. Indeed, his genuine interest seems to be confirmed by such\\n                    support being given to venues that were not nearly as economically successful as\\n                    his animal baiting concerns.<sup><a class=\\"fnLink\\" href=\\"#fn11\\" id=\\"fnLink11\\">11</a></sup> His \\u2018Diary\\u2019 is full of accounts of loans\\n                    to actors, playwrights, acting companies and tenants, and many of his tenants\\n                    appear to have been associated with the Rose, at which there seems to have been\\n                    a distinct, most likely \\u2018happy\\u2019, theatrical family.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><div class=\\"footnotes\\"><h3>Footnotes</h3><dl><dt id=\\"fn01\\">1.</dt><dd>See Julian\\n                        Bowsher and Pat Miller, <em>The Rose and the Globe - playhouses of\\n                            Shakespeare's Bankside, Southwark: excavations 1988-1991</em>(London:\\n                        Museum of London Archaeology, Monograph 48, 2009). <a href=\\"#fnLink01\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn02\\">2.</dt><dd>Henslowe\\u2019s birth is derived from a note\\n                        in Simon Forman\\u2019s papers; see S. P. Cerasano, 1993, 'Philip Henslowe, Simon\\n                        Forman, and the theatrical community of the 1590s',<em>Shakespeare\\n                            Quarterly</em>, Vol 44 (1993), 145-58. For other details of his early\\n                        life see Cerasano, \\u2018Philip Henslowe\\u2019s biography\\u2019, <em>Notes and\\n                        Queries</em>, 32 (1985),66\\u201372. <a href=\\"#fnLink02\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn03\\">3.</dt><dd>Documents describing the estate are known from\\n                        at least 1537, with further leases from 1574 (Muniment 8, <a href=\\"/images/Muniments-Series-1/Group-008/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/008/01r</a>)\\n                        and 1579 (Muniment 10, <a href=\\"/images/Muniments-Series-1/Group-010/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/010/01r</a>). <a href=\\"#fnLink03\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn04\\">4.</dt><dd>Detail of\\n                        \\u2018London\\u2019 in John Norden\\u2019s Speculum Britanniae reproduced in R. A. Foakes,\\n                            <em>Illustrations of the English stage 1580\\u20131642</em>, London:\\n                        Scolar Press, 1985), p. 7. <a href=\\"#fnLink04\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn05\\">5.</dt><dd>The\\n                        opening of the Rose has been construed differently by various historians. In\\n                            <em>The Henslowe Papers</em> (1907) W. W. Greg noted that\\n                        Cholmley\\u2019s initial payment wasn\\u2019t due for six months following the execution\\n                        of the agreement, from which he estimated that the playhouse would have been\\n                        ready \\u2018about Easter 1587\\u2019 (p. 2). However, Easter fell on April 18th of that\\n                        year, which is two months earlier than the six-month deadline specified; and\\n                        also, amongst the terms laid out in the deed the first payment was due \\u2018One\\n                        the feaste Daye of the Nativitie of St John Baptiste next Cominge\\u2019, which\\n                        was traditionally celebrated on June 24th (roughly six months from the date\\n                        that the document was signed). E. K. Chambers, in <em>The Elizabethan\\n                            Stage</em> (1923), reassigned the opening of the Rose to sometime in\\n                        the vicinity of Michaelmas (September 29th) 1587 (2:407) based on the sense\\n                        that the bridges and wharves would have been mended before the theatre\\n                        opened. It is worth noting that this would square with the timetable for the\\n                        construction of the Fortune Playhouse in 1600, when the theatre was built\\n                        outside of London during the early part of the year. Then, when the ground\\n                        thawed and a foundation could be built, the playhouse was deconstructed and\\n                        brought to London where it was reconstructed later in the year. Here too the\\n                        precise date of opening is open to some discussion although many historians\\n                        are inclined to set the opening date late in the summer or early in the\\n                        autumn of 1600. (See R. A. Foakes\\u2019s introduction to Muniment 22, the Fortune\\n                        contract, on this website: <a href=\\"http://www.henslowe-alleyn.org.uk/essays/fortunecontract.html\\" class=\\"ext\\" title=\\"External website\\">http://www.henslowe-alleyn.org.uk/essays/fortunecontract.html</a>). <a href=\\"#fnLink05\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn06\\">6.</dt><dd>See Julian\\n                        Bowsher, \\u2018The Rose and its stages\\u2019, <em>Shakespeare Survey</em>,60\\n                        (2007), 36\\u201348. <a href=\\"#fnLink06\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn07\\">7.</dt><dd>C. W.\\n                        Wallace, <em>The first London theatre: materials for a history</em>\\n                        (Lincoln, NE: Nebraska University Press, 1913), p. 76; Herbert Berry,\\n                        \\u2018Aspects of the Design and use of the First Public Playhouse\\u2019, in <em>The\\n                            first public playhouse: the Theatre in Shoreditch 1576\\u20131598</em>, ed.\\n                        H. Berry (Montreal: McGill-Queen\\u2019s University Press, 1979), p. 32. <a href=\\"#fnLink07\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn08\\">8.</dt><dd>This probably referred to running repairs and maintenance\\n                        throughout the estate rather than the playhouse itself, which was not parish\\n                        property. <a href=\\"#fnLink08\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn09\\">9.</dt><dd>London Metropolitan Archives, SKCS/18, ff. 315,\\n                        388, 401v, 406v. Henslowe later avoided being fined by the Commission by\\n                        claiming, rightly, that the property was no longer his; see SKCS/18, ff.\\n                        422v, 426v. <a href=\\"#fnLink09\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn10\\">10.</dt><dd>London Metropolitan Archives, SKCS/18, ff. 436, 441. <a href=\\"#fnLink10\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn11\\">11.</dt><dd>His only theatrical \\u2018failure\\u2019 was at the dual\\n                        purpose Hope, which the actors left to the bears after only a few years of\\n                        unsatisfactory cohabitation. <a href=\\"#fnLink11\\" class=\\"back\\">Back to context...</a></dd></dl></div><!--CTPL_FOOTNOTES ENDS--></div>"}]	Muniment 16
16	[{"id": "37f11e08-9df1-4528-9829-8578ef4b2ad1", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057749159616\\">MSS 1, Articles 135 and 136 (<a href=\\"/images/MSS-1/Article-135/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-135/01r</a> <a href=\\"/images/MSS-1/Article-136/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-136/01r</a>)</h2>\\n                <p>Martial. / </p>\\n                <p>The Thinges that make the happier life, are these,</p>\\n                <p>Most pleasant Martiall; Substance got wth ease,</p>\\n                <p>Not labour\\u2019d for, but left thee by thy Sire;</p>\\n                <p>A soyle, not barren; a continewall fire;</p>\\n                <p>Neuer at Law; seldome in office gown\\u2019d;</p>\\n                <p>A quiet mind; free powers; and body sound;</p>\\n                <p>A wise simplicity; Freindes alike=stated;</p>\\n                <p>Thy table wthout art, and easy=rated;</p>\\n                <p>Thy night not dronken, but from cares layd wast;</p>\\n                <p>No sowre, or sollen bed=mate, yet a Chast;</p>\\n                <p>Sleepe, that will make the darkest houres swift pac\\u2019t.</p>\\n                <p>Will to bee, what thou art; and nothing more:</p>\\n                <p>Nor feare thy latest day, nor wish therfore. / </p>\\n                \\n                <p>How happy is he borne, or taught,</p>\\n                <p>That serueth not anothers will!</p>\\n                <p>Whose armor is his honest thought;</p>\\n                <p>And silly truth his highest skill.</p>\\n                <p>Whose passions not his Masters are,</p>\\n                <p>Whose soule is still prepar\\u2019d for death,</p>\\n                <p> Vntied vnto the world, wth care</p>\\n                <p>Of princes grace, or vulgar breath.</p>\\n                <p>Who hath his life from rumors freed,</p>\\n                <p>Whose conscience is his strong retreate,</p>\\n                <p>Whose state can neyther flatterers feed,</p>\\n                <p>Nor ruine make accusers great.</p>\\n                <p>Who envieth none, Whome chance doth rayse;</p>\\n                <p>or Vice: Who neuer vnderstood</p>\\n                <p>How swordes giue sleighter wounds, yn prayse;</p>\\n                <p>or rules of state, but rules of good.</p>\\n                <p>Who God doth late, &amp; early pray</p>\\n                <p>More of his grace, then guifts to lend;</p>\\n                <p>And entertaynes the harmelesse day</p>\\n                <p>Wth a well=chosen booke, or freind.</p>\\n                <p>This Man is free from seruile bandes</p>\\n                <p>Of hope to rise, or feare to fall;</p>\\n                <p>Lord of himselfe, though not of landes:</p>\\n                <p>And hauing nothing, yet hath all. </p>\\n                \\n                <p>This page shows two sets of verses copied out, presumably for Edward Alleyn, by\\n                    his friend Ben Jonson (1572-1637), who was one of the most celebrated dramatists\\n                    and poets of the early modern period. Jonson apparently had a personal and\\n                    professional friendship with Alleyn and, at least, an economic relationship with\\n                    his father-in-law Philip Henslowe as an actor and dramatist.</p>\\n                <p>Henslowe\\u2019s first record of any dealings with Jonson come on July 28, 1597 when\\n                    Henslowe loaned \\u2018Bengemen Johnson player\\u2019 \\u00a34 \\u2018to be payd yt agayne when so euer\\n                    ether I or any for me shall demande yt\\u2019. At the same time, Jonson paid Henslowe\\n                    3s 9d pence for his undefined \\u2018Sharre\\u2019 (Henslowe's Diary, <a href=\\"/images/MSS-7/024r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/024r</a>). As E. K. Chambers noted, these\\n                    financial transactions were made on the same day that the theatres were\\n                    temporarily closed due to the scandalous play, <em>The Isle of Dogs</em>,\\n                    of which Jonson evidently was a co-author with Thomas Nashe.<sup><a class=\\"fnLink\\" href=\\"#fn01\\" id=\\"fnLink01\\">1</a></sup> Whether Jonson used all or only part of the\\n                    loan of \\u00a34 to defend himself against imminent prosecution for his participation\\n                    in that play, or simply to borrow enough money to buy a share in the Admiral\\u2019s\\n                    Men, is not clear.</p>\\n                <p>However it was not the last time that Jonson would depend on both Alleyn and\\n                    Henslowe to sustain him, artistically or financially. As his Diary makes clear,\\n                    Henslowe contracted Jonson to write or co-write a number of plays, including\\n                        <em>Hot Anger Soon Cold</em>, beginning in December 1597. On September\\n                    26, 1598, in MSS 1, Article 24 (<a href=\\"/images/MSS-1/Article-024/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-024/01r</a>), a grief-stricken Henslowe reported to Alleyn, \\u2018I haue loste\\n                    one of my company wch hurteth me greatley that is gabrell [Spenser] for he is\\n                    slayen in hoges den fylldes by the hands of benge[men] Jonson bricklayer\\u2019.\\n                    Henslowe did not sever his professional relationship with Jonson as a result of\\n                    his murder of the actor Gabriel Spenser in a duel in Hoxton, London, for\\n                    Henslowe continued to contract Jonson to write or collaborate in such plays as\\n                        <em>The Lamentable Tragedy of Page of Plymouth</em> and <em>Richard\\n                        Crookback</em>, i.e., <em>Richard III</em>, as well as additions to\\n                    \\u2018Geronymo\\u2019 (probably <em>The Spanish Tragedy</em>) for the Admiral\\u2019s Men,\\n                    among other companies, in August and September 1599, September 1601, and June\\n                    1602. Perhaps it was at Alleyn\\u2019s request, or that of his fellow actors, that\\n                    Henslowe continued his professional relationship with Jonson, who acted with\\n                    Alleyn not only in plays over the years, but in entertainments such as that at\\n                    Salisbury House in 1608 in front of James I. In fact, Alleyn frequently spoke\\n                    Jonson\\u2019s words, as in <em>The Magnificent Entertainment</em> (1604) in\\n                    front of the king.</p>\\n                <p>This enduring collaboration between Jonson and Alleyn is certainly celebrated in\\n                    this manuscript, one of only a handful of surviving works in Jonson\\u2019s\\n                    distinctive and stylish Italic handwriting. His autograph copies of <em>The\\n                        Masque of Queens</em> (1609) and the opening speech of <em>The\\n                        Entertainment of the Two Kings at Theobalds</em> (1606) survive, as well\\n                    as a recently discovered scribal manuscript of <em>Entertainment at Britain's\\n                        Burse</em> (1609) in which his hand may be present. Otherwise only nine\\n                    of his poems (including the present manuscript) are known to survive in his own\\n                    hand. Even so, this seemingly meagre toll of surviving autograph manuscripts is\\n                    rich by comparison with that for any of his fellow-dramatists, few of whose\\n                    original manuscripts are extant. This toll also stands in contrast to the\\n                    considerable number of his verse and dramatic works that survive in multiple\\n                    scribal copies of various kinds, which make Jonson the dramatist of his period\\n                    most widely represented in manuscript circulation.</p>\\n                <p>The present manuscript of verse is of interest for several other reasons. The\\n                    first poem, \\u2018The Thinges that make the happier life are these\\u2019\\u2013 which exists in\\n                    manuscript copies but was not published until 1841 (from this autograph\\n                    original)--is Jonson\\u2019s English version of an epigram (Book X, No. 47) by the\\n                    Latin poet Martial (c.40-103 AD). A celebration of what constitutes a happy\\n                    life, it shows the Roman poet in a somewhat sunnier, if reflective, mood than\\n                    does the acerbic and biting wit that informs so many of his more characteristic\\n                    satirical epigrams. That Martial\\u2019s epigrams were very much to Jonson\\u2019s taste and\\n                    that he was one of Jonson\\u2019s favourite Latin poets is well-attested. Not only do\\n                    we have his recorded references to Martial in his conversations with William\\n                    Drummond in 1619, but also the survival of at least three editions of Martial\\u2019s\\n                    poems from Jonson\\u2019s library (all now in the Folger Shakespeare Library,\\n                    Washington DC), one of which he has annotated heavily with remarks fiercely\\n                    defending the Roman poet against his detractors.</p>\\n                <p>In his invocation to \\u2018the Ghost of Martial\\u2019 Jonson praises him as a poet who gave\\n                    \\u2018farre nobler Epigrammes\\u2019 to his sovereign than Jonson ever could to his--a rare\\n                    example of modesty on Jonson\\u2019s part acknowledging anyone\\u2019s superiority to\\n                    himself. Martial was, in effect, a role-model. In defending his own sharp satire\\n                    in plays such as <em>Volpone</em>, Jonson identified with Martial\\u2019s\\n                    conception of the proper role of the poet. Martial was also the principal model\\n                    for Jonson\\u2019s own epigrams, some of which--such as the present one--are direct\\n                    translations of Martial, and highly accomplished ones at that.</p>\\n                <p>The second poem on this page comprises the first twelve lines of a 24-line poem,\\n                    which continued overleaf and is written along similar lines, not as a direct\\n                    translation of Martial or Horace but very much in the Stoical spirit of certain\\n                    of their poems. It is usually entitled \\u2018The Character of a Happy Life\\u2019. It is a\\n                    version composed, however, not by Jonson himself but by Sir Henry Wotton\\n                    (1568-1639), the diplomat, author and Provost of Eton, who is perhaps best\\n                    remembered for incurring the wrath of James I by writing that \\u2018an ambassador is\\n                    one who lies abroad for the good of his country\\u2019. \\u2018How happy is he borne, or\\n                    taught\\u2019 was one of Jonson\\u2019s favourite poems, which, according to his friend and\\n                    confidant William Drummond, he \\u2018hath by heart\\u2019.</p>\\n                <p>Jonson\\u2019s personal, elegantly written copy of it directly after one of his own\\n                    poems confirms his respect for Wotton\\u2019s composition, which was published first\\n                    in 1614 but widely circulated for many years in manuscript copies. As evidence\\n                    of Jonson\\u2019s taking the trouble to copy other men\\u2019s verse on certain occasions,\\n                    it also helps to explain why at least three poems by other authors managed to be\\n                    erroneously included in the posthumous edition of his <em>Works</em>,\\n                    edited in 1640 by Sir Kenelm Digby and Thomas Walkeley. The three poems (<em>Underwoods</em>, xxxix, lxxx and lxxxi) included yet another by Sir\\n                    Henry Wotton (on the King\\u2019s birthday), as well as an elegy by the one\\n                    contemporary poet Jonson revered \\u2018this side of idolatry\\u2019: John Donne. The poems\\n                    had evidently been mistaken by his editors as Jonson\\u2019s own compositions because\\n                    they found them among his papers, written in his own hand.</p>\\n                <p>This manuscript is a notable instance of the historical, as well as in this case\\n                    literary, riches contained in the Henslowe-Alleyn Archive, embodying, as it\\n                    does, a rare surviving autograph composition by one of the truly major poets and\\n                    dramatists of the Elizabethan-Jacobean period, and a friend and rival of\\n                    Shakespeare. It is also a document that throws exciting light on Jonson\\u2019s\\n                    poetical sources, taste and inspiration, on his relationship with Alleyn, and on\\n                    the nature and editing of his papers after his death.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><div class=\\"footnotes\\"><h3>Footnotes</h3><dl><dt id=\\"fn01\\">1.</dt><dd> E. K.\\n                        Chambers, <em>The Elizabethan Stage</em>, 4 vols (Oxford: Clarendon\\n                        Press, 1923), 3:352-3. <a href=\\"#fnLink01\\" class=\\"back\\">Back to context...</a></dd></dl></div><!--CTPL_FOOTNOTES ENDS--></div>"}]	MSS 1, Articles 135 and 136 
17	[{"id": "c10b52c9-f73f-4c57-828e-dbb7f29629f3", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057750168560\\">MSS 1, Article 6 (<a href=\\"/images/MSS-1/Article-006/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-006/01r</a>)</h2>\\n                <p>Your answer the other nighte, so well pleased the Gentlemen, as I was satisfied\\n                    therewth, though to the hazarde of ye wager; and yet my meaninge was not to\\n                    preiudice Peeles credit; neither wolde it, though it pleased you so to excuse\\n                    it, but beinge now growen farther into question, the partie affected to Bently,\\n                    (scornynge to wynne the wager by yor deniall), hath now giuen you libertie to\\n                    make choice of any one playe, that either Bently or Knell plaide, and least this\\n                    advantage, agree not wth yor minde, he is contented, both the plaie and the\\n                    tyme, shalbe referred to the gentlemen here prsent. I see not, how you canne any\\n                    waie hurte yor credit by this acc\\u2019on; for if you excell them, you will then be\\n                    famous, if equall them; you wynne both the wager and credit, yf short of them;\\n                    we must and will saie Ned Allen still.</p>\\n                <p>Yor frend to his power</p>\\n                <p>W: P.</p>\\n                \\n                <p>Deny me not sweete Nedd, the wager\\u2019s downe</p> \\n                <p>and twice as muche, commaunde of me or myne:</p>\\n                <p>And if you wynne, I sweare the half is thyne;</p>\\n                <p>and for an ouerplus, an English Crowne. </p>\\n                <p>Appoint the tyme, and stint it as you pleas,</p>\\n                <p>Your labor\\u2019s gaine; and that will proue it ease. / </p>\\n                \\n                <p>[Addressed:] To Edward Allen</p>\\n                \\n                <p>Unlike the vast majority of manuscript items in the Henslowe-Alleyn papers at\\n                    Dulwich, this letter with its verses is not only relatively legible, but\\n                    beautifully written. It is, however, difficult at first reading to understand\\n                    what the letter and the poem are about. W. P. seems to be acting as an\\n                    intermediary in a wager made between someone (\\u2018the partie\\u2019) and Alleyn in front\\n                    of various \\u2018Gentlemen\\u2019. Alleyn is to choose a play in which either Bently or\\n                    Knell had a part; it seems as if the Gentlemen are to judge whether Alleyn\\u2019s\\n                    performance is better than, or as good as or not as good as, Bently\\u2019s or Knell\\u2019s\\n                    performance in a part. If the outcome is that Alleyn is judged not as good as\\n                    either of them, he will lose nothing but will still be known as \\u2018Ned Allen\\u2019. The\\n                    familiar form of his name is alluded to in the verses, which are written as if\\n                    by Alleyn\\u2019s challenger, and offer a crown or five shillings, if the actor wins,\\n                    as an extra inducement to join in the wager. In addition to this, W. P. refers\\n                    to a meeting \\u2018the other nighte\\u2019 at which he seems to have said something\\n                    unintentionally disobliging about Peele to which Alleyn responded cleverly,\\n                    thereby amusing the assembled company.</p>\\n                <p>Except for Edward Alleyn himself, the identities of those concerned in this\\n                    matter are by no means certain. The Peele whose credit was not being impugned by\\n                    W. P. is usually taken to have been the poet and playwright George Peele\\n                    (1556\\u201396), but if his name was invoked here in relation to acting (rather than,\\n                    say, as a playwright), it is remarkable that there is no other firm evidence\\n                    that he himself performed on the stage. If the stage plot of Peele\\u2019s play <em>The Battle of Alcazar</em> was ever at Dulwich (it is now in the British\\n                    Library), it would represent one of the few definite links between its author\\n                    and Henslowe and Alleyn. Bently and Knell seem to be identical with John Bentley\\n                    and William(?) Knell, both members of the Queen\\u2019s Men in the 1580s. Knell must\\n                    have been dead by 1588, as his wife remarried in that year. Both men attracted a\\n                    few contemporary references, and Thomas Nashe in <em>Pierce Penniless</em>\\n                    (1592) associated them with Alleyn and Richard Tarlton.<sup><a class=\\"fnLink\\" href=\\"#fn01\\" id=\\"fnLink01\\">1</a></sup></p>\\n                <p>The identity of W. P. is equally uncertain. He is an accomplished scribe who\\n                    decorates the letter with characteristic flourishes beneath his initials, on\\n                    three sides of the verses, and beneath the address. He has also added oblique\\n                    strokes in otherwise blank parts of the letter, which serve both as decoration\\n                    and to stop other handwritten material being inserted in it. In each line of the\\n                    letter, apart from the first and the last, the scribe leaves one gap, and in the\\n                    penultimate line two significant gaps, between parts of its text; these gaps,\\n                    whose function or meaning is obscure, follow commas and semi-colons as well as\\n                    full stops. The well-formed secretary hand in which most of the letter is\\n                    written is complemented by a fine italic, used for names in the letter, his\\n                    initials, the verses and the address; in the verses, \\u2018English Crowne\\u2019 is written\\n                    in an almost Roman inscriptional hand. In the letter \\u2018Ned Allen\\u2019 and in the\\n                    verses \\u2018sweete Nedd\\u2019 and \\u2018English Crowne\\u2019 are all written in gold ink. This sort\\n                    of calligraphic exuberance and showmanship are relatively unusual in private\\n                    documents of the time and suggest the work of a writer of some skill: the\\n                    clubbed ascenders and descenders in the verse are characteristic of writing\\n                    dating from the 1590s and 1600s. One possible candidate for the writer of the\\n                    letter might be the scrivener William Panke who published his own writing manual\\n                    in 1591.<sup><a class=\\"fnLink\\" href=\\"#fn02\\" id=\\"fnLink02\\">2</a></sup>In 1595 Panke was involved in a wager for a handwriting competition\\n                    for a golden pen which the celebrated scrivener Peter Bales won. Unfortunately,\\n                    there are no links known between Panke and the theatrical world.</p>\\n                <p>The playful obscurity of the letter is characteristic of other Elizabethan\\n                    records of wagers, such as the one with Edmund Spenser recorded by Gabriel\\n                    Harvey in his letter-book. There seems to be some sort of joke involved in\\n                    calling Alleyn \\u2018Ned\\u2019; this is how Nashe refers to him in his two tracts of 1592,\\n                        <em>Pierce Penniless</em> and <em>Strange News of the Intercepting\\n                        Certain Letters</em>. In the latter, Nashe states that \\u2018his very name (as\\n                    the name of Ned Allen on the common stage) was able to make an ill matter good\\u2019.\\n                    By then, Alleyn was about 26 and already had a reputation as a great actor. It\\n                    seems unlikely that the joke refers to being over-familiar with his first name,\\n                    but its significance is otherwise unknown. The involved syntax of the letter is\\n                    far removed from the rather pedestrian verses, although in the last line, the\\n                    play on work and leisure is quite deftly done. The subscription to the letter\\n                    (\\u2018Yor frend to his power\\u2019) is a common salutation, especially during the\\n                    seventeenth century.</p>\\n                <p>W. P.\\u2019s undated letter, first published in the 1821 Boswell Variorum Shakespeare,\\n                    is unlike much of the material in the Henslowe-Alleyn papers: it is familiar but\\n                    not domestic; it is beautifully and legibly written, but not easy to understand\\n                    or to date. A highly attractive document, it links the world of fine writing to\\n                    the gossipy, competitive milieu of the theatre. It proved irresistible to the\\n                    nineteenth-century scholar and forger John Payne Collier: the following item in\\n                    the manuscript consists of seventeen lines of verse, addressed as if to Alleyn,\\n                    beginning \\u2018Sweete Nedde nowe wynne an other wager\\u2019, and in which the author\\n                    refers to \\u2018Willes newe playe\\u2019. Although written in a plausible secretary hand,\\n                    the uneven inking of the verses and their rather extravagant orthography led to\\n                    their exposure as a forgery within twenty years of their first publication in\\n                    Collier\\u2019s <em>Memoirs of Edward Alleyn (1841)</em>.<sup><a class=\\"fnLink\\" href=\\"#fn03\\" id=\\"fnLink03\\">3</a></sup></p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><div class=\\"footnotes\\"><h3>Footnotes</h3><dl><dt id=\\"fn01\\">1.</dt><dd>See E. K. Chambers,\\n                            <em>The Elizabethan Stage</em>, 4 volumes (Oxford: Clarendon\\n                        Press, 1923), 2:303, 327-8. <a href=\\"#fnLink01\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn02\\">2.</dt><dd>H.R. Woudhuysen, <em>Sir Philip Sidney and the Circulation of\\n                            Manuscripts, 1558\\u20131640</em> (Oxford: Clarendon Press, 1996), p.\\n                    34. <a href=\\"#fnLink02\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn03\\">3.</dt><dd>See Arthur\\n                        Freeman and Janet Ing Freeman, <em>John Payne Collier: Scholarship and\\n                            Forgery in the Nineteenth Century</em>, 2 vols (New Haven, Conn., and\\n                        London: Yale University Press, 2004), 2:1137. <a href=\\"#fnLink03\\" class=\\"back\\">Back to context...</a></dd></dl></div><!--CTPL_FOOTNOTES ENDS--></div>"}]	MSS 1, Article 6
18	[{"id": "14bcdadc-dcfd-4c0d-b1e5-689a812334d2", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057749938448\\">MSS 1, Article 70 (<a href=\\"/images/MSS-1/Article-070/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-070/01r</a>)</h2>\\n                <p>Memorandum tis agreed between phillip hinchlow Esq &amp; Robert Daborn gent, yt\\n                    [i.e., that] ye said Robert shall before ye end of this Easter Term deliuer in\\n                    his Tragoedy cald matchavill &amp; ye divill into ye hands of ye said phillip\\n                    for ye summ of xxty pounds, six pounds whereof ye said Ro=bert aknowledgeth to\\n                    hau receaued in earnest of ye sayd play this 17th of Aprill &amp; must hau other\\n                    four pound vpon delivery in of 3 acts &amp; other ten pound vpon deliuery in of\\n                    ye last scean perfited. In witnes hearof the said Robert Daborne hearvnto set\\n                    his hand this 17th of April 1613.</p>\\n                <p>per me Rob: Daborne</p>\\n                \\n                <p>Robert Daborne\\u2019s theatrical career can first be documented on January 4, 1610\\n                    when he received a royal patent to become a co-manager of the Children of the\\n                    Queen\\u2019s Revels, who usually performed at Whitefriars theatre. However, he may\\n                    have joined the theatrical profession in some capacity by at least 1608. By\\n                    1613, Daborne had begun writing plays for the adult company of the Lady\\n                    Elizabeth\\u2019s Men, which had amalgamated that year with the Children of the\\n                    Queen\\u2019s Revels, and which played at the Whitefriars, the Swan, the Rose, and the\\n                    Hope theatres, among other venues. Also in 1613, Henslowe took over the\\n                    management of the Lady Elizabeth\\u2019s Men, including the debts of the company\\u2019s\\n                    members. Between 1613 and 1614, Henslowe contracted Daborne to write at least\\n                    five plays, including <em>Machiavel and the Devil</em>, <em>The\\n                        Arraignment of London</em>, <em>The Bellman of London</em>, <em>The Owl</em>, and <em>The She Saint</em>. None of these plays\\n                    survives in manuscript or printed form, yet all but <em>The She Saint</em>\\n                    are recorded by Henslowe as having been completed.</p>\\n                <p>This 1613 memorandum entirely in Daborne\\u2019s handwriting offers fascinating insight\\n                    into ways in which dramatists could negotiate their terms of employment with\\n                    acting companies and their agents such as Henslowe. Daborne\\u2019s name does not\\n                    appear in Henslowe\\u2019s Diary, which records very few business dealings in the last\\n                    years of Henslowe\\u2019s life, so at the end of his career Henslowe may have kept\\n                    this set of documents and numerous personal letters from Daborne as a substitute\\n                    account book. After the composition of this memorandum, a formal Latin contract, Article 71\\n                    (<a href=\\"/images/MSS-1/Article-071/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-071/01r</a>), with an English translation on the verso, was copied out by a\\n                    professional scribe. It was then signed by Daborne and witnessed by the lawyer\\n                    Edward Griffin.</p>\\n                <p>Another formal Latin contract, Article 92 (<a href=\\"/images/MSS-1/Article-092/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-092/01r</a>) dated December 10, 1613, between\\n                    Henslowe and Daborne calls for Daborne to write <em>The Owl</em> and was\\n                    similarly witnessed by Griffin, along with two other men, and signed by Daborne;\\n                    it also has an English translation on the verso. If the contract for <em>The\\n                        Owl</em> was preceded by a memorandum, it no longer survives. Although\\n                    some dramatists in the period were on long-term contracts, Daborne appeared to\\n                    be on a per-play, or short-term, contract, probably because, as he hints in his\\n                    letters, he thought he could increase his fees with each new play completed.\\n                    Whether the contract was short-term or long-term, it was supposed to be\\n                    exclusive, even though dramatists threatened to take their finished play-texts\\n                    to another company for a higher fee, as Daborne eventually did in Article 81 (<a href=\\"/images/MSS-1/Article-081/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-081/01r</a>).</p>\\n                <p>Because Daborne\\u2019s contract to write <em>Machiavel and the Devil</em> began\\n                    as his own memorandum, he may have proposed in whole or in part its terms and\\n                    obligations. This play may have been based in some way on the Lord Strange\\u2019s\\n                    Men\\u2019s <em>Machiavel</em> play for which Henslowe lists receipts in March,\\n                    April and May 1592 (<a href=\\"/images/MSS-7/007r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/007r</a> <a href=\\"/images/MSS-7/007v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/007v</a>). However the memorandum suggests that\\n                    Daborne sees his play as his own composition. Daborne is to write the play in\\n                    the four weeks between April 17 and May 17, the end of the \\u2018Easter\\u2019 law term in\\n                    1613. He will receive a total of \\u2018xxty\\u2019 (i.e., 20), pounds for writing this\\n                    play, with \\u00a36 \\u2018earnest\\u2019 money (i.e., an advance against the total) paid upon the\\n                    completion of the memorandum, with \\u00a34 to be paid when Daborne submits the first\\n                    three acts. The final \\u00a310 will be paid upon his delivery of \\u2018ye last scean\\n                    perfited\\u2019, that is, when he submits all of the final two acts. In numerous of\\n                    his letters to Henslowe, Daborne makes clear that to \\u2018perfit\\u2019 (or \\u2018perfect\\u2019) a\\n                    play means to write out a \\u2018fair copy\\u2019, that is, a copy of the original foul\\n                    papers (or first draft) that would be easily legible and therefore ready to be\\n                    used by the company 'book-keeper', who kept track of the company\\u2019s master \\u2018book\\u2019\\n                    (now termed a \\u2018prompt-book\\u2019). Henslowe, who contracted over three hundred and\\n                    twenty-five plays during his association with acting companies, apparently took\\n                    no responsibility for commissioning or reimbursing scribes to make fair copies\\n                    of play-texts. Instead he apparently expected dramatists to \\u2018perfit\\u2019 a play\\n                    themselves or to pay scribes to do so.</p>\\n                <p>If Henslowe did use this type of formal contract for dramatists before 1613, they\\n                    do not appear to survive. However in his \\u2018Diary\\u2019 Henslowe seemed to have used a\\n                    consistent system of notation for his payments, including those made to\\n                    dramatists. In most entries, Henslowe wrote out in his own handwriting the\\n                    titles and authors of contracted plays. In a few cases, Henslowe wrote out the\\n                    entry when contracting a dramatist but left blank the name of the author;\\n                    eventually he had the author sign his name in the blank space. Perhaps Henslowe\\n                    decided on these occasions to contract a specific play, rather than an author,\\n                    and thus had the author sign his name upon being hired. </p>\\n                <p>However, these signatures, and especially those at the conclusion of entries that\\n                    Henslowe has written out himself, seem to indicate that Henslowe needed an\\n                    author\\u2019s signature for particular reasons and that the contract had to be drawn\\n                    up with the dramatist present. In some entries, Henslowe has his payees,\\n                    including dramatists, write the entire receipt themselves, as in Robert Wilson\\u2019s\\n                    entry for <em>The Second Part of Henry Richmond</em> (<a href=\\"/images/MSS-7/065r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/065r</a>). This type\\n                    of entry in the Diary in the dramatist\\u2019s hand, as well as those in Henslowe\\u2019s\\n                    hand subscribed with dramatists\\u2019 signatures, probably offered not simply a\\n                    memorandum but a legally binding contract. Whether informal or formal, these\\n                    contracts, including Daborne\\u2019s memorandum, suggest that the author is\\n                    negotiating his terms and conditions, not simply acquiescing to those of\\n                    Henslowe, who seems keen to oblige.<sup><a class=\\"fnLink\\" href=\\"#fn01\\" id=\\"fnLink01\\">1</a></sup></p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><div class=\\"footnotes\\"><h3>Footnotes</h3><dl><dt id=\\"fn01\\">1.</dt><dd>For further discussion of the\\n                        relationship between dramatists and playhouse personnel, see Grace Ioppolo,\\n                            <em>Dramatists and their Manuscripts in the Age of Shakespeare,\\n                            Jonson, Middleton and Heywood: Authorship, Authority and the\\n                        Playhouse</em> (London: Routledge, 2006). <a href=\\"#fnLink01\\" class=\\"back\\">Back to context...</a></dd></dl></div><!--CTPL_FOOTNOTES ENDS--></div>"}]	MSS 1, Article 70
19	[{"id": "d1954fc5-703a-472a-bdc8-9d8a74174704", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057747610080\\">Muniment 22 (<a href=\\"/images/Muniments-Series-1/Group-022/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/022/01r</a>)</h2>\\n                <p>Contract dated 8 January 1599/1600 between Peter Street, builder, and, as\\n                    partners, Philip Henslowe and Edward Alleyn, for the erection of the Fortune\\n                    Playhouse in Whitecross Street near Golden Lane in the parish of St Giles without\\n                    Cripplegate.</p>\\n                <p>In 1599, Henslowe, owner of the Rose Playhouse on Bankside, and Alleyn, leading\\n                    actor of the Admiral\\u2019s Men, were working with the Rose playhouse that was aging\\n                    badly and facing competition from the new Globe (built in 1599 close to the\\n                    Rose). The two men decided to erect a new playhouse for their company north of the\\n                    city, just outside its limits in the county of Middlesex. The contract for the\\n                    building survives, the only one for a public, outdoor playhouse in London during\\n                    the sixteenth and seventeenth centuries, and a unique document of great\\n                    importance for our understanding of the public or open-air playhouses of the early\\n                    modern period. Peter Street, who had been responsible for building the Globe in\\n                    1599, now agreed to erect the Fortune playhouse by July 25 at a price of \\u00a3440. The\\n                    contract provides enough information and exact measurements to give us a very\\n                    good idea of what the Fortune looked like. At the same time it has puzzling\\n                    features, not least because in relation to various aspects of the new playhouse it\\n                    does not specify what is to be done, but simply says do it in \\u2018the manner and\\n                    fashion of the saide howse Called the Globe\\u2019. Moreover, unlike its predecessors,\\n                    the Fortune was to be square, not based on the polygonal model we commonly\\n                    associate with the Elizabethan stage.</p>\\n                <p>The Fortune contract states that the playhouse was to be 80 feet square on the\\n                    outside, and 55 feet square on the inside, unlike the multi-sided Globe. The\\n                    foundations were to be of piles, i.e. stakes or pilings, driven into the ground,\\n                    and of brick, lime and sand and to extend at least one foot above the ground.\\n                    The playhouse was to be made of \\u2018good stronge and substancyall timber\\u2019, with three\\n                    stories of galleries, the lowest 12 feet in height, the middle one 11 feet, and\\n                    the upper one 9 feet. The galleries were to be 12\\u00bd feet deep, and the upper ones\\n                    each were to have a \\u2018Juttey forwards\\u2019 of 10 inches. The galleries were to be\\n                    fitted with seats, and there were to be \\u2018fower convenient divisions\\u2019 for\\n                    gentlemens\\u2019 rooms, and divisions for \\u2018Two pennie roomes\\u2019, but the contract does\\n                    not indicate where these \\u2018rooms\\u2019 were to be located. Only these rooms and the\\n                    stage were to be \\u2018rendered\\u2019 or \\u2018sealed\\u2019 with plaster, and Peter Street was not\\n                    to be charged for any painting. Certain features were to be different from those\\n                    at the Globe. The \\u2018scantlings\\u2019, or small pieces of wood used as studs or\\n                    supports within the frame, were to be \\u2018in every poynte\\u2019 larger in dimensions\\n                    than those used at the Globe. Also, the main posts of the inner frame and the\\n                    stage were to be carved as pilasters with figure of satyrs, part men, part\\n                    beast, possibly alluding to both satire or comedy and to tragedy (in Greek, the\\n                    song of the goat).</p>\\n                <p>Other details are of interest, especially perhaps the instruction that the stage\\n                    was to be \\u2018paled in\\u2019 with boards and \\u2018fenced with strong iron pykes\\u2019, presumably\\n                    to keep the groundlings in their place. The stage was also to be provided with a\\n                    \\u2018shadowe or cover\\u2019, which, like the staircases and the frame, was to be covered\\n                    with tiles (not thatch, as at the Globe).The contract is least informative about\\n                    the stage area. It calls for a stage and tiring-house to be set up within the\\n                    frame (i.e. the outer walls), the stage to be 43 feet long (or wide as we might\\n                    now see it), and to extend to \\u2018the middle of the yarde\\u2019. It is not clear what\\n                    this means. A stage 43 feet wide would leave a gap of only 6 feet between each\\n                    side of the stage and the inner wall of the frame, since the contract specifies\\n                    that the inner frame was to be 55 feet \\u2018square everye waye\\u2019. The contract\\n                    originally was accompanied by a \\u2018Plott\\u2019 or plan showing how the stage should be\\n                    \\u2018placed &amp; sett\\u2019, and also how the staircases of the frame should be made,\\n                    but this plan has been lost. Since a plan was needed, it is likely that the\\n                    stage was not a simple rectangle, but had a more elaborate shape, perhaps being\\n                    tapered, like that at the Rose. Also it may have been 43 feet wide only where it\\n                    abutted on to the frame. In any case, the stage at the Fortune was much larger\\n                    than that at the Rose, while the space provided for groundlings was much\\n                    smaller. The Fortune offered better accommodation and more protection from the\\n                    weather for actors and audiences.</p>\\n                <p>Between January and June 1600 Henslowe listed on the back of the document various\\n                    payments and receipts in connection with the work being done by Peter Street.\\n                    Other expenses, the latest dated August 2, are listed in Henslowe\\u2019s Diary:\\n                    (<a href=\\"/images/MSS-7/097r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/097r</a> <a href=\\"/images/MSS-7/097v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/097v</a> <a href=\\"/images/MSS-7/098r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/098r</a> <a href=\\"/images/MSS-7/098v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/098v</a> and <a href=\\"/images/MSS-7/099r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/099r</a>). It seems that Henslowe took\\n                    care of the practical arrangements from day to day, including dining with Peter\\n                    Street or laying out money for drink for the workmen. The first task was to\\n                    remove dung in a cart (<a href=\\"/images/MSS-7/098v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/098v</a>). Alleyn apparently took care of negotiations\\n                    that were needed when local inhabitants objected to the building of a playhouse in\\n                    Whitecross Street. He used his connection with the Lord Admiral, the Earl of\\n                    Nottingham, patron of his company the Admiral\\u2019s Men, to enlist his support in\\n                    January and again in April, after the Privy Council on March 9 ordered that no\\n                    playhouse should be built there. Among the expenses Henslowe noted on the back\\n                    of the contract is one for Alleyn when he rode to Windsor on May 15, presumably\\n                    still negotiating at court. </p>\\n                <p>It is not known whether Peter Street completed the playhouse by the promised date\\n                    of July 25. The last payment to Henslowe by the Admiral\\u2019s Men at the Rose was on\\n                    July 13, 1600 (Henslowe's Diary, <a href=\\"/images/MSS-7/062v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/062v</a>), so they probably moved to the Fortune in the\\n                    late summer. Henslowe paid Alleyn for the \\u2018firste weckes playe\\u2019 according to a\\n                    Diary note between entries dated November 11 and December 14 (<a href=\\"/images/MSS-7/070v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/070v</a>), and this\\n                    has been taken as evidence of the opening of the Fortune, but it more likely\\n                    relates to the previous entry concerning a \\u2018composition\\u2019 , a mutual agreement or\\n                    contract, between Alleyn and the company marking his return to acting full time\\n                    with them.</p>\\n                <p>The Fortune seems to have become a thriving enterprise until December 1621, when,\\n                    as John Chamberlain reported in a letter, \\u2018the fairest playhouse in this town\\u2019\\n                    was destroyed by fire. A second Fortune playhouse was built soon after on the\\n                    same site.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	Muniment 22
20	[{"id": "e7bb1993-ee84-4e9a-b57c-9f432b2345c1", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057748841632\\">Dulwich MSS 1, Article 138, folio 8r (<a href=\\"/images/MSS-1/Article-138/08r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-138/08r</a>)</h2>\\n                <p>Robert Greene was accused in an anonymous work called <em>The Defence of\\n                        Cony-Catching</em> (undated, but entered in the Stationers\\u2019 Register on\\n                    21 April 1592) as having sold his play <em>Orlando Furioso</em> (probably\\n                    written in 1591, and printed 1594) to the Queen\\u2019s Players, and then, when they\\n                    were touring in the country, sold it again to the Admiral\\u2019s Men. The play\\n                    appears once in the earliest list of performances in Henslowe\\u2019s Diary (<a href=\\"/images/MSS-7/007r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/007r</a>)\\n                    as played at the Rose by Lord Strange\\u2019s Men in February 1591/2. At this time it\\n                    seems that Lord Strange\\u2019s Men and the Lord Admiral\\u2019s Men formed one company,\\n                    which split into two separate companies in 1594 (Henslowe's Diary, <a href=\\"/images/MSS-7/009r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/009r</a>), when Edward Alleyn\\n                    became the star actor of the Admiral\\u2019s Men.</p>\\n                <p>Born in 1566, Alleyn was already established, in Thomas Nashe\\u2019s opinion, as a\\n                    supreme actor by 1592, for Nashe wrote that not even Roscius, the greatest actor\\n                    of ancient Rome, could \\u2018ever perform more in action than famous <em>Ned Allen </em>(<em>Pierce Peniless his supplication to the\\n                        Devil</em> (1592).<sup><a class=\\"fnLink\\" href=\\"#fn01\\" id=\\"fnLink01\\">1</a></sup>. The leading role in\\n                    Greene\\u2019s play <em>Orlando Furioso</em>, very loosely based on Ariosto\\u2019s\\n                    romance, which was translated by Sir John Harington in an English version\\n                    published in 1591, may have suited Alleyn as a ranting part in which he runs mad\\n                    with jealousy in his love for Angelica and imagines that he is Hercules.</p>\\n                <p>Several examples survive of individual parts written out for actors in medieval\\n                    plays, but the part of Orlando is the only one known from the Elizabethan\\n                    period. It appears that for major roles the actor was provided not with the\\n                    whole text of the play, but with his own part with cues for each speech. The\\n                    part of Orlando is written on strips of paper measuring about 16\\u00bc by 6 inches.\\n                    Originally there were probably 14 strips pasted together to form a continuous\\n                    roll, but they were separated at some point and three, numbers 1, 2 and 7, are\\n                    lost. Seven are more or less complete, three more are incomplete, and a fourth\\n                    is represented by a single line of text. The text of the part was written out by\\n                    a scribe who had some difficulties in reading the manuscript from which he was\\n                    copying. Sometimes he got things wrong, and occasionally he left a blank space\\n                    where he could not read or understand a word. It seems that Alleyn himself\\n                    supplied words where necessary, such as the names \\u2018Ate\\u2019 and \\u2018Galaxsia\\u2019, and the\\n                    words \\u2018crimson\\u2019 and \\u2018caus[e]lesse\\u2019. There are a few stage directions in the hand\\n                    of the scribe, and \\u2018Exeunt\\u2019 was twice added by Alleyn, once at a point where\\n                    Orlando is alone on stage (the Quarto has \\u2018Exit\\u2019) and he leaves to remain\\n                    offstage for the next 65 lines.</p>\\n                <p>The characteristics of this player\\u2019s part are well shown on the strip, folio 8r,\\n                    illustrated here (<a href=\\"/images/MSS-1/Article-138/08r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-138/08r</a>) . Except for some wormholes this strip is in good condition and\\n                    contains lines 165-226 of the part. The surviving strips preserve 531 lines or\\n                    parts of lines. The completed part would have run to about 800 lines. <sup><a class=\\"fnLink\\" href=\\"#fn02\\" id=\\"fnLink02\\">2</a></sup>. The scribe\\u2019s secretary hand is for the most part bold and\\n                    clear, and he marks off each speech by a line that leads into the cue for\\n                    Orlando\\u2019s next speech. These cues consist usually of brief phrases, such as \\u2018for\\n                    a woem\\u00e3\\u2019 ( i.e. woman); \\u2018for hir honesty\\u2019, \\u2018wth an othe\\u2019, (i.e., oath), and once\\n                    of the single name \\u2018Angelica\\u2019. There is no indication of acts or scenes. At one\\n                    point the scribe has written \\u2018Exit\\u2019 in the left margin, followed by a line\\n                    across the strip and then the word \\u2018Enter\\u2019 centred on the strip. This marks the\\n                    absence of Orlando from the stage for about 100 lines. The scribe seems to have\\n                    been unable to interpret one line where he left a space. Here Alleyn inserted in\\n                    a distinctive hand the line \\u2018inconstant base inurius &amp; vntrue\\u2019.</p>\\n                <p>Some time after Greene died in September 1592 a quarto version of the play was\\n                    published as the <em>The Historie of Orlando Furioso</em> in 1594 without\\n                    attribution of authorship, and a second quarto was printed from the first in\\n                    1599. The Quarto text has about 1600 lines including stage directions and prose\\n                        <sup><a class=\\"fnLink\\" href=\\"#fn03\\" id=\\"fnLink03\\">3</a></sup> and represents an abridged version of the play,\\n                    omitting some scenes and conflating others, as a comparison with Alleyn\\u2019s part\\n                    of Orlando confirms. It also has many errors and confusions. Many of the lines\\n                    reproduced here from the part of Orlando are missing from the Quarto, in which\\n                    the action too has been changed. Of the 36 lines in the part beginning with the\\n                    cue \\u2018Angelica\\u2019 and ending with Orlando\\u2019s exit on the line \\u2018That Medor may not\\n                    haue Angelica\\u2019, 19 are not in the Quarto, and many of the cues for Alleyn have\\n                    no connection with speeches in the printed text.</p>\\n                <p>In the action represented by the part, it seems that Orlando in his madness\\n                    imagines that he sees Angelica, or takes some mannequin brought on by his page\\n                    Argalio to be her, until the thought of Medor, believed by him to be her lover,\\n                    makes him turn against her. In the Quarto, Argalio brings on a \\u2018Clowne drest\\n                    lyke Angelica\\u2019, according to the stage direction, and there follows some rather\\n                    feeble comic dialogue in prose. The Quarto contains two other scenes in which\\n                    clowns appear and speak in prose, and all three presumably are alterations or\\n                    additions to the original play.</p>\\n                <p>The part is thus of unique importance. It shows how a leading actor studied his\\n                    role in a play. It also shows that Greene created a heroic romance in which\\n                    Orlando comes with other princes to sue for the hand of Angelica, is chosen by\\n                    her, runs mad when falsely persuaded she has betrayed him, but overcomes his\\n                    madness, fights and kills his challenger Brandemart and the traitor Sacrepant,\\n                    to be restored to happiness at the end. The printed text is shortened and\\n                    muddled; however, it cuts the blank verse of Orlando substantially, and adds\\n                    clowns and comic byplay in prose. It appears to be a version of the play as\\n                    adapted perhaps for a company touring outside London, and the claim on the\\n                    title-page, \\u2018As it was playd before the Queenes Maiestie\\u2019 may be merely an\\n                    advertising boast and not to be taken literally. In any case, the manuscript of\\n                    the part of Orlando permits a comparison of the text drawn directly from the\\n                    prompt copy of the Strange\\u2019s Men with the text as modified.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><div class=\\"footnotes\\"><h3>Footnotes</h3><dl><dt id=\\"fn01\\">1.</dt><dd><em>The Works of Thomas Nashe</em>, ed. R.\\n                        B. McKerrow (London: A. H. Bullen, 1904), 1: 215 <a href=\\"#fnLink01\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn02\\">2.</dt><dd>W.\\n                        W. Greg, <em>Two Elizabethan stage abridgements: The battle of Alcazar\\n                            and Orlando Furioso</em> (London: Oxford University Press, 1922), pp.\\n                        136-7. <a href=\\"#fnLink02\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn03\\">3.</dt><dd>Greg, p. 275, <a href=\\"#fnLink03\\" class=\\"back\\">Back to context...</a></dd></dl></div><!--CTPL_FOOTNOTES ENDS--></div>"}]	Dulwich MSS 1, Article 138, folio 8r
21	[{"id": "6d9072cd-ef3e-4e31-9af0-3b9a2d46d1e7", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057747471696\\">Muniment 584 (<a href=\\"/images/Muniments-Series-3/Group-584/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-3/584/01r</a>)</h2>\\n                <p>On September 13, 1619, Edward Alleyn read aloud his Deed of Foundation in the\\n                    College chapel. The chronicler Edmund Howes (fl. 1602-31) was a witness and a\\n                    signatory; in his continuation of John Stow\\u2019s <em>Annales</em> (1631), he\\n                    described how the great actor \\u2018very publiquely and audibly\\u2019 read the document,\\n                    and \\u2018did subscribe his name and fix his seal\\u2019.<sup><a class=\\"fnLink\\" href=\\"#fn01\\" id=\\"fnLink01\\">1</a></sup> Alleyn set down in his Diary (<a href=\\"/images/MSS-9/038r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/038r</a>): \\u2018They first Herd a\\n                    sermond, &amp; after ye Instrument of Creacion wase by me read, &amp; after an\\n                    anthem They went to dinner.\\u2019<sup><a class=\\"fnLink\\" href=\\"#fn02\\" id=\\"fnLink02\\">2</a></sup> He had ridden\\n                    twice in August to dine with the Archbishop of Canterbury at his Palace in\\n                    Croydon and to discuss the arrangements (09-036v), but on the day itself the\\n                    Archbishop was indisposed.</p>\\n                <p>Alleyn issued invitations across the Thames in person: \\u2018I rode to London to Envit\\n                    Lordes to ye Creacion\\u2019 (Alleyn's Diary, <a href=\\"/images/MSS-9/037v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/037v</a>). From this \\u2018Instrument\\u2019 it appears that Alleyn\\n                    intended the title of his College--\\u2018God\\u2019s Gift\\u2019-- to refer to what he had\\n                    personally received, dedicating it \\u2018to the honour and glorie of Almightie God,\\n                    and in a thankfull remembrance of his Guift and blessings bestowed on me the\\n                    said Edward Alleyn\\u2019 (In 1858 by Act of Parliament under the Scheme to turn the\\n                    College into a \\u2018public school\\u2019 it was renamed Alleyn\\u2019s College of God\\u2019s Gift; by\\n                    a further act in 1882 it became Dulwich College). The menu for the dinner is\\n                    itemised in the Diary, and includes beef, capons, pigeons, venison, mutton,\\n                    oysters, neat\\u2019s tongues, duck, eels, partridges, rabbits and artichoke pie\\n                    (Alleyn's Diary, <a href=\\"/images/MSS-9/038r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/038r</a>).</p>\\n                <p>The signatories to the Deed of Foundation included the great and the good:\\n                    Francis Bacon (1561-1626), Lord Verulam and Lord Chancellor, who signed himself\\n                    \\u2018F. Verulam Canc\\u2019; Thomas Howard, Earl of Arundel, the great connoisseur\\n                    (1585-1646); Inigo Jones \\u2018Suyor\\u2019, the architect and the King\\u2019s Surveyor\\n                    (1573-1652); the local magnates Sir Thomas Grymes of Peckham, and Sir Edward\\n                    Cecil (later Viscount Wimbledon) who was a Deputy-Lieutenant for Surrey,\\n                    together with other local magnates, the Sheriff of Surrey and a notary public.\\n                    Alleyn signed the Deed above his seal showing the crest: a hand holding aloft\\n                    a flaming heart, a likely reference to his performance in Ben Jonson\\u2019s masque\\n                        <em>The Magnificent Entertainment</em> (1604) when Alleyn on behalf of\\n                    the City of London raised high to King James a heart (an emblem of charity) from\\n                    a flaming altar.</p>\\n                <p>Alleyn\\u2019s signature seems the stiffest and the least polished on the document,\\n                    particularly among the elegant new \\u2018Roman\\u2019 hands of Arundel and Jones, who were\\n                    present as associates of Alleyn from court entertainments and also as\\n                    Commissioners for New Buildings. It is likely that Alleyn was involved with\\n                    these men in 1613 in the two months of celebrations involving masques, feasts\\n                    and revelry for the marriage of James\\u2019s daughter Princess Elizabeth to the\\n                    Elector Palatine. Alleyn perhaps accompanied Arundel and Edward Cecil (who was\\n                    Treasurer to the Princess) in the suite of forty-one that then followed the\\n                    princess to Heidelberg. Ten years later and just two years before Alleyn\\u2019s\\n                    death, he and Inigo Jones were involved in preparations for the reception of the\\n                    Infanta Maria as bride of Prince Charles, which was called off. On 5 June 1623,\\n                    Dr. Meddus wrote to Joseph Mead: 'Allein, sometime player, now Squire of the\\n                    Beares, and Inigo Jones, surveyor of the King\\u2019s works, rode hence on Tuesday\\n                    towards Winchester and Southampton to take order for his Majestie\\u2019s\\n                    entertainment, with the Prince\\u2019s and Ladie Marie\\u2019s . . . for shows\\u2019. <sup><a class=\\"fnLink\\" href=\\"#fn03\\" id=\\"fnLink03\\">3</a></sup>The Deed addresses greetings\\n                    to all true Christian people, and refers back to the Letters Patent from James I\\n                    of June 21, 1619 (Muniment 581, with the Great Seal of England, <a href=\\"/images/Muniments-Series-3/Group-581/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-3/581/01r</a>) licensing Alleyn\\n                    to consign his property to relieve and maintain poor men, women and children and\\n                    to educate the children.</p>\\n                <p>The Deed specifies that the College is to be staffed by one Master and four\\n                    Fellows, including an organist; six Poor Brethren, six Poor Sisters and twelve\\n                    Poor Scholars are to be maintained, sustained, educated, guided, governed and\\n                    ruled according to statutes made in his life time or amendments made after his\\n                    decease. All are to form \\u2018one body corporate and politique and one perpetual\\n                    cominality [corporation]\\u2019. He consigns property to the College. The almsfolk are\\n                    to come from the parishes connected with his career: St. Botolph\\u2019s, Bishopsgate\\n                    (where his father kept an inn and owned property); St. Saviour\\u2019s, Southwark\\n                    (with Bankside, the site of the Rose, Paris Garden and the Hope); St. Giles,\\n                    Cripplegate (the Fortune); Camberwell (in which Dulwich was included). The\\n                    resonant phrase \\u2018for ever\\u2019 recurs. Alleyn names the first officers and\\n                    beneficiaries, including his two relatives Thomas and Matthew as Master and\\n                    Warden. Four copies of the document were signed, and one was to remain in the\\n                    common chest of the College.<sup><a class=\\"fnLink\\" href=\\"#fn04\\" id=\\"fnLink04\\">4</a></sup></p>\\n                <p>Alleyn had needed the support of Francis Bacon, who initially opposed the scheme\\n                    on the grounds of tax evasion and showed a rather callous attitude towards such\\n                    charitable foundations. As Solicitor General he had opposed in 1611 the founding\\n                    of the Charterhouse by Thomas Sutton, arguing that the salaries of university\\n                    lecturers in the \\u2018universities of this realm, which I take to be of the best\\n                    endowed of Europe\\u2019 were the best endowment for education to flourish rather than\\n                    investing in the teaching of children.<sup><a class=\\"fnLink\\" href=\\"#fn05\\" id=\\"fnLink05\\">5</a></sup> He was against settling\\n                    estates in \\u2018mortmain\\u2019, i. e., avoiding death duties, because of the loss of\\n                    revenue to the state (Magna Carta forbad the conveyance of property to\\n                    corporations without royal sanction). Alleyn rode from Dulwich four times in\\n                    five days to see Bacon. Alleyn must have been in a high state of anxiety at this\\n                    point, as the College was already built, with the poor scholars, brethren and\\n                    sisters in place. Bacon pressed Alleyn to spend part of his bounty to endow two\\n                    new lectureships at Oxford and Cambridge, but Alleyn held fast to his scheme.</p>\\n                <p>Alleyn noted in his diary for August 17, 1618 that he called on the \\u2018Lo:\\n                    Chancellor\\u2019 \\u2018about staying [holding up] ye pattent\\u2019 (Alleyn's Diary, <a href=\\"/images/MSS-9/019v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/019v</a>). The next day\\n                    Bacon wrote to George Villiers, Duke of Buckingham, and mentioned Alleyn\\u2019s\\n                    appeal for a \\u2018license to give in mortmain \\u00a3800 land, though it be of tenure in\\n                    chief, to Allen, that was the player, for an Hospital. I like well that Allen\\n                    playeth the last act of his life so well; but if His Majesty give way thus to\\n                    amortize his tenures, the Court of Wards will decay, which I had well hoped\\n                    should improve\\u2019. Bacon appears to have failed to see the point of Alleyn\\u2019s\\n                    charitable intentions to return to London the bounty he had earned there:\\n                    \\u2018Hospitals [in the sense of almshouses or schools, e.g. \\u2018Christ\\u2019s Hospital\\u2019 and\\n                    \\u2018Chelsea Hospital\\u2019] abound, and Beggars abound never a whit less\\u2019.<sup><a class=\\"fnLink\\" href=\\"#fn06\\" id=\\"fnLink06\\">6</a></sup></p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><div class=\\"footnotes\\"><h3>Footnotes</h3><dl><dt id=\\"fn01\\">1.</dt><dd>Stow, <em>Annales, or a\\n                            General Chronicle of England</em> (London: R. Meighen, 1631), p.\\n                        1032. <a href=\\"#fnLink01\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn02\\">2.</dt><dd>Alleyn\\u2019s Diary was transcribed in volume II of\\n                            <em>The History of Dulwich College</em>, ed. William Young\\n                        (Edinburgh: Morrison &amp; Gibb, 1889), pp. 51-255. <a href=\\"#fnLink02\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn03\\">3.</dt><dd>British Library Harley MSS 389, f. 337. <a href=\\"#fnLink03\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn04\\">4.</dt><dd>For further discussion of the history of the\\n                        College, see Jan Piggott<em>Dulwich College: a History, 1616-2008</em>\\n                        (London: Dulwich College, 2008). <a href=\\"#fnLink04\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn05\\">5.</dt><dd><em>The Life of Sir Francis\\n                        Bacon</em> in <em>The Works of Sir Francis Bacon</em>, ed. Basil\\n                        Montagu (London: 1834), vol. 16, p. clii. <a href=\\"#fnLink05\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn06\\">6.</dt><dd><em>The Works of Francis Bacon</em>, 5 volumes (London: A. Millar, 1765,\\n                        III:365; the original letter has disappeared. <a href=\\"#fnLink06\\" class=\\"back\\">Back to context...</a></dd></dl></div><!--CTPL_FOOTNOTES ENDS--></div>"}]	Muniment 584
22	[{"id": "545804b1-60f6-4065-92c9-bc9899726618", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057747637168\\">MSS 1, Article 30 (<a href=\\"/images/MSS-1/Article-030/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-030/01r</a>)</h2>\\n                <p>MSS 1, Article 30 was termed an \\u2018inventory of theatrical apparel\\u2019 by W. W. Greg,\\n                    but that is simply a complex way of characterizing this list of clothing items\\n                    in the handwriting of Edward Alleyn. The manuscript is undated, and in the head\\n                    note to his transcription of it in <em>The Henslowe Papers</em> (1907)\\n                    Greg also mistakenly thought that the manuscript belonged to the period between\\n                    1590 and 1600. Contrary to this conclusion, it does not seem to have been\\n                    related to another familiar \\u2018inventory\\u2019\\u2014of apparel, properties, and\\n                    playbooks\\u2014purportedly written by Philip Henslowe in March and April 1598. Edmund\\n                    Malone claimed to have seen the original manuscript of Henslowe\\u2019s list, which is\\n                    now lost; the only extant copy is the one produced by John Payne Collier.</p>\\n                <p>In the manuscript illustrated here, Alleyn divided the page (consisting of a\\n                    single sheet) into six columns in which he catalogued \\u2018Cloakes\\u2019, \\u2018Gownes\\u2019,\\n                    \\u2018Antik sutes\\u2019, \\u2018Jerkings and Dublets\\u2019, \\u2018french[h]ose\\u2019, and \\u2018venetians\\u2019 (a kind\\n                    of hose or breeches that were made to come below the garters). Altogether, some\\n                    seventy-three items are listed, which would seem to be a modest collection given\\n                    the large number of plays in the repertory of the Lord Admiral\\u2019s Men. However,\\n                    costumes were the most expensive part of the budget for any stage production,\\n                    and there is some evidence, from Henslowe\\u2019s Diary, that, in general, the acting\\n                    companies only purchased a new costume for the lead actor in a production.\\n                    Consequently, it would appear that other actors borrowed whatever clothing they\\n                    could from the tiring house, with the result that apparel was used and reused as\\n                    long as it was in reasonable condition.</p>\\n                <p>Other telling and even perhaps surprising information can be gleaned from this\\n                    manuscript list as well. For example, the colors of cloth in the descriptions\\n                    (\\u2018scarlett\\u2019, \\u2018purpell\\u2019, and \\u2018yelow\\u2019), the kinds of fabrics employed (\\u2018damask\\u2019,\\n                    \\u2018velvett\\u2019, \\u2018silk\\u2019, and \\u2018cloth of gould\\u2019), and even some decorations (\\u2018gould\\n                    butens\\u2019 and \\u2018spanngles\\u2019) remind us of the expense of the apparel. Also, some of\\n                    the descriptions recall specific characters in the plays of the Admiral\\u2019s Men\\u2019s\\n                    repertory: \\u2018faustus Jerkin his clok\\u2019 and \\u2018pryams hoes\\u2019. One particular player in\\n                    the Admiral\\u2019s Men, Will Parr, seems to be mentioned by name in \\u2018A cloth of\\n                    silver for parr \\u2019. Also striking are the items for female characters (\\u2018wemens\\n                    gowns\\u2019) as well as several items designated specifically \\u2018for a boye\\u2019. </p>\\n                <p>Although much of the apparel would have been worn by actors playing a variety of\\n                    characters, and is therefore relatively undistinguished, three items in\\n                    particular\\u2014\\u2018hary ye viii gowne\\u2019, \\u2018a cardinalls gowne\\u2019, and \\u2018will somers\\n                    cote\\u2019\\u2014might conceivably refer to the two parts of <em>Cardinal Wolsey</em>\\n                    which were in production in 1601 and 1602. These annotations would suggest that\\n                    scholars should date MSS 1, Article 30 to coincide with the production of Henry\\n                    Chettle\\u2019s play. R. A. Foakes has hypothesized that perhaps the manuscript\\n                    coincides with a slightly earlier date, when Alleyn returned to the stage to\\n                    launch the opening of the Fortune Playhouse in the autumn of 1600.<sup><a class=\\"fnLink\\" href=\\"#fn01\\" id=\\"fnLink01\\">1</a></sup></p>\\n                <p>If MSS 1, Article 30 has become well known because of its interest for historians\\n                    of early modern dress, it is perhaps equally well known for the interlinear\\n                    forgeries in it by John Payne Collier. In three separate places Collier added\\n                    the names of characters (\\u2018Romeos\\u2019, \\u2018Pericles\\u2019, and \\u2018Leir\\u2019) to suggest that the\\n                    costume list is relevant to Shakespeare\\u2019s plays and perhaps even that the list\\n                    was produced during the summer of 1594 when the Lord Admiral\\u2019s Men and the Lord\\n                    Chamberlain\\u2019s Men briefly performed together at Newington Butts. In another\\n                    instance, Collier added \\u2018in Dido\\u2019 to suggest that \\u2018pryams hoes\\u2019 was somehow\\n                    related to Marlowe\\u2019s <em>Dido, Queen of Carthage</em>, despite the fact\\n                    that Priam is deceased prior to the opening of the play. Also, Collier added two\\n                    words (\\u2018in Venus\\u2019) following \\u2018i blew damask cote the moro\\u2019, probably in an\\n                    attempt to connect this entry to Shakespeare\\u2019s <em>Othello</em>, subtitled\\n                        <em>The Moor of Venice</em>.</p>\\n                <p>Regardless of Collier\\u2019s intrusions into Alleyn\\u2019s list, the manuscript, as with\\n                    others in the Dulwich collection, provides significant evidence of the sizeable\\n                    financial interest that Henslowe and Alleyn maintained in the Lord Admiral\\u2019s\\n                    Men. Throughout the company\\u2019s history\\u2014which lasted over a decade\\u2014these men were\\n                    the actors\\u2019 primary financiers, advancing literally hundreds of pounds of their\\n                    own money to purchase playbooks and apparel, without which the acting company\\n                    never could have succeeded. In preparing this list of apparel, Alleyn apparently\\n                    intended to detail precisely which pieces of clothing the actors had in their\\n                    possession. From Alleyn\\u2019s standpoint this was simply good business practice. Yet\\n                    he might have had other motives in mind, possibly because Henslowe\\u2019s earlier\\n                    list of apparel noted, right at the beginning, that ten items that were \\u2018Gone\\n                    and loste\\u2019, including two particularly expensive items\\u2014\\u2018Harey the fyftes dublet\\u2019\\n                    and \\u2018Harey the fyftes vell[v]et gowne\\u2019. Interestingly, there is less apparel in\\n                    the 1598 inventory than in Alleyn\\u2019s later catalogue, but a few of the items are\\n                    repeated, including \\u2018will somers cote\\u2019 which, if Collier was honest in making\\n                    his transcription of the 1598 inventory, had been characterized by Henslowe as\\n                    \\u2018Will. Sommers sewtte\\u2019.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><div class=\\"footnotes\\"><h3>Footnotes</h3><dl><dt id=\\"fn01\\">1.</dt><dd><em>Henslowe's Diary</em>, ed. R. A. Foakes (Cambridge: Cambridge\\n                        University Press, 2002), p. xliii) <a href=\\"#fnLink01\\" class=\\"back\\">Back to context...</a></dd></dl></div><!--CTPL_FOOTNOTES ENDS--></div>"}]	MSS 1, Article 30
23	[{"id": "24fc7f47-0382-4304-8a8f-6e7e333944a5", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057748214000\\">MSS 2, Article 5 (<a href=\\"/images/MSS-2/Article-005/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-2/Article-005/01r</a>)</h2>\\n                <p>In 1604 Philip Henslowe and Edward Alleyn acquired the patent for the Mastership\\n                    of the Royal Game, alternately known as the Mastership of the Bulls, Bears, and\\n                    Mastiff Dogs. It was a patent they had sought for some years, possibly from the\\n                    early 1590s, at which time they were already running the Bear Garden in\\n                    Southwark. The office of \\u2018bearward\\u2019 is recorded in account books of various\\n                    noblemen as far back as the middle ages, and the royal office existed as far\\n                    back as 1484, if not well before this time. A bull-baiting ring\\u2014a predecessor of\\n                    the bear-baiting arena\\u2014appears in a map of Southwark that can be dated around\\n                    1542. However, there is evidence that bears were baited during the twelfth\\n                    century, at certain times of the year, in Paris Garden. The patent held by\\n                    Henslowe and Alleyn allowed the men to procure animals for baiting and to bait\\n                    bears and dogs at Court and at Paris Garden, as well as to license traveling\\n                    bear wards and to breed, for their own purposes and for sale, English mastiffs,\\n                    which were highly sought after as watchdogs. From all of these privileges\\n                    Henslowe and Alleyn stood to earn quite a tidy sum. Owning the Bear Garden alone\\n                    was similar to owning a modern racetrack where much of the profit is generated\\n                    by the placing of bets.</p>\\n                <p>In 1573 the patent for the Mastership of the Royal Game was held by Ralph Bowes\\n                    whose brother, Sir Jerome Bowes, was ambassador to Moscow, and it was through\\n                    this connection that several white bears (a great rarity) were procured for the\\n                    Bear Garden. Despite the fact that Henslowe and Alleyn had been baiting bears at\\n                    Paris Garden as licensees of Bowes since 1594, the patent reverted to Sir John\\n                    Dorrington upon the death of Bowes in August, 1598. When Dorrington died, in\\n                    July, 1604, the men were again unsuccessful in obtaining the patent. Instead the\\n                    mastership was bestowed on Sir William Stuart, an associate of King James, who\\n                    seems to have been uninterested in the opportunities provided by the grant.\\n                    Therefore Henslowe and Alleyn were obliged ultimately to purchase the office.</p>\\n                <p>MSS 2, Article 5\\u2014a scribal copy written on paper\\u2014follows a form that was typical\\n                    of \\u2018letters patent\\u2019, i.e., a document that confers a privilege, office, title,\\n                    or property upon its holder. In addition to outlining the holders\\u2019 privileges\\n                    (summarized above), the fee for the office is listed as 10d per day, with the\\n                    Crown paying an additional 4d per day to Henslowe and Alleyn as salary for their\\n                    deputy. The manuscript is endorsed on the reverse side by Edward Alleyn who\\n                    identified the document as \\u2018A draft off ye patent\\u2019. Although the manuscript in\\n                    the Dulwich archive is imperfect (the first page is missing) an official copy\\n                    would have been enrolled in the Court of Chancery, for which Henslowe and Alleyn\\n                    would have paid a fee, in addition to paying for the scribal draft. Another\\n                    noteworthy aspect of this manuscript is that the draft document is dated\\n                    November 24, 1604, at \\u2018Westminster\\u2019, where the Court of Chancery was located.\\n                    Also relevant is Article 6 (<a href=\\"/images/MSS-2/Article-006/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-2/Article-006/01r</a>), an acquittance dated four days later on November 28,\\n                    from Sir Willam Stuart, who received a one-time payment of \\u00a3450 in exchange for\\n                    relinquishing his rights to the office with all \\u2018profits and appurtenaunces\\u2019.\\n                    Other manuscripts relating to the Bear Garden, and its history and operation, can\\n                    be found amongst the Henslowe-Alleyn papers. These include the diary of a\\n                    traveling bearward, and documents relating to the rebuilding of the Bear Garden\\n                    in 1613 as a joint playhouse-baiting arena called the Hope Playhouse.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	MSS 2, Article 5
24	[{"id": "fc12a40f-3c99-4831-a5b4-8804adabc5ec", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057750163792\\">MSS 7, folios 11r, 65v, and 90r (<a href=\\"/images/MSS-7/011r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/011r</a> <a href=\\"/images/MSS-7/065v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/065v</a> <a href=\\"/images/MSS-7/090r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/090r</a>)</h2>\\n                <p>In many ways MSS 7\\u2014a manuscript notebook of 238 folios\\u2014is undoubtedly the single\\n                    most important document of early modern English theatre history, and is thus the\\n                    best-known manuscript in the Dulwich collection. The book seems to have been\\n                    owned originally by John Henslowe, the brother of Philip Henslowe, who used a\\n                    small portion of it to record forestry accounts relating to Ashdown Forest,\\n                    Sussex, near to Lindfield where the Henslowe family resided. At some point\\n                    before 1591 the book was acquired by Philip, who lived in London.<sup><a class=\\"fnLink\\" href=\\"#fn01\\" id=\\"fnLink01\\">1</a></sup></p>\\n                <p>The Diary\\u2014a treasure trove of information about the Elizabethan theatre\\u2014contains\\n                    records of payments to dramatists, loans to authors and actors, disbursements\\n                    for costumes and playhouse construction, payments to the Master of the Revels,\\n                    and daily performance receipts for the Rose Playhouse, which Henslowe built in\\n                    1587. Especially prominent in the early 1590s are plays written by Christopher\\n                    Marlowe, including <em>Doctor Faustus</em>, <em>Tamburlaine the\\n                        Great</em>, and <em>The Jew of Malta</em>. Included also are receipts\\n                    for a brief period during the summer of 1594 when the Lord Chamberlain\\u2019s Men and\\n                    the Lord Admiral\\u2019s Men performed together at the playhouse in Newington Butts\\n                    (south of London) because plague had shut down the theatres in the city.\\n                    Additionally, Henslowe\\u2019s book preserves signatures of both prominent and lesser\\n                    known dramatists\\u2014George Chapman, Thomas Dekker, Michael Drayton, Samuel\\n                    Rowley\\u2014as well as business transactions with others, amongst which are Ben\\n                    Jonson, Thomas Heywood, Henry Chettle, Thomas Middleton, and Anthony Munday,\\n                    giving us unique insight into how, when, and with whom such authors\\n                    collaborated. As such, Henslowe\\u2019s Diary provides a unique picture of the\\n                    financial workings of an early modern playhouse.</p>\\n                <p>The folios shown here offer evidence of the riches in Henslowe\\u2019s book. On\\n                    folio 11r (<a href=\\"/images/MSS-7/011r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/011r</a>) which records playhouse receipts from December 17, 1594 through\\n                    February 15, 1594/5, are familiar titles, such as <em>Tamburlaine, Parts 1\\n                        and 2</em> and <em>Doctor Faustus</em> alongside other successful\\n                    plays of the time. Some of these, such as <em>Mahomet</em> (on February\\n                    5), were probably modeled on the <em>Tamburlaine</em> plays, while others,\\n                    such as <em>The Wise Man of West Chester</em>, are relatively unknown now,\\n                    but were popular then. Interestingly, Henslowe notes that the receipts totaled\\n                    \\u00a33 or more (a high return) at three different performances of <em>Wise\\n                        Man</em>\\u2014a comparatively new play at the time\\u2014while <em>Doctor\\n                            Faustus</em> which had been in the repertory for a longer period, was\\n                    bringing in less money. Also worth noting is the entry written January 1, 1594/5\\n                    for <em>Tamburlaine, Part 2</em>, which also premiered during this season,\\n                    and was highly successful, bringing in over \\u00a33. Other plays, such as <em>A\\n                        Knack to Know an Honest Man</em> (January 13), <em>The Grecian\\n                            Comedy</em> (January 10), and <em>Long Meg of Westminster</em>\\n                    (February 14) were the kinds of solid money-makers that filled in the repertory.\\n                    Because the season between Christmas and Candlemas (February 2) was generally\\n                    the busiest time of the year for the London playhouses, the receipts shown here\\n                    indicate that following the plague closings of 1593 and early 1594, the Rose\\n                    Theatre quickly returned to its customary level of activity. In fact, the\\n                    1594-95 holiday season produced robust returns.</p>\\n                <p>In commercial terms, folio 65v (<a href=\\"/images/MSS-7/065v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/065v</a>) represents the \\u2018opposite\\u2019 side of the diary in which\\n                    Henslowe recorded outlay for theatrical expenses. Here, in his own terminology,\\n                    Henslowe \\u2018lent\\u2019 20s to two dramatists, William Haughton and John Day, at the\\n                    appointment of Thomas Downton, an actor-manager in the acting company, to write\\n                    a tragedy entitled <em>Cox of Collumpton</em>. The subsequent entry is an\\n                    annotation, signed by Downton, attesting to the fact that 40s were advanced to a\\n                    different dramatist, Thomas Dekker, to write <em>The History of\\n                        Fortunatus</em>. The receipts section of Henslowe\\u2019s Diary is best known for\\n                    its annotations pertaining to dramatists; however, all theatrical expenses\\u2014for\\n                    costumes, for the commissioned writing of special prologues for the Court, for\\n                    copper lace, or for licenses from the Master of the Revels\\u2014are recorded here.\\n                    Finally, the upper portion of folio 90r (<a href=\\"/images/MSS-7/090r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/090r</a>) records a bond between Henslowe and\\n                    dramatist George Chapman, written on October 24, 1598, for a personal loan of\\n                    \\u00a310 10s. Chapman\\u2019s signature, in an Italian hand, is presumed to be an authentic\\n                    autograph.</p>\\n                <p>In addition to preserving records of his commercial interests, Henslowe\\u2019s\\n                    memorandum book contains some personal information. From it we learn that his\\n                    nephew Francis became a member of the Waterman\\u2019s Company and also purchased a\\n                    half share in a playing company. Loans to actors, extended by Henslowe\\u2019s wife\\n                    Agnes and stepdaughter Joan, are recorded as well, and one page preserves the\\n                    costs of what might have been a goblet made for the marriage of Joan to Edward\\n                    Alleyn, the lead actor in the Lord Admiral\\u2019s Men and, later, the co-owner, with\\n                    Henslowe, of the Fortune and the Hope playhouses. Folio 16v (<a href=\\"/images/MSS-7/016v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/016v</a>) records directions for\\n                    casting a child\\u2019s nativity (i.e., horoscope), while folio 17r (<a href=\\"/images/MSS-7/017r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/017r</a>) preserves a series\\n                    of magic spells that Henslowe purchased from the well-known astrologer Simon\\n                    Forman, including one \\u2018To make A fowle ffalle downe\\u2019 and another to discern\\n                    where a stolen object could be found.<sup><a class=\\"fnLink\\" href=\\"#fn02\\" id=\\"fnLink02\\">2</a></sup></p>\\n                <p>Unfortunately, the manuscript has suffered some mutilation, both in Henslowe\\u2019s\\n                    time and in later periods. Several groups of signatures, cut out of the diary by\\n                    subsequent readers, have found their way into the collections of major\\n                    libraries, including the British Library, the Bodleian Library, the Folger Shakespeare Library, and\\n                    Belvoir Castle, and in other cases it appears that entire pages might well have\\n                    been removed. Although it is impossible to tell precisely what has been lost,\\n                    what remains of Henslowe\\u2019s Diary is unmatched in terms of the ways in which it\\n                    reveals the fascinating complexity of theatrical life and theatrical commerce in\\n                    London, especially during the period between 1592 and 1605.<sup><a class=\\"fnLink\\" href=\\"#fn03\\" id=\\"fnLink03\\">3</a></sup></p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><div class=\\"footnotes\\"><h3>Footnotes</h3><dl><dt id=\\"fn01\\">1.</dt><dd>S. P.\\n                        Cerasano, 'Henslowe's Curious Diary', <em>Medieval and Renaissance Drama\\n                            in England</em>, 17 (2005), 72-85. <a href=\\"#fnLink01\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn02\\">2.</dt><dd>S. P. Cerasano, 'Philip Henslowe,\\n                        Simon Forman, and the Theatrical Community of the 1590s',<em>Shakespeare\\n                            Quarterly</em>, 44 (1993), 145-58. <a href=\\"#fnLink02\\" class=\\"back\\">Back to context...</a></dd><dt id=\\"fn03\\">3.</dt><dd>S. P. Cerasano,\\n                        'The Geography of Henslowe's Diary', <em>Shakespeare Quarterly</em>,\\n                        56 (2005), 328-53. For an authoritative transcription of the full diary, see\\n                        <em>Henslowe's Diary</em>, ed. R. A. Foakes (Cambridge: Cambridge\\n                        University Press, 2002). <a href=\\"#fnLink03\\" class=\\"back\\">Back to context...</a></dd></dl></div><!--CTPL_FOOTNOTES ENDS--></div>"}]	MSS 7, folios 11r, 65v, and 90r
25	[{"id": "211699f5-dc41-49d7-8b14-8e92e019e146", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057747612448\\">MSS 19 (<a href=\\"/images/MSS-19/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-19/01r</a> <a href=\\"/images/MSS-19/02r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-19/02r</a> <a href=\\"/images/MSS-19/03r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-19/03r</a>)</h2>\\n                <p>This manuscript is one of six surviving stage \\u2018plots\\u2019 (\\u2018platt\\u2019 is a variant\\n                    spelling) that were used by acting companies in the Elizabethan public theatres;\\n                    a seventh, now lost, was printed in volume 3 of the edition of Shakespeare by\\n                    Samuel Johnson, George Steevens and Isaac Reed published in 21 volumes in 1803.\\n                    Five now are collected in British Library MS Additional 10449, and all these\\n                    belonged to the Admiral\\u2019s Men, and almost certainly were at one time among the\\n                    manuscripts at Dulwich. Only one remains among the Henslowe papers, the plot of\\n                        <em>The Second Part of the Seven Deadly Sins</em>, which names only\\n                    players who were members of Lord Strange\\u2019s Men, so that it may date from a\\n                    period between 1590 and 1592 when this group and the Admiral\\u2019s Men were\\n                    collaborating, which would account for its presence at Dulwich. The play was\\n                    probably a sequel to <em>Four Plays in One</em>, listed by Henslowe in his\\n                    Diary (<a href=\\"/images/MSS-7/007r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/007r</a>) as performed on March 6, 1592, by Strange\\u2019s Men. This title may\\n                    be identified with an old play on the seven deadly sins written by Richard\\n                    Tarlton for the Queen\\u2019s Men around 1585. <sup><a class=\\"fnLink\\" href=\\"#fn01\\" id=\\"fnLink01\\">1</a></sup> The sins, in fact, seem to have stretched to two plays, four\\n                    being illustrated in Part 1, hence the alternative title <em>Four Plays in\\n                        One</em>, and three more in the second part.</p>\\n                <p>The play itself is lost, and there is no record of a performance in Henslowe\\u2019s\\n                    Diary, but the plot shows that <em>The Secound Part of the Seven Deadlie\\n                        Sinnes</em>, to use its original spelling,  presented three episodes illustrating the sins of envy, sloth\\n                    and lechery within a framing device involving King Henry VI and the poet John\\n                    Lydgate (who in fact lived well before the reign of this king). Henry appeared\\n                    asleep in a tent at the beginning, and the episodes seem to have been staged as\\n                    if dreamt by him. Lydgate and Henry were to remain on stage throughout and\\n                    address the audience, presumably commenting on the action, at various points.\\n                    The first episode concerned the reign of King Gorboduc (played by the young\\n                    Richard Burbage, not yet a sharer in the company), who handed over his authority\\n                    to his two sons, Ferrex and Porrex, with a tragic outcome as the sons quarrel\\n                    and attempt to kill one another. The second episode dealt with Sardanapalus, a\\n                    king in ancient Assyria, noted for his luxury and idleness. The third episode\\n                    had to do with the rape of Philomel by Tereus (also played by Burbage). The\\n                    whole thus might have been called three plays in one.</p>\\n                <p>It is perhaps surprising that any stage plots survive, since they were used for\\n                    performances, subject to wear and tear, and might be discarded when a play lost\\n                    its place in the repertory. Most of the surviving stage plots are damaged, and\\n                    only a fragment remains of one of them (<em>Troilus and Cressida</em>),\\n                    but they all seem to have had roughly the same form, a large sheet of paper with\\n                    two columns of writing on it divided by vertical rules. These columns contain a\\n                    list of the scenes in the play, each separated from the next by a horizontal\\n                    rule. The entry of actors is noted for each scene, identifying the players by\\n                    their own names and by the character\\u2019s name for a first entry, and thereafter\\n                    usually naming the characters only. </p>\\n                <p>The plot of <em>The Second Part of the Seven Deadly Sins</em> is unusually\\n                    well preserved, having at some time been cut in two, and each half mounted on\\n                    boards that were folded and jointed together with a strip of leather binding. In\\n                    the centre of the top half is a square hole that was no doubt used to hang the\\n                    plot on a peg somewhere in the backstage area during a performance of the play.\\n                    The plot then functioned as a guide to the players, a reminder of when they\\n                    would be needed on stage. No act divisions are marked, and no exits, except for\\n                    a final direction for Lydgate, who \\u2018speaks to the Audiens and so Exitts\\u2019. The\\n                    actors worked as a team, and in the absence of any equivalent of the modern\\n                    director or producer, the plot served an important purpose.</p>\\n                <p>The plot names fourteen actors and six boys, who played women\\u2019s parts and perhaps\\n                    the sins in the dumbshows. Three actors are given the title \\u2018Mr\\u2019 (George Brian,\\n                    Augustine Phillips and Thomas Pope), probably indicating they were sharers in\\n                    the company. Phillips, Pope and Burbage later became sharers in the Lord\\n                    Chamberlain\\u2019s Men (together with Shakespeare). Other named actors include\\n                    William Sly, who also became a sharer in the Chamberlain\\u2019s Men, Christopher\\n                    Beeston (\\u2018Kitt\\u2019), who was a leading player in Worcester\\u2019s Men in 1602 (Henslowe's Diary,\\n                    <a href=\\"/images/MSS-7/118r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/118r</a>), and had a long career with several companies, and John Duke, also a\\n                    sharer in Worcester\\u2019s Men in 1602. The actors playing Henry VI and Lydgate, who\\n                    are on stage throughout, are not named, and may also have been sharers in\\n                    Strange\\u2019s Men. One of the boys, Nick, surname unknown, seems to have become\\n                    attached to the Admiral\\u2019s Men, who bought a pair of hose for him in December\\n                    1601 'to tumble in before the quen' (Henslowe's Diary, <a href=\\"/images/MSS-7/095v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/095v</a>). The others appear to\\n                    have belonged to Strange\\u2019s Men and later to the Chamberlain\\u2019s Men, among them\\n                    one Ned, surname unidentified, but not, in this case, Edward Alleyn, who was\\n                    born in 1566 and no longer a boy.</p>\\n                <p>Two dumbshows are called for, with Lydgate as commentator. Otherwise the play\\n                    required little in the way of properties or scenic aids. Three musicians appear\\n                    in one scene, but no indications are given for music to be played. The main\\n                    needs were for a tent at the beginning, then later Sardanapalus was to come on\\n                    at one point \\u2018wth as many Jewels robes and gold as he can cary\\u2019. Philomel\\n                    entered bearing \\u2018Itis head in a dish\\u2019 in the second dumbshow, in which Mercury\\n                    also has a part.</p>\\n                <p> The plot was reproduced in W. W. Greg\\u2019s <em>Dramatic Documents from the\\n                        Elizabethan Playhouses</em>, 2 vols. (1931), with a commentary in vol.2,\\n                    pp.105-22.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><div class=\\"footnotes\\"><h3>Footnotes</h3><dl><dt id=\\"fn01\\">1.</dt><dd>E. K. Chambers, <em>The\\n                            Elizabethan Stage</em>, 4 volumes (Oxford: Clarendon Press, 1923),\\n                        3:496-7. <a href=\\"#fnLink01\\" class=\\"back\\">Back to context...</a></dd></dl></div><!--CTPL_FOOTNOTES ENDS--></div>"}]	MSS 19
26	[{"id": "a3ce60fe-a18c-4d71-b6f4-b66b868a148b", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057749554160\\">MSS 1, Article 68 (<a href=\\"/images/MSS-1/Article-068/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-068/01r</a>)</h2>\\n                <p>Mr Hinchlow</p>\\n                <p>You vnderstand or vnfortunate extremitie and I doe not thincke you so void of\\n                    christianitie but that you would throw so much money into the Thames as wee\\n                    request now of you; rather then endanger so many innocent liues, you know there\\n                    is xl [i.e., \\u00a310] more at least to be receaued of you, for the play, wee desire\\n                    you to lend vs vl [\\u00a35] of that, wch shall be allowed to you wthout wch wee\\n                    cannot be bayled, nor I play any more till this be dispatch\\u2019d, it will loose you\\n                    xxl [\\u00a320] ere the end of the next weeke, beside the hin=derance of the next new\\n                    play, pray Sr Consider our Cases with humanitie, and now giue us cause to\\n                    acknowledge you our true freind in time of neede; wee haue entreated Mr. Dauison\\n                    to deliuer this note, as well to wittnesse yr loue, as or promises, and allwayes\\n                    acknowledgment to be euer</p>\\n                <p>yr most thanckfull; and louing freinds</p>\\n                <p>Nat: Field</p>\\n                <p>the mony shall be abated out of the mony remayns for the play of mr fletcher\\n                    &amp; ours</p>\\n                <p>Rob: Daborne</p>\\n                <p>I have everfounde you a true lovinge freinde to mee &amp; in soe small a suite yt\\n                    [i.e., that] beeinge honest I hope yow will not faile vs. Philip Massinger</p>\\n                <p>In the spring of 1614, Philip Henslowe was in his sixties, an old man in that\\n                    period, and was taking on a theatre and a company, the Lady Elizabeth\\u2019s Men, new\\n                    to him. He had had already established a <em>modus operandi</em>,\\n                    first at the Rose and later the Fortune theatres, between 1592 and 1604, the\\n                    period documented by his famous Diary, or account-book. During those twelve\\n                    years, he acted in effect as banker to the actors, collecting their share of the\\n                    admission money at the playhouse and advancing money on their behalf at the\\n                    behest of sharers to dramatists for new or revised plays and costumes. However,\\n                    after 1604, not much is known about Henslowe\\u2019s theatrical activities until he\\n                    bought the Bear Garden from his son-in-law, Edward Alleyn, in 1611. He had this\\n                    torn down in 1613, and in partnership with Jacob Meade, a waterman, he erected\\n                    the Hope theatre, which was designed to serve as a playhouse and for bear- and\\n                    bull-baiting one day in every four days. Henslowe and Meade entered into\\n                    agreements with \\u2018Nathan Field, gentleman\\u2019, a celebrated actor and dramatist, and\\n                    with Robert Dawes, an actor, as sharers in the Lady Elizabeth\\u2019s Men, to provide\\n                    the company a playhouse.</p>\\n                <p>Henslowe and Mead agreed, according to Muniment 52 (<a href=\\"/images/Muniments-Series-1/Group-052/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-1/052/01r</a>), to \\u2018lay out\\n                    . . . such sums of money as shall be thought fitting by four or five of the\\n                    sharers of the said company\\u2019 to pay for \\u2018any play which they shall buy or\\n                    condition or agree for\\u2019, provided that the company reimburse Henslowe and Meade\\n                    on the second or third day of the play\\u2019s performance. This echoes the\\n                    arrangement Henslowe had with the Admiral\\u2019s Men in the 1590s, but then, as now\\n                    in 1614, many deals were made directly with individual actors or dramatists, no\\n                    sharers perhaps being available. It is in this context that Article 68r needs to\\n                    be understood.</p>\\n                <p>Nathan Field made his name as a boy actor playing female roles, and aged about 27\\n                    or 28 at the time of this letter he had become the leading adult player of the\\n                    Lady Elizabeth\\u2019s Men. Field had been arrested, by whom and for what reason is\\n                    not known, but in a litigious age arrests for minor matters such as unpaid debts\\n                    were common: for example, Thomas Dekker, the dramatist, was discharged by\\n                    Henslowe from arrest at the suit of the Lord Chamberlain\\u2019s Men in 1598\\n                    (Henslowe\\u2019s Diary, <a href=\\"/images/MSS-7/053r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-7/053r</a>). Without Field, the company could not perform, and\\n                    it seems that he was collaborating in the writing of a play with Daborne and\\n                    Massinger, who add their support. As a working dramatist Daborne had negotiated\\n                    for several years with Philip Henslowe. Philip Massinger later wrote many plays,\\n                    often in collaboration with John Fletcher, for the King\\u2019s Men.</p>\\n                <p>Other records in the Henslowe-Alleyn archive suggest that the play which Daborne\\n                    refers to as John Fletcher\\u2019s \\u2018and ours\\u2019 is <em>The Honest Man\\u2019s\\n                    Fortune</em>, contracted by Henslowe in 1613 (a manuscript of the play\\n                    survives at the Victoria and Albert Museum). In some ways, this letter is a\\n                    routine reiteration of the relationships between dramatists and those who\\n                    employed or contracted them\\u2014mutually dependent and beneficial and, not\\n                    unusually, underlined by the fact that dramatists and theatre entrepreneurs\\n                    could become \\u2018true and loving friends\\u2019. This collaborative letter implies here\\n                    that the three authors are familiar with Henslowe\\u2019s character, as well as his\\n                    paternal relationships with theatre personnel. Indeed, some dramatists did refer\\n                    to Henslowe as \\u2018Father\\u2019 and signed their letters \\u2018your loving son\\u2019, as in Article 69\\n                    (<a href=\\"/images/MSS-1/Article-069/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-069/01r</a>), probably because many of them had worked for him in other\\n                    capacities over the years as boy or adult actors or company-sharers or managers.\\n                    Perhaps they aspired to the affectionate father-son relationship Henslowe shared\\n                    with another actor\\u2014Edward Alleyn.</p>\\n                <p>At this time, being arrested for debt or other minor offences did not imply that\\n                    men like Field were considered dissolute wastrels by society. Henslowe knew that\\n                    actors and dramatists had to rely on the variable nature and income of their\\n                    work. This income depended on the size of the audience, and playhouses could be\\n                    closed in time of plague. Even if they were on an exclusive contract, dramatists\\n                    were usually paid per play in small increments. For example, if a dramatist was\\n                    paid a total of \\u00a36 for a play in the 1590s (or \\u00a320 by the 1610s), the payment\\n                    was usually made in stages over a few weeks, or months, of several 20-shilling\\n                    (i.e., \\u00a31) advances at a time, plus a final payment when the play was finished.\\n                    This meant that dramatists\\u2019 income was variable and sporadic, not regular and\\n                    predictable per annum.</p>\\n                <p> Living on this type of deferred income could lead a dramatist into debt, and\\n                    into asking his employer or contractor, eventually, to bail him against future\\n                    potential or real income. What is most notable about these requests directly\\n                    from an actor and dramatists to Henslowe is his willingness to offer immediately\\n                    the sum requested. Judging from various records in the archive, Henslowe lost\\n                    more than he made in providing loans or bail money to dramatists. In fact, he\\n                    appears to have simply forgiven many dramatists their debts, including the\\n                    sizeable sum of \\u00a320 owed to him by Daborne in 1616. Perhaps Henslowe considered\\n                    this loss to be worth the \\u2018true and loving friends\\u2019 he maintained in return.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	MSS 1, Article 68
27	[{"id": "06441b39-700a-4c2b-822c-7b80ece0db0b", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057749277248\\">MSS 1, Article 89 (<a href=\\"/images/MSS-1/Article-089/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-089/01r</a>)</h2>\\n                <p>Mr Hinchlow yu accuse me with the breach of promise, trew it is I promysd to\\n                    bring yu the last scean which yt [i.e., that] yu may see finished I send yu the\\n                    foule sheet &amp; ye fayr I was wrighting as ye man can testify which if great\\n                    busnies had not preuented I had this night fynished Sr you meat me by ye common\\n                    measuer of poets if I could not liu by it &amp; be honest I would giu it ouer\\n                    for rather then I would be vnthankful to yu I would famish thearfor accuse me\\n                    not till you haue cause if yu pleas to perform my request I shall think my self\\n                    beholding to yu for it howsoeuer. I will not fayle to write this fayr &amp;\\n                    perfit the book which shall not ly one yr hands</p>\\n                <p>yrs to command </p>\\n                <p>Ro: Daborne</p>\\n                <p>Lent at this tyme 20s</p>\\n                <p>the 13 of november 1613</p>\\n                <p>Twenty-six original letters from Robert Daborne to Philip Henslowe between April\\n                    1613 and August 1614 illuminate the wide-ranging artistic duties and\\n                    obligations, as well as the financial grievances and complaints, of an early\\n                    modern English professional dramatist.</p>\\n                <p>To begin with, the commissioning of a new play was clearly a collaborative\\n                    process between author and entrepreneur, however, Daborne suggested not only the\\n                    play topics but the conditions of their composition. At the time of a contract,\\n                    Daborne asks for an advance of \\u00a35 to \\u00a310 on his total fee of \\u00a320 per play, but\\n                    often requests a further advance of 10 to 20 shillings against the remainder of\\n                    his fee. Only in the contract for <em>Machiavel and the Devil</em> do the\\n                    two men actually stipulate that some portion of the completed text must be\\n                    submitted for Daborne to collect these interim advances, but the letters also\\n                    suggest that this is the case for the other plays. For example, in 001-075-01r,\\n                    Daborne states that on the following Tuesday night he will meet with Henslowe\\n                    and Alleyn to \\u2018read some\\u2019 of his new play, although he is \\u2018vnwilling to read to\\n                    ye generall company till all be finisht\\u2019. Daborne\\u2019s reluctance to read all of\\n                    his play appears not to be due to modesty but his failure to have finished\\n                    anything at all. He is probably gambling that within a few days he will have\\n                    written enough to convince Henslowe and Alleyn that he will indeed deliver the\\n                    entire play on time.</p>\\n                <p>Daborne\\u2019s promise that he will read the completed play to the entire company,\\n                    most probably the Lady Elizabeth\\u2019s Men, supports other evidence in Henslowe\\u2019s\\n                    papers that dramatists read their newly finished plays aloud to the actors with\\n                    whom they were working. This collaboration between author and actors suggests a\\n                    strong working relationship between them not only during composition but after\\n                    the play has been completed. As authors are suiting their material, and later\\n                    revisions and alterations, to the general and individual talents of the company\\n                    for which they are writing, authors needed comments and criticism from the\\n                    actors, even if the actors simply said, \\u2018we haue heard their booke and lyke yt\\u2019\\n                    (<a href=\\"/images/MSS-1/Article-026/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-026/01r</a>).</p>\\n                <p>In Article 73 (<a href=\\"/images/MSS-1/Article-073/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-073/01r</a>), Daborne promises shortly to \\u2018deliuer in ye 3 acts fayr written\\n                    &amp; then receau ye other 40s &amp; if yu please to have some papers now yu\\n                    shall\\u2019. Daborne also offers to write a new play based, as he tells Henslowe, on\\n                    \\u2018perusall of any other book of yrs\\u2019. In succeeding letters, particularly Article 74\\n                    (<a href=\\"/images/MSS-1/Article-074/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-074/01r</a>), Daborne continues to promise Henslowe \\u2018fair\\u2019 rather than foul\\n                    sheets of his new play, even apologising, \\u2018Some papers I haue sent yu though not\\n                    so fayr written all as I could wish\\u2019. Daborne also notes that he is aware of the\\n                    new play that the company is \\u2018studyinge\\u2019. In Article 78 (<a href=\\"/images/MSS-1/Article-078/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-078/01r</a>), Daborne acknowledges both\\n                    that he has sent Henslowe \\u20182 sheets more fayr written\\u2019 of <em>Machiavel and\\n                        the Devil</em> and that he has asked Cyril Tourneur to write one act of\\n                        <em>The Arraignment of London</em>.</p>\\n                <p>However by November 13, 1613, as Article 89 demonstrates here, Henslowe finally\\n                    had had enough of Daborne\\u2019s procrastination and has threatened to bring a suit\\n                    for \\u2018breach of promise\\u2019 against Daborne for failing to deliver a fair-copied,\\n                    completed play. In desperation, Daborne has reluctantly surrendered a foul sheet\\n                    of one or more pages only because he was interrupted in the act of copying,\\n                    apparently by Henslowe\\u2019s associate, who showed up to collect the promised fair\\n                    copy. Daborne then delivered an incomplete fair copy, but to prove that he has\\n                    completed the entire scene he takes the unusual step of sending a \\u2018sheet\\u2019 from\\n                    his foul papers, presumably for the portion he has not yet had time to fair copy\\n                    but which concludes the scene. However, Daborne has also promised of that foul\\n                    sheet, \\u2018I will not fayle to write this fayr &amp; perfit the book\\u2019. Thus the\\n                    foul sheet has been used as proof that the text was written and not as a\\n                    substitute for fair copy. When pressed, Henslowe seems to have made an exception\\n                    here in taking a foul-paper sheet as a token of work in progress, in lieu of the\\n                    customary fair copy. </p>\\n                <p>Daborne\\u2019s promise here and elsewhere to supply a \\u2018perfit\\u2019 or \\u2018perfited\\u2019 \\u2018book\\u2019\\n                    implies that a \\u2018perfect\\u2019 text was a fair copy, which could be used for licensing\\n                    and in the theatre, thereby saving Henslowe the expense of having it copied by a\\n                    professional scribe. Henslowe\\u2019s practices were, in this respect, undoubtedly\\n                    standard in the period, and what he required of his dramatists almost certainly\\n                    matched the conditions of other commissioning agents and acting companies,\\n                    otherwise his business interests and revenue could have been severely undercut\\n                    by his competitors. At least by 1613 this distinction between \\u2018foul\\u2019 and \\u2018fair\\u2019\\n                    copy was firmly in place.</p>\\n                <p>In his complaint here that Henslowe assesses him by the \\u2018common measure of poets\\u2019\\n                    Daborne may be interpreting Henslowe to mean that, like others, Daborne never\\n                    finishes on time or alternatively is always begging for money. However here, as\\n                    in his other letters, Daborne continues to insist on his artistic integrity. In\\n                    another letter, Article 91 (<a href=\\"/images/MSS-1/Article-091/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-091/01r</a>), he assures Henslowe, \\u2018Sr if yu doe not like this\\n                    play when it is read yu shall hau the other which shall be finished wth all\\n                    expedition\\u2019. To impress Henslowe and himself is Daborne\\u2019s chief concern, for\\n                    this offer concludes with the promise, \\u2018befor god this is a good one &amp; will\\n                    giu yu content\\u2019. For Daborne, artistry and economics were inseparable: in Article 78\\n                    (<a href=\\"/images/MSS-1/Article-078/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-1/Article-078/01r</a>), for example, he advises Henslowe, \\u2018I pray sr let yr boy giue order\\n                    this night to the stage keep [i.e. manager] to set up bills agst [i.e. for]\\n                    munday for Eastward hoe &amp; one [i.e. on] wendsday the new play\\u2019. Daborne\\u2019s\\n                    concern with advertising his new play and <em>Eastward Ho</em>, a controversial play by Chapman, Jonson and Marston being revived by the Lady\\n                    Elizabeth\\u2019s Men, would have been second nature to a man who had previously\\n                    co-managed one or more companies. If Daborne\\u2019s role is typical for a short-term\\n                    dramatist, hired to deliver five plays in one year, it would be crucial for a\\n                    long-term dramatist, such as Heywood, who was attached to Henslowe\\u2019s companies\\n                    for several years and who collaborated with other long-term dramatists such as\\n                    Chettle, Drayton and Dekker.<sup><a class=\\"fnLink\\" href=\\"#fn01\\" id=\\"fnLink01\\">1</a></sup></p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><div class=\\"footnotes\\"><h3>Footnotes</h3><dl><dt id=\\"fn01\\">1.</dt><dd>On the transmission of dramatic manuscripts from author to audience, see Grace Ioppolo, <em>Dramatists and their Manuscripts in the Age of Shakespeare, Jonson, Middleton and Heywood: Authorship, Authority and the Playhouse</em> (London: Routledge, 2006). <a href=\\"#fnLink01\\" class=\\"back\\">Back to context...</a></dd></dl></div><!--CTPL_FOOTNOTES ENDS--></div>"}]	MSS 1, Article 89
28	[{"id": "f4703714-379a-448f-ad6a-2a97e6b534f9", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057748843072\\">MSS 20 (<a href=\\"/images/MSS-20/01r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-20/01r</a> and following)</h2>\\n                <p>The early history of the manuscript of <em>The Telltale</em> is not known,\\n                    but the manuscript is mentioned by Edmond Malone in his <em>Supplement to the\\n                        Edition of Shakespeare\\u2019s Plays</em> published in 1778 (printed in 1780),\\n                    volume I, p. 61, only because it was then wrapped in the \\u2018plot\\u2019 of <em>The\\n                        Second Part of the Seven Deadly Sins</em>. It perhaps still lay in this\\n                    cover in 1821, when an account of the \\u2018plot\\u2019 was printed in Boswell\\u2019s expansion\\n                    of Malone\\u2019s edition of <em>The Plays and Poems of William\\n                    Shakespeare</em>, volume III, p. 350, but the \\u2018plot\\u2019 and the play were listed\\n                    as separate items in the sale catalogue of Boswell\\u2019s library in 1825. According\\n                    to a note by Thomas Jenyns Smith now bound with the play, both items were\\n                    claimed by the College authorities and restored to them before the sale. Some\\n                    time after this happened the play was bound as a separate volume, most likely by\\n                    George Warner when he catalogued the archive in the 1880's.</p>\\n                <p>This volume has a modern foliation inserted in pencil, but Folio 1 is a leaf\\n                    which clearly has nothing to do with the play. It is of a different paper from\\n                    the rest, is inscribed \\u2018The Booke and platt of the Second part of the 7 deadly\\n                    sinns\\u2019 in the same hand in which the rest of the \\u2018plot\\u2019 is written, and as W. W.\\n                    Greg argued in his <em>Dramatic Documents from the Elizabethan\\n                    Playhouses</em> (1931), p. 106, very probably formed part of this at one\\n                    time. The play occupies twelve sheets of paper, folded once to give a page\\n                    measuring up to 12 \\u00bc by nearly 8 inches. The manuscript is in very good\\n                    condition and is affected by damage only at the inner top corner of the first\\n                    page. The text is written in one hand, a clear and fairly neat English hand with\\n                    some admixture of Italian forms. The play is divided into acts, but there is no\\n                    heading for Act I; scenes are not indicated in the original. Act-headings and\\n                    many stage-directions are centred; other directions are usually written in the\\n                    right margin, but there are a few in the left margin.</p>\\n                <p>There are four points of special interest about the manuscript. First, in the\\n                    left margin, opposite the first speech assigned to the Duke of Florence, is\\n                    written in a large hand and enclosed in rules the word <em>mine</em>. George F. Warner suggested in his <em>Catalogue of the\\n                        Manuscripts and Muniments of Alleyn\\u2019s College of God\\u2019s Gift at\\n                    Dulwich</em> (1881) that the manuscript may at one time have belonged to an\\n                    actor who played the Duke, but this is unlikely for numerous reasons, an obvious\\n                    one being that the text is incomplete.</p>\\n                <p>A second point of interest is a gap of some length in the text of Act IV; the\\n                    break apparently occurs in the middle of line 1818, and the writer resumed in\\n                    the middle of a scene. He seems not to have known, or perhaps did not bother to\\n                    estimate accurately, the extent of the missing material, for he resumed at the\\n                    head of a fresh sheet without numbering it. Well over 2 \\u00bd pages of Sheet 9 are\\n                    left blank. As Greg observed, the lacuna, and the scribe\\u2019s ignorance of its\\n                    extent, suggest a copyist rather than the author. There are other small\\n                    indications that the manuscript is a copy: the most important of these is the\\n                    number of anticipations of words or even lines.</p>\\n                <p>A third point of interest is the presence of the unusual stage direction\\n                    \\"Exiturus\\" = \\"making as if to leave\\" at line 567. This direction occurs in five\\n                    plays by George Chapman, one by Nathaniel Field, one by Thomas Middleton and\\n                    John Webster, and one by John Clavell, the earliest of these being Chapman's May\\n                    Day (1602).<sup><a class=\\"fnLink\\" href=\\"#fn01\\" id=\\"fnLink01\\">1</a></sup></p>\\n                <p>Lastly, at the end of the text, next to the word ffinis is a monogram containing\\n                    the letters \\u2018NLcos\\u2019 which would perhaps make up the name NICHOLAS. This monogram\\n                    is certainly that of the scribe rather than the author. Professional scribes and\\n                    notaries, particularly members of the Society of Scriveners, would sometimes\\n                    sign their work in this way, or with paraphs or other devices. Yet it is unusual\\n                    to find freelance scribes, such as those employed by playhouses, ever\\n                    identifying themselves in this period (Ralph Crane, who copied some of\\n                    Shakespeare\\u2019s plays for the First Folio, is a notable exception). \\u2018Nicholas\\u2019\\n                    offers us another, this time puzzling, exception, and other manuscripts in his\\n                    fairly distinctive secretary hand, dating perhaps as late as the 1630s, have yet\\n                    to come to light.</p>\\n                <p>In the lack of further evidence, the play must be recorded as of unknown\\n                    authorship and of uncertain date. The general tone of the play, and its\\n                    imitation of a Fletcherian manner, for instance in the treatment of the\\n                    soldiers, point to a latish date, well after 1605. Some time about this year\\n                    suggests itself as an absolute <em>terminus a quo</em> in view of\\n                    the apparent imitation in <em>The Telltale</em> of themes used in plays\\n                    written between 1600 and 1605, firstly the purging of Garullo, which seems to\\n                    echo <em>Poetaster</em>, and secondly the theme of the ruler who leaves\\n                    his state on an excuse, and returns in disguise to inspect it, which is\\n                    reminiscent of plays such as Shakespeare\\u2019s <em>Measure for Measure</em>,\\n                    Middleton\\u2019s <em>The Phoenix</em>, Marston\\u2019s <em>The Malcontent</em>,\\n                    most of all perhaps John Day\\u2019s <em>Law Tricks</em>. One small point might\\n                    be used as evidence of multiple authorship: there are changes of spelling in the\\n                    names of two characters, Hortensio (folios 1-6), who becomes Hortenza(sa) on his\\n                    entry at line 804 and Hortenzo from line 1718, and Garullo, who becomes Garettzo\\n                    or Garettzi at line 781 but Garullo again from line 1251 onwards.</p>\\n                <p>How the manuscript came to Dulwich College is not clear, as the play does not\\n                    appear to have a known connection with Edward Alleyn, although it may have been\\n                    in the repertory of one of his companies or performed at the Fortune theatre. It\\n                    is possible that the manuscript was bequeathed to Dulwich College by the Stuart\\n                    and Restoration actor, company manager, and bibliophile William Cartwright the\\n                    younger, son of one of Alleyn\\u2019s acting colleagues and close friends. According\\n                    to the terms of his 1685 will, Cartwright\\u2019s estate included \\u2018about 100 Manu\\n                    Scripts of plaies\\u2019, which along with his folios, quartos and other books had\\n                    been appraised by William Brook and Rowland Reynolds for \\u00a337 15s (the equivalent\\n                    of \\u00a35588 in today\\u2019s money) on January 14, 1686, and which were to be left to\\n                    Dulwich College.</p>\\n                <p>Cartwright\\u2019s portraits of early modern and Restoration actors formed the basis\\n                    for the Dulwich Picture Gallery and can still be found there. However, his\\n                    collection of printed and manuscript plays appears to have been dispersed in the\\n                    18th and 19th centuries to visitors to Dulwich College such as David Garrick,\\n                    George Steevens, Edmond Malone, John Payne Collier and James Orchard\\n                    Halliwell-Phillips, all of whom borrowed from the library, and often did not\\n                    return, documents and books which offered them some insight into the\\n                    \\u2018Shakespearean\\u2019 age of drama. As noted above, it was only because the manuscript\\n                    of <em>The Telltale</em> was bound up with the plot of <em>The Second\\n                        Part of the Seven Deadly Sins</em> that it was returned to the College\\n                    from an auction of the library of Boswell (and thus of Malone, for whom Boswell\\n                    was literary executor). At least one other pre-1640 play manuscript, <em>The\\n                        Wizard</em> (British Library Additional 10306), carries a note that it\\n                    was removed from Dulwich College by David Garrick. How many others Garrick\\n                    removed is not yet known, but it is likely that nearly all of the one hundred\\n                    play manuscripts donated to Dulwich College by Cartwright were eventually, and\\n                    indirectly, donated or auctioned to public and private libraries throughout the\\n                    UK and the USA, where they remain.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><div class=\\"footnotes\\"><h3>Footnotes</h3><dl><dt id=\\"fn01\\">1.</dt><dd>On such directions, see Alan C. Dessen and Leslie Thomson,\\n                    <em>A Dictionary of Stage Directions in English Drama, 1580-1642.\\n                        </em> (Cambridge: Cambridge University Press, 1999). <a href=\\"#fnLink01\\" class=\\"back\\">Back to context...</a></dd></dl></div><!--CTPL_FOOTNOTES ENDS--></div>"}]	MSS 20
29	[{"id": "5715d8ce-a71f-4ec7-a654-953f68d508b4", "type": "paragraph", "value": "<div xmlns=\\"http://www.w3.org/1999/xhtml\\" id=\\"mainContent\\"><!--CTPL_PAGEHEAD STARTS--><div class=\\"pageHeader\\"><div class=\\"t01\\"><h1></h1></div></div><!--CTPL_PAGEHEAD ENDS--><!--CTPL_TOC1 STARTS--><!--CTPL_TOC1 ENDS--><!--CTPL_CONTENT STARTS-->\\n    \\n    \\n        \\n            \\n            \\n                <h2 id=\\"idm140057748159424\\">MSS 9, 32r (<a href=\\"/images/MSS-9/032r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/032r</a>)</h2>\\n                <p>While Philip Henslowe\\u2019s Diary records an extraordinary professional life, Edward\\n                    Alleyn\\u2019s Diary records a largely ordinary, and occasionally extraordinary,\\n                    private life. In his Diary, Alleyn documents nearly every day from September 29,\\n                    1617 to October 1, 1622, long after his retirement from acting. He illustrates\\n                    how he lived his life on a daily basis: where he travelled, whom he knew and\\n                    dealt with, what he ate (as well as how and where he ate it), what he and his\\n                    wife Joan wore, and even what medicines they took. Thus the Diary reveals\\n                    aspects of his domestic life and household, his social and political circle, his\\n                    personal friends and professional contacts, and how he spent his considerable\\n                    wealth.</p>\\n                <p>Alleyn probably purchased the Diary as an bound book of blank pages (its tight\\n                    modern binding does not allow for further study). Unlike his Memorandum Book\\n                    (MSS 8), the tall and heavy Diary could not have been carried in Alleyn\\u2019s\\n                    pocket. At the top of each page, Alleyn writes out a heading with the month and\\n                    year (using the \\u2018old style\\u2019 calendar), with the day written out flush left with the astrological symbol for that day of the week,\\n                    followed by a detailed entry. Flush right, he provides three main columns to\\n                    record pound, shilling and pence expenses. Some expenses are broken down into\\n                    three extra columns of figures to the left of the main columns (for example, for\\n                    his wife\\u2019s clothing expenses on May 7). At the end of each page (and sometimes\\n                    elswhere), he tallies up the \\u2018some\\u2019, or sum, in order to keep a running account.\\n                    He calls attention to particular entries with his drawing of a hand with a pointed index finger, either to the left or\\n                    right of the date.</p>\\n                <p>Alleyn lists expenses for an astonishingly wide variety of goods and services,\\n                    including the acquisition and maintenance of land, buildings and gardens, the\\n                    care of livestock (including pigeons), and the purchase and preparation of food\\n                    (especially for dinner parties), as well as the costs of everyday household\\n                    items. For example, here he notes that \\u2018li\\u2019 (i.e., one pound) of sugar cost him 1\\n                    shilling. His purchase of screws (\\u2018skrwes\\u2019), binding rods, leather stirrups,\\n                    herbs and seeds appear alongside those of various types of clothing and\\n                    textiles\\u2014including whalebone for Joan\\u2019s \\u2018bodyes\\u2019 (i.e. bodice). On May 7 he has\\n                    itemised his expense of \\u00a31 17s 11d for the coats to be worn by the \\u2018poore\\n                    schollers\\u2019, probably at the opening in September of Dulwich College, where\\n                    Alleyn will provide them with with a free education. His wife\\u2019s red petticoat\\n                    with expensive black velvet and his cloth jerkin and a cloak with silk basting\\n                    may also have been ordered for the College\\u2019s opening. Joyous celebrations of\\n                    birthdays, wedding anniversaries, and religious feast days are particularly\\n                    noted in the Diary, as on May 16, Whitsunday (i.e. Pentecost), when he and his\\n                    wife invited to dinner the poor, for whom he provided almshouses, which still\\n                    stand today alongside the Chapel in Dulwich in which Alleyn and Joan are buried.</p>\\n                <p>Alleyn also itemises his frequent travel to London from his home in Dulwich,\\n                    including the cost of crossing the Thames by ferry from the south to the north\\n                    bank. On May 10, for example, he travelled by horse to Gray\\u2019s Inn, near Holborn,\\n                    at the cost of 4d; an added expense is for \\u2018horse-standing\\u2019 (i.e. holding a\\n                    horse), as on May 15, when he paid Matthias 1s. Throughout, Alleyn cites dinners\\n                    at a number of pubs, whose locations, often near the playhouses, he specifies.\\n                    Yet other entries record his receipt of rent for the Fortune Theatre and other\\n                    leased properties, as well as visits to theatres such as the Red Bull, where on\\n                    October 3, 1617, he received the sum of \\u00a33 6s 4d as his share in the play <em>The Younger Brother</em> (<a href=\\"/images/MSS-9/002r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/002r</a>). He maintained contact with his\\n                    colleagues and collaborators in the theatre, for example, dining frequently over\\n                    the years with the actor Charles Massey.</p>\\n                <p>Not least of Alleyn\\u2019s expenditure was on the writing and use of manuscripts. He\\n                    often lists the full costs of having various documents copied, engrossed and\\n                    enrolled in Chancery and elsewhere, with prices ranging from 8 to 12 pence per\\n                    page, as well as what he has paid for a ream of paper (4s 4d on one occasion).\\n                    He also refers to the \\u2018fayer copies\\u2019 that he is having made (adding yet one more\\n                    example of the contemporary use of the term, as distinct from \\u2018foul papers\\u2019).\\n                    Alleyn\\u2019s friendship and compassion stretched beyond his former theatrical\\n                    colleagues, for he names at least one scrivener, \\u2018Bowlton\\u2019, who has been\\n                    incarcerated for debt in the Marshalsea prison and has appealed to Alleyn for\\n                    relief. Alleyn eases Bowlton\\u2019s \\u2018great povertye\\u2019 by sending him 10s (<a href=\\"/images/MSS-9/031r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/031r</a>).</p>\\n                <p>Alleyn apparently wielded considerable influence not only over those who broke\\n                    laws but those who made and enforced them. He notes on a number of occasions\\n                    that he dined with Privy Councillors and their clerks before, as well as after,\\n                    they ruled on his own cases in the Star Chamber, as on October 31, 1617 when he\\n                    \\u2018went to London to ye Lord Treasurers, supper att youngs ordinary [pub] with ye\\n                    starr chamber men\\u2019 (<a href=\\"/images/MSS-9/003v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/003v</a>). Alleyn also admits to manipulating the legal\\n                    system in more minor ways, for example by giving 5s to a bailiff on December 19,\\n                    1617 \\u2018in gratuitie for keeping me off Juries\\u2019 (<a href=\\"/images/MSS-9/005v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/005v</a>).</p>\\n                <p>In fact, the Diary suggests that Alleyn possessed the sort of prestige and\\n                    stature that ambassadors, clerics, and government officials recognised and,\\n                    perhaps, sought to share. At the very least, he was a popular companion or\\n                    guest, whether of the Mayor of London or the notorious Spanish Ambassador, Count\\n                    Gondomar. Alleyn records his acquisition of books, on theology, witchcraft and\\n                    languages, for example, and paintings, of Plantagenet kings, as well as his\\n                    visits to the collections of others, including Thomas Howard, Earl of Arundel,\\n                    who on April 17, 1618 showed Alleyn \\u2018all His statues &amp; picktures that came\\n                    from Italy\\u2019 (<a href=\\"/images/MSS-9/013r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/013r</a>).</p>\\n                <p>Alleyn\\u2019s other invitations, either in his official capacity as the master of\\n                    blood sports or as a private individual, were to even more prestigious places,\\n                    ranging from the Bishop of Westminster\\u2019s palace in the Clink to Greenwich and\\n                    Whitehall Palaces and other residences of King James I. On July 13, 1618, Alleyn\\n                    rode \\u2018to wansted wher ye markques off buckinghame [George Villiers, the King\\u2019s\\n                    favourite] vndertooke ye Kings hand\\u2019 for him on the letters patent for Dulwich\\n                    College (<a href=\\"/images/MSS-9/018r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/018r</a>). Alleyn still had to negotiate the College\\u2019s tax status with\\n                    Sir Francis Bacon, the Lord Chancellor, but finally on May 27, 1619, Alleyn\\n                    reported that he \\u2018rode to grenewich &amp; gott ye King\\u2019s Hand\\u2019 (<a href=\\"/images/MSS-9/032v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/032v</a>).\\n                    Bacon\\u2019s signature as a Dulwich College Governor on the Foundation Deed, Muniment\\n                    584 (<a href=\\"/images/Muniments-Series-3/Group-584/01r.html\\" class=\\"int\\" target=\\"_blank\\">mun-3/584/01r</a>), and his frequent presence in the Diary on less formal\\n                    occasions testify to Alleyn\\u2019s ability to maintain personal friendships with some\\n                    of the King\\u2019s most trusted officials.</p>\\n                <p>The Diary was also a place for Alleyn to record those remarkable historical\\n                    events to which he had a personal, and familiar, connection, as on January 12,\\n                    1619 when Whitehall Palace burned down (<a href=\\"/images/MSS-9/027v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/027v</a>); he had often performed in its\\n                    Banqueting Hall. On March 1, 1619, he tersely writes in the margin, \\u20184 in ye\\n                    morning q. Ann died\\u2019 (<a href=\\"/images/MSS-9/029r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/029r</a>); on 6 April, he explains: \\u2018[I went] with my wife to\\n                    somersett Howse to see ye Hearse of Queen Anne\\u2019 (<a href=\\"/images/MSS-9/031v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/031v</a>). In the page\\n                    illustrated here, he carefully states on May 13: \\u2018memorandum; the quens funeral\\n                    was this day, after diner my wife &amp; I went to see itt\\u2019. Given Alleyn\\u2019s role\\n                    as actor-manager of the Queen\\u2019s Men, and his frequent performances at court over\\n                    the years in front of Anne, this would have been a poignant day for him. But\\n                    also apparent here is Alleyn\\u2019s sense that his Diary was a witness to history.</p>\\n                <p>Numerous other notable figures come to life in the pages of Alleyn\\u2019s Diary,\\n                    including John Taylor the Water Poet, Sir Robert Sidney, brother of Sir Philip\\n                    Sidney, and John Donne, whom Alleyn heard preach in Camberwell on three\\n                    occasions. Alleyn also records going to dinner on September 4, 1622 with a group\\n                    of friends including Donne\\u2019s \\u2018dafter\\u2019, that is, his daughter Constance\\n                    (<a href=\\"/images/MSS-9/061r.html\\" class=\\"int\\" target=\\"_blank\\">MSS-9/061r</a>). About a year later, and five months after the death of Joan, Alleyn\\n                    married Constance, who was nearly forty years his junior. Donne\\u2019s apparent\\n                    refusal to pay Constance\\u2019s dowry, called by Alleyn in a draft letter to Donne an\\n                    \\u2018vnkind vnexspeckted and vndeserved denial of yt common curtesie afforded to a\\n                    frend\\u2019 (<a href=\\"/images/MSS-3/102/01v.html\\" class=\\"int\\" target=\\"_blank\\">MSS-3/102/01v</a>), caused a breach between Alleyn and Donne.\\n                    Even such breaches allow us to connect the world of the early modern theatre\\n                    with the world outside it, bringing both of them into vivid focus. With its\\n                    minutiae and richness of detail, The Diary of Edward Alleyn is a remarkable\\n                    bridge between and testament to those worlds.</p>\\n            \\n        \\n    \\n<!--CTPL_CONTENT ENDS--><!--CTPL_FOOTNOTES STARTS--><!--CTPL_FOOTNOTES ENDS--></div>"}]	MSS 9, 32r
11	[{"id": "140ed86d-e0f7-4291-abab-3299664ce625", "type": "paragraph", "value": "<p></p><h2>Front Contents</h2><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><h2>Heading 2</h2><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><h3>Heading 3</h3><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><h4>Heading 4</h4><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><p>Heading 5</p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><p>Heading 6</p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><h2>Right hand content</h2><p>Right hand content is on for the site. The exceptions are: <a href=\\"/.html\\">home</a>, the first page of <a href=\\"//.html\\">ng003</a>, the group g3 in filebase which consists of the type02 pages and the group g3_01 in filebase which consists of the type01 pages surrounding type02, ie <a href=\\"/.html\\">type02 index</a> and following. <a href=\\"/.html\\">Test_II_01</a>, is defined as on in the xml file, overriding the off stated in filebase of the group g3.</p><h2>Links</h2><p>External to the site:</p><ul><li>Link to an external site, <a href=\\"http://www.google.com\\">the google search engine</a>. Default in the same window.</li><li>Link to an external site, <a href=\\"http://www.google.com\\">the google search engine</a>, in an external window</li><li>Link to the same external site <a href=\\"http://www.google.com\\">http://www.google.com</a>, this time using &lt;xptr&gt;</li><li>Link to an <a href=\\"mailto:paul.spence@kcl.ac.uk\\">email</a></li></ul><p>Internal to the site:</p><ul><li>Link to <a href=\\"/.html\\">another page</a> internal to the site (type01)</li><li>Link to <a href=\\"/.html\\">another page</a> internal to the site and in new window (type01)</li><li>Link to <a href=\\"/.html\\">another page</a> internal to the site (type02)</li><li>Link to <a href=\\"/ng003/ng003_07.html\\">another page</a> internal to the site (type03)</li><li>Link to <a href=\\"/.html\\">another page</a> internal to the site (type04)</li></ul><p>Internal to the page:</p><ul><li>Link <a href=\\"#anchor1\\">internal to this page</a>, using a pointer to an anchor</li><li>Link <a href=\\"#anchor2\\">internal to this page</a>, using a pointer to a paragraph</li><li>Link <a href=\\"#anchor3\\">internal to this page</a>, using a pointer to a division header</li></ul><h2>Box Header</h2><p>Box paragraph</p><ul><li>list item 1</li><li>list item 2</li><li>list item 3</li></ul><h2>Normal text with footnotes</h2><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus.<a href=\\"#fn01\\">1</a> Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo.<a href=\\"#fn02\\">2</a> Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus.</p><p>Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.<a href=\\"#fn03\\">3</a></p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus.<a href=\\"#fn04\\">4</a> Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis.<a href=\\"#fn05\\">5</a> Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.<a href=\\"#fn06\\">6</a></p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus.<a href=\\"#fn07\\">7</a> Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.<a href=\\"#fn08\\">8</a></p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.<a href=\\"#fn09\\">9</a> Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><p><b>Fusce gravida blandit turpis.</b> Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. <i>Phasellus ultrices libero non lectus.</i> In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. <b><i>Curabitur lectus turpis</i></b>, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><h3>Pre-formatted text</h3><p>&lt;xsl:when test=&quot;@rend=&#x27;pre&#x27;&quot;&gt; &lt;pre&gt; &lt;xsl:apply-templates/&gt; &lt;/pre&gt; &lt;/xsl:when&gt;</p><h2>Back Contents: Bibliography</h2><h3>Primary</h3><ul><li>AuthorFirstName, <i>article title</i>, <i>journal title</i>, pp abc-xyz.</li><li>And a book with a <i>title</i></li><li>And a book with a <i>title</i></li></ul><h3>Secondary</h3><ul><li>And a book with a <i>title</i></li><li>And a book with a <i>title</i></li><li>And a book with a <i>title</i></li></ul><h2>Back Contents: Glossary</h2><p>Glossary label headGlossary<i> item</i> head label1item1 label2item2 label3item4</p><h3>Footnotes</h3><p>1.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\\"#fnLink01\\">Back to context...</a>2.Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. <a href=\\"#fnLink02\\">Back to context...</a>3.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. <a href=\\"#fnLink03\\">Back to context...</a>4.Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. <a href=\\"#fnLink04\\">Back to context...</a>5.Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. <a href=\\"#fnLink05\\">Back to context...</a>6.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. <a href=\\"#fnLink06\\">Back to context...</a>7.Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. <a href=\\"#fnLink07\\">Back to context...</a>8.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. <a href=\\"#fnLink08\\">Back to context...</a>9.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. <a href=\\"#fnLink09\\">Back to context...</a></p>"}]	
14	[{"id": "a3484b22-1df6-404f-845b-5f3189da7fe9", "type": "paragraph", "value": "<p></p><h2>Introduction</h2><p>In order to understand the richness and scope of the images in the Henslowe Alleyn electronic archive, members of the Henslowe-Alleyn Digitisation Project have contributed \\u2018digital essays\\u2019 on a representative sample of these wide-ranging documents. Included are essays on poems, personal letters, private leases and deeds, public or government indentures and letters patent, \\u2018diaries\\u2019 or account books, a theatrical part, a theatrical plot, and a play manuscript, all of which reveal numerous aspects of theatrical production and performance.</p><p>More broadly, all of these documents are unique and invaluable witnesses to literary, theatrical, social and economic history in the English early modern age, in which theatre entrepreneurs such as Henslowe and Alleyn could, in effect, collaborate with monarchs, privy councillors, aristocrats, and religious and social leaders, as well as everyday colleagues in the theatre industry such as dramatists, actors, tailors, carpenters, tradesmen, scriveners and even the &#x27;watermen&#x27; who rowed playhouse customers across the Thames. The papers of Henslowe and Alleyn record both ordinary and extraordinary daily life, in which the acts of contracting plays, inspecting new costumes, bailing actors from debtors&#x27; prison, and sharing festive meals with &#x27;poor brethren&#x27; co-existed with performing at court for the monarch and dining at the homes of many of the most influential figures in the kingdom. These manuscripts therefore demonstrate that there was not always a strict or hierarchical division between those seeking patronage at the most basic level and those offering it at the highest level.</p><p>Above all, these digital essays suggest that rather than being powerless, marginalised or scandalous, early modern theatre professionals moved successfully among and prospered in all political, economic and social spheres. Thus, these essays offer us the strongest possible documentary evidence that early modern English drama and performance did not simply reflect culture but create it.</p><h2>List of Essays</h2><p>George Warner and Francis Bickely catalogued the Henslowe-Alleyn papers by topic in numerous volumes of manuscripts; for these catalogues, see series 1 and 2 of <i>The Catalogue of the Manuscripts and Muniments of Alleyn\\u2019s College of God\\u2019s Gift at Dulwich</i> (London, 1881, 1903). The digital essays are presented in the order of the catalogue number of the documents under discussion.</p><p>Manuscripts in MSS 1</p><ul><li>\\u2018W.P\\u2019s Letter to Edward Alleyn with a Copy of Verses Addressed to \\u2018sweete Nedd\\u2019, by H. R. Woudhuysen.</li><li>\\u2018An Inventory of Theatrical Apparel (c. 1601/2)\\u2019, by S. P. Cerasano.</li><li>\\u2018A Letter from Nathan Field, Robert Daborne and Philip Massinger to Philip Henslowe (c. 1614)\\u2019, by R. A. Foakes and Grace Ioppolo.</li><li>\\u2018Robert Daborne&#x27;s Contracts to Write Plays for Philip Henslowe (1613)\\u2019, by Grace Ioppolo.</li><li>\\u2018Robert Daborne&#x27;s Foul Papers and Fair Copies (1613)&#x27;, by Grace Ioppolo.</li><li>\\u2018Ben Jonson\\u2019s Autograph Fair Copies of Two Poems\\u2019, by Peter Beal.</li><li>The \\u2018Part\\u2019 of Orlando in Robert Greene\\u2019s play <i>Orlando Furioso</i>&#x27;, by R. A. Foakes.</li></ul><p>Manuscripts in MSS 2</p><ul><li>\\u2018A Draft of the Royal Patent for the Mastership of the Game of Bears, Bulls, and Mastiff Dogs (November 24, 1604)\\u2019, by S. P. Cerasano.</li></ul><p>Manuscripts in MSS 7</p><ul><li>\\u2018Henslowe\\u2019s Diary (1591-1609)\\u2019, by S. P. Cerasano.</li></ul><p>Manuscripts in MSS 9</p><ul><li>\\u2018The Diary of Edward Alleyn (1617-1622)\\u2019, by Grace Ioppolo.</li></ul><p>Manuscripts in MSS 19</p><ul><li>\\u2018The &#x27;Platt&#x27; (or Plot) of <i>The Second Part of the Seven Deadly Sins</i>\\u2019, by R. A. Foakes.</li></ul><p>Manuscripts in MSS 20</p><ul><li>\\u2018The Manuscript of <i>The Telltale</i>\\u2019, by R. A. Foakes, Peter Beal and Grace Ioppolo.</li></ul><p>Muniments, Series 1 and 3</p><ul><li>\\u2018The Deed of Partnership in the Rose Playhouse (January 10, 1587)\\u2019, by Julian Bowsher and S. P. Cerasano.</li><li>\\u2018The Contract for the Fortune Playhouse (1600)\\u2019, by R. A. Foakes.</li><li>\\u2018The Foundation Deed of God\\u2019s Gift College (1619)\\u2019, by Jan Piggott.</li></ul>"}]	
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	wagtailcore	page
2	wagtailadmin	admin
3	wagtaildocs	document
4	wagtailimages	image
5	admin	logentry
6	auth	permission
7	auth	group
8	auth	user
9	contenttypes	contenttype
10	sessions	session
11	wagtailcore	groupcollectionpermission
12	wagtailcore	collection
13	wagtailcore	grouppagepermission
14	wagtailcore	pageviewrestriction
15	wagtailcore	site
16	wagtailcore	collectionviewrestriction
17	wagtailcore	pagerevision
18	wagtailusers	userprofile
19	wagtailimages	rendition
20	wagtailembeds	embed
21	wagtailredirects	redirect
22	wagtailforms	formsubmission
23	taggit	taggeditem
24	taggit	tag
25	wagtailsearch	querydailyhits
26	wagtailsearch	query
27	cms	homepage
28	cms	catalogue
29	cms	image
30	cms	catalogueentry
31	cms	richtextpage
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 31, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-10-22 15:34:54.750441+00
2	auth	0001_initial	2018-10-22 15:34:54.834755+00
3	admin	0001_initial	2018-10-22 15:34:54.870412+00
4	admin	0002_logentry_remove_auto_add	2018-10-22 15:34:54.881222+00
5	contenttypes	0002_remove_content_type_name	2018-10-22 15:34:54.904897+00
6	auth	0002_alter_permission_name_max_length	2018-10-22 15:34:54.917563+00
7	auth	0003_alter_user_email_max_length	2018-10-22 15:34:54.934257+00
8	auth	0004_alter_user_username_opts	2018-10-22 15:34:54.953713+00
9	auth	0005_alter_user_last_login_null	2018-10-22 15:34:54.965174+00
10	auth	0006_require_contenttypes_0002	2018-10-22 15:34:54.967632+00
11	auth	0007_alter_validators_add_error_messages	2018-10-22 15:34:54.977175+00
12	auth	0008_alter_user_username_max_length	2018-10-22 15:34:54.995503+00
13	auth	0009_alter_user_last_name_max_length	2018-10-22 15:34:55.006145+00
14	wagtailcore	0001_initial	2018-10-22 15:34:55.249715+00
15	wagtailcore	0002_initial_data	2018-10-22 15:34:55.251717+00
16	wagtailcore	0003_add_uniqueness_constraint_on_group_page_permission	2018-10-22 15:34:55.253593+00
17	wagtailcore	0004_page_locked	2018-10-22 15:34:55.255348+00
18	wagtailcore	0005_add_page_lock_permission_to_moderators	2018-10-22 15:34:55.25719+00
19	wagtailcore	0006_add_lock_page_permission	2018-10-22 15:34:55.25902+00
20	wagtailcore	0007_page_latest_revision_created_at	2018-10-22 15:34:55.260864+00
21	wagtailcore	0008_populate_latest_revision_created_at	2018-10-22 15:34:55.262737+00
22	wagtailcore	0009_remove_auto_now_add_from_pagerevision_created_at	2018-10-22 15:34:55.264569+00
23	wagtailcore	0010_change_page_owner_to_null_on_delete	2018-10-22 15:34:55.26635+00
24	wagtailcore	0011_page_first_published_at	2018-10-22 15:34:55.268066+00
25	wagtailcore	0012_extend_page_slug_field	2018-10-22 15:34:55.269765+00
26	wagtailcore	0013_update_golive_expire_help_text	2018-10-22 15:34:55.27155+00
27	wagtailcore	0014_add_verbose_name	2018-10-22 15:34:55.273351+00
28	wagtailcore	0015_add_more_verbose_names	2018-10-22 15:34:55.275136+00
29	wagtailcore	0016_change_page_url_path_to_text_field	2018-10-22 15:34:55.276987+00
30	wagtailredirects	0001_initial	2018-10-22 15:34:55.305005+00
31	wagtailredirects	0002_add_verbose_names	2018-10-22 15:34:55.340309+00
32	wagtailredirects	0003_make_site_field_editable	2018-10-22 15:34:55.358295+00
33	wagtailredirects	0004_set_unique_on_path_and_site	2018-10-22 15:34:55.390941+00
34	wagtailredirects	0005_capitalizeverbose	2018-10-22 15:34:55.485504+00
35	wagtailredirects	0006_redirect_increase_max_length	2018-10-22 15:34:55.50972+00
36	wagtailforms	0001_initial	2018-10-22 15:34:55.541341+00
37	wagtailforms	0002_add_verbose_names	2018-10-22 15:34:55.56543+00
38	wagtailforms	0003_capitalizeverbose	2018-10-22 15:34:55.589734+00
39	wagtailcore	0017_change_edit_page_permission_description	2018-10-22 15:34:55.609963+00
40	wagtailcore	0018_pagerevision_submitted_for_moderation_index	2018-10-22 15:34:55.640577+00
41	wagtailcore	0019_verbose_names_cleanup	2018-10-22 15:34:55.784692+00
42	wagtailcore	0020_add_index_on_page_first_published_at	2018-10-22 15:34:55.81116+00
43	wagtailcore	0021_capitalizeverbose	2018-10-22 15:34:56.18128+00
44	wagtailcore	0022_add_site_name	2018-10-22 15:34:56.196821+00
45	wagtailcore	0023_alter_page_revision_on_delete_behaviour	2018-10-22 15:34:56.21942+00
46	wagtailcore	0024_collection	2018-10-22 15:34:56.233014+00
47	wagtailcore	0025_collection_initial_data	2018-10-22 15:34:56.251552+00
48	wagtailcore	0026_group_collection_permission	2018-10-22 15:34:56.306846+00
49	wagtailcore	0027_fix_collection_path_collation	2018-10-22 15:34:56.338999+00
50	wagtailcore	0024_alter_page_content_type_on_delete_behaviour	2018-10-22 15:34:56.361083+00
51	wagtailcore	0028_merge	2018-10-22 15:34:56.363637+00
52	wagtailcore	0029_unicode_slugfield_dj19	2018-10-22 15:34:56.378502+00
53	wagtailcore	0030_index_on_pagerevision_created_at	2018-10-22 15:34:56.404254+00
54	wagtailcore	0031_add_page_view_restriction_types	2018-10-22 15:34:56.55752+00
55	wagtailcore	0032_add_bulk_delete_page_permission	2018-10-22 15:34:56.575891+00
56	wagtailcore	0033_remove_golive_expiry_help_text	2018-10-22 15:34:56.619477+00
57	wagtailcore	0034_page_live_revision	2018-10-22 15:34:56.640991+00
58	wagtailcore	0035_page_last_published_at	2018-10-22 15:34:56.664952+00
59	wagtailcore	0036_populate_page_last_published_at	2018-10-22 15:34:56.690822+00
60	wagtailcore	0037_set_page_owner_editable	2018-10-22 15:34:56.725278+00
61	wagtailcore	0038_make_first_published_at_editable	2018-10-22 15:34:56.742657+00
62	wagtailcore	0039_collectionviewrestriction	2018-10-22 15:34:56.825867+00
63	wagtailcore	0040_page_draft_title	2018-10-22 15:34:56.887098+00
64	cms	0001_initial	2018-10-22 15:34:56.968843+00
65	cms	0002_richtextpage_subtitle	2018-10-22 15:34:56.994016+00
66	cms	0003_auto_20181011_1636	2018-10-22 15:34:57.142445+00
67	cms	0004_auto_20181011_1644	2018-10-22 15:34:57.185798+00
68	cms	0005_homepage_subtitle	2018-10-22 15:34:57.204979+00
69	sessions	0001_initial	2018-10-22 15:34:57.219841+00
70	taggit	0001_initial	2018-10-22 15:34:57.286515+00
71	taggit	0002_auto_20150616_2121	2018-10-22 15:34:57.298942+00
72	wagtailadmin	0001_create_admin_access_permissions	2018-10-22 15:34:57.336997+00
73	wagtaildocs	0001_initial	2018-10-22 15:34:57.371844+00
74	wagtaildocs	0002_initial_data	2018-10-22 15:34:57.426024+00
75	wagtaildocs	0003_add_verbose_names	2018-10-22 15:34:57.585137+00
76	wagtaildocs	0004_capitalizeverbose	2018-10-22 15:34:57.658403+00
77	wagtaildocs	0005_document_collection	2018-10-22 15:34:57.709003+00
78	wagtaildocs	0006_copy_document_permissions_to_collections	2018-10-22 15:34:57.763033+00
79	wagtaildocs	0005_alter_uploaded_by_user_on_delete_action	2018-10-22 15:34:57.790145+00
80	wagtaildocs	0007_merge	2018-10-22 15:34:57.795336+00
81	wagtaildocs	0008_document_file_size	2018-10-22 15:34:57.824236+00
82	wagtailembeds	0001_initial	2018-10-22 15:34:57.850429+00
83	wagtailembeds	0002_add_verbose_names	2018-10-22 15:34:57.856176+00
84	wagtailembeds	0003_capitalizeverbose	2018-10-22 15:34:57.861765+00
85	wagtailimages	0001_initial	2018-10-22 15:34:57.956406+00
86	wagtailimages	0002_initial_data	2018-10-22 15:34:58.007619+00
87	wagtailimages	0003_fix_focal_point_fields	2018-10-22 15:34:58.062244+00
88	wagtailimages	0004_make_focal_point_key_not_nullable	2018-10-22 15:34:58.119832+00
89	wagtailimages	0005_make_filter_spec_unique	2018-10-22 15:34:58.145289+00
90	wagtailimages	0006_add_verbose_names	2018-10-22 15:34:58.20845+00
91	wagtailimages	0007_image_file_size	2018-10-22 15:34:58.23513+00
92	wagtailimages	0008_image_created_at_index	2018-10-22 15:34:58.253584+00
93	wagtailimages	0009_capitalizeverbose	2018-10-22 15:34:58.370757+00
94	wagtailimages	0010_change_on_delete_behaviour	2018-10-22 15:34:58.398761+00
95	wagtailimages	0011_image_collection	2018-10-22 15:34:58.44877+00
96	wagtailimages	0012_copy_image_permissions_to_collections	2018-10-22 15:34:58.491104+00
97	wagtailimages	0013_make_rendition_upload_callable	2018-10-22 15:34:58.510118+00
98	wagtailimages	0014_add_filter_spec_field	2018-10-22 15:34:58.660715+00
99	wagtailimages	0015_fill_filter_spec_field	2018-10-22 15:34:58.687727+00
100	wagtailimages	0016_deprecate_rendition_filter_relation	2018-10-22 15:34:58.738378+00
101	wagtailimages	0017_reduce_focal_point_key_max_length	2018-10-22 15:34:58.766032+00
102	wagtailimages	0018_remove_rendition_filter	2018-10-22 15:34:58.804737+00
103	wagtailimages	0019_delete_filter	2018-10-22 15:34:58.812016+00
104	wagtailimages	0020_add-verbose-name	2018-10-22 15:34:58.831539+00
105	wagtailimages	0021_image_file_hash	2018-10-22 15:34:58.86275+00
106	wagtailsearch	0001_initial	2018-10-22 15:34:58.954442+00
107	wagtailsearch	0002_add_verbose_names	2018-10-22 15:34:59.019+00
108	wagtailsearch	0003_remove_editors_pick	2018-10-22 15:34:59.042049+00
109	wagtailusers	0001_initial	2018-10-22 15:34:59.076726+00
110	wagtailusers	0002_add_verbose_name_on_userprofile	2018-10-22 15:34:59.127737+00
111	wagtailusers	0003_add_verbose_names	2018-10-22 15:34:59.143544+00
112	wagtailusers	0004_capitalizeverbose	2018-10-22 15:34:59.211405+00
113	wagtailusers	0005_make_related_name_wagtail_specific	2018-10-22 15:34:59.236044+00
114	wagtailusers	0006_userprofile_prefered_language	2018-10-22 15:34:59.262501+00
115	wagtailusers	0007_userprofile_current_time_zone	2018-10-22 15:34:59.296861+00
116	wagtailusers	0008_userprofile_avatar	2018-10-22 15:34:59.324096+00
117	wagtailcore	0001_squashed_0016_change_page_url_path_to_text_field	2018-10-22 15:34:59.327448+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 117, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
dl9o4mecje7a46pkzd32yhqihxug17mj	NGZmODMzYWIwNjU3MzM3ODg3YzM3MmE4YWU5YjU1YmE1ZmJmNjI0NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjNjZGQzODRmN2EyYjAzNmI5YmYyODg4OGI4NTllZjI4NWE3ZGVhOWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2018-11-05 15:36:36.061382+00
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys  FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Data for Name: wagtailcore_collection; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailcore_collection (id, path, depth, numchild, name) FROM stdin;
1	0001	1	0	Root
\.


--
-- Name: wagtailcore_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailcore_collection_id_seq', 1, true);


--
-- Data for Name: wagtailcore_collectionviewrestriction; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailcore_collectionviewrestriction (id, restriction_type, password, collection_id) FROM stdin;
\.


--
-- Data for Name: wagtailcore_collectionviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailcore_collectionviewrestriction_groups (id, collectionviewrestriction_id, group_id) FROM stdin;
\.


--
-- Name: wagtailcore_collectionviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_collectionviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailcore_collectionviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_groupcollectionpermission; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailcore_groupcollectionpermission (id, collection_id, group_id, permission_id) FROM stdin;
1	1	1	2
2	1	2	2
3	1	1	3
4	1	2	3
5	1	1	5
6	1	2	5
7	1	1	6
8	1	2	6
\.


--
-- Name: wagtailcore_groupcollectionpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailcore_groupcollectionpermission_id_seq', 8, true);


--
-- Data for Name: wagtailcore_grouppagepermission; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailcore_grouppagepermission (id, permission_type, group_id, page_id) FROM stdin;
1	add	1	1
2	edit	1	1
3	publish	1	1
4	add	2	1
5	edit	2	1
6	lock	1	1
\.


--
-- Name: wagtailcore_grouppagepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailcore_grouppagepermission_id_seq', 6, true);


--
-- Data for Name: wagtailcore_page; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailcore_page (id, path, depth, numchild, title, slug, live, has_unpublished_changes, url_path, seo_title, show_in_menus, search_description, go_live_at, expire_at, expired, content_type_id, owner_id, locked, latest_revision_created_at, first_published_at, live_revision_id, last_published_at, draft_title) FROM stdin;
2	00010001	2	0	Welcome to your new Wagtail site!	home	t	f	/home/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N	Welcome to your new Wagtail site!
15	0001000300030001	4	0	The Deed of Partnership in the Rose Playhouse (January 10, 1587)	the-deed-of-partnership-in-the-rose-playhouse-january-10-1587	t	f	/home-3/digital-essays/the-deed-of-partnership-in-the-rose-playhouse-january-10-1587/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	The Deed of Partnership in the Rose Playhouse (January 10, 1587)
20	0001000300030006	4	0	The ‘Part’ of Orlando in Robert Greene’s play 	the-part-of-orlando-in-robert-greenes-play	t	f	/home-3/digital-essays/the-part-of-orlando-in-robert-greenes-play/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	The ‘Part’ of Orlando in Robert Greene’s play 
16	0001000300030002	4	0	Ben Jonson’s Autograph Fair Copies of Two Poems	ben-jonsons-autograph-fair-copies-of-two-poems	t	f	/home-3/digital-essays/ben-jonsons-autograph-fair-copies-of-two-poems/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	Ben Jonson’s Autograph Fair Copies of Two Poems
17	0001000300030003	4	0	W.P’s Letter to Edward Alleyn with a Copy of Verses Addressed to ‘sweete\n                    Nedd’	wps-letter-to-edward-alleyn-with-a-copy-of-verses-addressed-to-sweete-nedd	t	f	/home-3/digital-essays/wps-letter-to-edward-alleyn-with-a-copy-of-verses-addressed-to-sweete-nedd/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	W.P’s Letter to Edward Alleyn with a Copy of Verses Addressed to ‘sweete\n                    Nedd’
6	0001000300010001	4	0	Members of the Project	members-of-the-project	t	f	/home-3/about-the-project/members-of-the-project/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	Members of the Project
7	0001000300010002	4	0	Copyrights, Reproductions, and Permissions	copyrights-reproductions-and-permissions	t	f	/home-3/about-the-project/copyrights-reproductions-and-permissions/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	Copyrights, Reproductions, and Permissions
23	0001000300030009	4	0	A Draft of the Royal Patent for the Mastership of the Game of Bears, Bulls,\n                    and Mastiff Dogs (November 24, 1604)	a-draft-of-the-royal-patent-for-the-mastership-of-the-game-of-bears-bulls-and-mastiff-dogs-november-24-1604	t	f	/home-3/digital-essays/a-draft-of-the-royal-patent-for-the-mastership-of-the-game-of-bears-bulls-and-mastiff-dogs-november-24-1604/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	A Draft of the Royal Patent for the Mastership of the Game of Bears, Bulls,\n                    and Mastiff Dogs (November 24, 1604)
8	0001000300010003	4	0	About the Project	about-the-project	t	f	/home-3/about-the-project/about-the-project/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	About the Project
18	0001000300030004	4	0	Robert Daborne's Contracts to Write Plays for Philip Henslowe (1613)	robert-dabornes-contracts-to-write-plays-for-philip-henslowe-1613	t	f	/home-3/digital-essays/robert-dabornes-contracts-to-write-plays-for-philip-henslowe-1613/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	Robert Daborne's Contracts to Write Plays for Philip Henslowe (1613)
9	0001000300010004	4	0	The Scope of the Henslowe-Alleyn Digitisation Project	the-scope-of-the-henslowe-alleyn-digitisation-project	t	f	/home-3/about-the-project/the-scope-of-the-henslowe-alleyn-digitisation-project/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	The Scope of the Henslowe-Alleyn Digitisation Project
5	000100030001	3	5	About the Project	about-the-project	t	f	/home-3/about-the-project/		t		\N	\N	f	31	\N	f	2018-10-22 15:40:20.571231+00	2018-10-22 15:40:20.634352+00	2	2018-10-22 15:40:20.634352+00	About the Project
10	0001000300010005	4	0	The Scope of the Henslowe-Alleyn Papers	the-scope-of-the-henslowe-alleyn-papers	t	f	/home-3/about-the-project/the-scope-of-the-henslowe-alleyn-papers/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	The Scope of the Henslowe-Alleyn Papers
19	0001000300030005	4	0	The Contract for the Fortune Playhouse (1600)	the-contract-for-the-fortune-playhouse-1600	t	f	/home-3/digital-essays/the-contract-for-the-fortune-playhouse-1600/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	The Contract for the Fortune Playhouse (1600)
12	0001000300020001	4	0	A Brief History of Dulwich College	a-brief-history-of-dulwich-college	t	f	/home-3/example-simple-markup/a-brief-history-of-dulwich-college/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	A Brief History of Dulwich College
11	000100030002	3	2	Histories	example-simple-markup	t	f	/home-3/example-simple-markup/		t		\N	\N	f	31	\N	f	2018-10-22 15:40:38.872758+00	2018-10-22 15:40:38.926293+00	3	2018-10-22 15:40:38.926293+00	Histories
13	0001000300020002	4	0	 Brief Biographies of Philip Henlsowe and Edward Alleyn	brief-biographies-of-philip-henlsowe-and-edward-alleyn	t	f	/home-3/example-simple-markup/brief-biographies-of-philip-henlsowe-and-edward-alleyn/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	 Brief Biographies of Philip Henlsowe and Edward Alleyn
1	0001	1	2	Root	root	t	f	/		f		\N	\N	f	1	\N	f	\N	\N	\N	\N	Root
4	00010003	2	4	Home	home-3	t	f	/home-3/		t		\N	\N	f	27	\N	f	2018-10-22 15:40:10.602343+00	2018-10-22 15:40:10.664769+00	1	2018-10-22 15:40:10.664769+00	Home
21	0001000300030007	4	0	The Foundation Deed of God’s Gift College (1619)	the-foundation-deed-of-gods-gift-college-1619	t	f	/home-3/digital-essays/the-foundation-deed-of-gods-gift-college-1619/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	The Foundation Deed of God’s Gift College (1619)
26	000100030003000C	4	0	A Letter from Nathan Field, Robert Daborne and Philip Massinger to Philip\n                    Henslowe (c. 1614)	a-letter-from-nathan-field-robert-daborne-and-philip-massinger-to-philip-henslowe-c-1614	t	f	/home-3/digital-essays/a-letter-from-nathan-field-robert-daborne-and-philip-massinger-to-philip-henslowe-c-1614/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	A Letter from Nathan Field, Robert Daborne and Philip Massinger to Philip\n                    Henslowe (c. 1614)
22	0001000300030008	4	0	An Inventory of Theatrical Apparel (c. 1601/2)	an-inventory-of-theatrical-apparel-c-16012	t	f	/home-3/digital-essays/an-inventory-of-theatrical-apparel-c-16012/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	An Inventory of Theatrical Apparel (c. 1601/2)
24	000100030003000A	4	0	Henslowe’s Diary (1591-1609)	henslowes-diary-1591-1609	t	f	/home-3/digital-essays/henslowes-diary-1591-1609/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	Henslowe’s Diary (1591-1609)
25	000100030003000B	4	0	The 'Platt' (or Plot) of The Second Part of the Seven Deadly Sins	the-platt-or-plot-of-the-second-part-of-the-seven-deadly-sins	t	f	/home-3/digital-essays/the-platt-or-plot-of-the-second-part-of-the-seven-deadly-sins/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	The 'Platt' (or Plot) of The Second Part of the Seven Deadly Sins
27	000100030003000D	4	0	Robert Daborne's Foul Papers and Fair Copies (1613)	robert-dabornes-foul-papers-and-fair-copies-1613	t	f	/home-3/digital-essays/robert-dabornes-foul-papers-and-fair-copies-1613/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	Robert Daborne's Foul Papers and Fair Copies (1613)
28	000100030003000E	4	0	The Manuscript of 	the-manuscript-of	t	f	/home-3/digital-essays/the-manuscript-of/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	The Manuscript of 
29	000100030003000F	4	0	The Diary of Edward Alleyn (1617-1622)	the-diary-of-edward-alleyn-1617-1622	t	f	/home-3/digital-essays/the-diary-of-edward-alleyn-1617-1622/		f		\N	\N	f	31	\N	f	\N	\N	\N	\N	The Diary of Edward Alleyn (1617-1622)
42	00010003000400030005	5	0	Page 003r	page-003r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-003r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 003r
56	0001000300040003000J	5	0	Page 010r	page-010r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-010r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 010r
43	00010003000400030006	5	0	Page 003v	page-003v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-003v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 003v
32	00010003000400010001	5	0	45	45	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-5/45/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	45
33	00010003000400010002	5	0	47	47	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-5/47/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	47
31	0001000300040001	4	3	MSS 5	mss-5	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-5/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	MSS 5
34	00010003000400010003	5	0	48	48	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-5/48/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	48
51	0001000300040003000E	5	0	Page 007v	page-007v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-007v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 007v
44	00010003000400030007	5	0	Page 004r	page-004r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-004r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 004r
35	0001000300040002	4	1	Miscellaneous Images	miscellaneous-images	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/miscellaneous-images/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	Miscellaneous Images
36	00010003000400020001	5	0	1	1	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/miscellaneous-images/1/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	1
14	000100030003	3	15	Digital Essays	digital-essays	t	f	/home-3/digital-essays/		t		\N	\N	f	31	\N	f	2018-10-22 15:40:46.666851+00	2018-10-22 15:40:46.721074+00	4	2018-10-22 15:40:46.721074+00	Digital Essays
38	00010003000400030001	5	0	Page 001r	page-001r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-001r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 001r
45	00010003000400030008	5	0	Page 004v	page-004v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-004v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 004v
39	00010003000400030002	5	0	Page 001v	page-001v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-001v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 001v
40	00010003000400030003	5	0	Page 002r	page-002r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-002r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 002r
41	00010003000400030004	5	0	Page 002v	page-002v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-002v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 002v
52	0001000300040003000F	5	0	Page 008r	page-008r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-008r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 008r
46	00010003000400030009	5	0	Page 005r	page-005r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-005r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 005r
47	0001000300040003000A	5	0	Page 005v	page-005v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-005v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 005v
48	0001000300040003000B	5	0	Page 006r	page-006r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-006r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 006r
53	0001000300040003000G	5	0	Page 008v	page-008v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-008v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 008v
49	0001000300040003000C	5	0	Page 006v	page-006v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-006v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 006v
57	0001000300040003000K	5	0	Page 010v	page-010v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-010v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 010v
50	0001000300040003000D	5	0	Page 007r	page-007r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-007r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 007r
54	0001000300040003000H	5	0	Page 009r	page-009r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-009r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 009r
55	0001000300040003000I	5	0	Page 009v	page-009v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-009v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 009v
60	0001000300040003000N	5	0	Page 012r	page-012r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-012r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 012r
58	0001000300040003000L	5	0	Page 011r	page-011r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-011r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 011r
65	0001000300040003000S	5	0	Page 014v	page-014v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-014v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 014v
59	0001000300040003000M	5	0	Page 011v	page-011v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-011v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 011v
61	0001000300040003000O	5	0	Page 012v	page-012v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-012v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 012v
62	0001000300040003000P	5	0	Page 013r	page-013r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-013r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 013r
63	0001000300040003000Q	5	0	Page 013v	page-013v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-013v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 013v
64	0001000300040003000R	5	0	Page 014r	page-014r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-014r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 014r
66	0001000300040003000T	5	0	Page 015r	page-015r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-015r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 015r
67	0001000300040003000U	5	0	Page 015v	page-015v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-015v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 015v
68	0001000300040003000V	5	0	Page 016r	page-016r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-016r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 016r
69	0001000300040003000W	5	0	Page 016v	page-016v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-016v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 016v
30	000100030004	3	12	A Catalogue of the Manuscript and Muniment Images	a-catalogue-of-the-manuscript-and-muniment-images	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/		t		\N	\N	f	28	\N	f	2018-10-22 15:40:54.265893+00	2018-10-22 15:40:54.32292+00	5	2018-10-22 15:40:54.32292+00	A Catalogue of the Manuscript and Muniment Images
70	0001000300040003000X	5	0	Page 017r	page-017r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-017r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 017r
71	0001000300040003000Y	5	0	Page 017v	page-017v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-017v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 017v
83	0001000300040003001A	5	0	Page 023v	page-023v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-023v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 023v
72	0001000300040003000Z	5	0	Page 018r	page-018r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-018r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 018r
73	00010003000400030010	5	0	Page 018v	page-018v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-018v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 018v
99	0001000300040003001Q	5	0	Page 031v	page-031v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-031v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 031v
74	00010003000400030011	5	0	Page 019r	page-019r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-019r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 019r
84	0001000300040003001B	5	0	Page 024r	page-024r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-024r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 024r
75	00010003000400030012	5	0	Page 019v	page-019v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-019v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 019v
76	00010003000400030013	5	0	Page 020r	page-020r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-020r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 020r
91	0001000300040003001I	5	0	Page 027v	page-027v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-027v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 027v
77	00010003000400030014	5	0	Page 020v	page-020v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-020v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 020v
85	0001000300040003001C	5	0	Page 024v	page-024v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-024v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 024v
78	00010003000400030015	5	0	Page 021r	page-021r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-021r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 021r
79	00010003000400030016	5	0	Page 021v	page-021v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-021v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 021v
80	00010003000400030017	5	0	Page 022r	page-022r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-022r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 022r
86	0001000300040003001D	5	0	Page 025r	page-025r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-025r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 025r
81	00010003000400030018	5	0	Page 022v	page-022v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-022v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 022v
96	0001000300040003001N	5	0	Page 030r	page-030r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-030r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 030r
82	00010003000400030019	5	0	Page 023r	page-023r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-023r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 023r
92	0001000300040003001J	5	0	Page 028r	page-028r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-028r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 028r
87	0001000300040003001E	5	0	Page 025v	page-025v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-025v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 025v
88	0001000300040003001F	5	0	Page 026r	page-026r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-026r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 026r
89	0001000300040003001G	5	0	Page 026v	page-026v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-026v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 026v
90	0001000300040003001H	5	0	Page 027r	page-027r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-027r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 027r
93	0001000300040003001K	5	0	Page 028v	page-028v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-028v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 028v
97	0001000300040003001O	5	0	Page 030v	page-030v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-030v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 030v
94	0001000300040003001L	5	0	Page 029r	page-029r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-029r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 029r
95	0001000300040003001M	5	0	Page 029v	page-029v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-029v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 029v
100	0001000300040003001R	5	0	Page 032r	page-032r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-032r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 032r
98	0001000300040003001P	5	0	Page 031r	page-031r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-031r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 031r
105	0001000300040003001W	5	0	Page 034v	page-034v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-034v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 034v
101	0001000300040003001S	5	0	Page 032v	page-032v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-032v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 032v
102	0001000300040003001T	5	0	Page 033r	page-033r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-033r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 033r
103	0001000300040003001U	5	0	Page 033v	page-033v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-033v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 033v
104	0001000300040003001V	5	0	Page 034r	page-034r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-034r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 034r
106	0001000300040003001X	5	0	Page 035r	page-035r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-035r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 035r
107	0001000300040003001Y	5	0	Page 035v	page-035v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-035v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 035v
108	0001000300040003001Z	5	0	Page 036r	page-036r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-036r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 036r
109	00010003000400030020	5	0	Page 036v	page-036v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-036v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 036v
122	0001000300040003002D	5	0	Page 043r	page-043r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-043r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 043r
110	00010003000400030021	5	0	Page 037r	page-037r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-037r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 037r
111	00010003000400030022	5	0	Page 037v	page-037v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-037v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 037v
130	0001000300040003002L	5	0	Page 047r	page-047r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-047r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 047r
112	00010003000400030023	5	0	Page 038r	page-038r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-038r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 038r
123	0001000300040003002E	5	0	Page 043v	page-043v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-043v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 043v
113	00010003000400030024	5	0	Page 038v	page-038v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-038v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 038v
114	00010003000400030025	5	0	Page 039r	page-039r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-039r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 039r
115	00010003000400030026	5	0	Page 039v	page-039v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-039v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 039v
124	0001000300040003002F	5	0	Page 044r	page-044r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-044r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 044r
116	00010003000400030027	5	0	Page 040r	page-040r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-040r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 040r
117	00010003000400030028	5	0	Page 040v	page-040v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-040v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 040v
118	00010003000400030029	5	0	Page 041r	page-041r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-041r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 041r
125	0001000300040003002G	5	0	Page 044v	page-044v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-044v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 044v
119	0001000300040003002A	5	0	Page 041v	page-041v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-041v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 041v
120	0001000300040003002B	5	0	Page 042r	page-042r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-042r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 042r
131	0001000300040003002M	5	0	Page 047v	page-047v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-047v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 047v
121	0001000300040003002C	5	0	Page 042v	page-042v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-042v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 042v
126	0001000300040003002H	5	0	Page 045r	page-045r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-045r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 045r
127	0001000300040003002I	5	0	Page 045v	page-045v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-045v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 045v
132	0001000300040003002N	5	0	Page 048r	page-048r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-048r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 048r
128	0001000300040003002J	5	0	Page 046r	page-046r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-046r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 046r
129	0001000300040003002K	5	0	Page 046v	page-046v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-046v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 046v
136	0001000300040003002R	5	0	Page 050r	page-050r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-050r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 050r
133	0001000300040003002O	5	0	Page 048v	page-048v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-048v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 048v
134	0001000300040003002P	5	0	Page 049r	page-049r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-049r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 049r
139	0001000300040003002U	5	0	Page 051v	page-051v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-051v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 051v
135	0001000300040003002Q	5	0	Page 049v	page-049v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-049v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 049v
137	0001000300040003002S	5	0	Page 050v	page-050v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-050v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 050v
144	0001000300040003002Z	5	0	Page 054r	page-054r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-054r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 054r
138	0001000300040003002T	5	0	Page 051r	page-051r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-051r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 051r
140	0001000300040003002V	5	0	Page 052r	page-052r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-052r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 052r
141	0001000300040003002W	5	0	Page 052v	page-052v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-052v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 052v
142	0001000300040003002X	5	0	Page 053r	page-053r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-053r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 053r
143	0001000300040003002Y	5	0	Page 053v	page-053v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-053v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 053v
145	00010003000400030030	5	0	Page 054v	page-054v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-054v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 054v
146	00010003000400030031	5	0	Page 055r	page-055r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-055r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 055r
147	00010003000400030032	5	0	Page 055v	page-055v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-055v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 055v
148	00010003000400030033	5	0	Page 056r	page-056r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-056r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 056r
161	0001000300040003003G	5	0	Page 062v	page-062v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-062v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 062v
149	00010003000400030034	5	0	Page 056v	page-056v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-056v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 056v
150	00010003000400030035	5	0	Page 057r	page-057r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-057r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 057r
169	0001000300040003003O	5	0	Page 066v	page-066v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-066v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 066v
151	00010003000400030036	5	0	Page 057v	page-057v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-057v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 057v
162	0001000300040003003H	5	0	Page 063r	page-063r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-063r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 063r
152	00010003000400030037	5	0	Page 058r	page-058r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-058r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 058r
153	00010003000400030038	5	0	Page 058v	page-058v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-058v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 058v
154	00010003000400030039	5	0	Page 059r	page-059r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-059r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 059r
163	0001000300040003003I	5	0	Page 063v	page-063v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-063v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 063v
155	0001000300040003003A	5	0	Page 059v	page-059v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-059v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 059v
156	0001000300040003003B	5	0	Page 060r	page-060r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-060r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 060r
157	0001000300040003003C	5	0	Page 060v	page-060v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-060v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 060v
164	0001000300040003003J	5	0	Page 064r	page-064r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-064r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 064r
158	0001000300040003003D	5	0	Page 061r	page-061r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-061r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 061r
159	0001000300040003003E	5	0	Page 061v	page-061v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-061v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 061v
170	0001000300040003003P	5	0	Page 067r	page-067r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-067r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 067r
160	0001000300040003003F	5	0	Page 062r	page-062r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-062r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 062r
165	0001000300040003003K	5	0	Page 064v	page-064v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-064v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 064v
166	0001000300040003003L	5	0	Page 065r	page-065r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-065r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 065r
171	0001000300040003003Q	5	0	Page 067v	page-067v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-067v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 067v
167	0001000300040003003M	5	0	Page 065v	page-065v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-065v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 065v
168	0001000300040003003N	5	0	Page 066r	page-066r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-066r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 066r
175	0001000300040003003U	5	0	Page 069v	page-069v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-069v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 069v
172	0001000300040003003R	5	0	Page 068r	page-068r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-068r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 068r
173	0001000300040003003S	5	0	Page 068v	page-068v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-068v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 068v
178	0001000300040003003X	5	0	Page 071r	page-071r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-071r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 071r
174	0001000300040003003T	5	0	Page 069r	page-069r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-069r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 069r
176	0001000300040003003V	5	0	Page 070r	page-070r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-070r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 070r
183	00010003000400030042	5	0	Page 073v	page-073v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-073v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 073v
177	0001000300040003003W	5	0	Page 070v	page-070v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-070v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 070v
179	0001000300040003003Y	5	0	Page 071v	page-071v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-071v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 071v
180	0001000300040003003Z	5	0	Page 072r	page-072r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-072r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 072r
181	00010003000400030040	5	0	Page 072v	page-072v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-072v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 072v
182	00010003000400030041	5	0	Page 073r	page-073r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-073r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 073r
184	00010003000400030043	5	0	Page 074r	page-074r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-074r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 074r
185	00010003000400030044	5	0	Page 074v	page-074v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-074v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 074v
186	00010003000400030045	5	0	Page 075r	page-075r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-075r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 075r
187	00010003000400030046	5	0	Page 075v	page-075v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-075v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 075v
200	0001000300040003004J	5	0	Page 082r	page-082r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-082r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 082r
188	00010003000400030047	5	0	Page 076r	page-076r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-076r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 076r
189	00010003000400030048	5	0	Page 076v	page-076v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-076v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 076v
208	0001000300040003004R	5	0	Page 086r	page-086r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-086r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 086r
190	00010003000400030049	5	0	Page 077r	page-077r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-077r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 077r
201	0001000300040003004K	5	0	Page 082v	page-082v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-082v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 082v
191	0001000300040003004A	5	0	Page 077v	page-077v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-077v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 077v
192	0001000300040003004B	5	0	Page 078r	page-078r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-078r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 078r
193	0001000300040003004C	5	0	Page 078v	page-078v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-078v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 078v
202	0001000300040003004L	5	0	Page 083r	page-083r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-083r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 083r
194	0001000300040003004D	5	0	Page 079r	page-079r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-079r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 079r
195	0001000300040003004E	5	0	Page 079v	page-079v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-079v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 079v
196	0001000300040003004F	5	0	Page 080r	page-080r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-080r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 080r
203	0001000300040003004M	5	0	Page 083v	page-083v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-083v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 083v
197	0001000300040003004G	5	0	Page 080v	page-080v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-080v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 080v
198	0001000300040003004H	5	0	Page 081r	page-081r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-081r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 081r
209	0001000300040003004S	5	0	Page 086v	page-086v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-086v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 086v
199	0001000300040003004I	5	0	Page 081v	page-081v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-081v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 081v
204	0001000300040003004N	5	0	Page 084r	page-084r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-084r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 084r
205	0001000300040003004O	5	0	Page 084v	page-084v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-084v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 084v
210	0001000300040003004T	5	0	Page 087r	page-087r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-087r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 087r
206	0001000300040003004P	5	0	Page 085r	page-085r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-085r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 085r
207	0001000300040003004Q	5	0	Page 085v	page-085v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-085v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 085v
214	0001000300040003004X	5	0	Page 089r	page-089r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-089r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 089r
211	0001000300040003004U	5	0	Page 087v	page-087v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-087v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 087v
212	0001000300040003004V	5	0	Page 088r	page-088r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-088r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 088r
217	00010003000400030050	5	0	Page 090v	page-090v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-090v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 090v
213	0001000300040003004W	5	0	Page 088v	page-088v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-088v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 088v
215	0001000300040003004Y	5	0	Page 089v	page-089v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-089v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 089v
222	00010003000400030055	5	0	Page 093r	page-093r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-093r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 093r
216	0001000300040003004Z	5	0	Page 090r	page-090r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-090r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 090r
218	00010003000400030051	5	0	Page 091r	page-091r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-091r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 091r
219	00010003000400030052	5	0	Page 091v	page-091v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-091v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 091v
220	00010003000400030053	5	0	Page 092r	page-092r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-092r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 092r
221	00010003000400030054	5	0	Page 092v	page-092v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-092v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 092v
223	00010003000400030056	5	0	Page 093v	page-093v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-093v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 093v
224	00010003000400030057	5	0	Page 094r	page-094r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-094r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 094r
225	00010003000400030058	5	0	Page 094v	page-094v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-094v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 094v
226	00010003000400030059	5	0	Page 095r	page-095r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-095r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 095r
239	0001000300040003005M	5	0	Page 101v	page-101v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-101v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 101v
227	0001000300040003005A	5	0	Page 095v	page-095v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-095v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 095v
228	0001000300040003005B	5	0	Page 096r	page-096r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-096r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 096r
247	0001000300040003005U	5	0	Page 105v	page-105v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-105v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 105v
229	0001000300040003005C	5	0	Page 096v	page-096v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-096v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 096v
240	0001000300040003005N	5	0	Page 102r	page-102r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-102r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 102r
230	0001000300040003005D	5	0	Page 097r	page-097r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-097r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 097r
231	0001000300040003005E	5	0	Page 097v	page-097v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-097v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 097v
232	0001000300040003005F	5	0	Page 098r	page-098r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-098r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 098r
241	0001000300040003005O	5	0	Page 102v	page-102v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-102v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 102v
233	0001000300040003005G	5	0	Page 098v	page-098v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-098v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 098v
234	0001000300040003005H	5	0	Page 099r	page-099r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-099r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 099r
235	0001000300040003005I	5	0	Page 099v	page-099v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-099v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 099v
242	0001000300040003005P	5	0	Page 103r	page-103r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-103r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 103r
236	0001000300040003005J	5	0	Page 100r	page-100r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-100r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 100r
237	0001000300040003005K	5	0	Page 100v	page-100v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-100v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 100v
248	0001000300040003005V	5	0	Page 106r	page-106r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-106r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 106r
238	0001000300040003005L	5	0	Page 101r	page-101r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-101r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 101r
243	0001000300040003005Q	5	0	Page 103v	page-103v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-103v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 103v
244	0001000300040003005R	5	0	Page 104r	page-104r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-104r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 104r
249	0001000300040003005W	5	0	Page 106v	page-106v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-106v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 106v
245	0001000300040003005S	5	0	Page 104v	page-104v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-104v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 104v
246	0001000300040003005T	5	0	Page 105r	page-105r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-105r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 105r
253	00010003000400030060	5	0	Page 108v	page-108v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-108v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 108v
250	0001000300040003005X	5	0	Page 107r	page-107r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-107r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 107r
251	0001000300040003005Y	5	0	Page 107v	page-107v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-107v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 107v
256	00010003000400030063	5	0	Page 110r	page-110r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-110r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 110r
252	0001000300040003005Z	5	0	Page 108r	page-108r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-108r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 108r
254	00010003000400030061	5	0	Page 109r	page-109r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-109r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 109r
261	00010003000400030068	5	0	Page 112v	page-112v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-112v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 112v
255	00010003000400030062	5	0	Page 109v	page-109v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-109v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 109v
257	00010003000400030064	5	0	Page 110v	page-110v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-110v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 110v
258	00010003000400030065	5	0	Page 111r	page-111r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-111r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 111r
259	00010003000400030066	5	0	Page 111v	page-111v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-111v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 111v
260	00010003000400030067	5	0	Page 112r	page-112r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-112r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 112r
262	00010003000400030069	5	0	Page 113r	page-113r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-113r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 113r
263	0001000300040003006A	5	0	Page 113v	page-113v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-113v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 113v
264	0001000300040003006B	5	0	Page 114r	page-114r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-114r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 114r
265	0001000300040003006C	5	0	Page 114v	page-114v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-114v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 114v
278	0001000300040003006P	5	0	Page 121r	page-121r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-121r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 121r
266	0001000300040003006D	5	0	Page 115r	page-115r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-115r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 115r
267	0001000300040003006E	5	0	Page 115v	page-115v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-115v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 115v
286	0001000300040003006X	5	0	Page 125r	page-125r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-125r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 125r
268	0001000300040003006F	5	0	Page 116r	page-116r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-116r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 116r
279	0001000300040003006Q	5	0	Page 121v	page-121v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-121v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 121v
269	0001000300040003006G	5	0	Page 116v	page-116v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-116v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 116v
270	0001000300040003006H	5	0	Page 117r	page-117r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-117r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 117r
271	0001000300040003006I	5	0	Page 117v	page-117v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-117v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 117v
280	0001000300040003006R	5	0	Page 122r	page-122r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-122r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 122r
272	0001000300040003006J	5	0	Page 118r	page-118r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-118r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 118r
273	0001000300040003006K	5	0	Page 118v	page-118v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-118v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 118v
274	0001000300040003006L	5	0	Page 119r	page-119r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-119r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 119r
281	0001000300040003006S	5	0	Page 122v	page-122v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-122v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 122v
275	0001000300040003006M	5	0	Page 119v	page-119v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-119v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 119v
276	0001000300040003006N	5	0	Page 120r	page-120r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-120r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 120r
287	0001000300040003006Y	5	0	Page 125v	page-125v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-125v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 125v
277	0001000300040003006O	5	0	Page 120v	page-120v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-120v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 120v
282	0001000300040003006T	5	0	Page 123r	page-123r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-123r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 123r
283	0001000300040003006U	5	0	Page 123v	page-123v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-123v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 123v
288	0001000300040003006Z	5	0	Page 126ar	page-126ar	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126ar/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126ar
284	0001000300040003006V	5	0	Page 124r	page-124r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-124r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 124r
285	0001000300040003006W	5	0	Page 124v	page-124v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-124v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 124v
292	00010003000400030073	5	0	Page 126cr	page-126cr	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126cr/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126cr
289	00010003000400030070	5	0	Page 126av	page-126av	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126av/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126av
290	00010003000400030071	5	0	Page 126br	page-126br	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126br/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126br
295	00010003000400030076	5	0	Page 126dv	page-126dv	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126dv/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126dv
291	00010003000400030072	5	0	Page 126bv	page-126bv	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126bv/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126bv
293	00010003000400030074	5	0	Page 126cv	page-126cv	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126cv/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126cv
300	0001000300040003007B	5	0	Page 127r	page-127r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-127r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 127r
294	00010003000400030075	5	0	Page 126dr	page-126dr	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126dr/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126dr
296	00010003000400030077	5	0	Page 126er	page-126er	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126er/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126er
297	00010003000400030078	5	0	Page 126ev	page-126ev	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126ev/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126ev
298	00010003000400030079	5	0	Page 126r	page-126r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126r
299	0001000300040003007A	5	0	Page 126v	page-126v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-126v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 126v
301	0001000300040003007C	5	0	Page 127v	page-127v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-127v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 127v
302	0001000300040003007D	5	0	Page 128r	page-128r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-128r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 128r
303	0001000300040003007E	5	0	Page 128v	page-128v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-128v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 128v
304	0001000300040003007F	5	0	Page 129r	page-129r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-129r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 129r
317	0001000300040003007S	5	0	Page 135v	page-135v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-135v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 135v
305	0001000300040003007G	5	0	Page 129v	page-129v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-129v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 129v
306	0001000300040003007H	5	0	Page 130r	page-130r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-130r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 130r
325	00010003000400030080	5	0	Page 139v	page-139v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-139v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 139v
307	0001000300040003007I	5	0	Page 130v	page-130v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-130v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 130v
318	0001000300040003007T	5	0	Page 136r	page-136r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-136r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 136r
308	0001000300040003007J	5	0	Page 131r	page-131r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-131r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 131r
309	0001000300040003007K	5	0	Page 131v	page-131v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-131v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 131v
310	0001000300040003007L	5	0	Page 132r	page-132r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-132r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 132r
319	0001000300040003007U	5	0	Page 136v	page-136v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-136v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 136v
311	0001000300040003007M	5	0	Page 132v	page-132v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-132v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 132v
312	0001000300040003007N	5	0	Page 133r	page-133r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-133r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 133r
313	0001000300040003007O	5	0	Page 133v	page-133v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-133v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 133v
320	0001000300040003007V	5	0	Page 137r	page-137r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-137r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 137r
314	0001000300040003007P	5	0	Page 134r	page-134r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-134r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 134r
315	0001000300040003007Q	5	0	Page 134v	page-134v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-134v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 134v
326	00010003000400030081	5	0	Page 140r	page-140r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-140r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 140r
316	0001000300040003007R	5	0	Page 135r	page-135r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-135r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 135r
321	0001000300040003007W	5	0	Page 137v	page-137v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-137v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 137v
322	0001000300040003007X	5	0	Page 138r	page-138r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-138r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 138r
327	00010003000400030082	5	0	Page 140v	page-140v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-140v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 140v
323	0001000300040003007Y	5	0	Page 138v	page-138v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-138v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 138v
324	0001000300040003007Z	5	0	Page 139r	page-139r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-139r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 139r
331	00010003000400030086	5	0	Page 142v	page-142v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-142v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 142v
328	00010003000400030083	5	0	Page 141r	page-141r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-141r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 141r
329	00010003000400030084	5	0	Page 141v	page-141v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-141v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 141v
334	00010003000400030089	5	0	Page 144r	page-144r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-144r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 144r
330	00010003000400030085	5	0	Page 142r	page-142r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-142r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 142r
332	00010003000400030087	5	0	Page 143r	page-143r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-143r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 143r
339	0001000300040003008E	5	0	Page 146v	page-146v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-146v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 146v
333	00010003000400030088	5	0	Page 143v	page-143v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-143v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 143v
335	0001000300040003008A	5	0	Page 144v	page-144v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-144v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 144v
336	0001000300040003008B	5	0	Page 145r	page-145r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-145r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 145r
337	0001000300040003008C	5	0	Page 145v	page-145v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-145v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 145v
338	0001000300040003008D	5	0	Page 146r	page-146r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-146r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 146r
340	0001000300040003008F	5	0	Page 147r	page-147r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-147r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 147r
341	0001000300040003008G	5	0	Page 147v	page-147v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-147v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 147v
342	0001000300040003008H	5	0	Page 148r	page-148r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-148r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 148r
343	0001000300040003008I	5	0	Page 148v	page-148v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-148v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 148v
356	0001000300040003008V	5	0	Page 155r	page-155r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-155r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 155r
344	0001000300040003008J	5	0	Page 149r	page-149r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-149r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 149r
345	0001000300040003008K	5	0	Page 149v	page-149v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-149v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 149v
364	00010003000400030093	5	0	Page 159r	page-159r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-159r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 159r
346	0001000300040003008L	5	0	Page 150r	page-150r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-150r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 150r
357	0001000300040003008W	5	0	Page 155v	page-155v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-155v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 155v
347	0001000300040003008M	5	0	Page 150v	page-150v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-150v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 150v
348	0001000300040003008N	5	0	Page 151r	page-151r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-151r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 151r
349	0001000300040003008O	5	0	Page 151v	page-151v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-151v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 151v
358	0001000300040003008X	5	0	Page 156r	page-156r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-156r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 156r
350	0001000300040003008P	5	0	Page 152r	page-152r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-152r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 152r
351	0001000300040003008Q	5	0	Page 152v	page-152v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-152v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 152v
352	0001000300040003008R	5	0	Page 153r	page-153r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-153r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 153r
359	0001000300040003008Y	5	0	Page 156v	page-156v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-156v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 156v
353	0001000300040003008S	5	0	Page 153v	page-153v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-153v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 153v
354	0001000300040003008T	5	0	Page 154r	page-154r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-154r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 154r
365	00010003000400030094	5	0	Page 159v	page-159v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-159v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 159v
355	0001000300040003008U	5	0	Page 154v	page-154v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-154v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 154v
360	0001000300040003008Z	5	0	Page 157r	page-157r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-157r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 157r
361	00010003000400030090	5	0	Page 157v	page-157v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-157v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 157v
366	00010003000400030095	5	0	Page 160r	page-160r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-160r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 160r
362	00010003000400030091	5	0	Page 158r	page-158r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-158r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 158r
363	00010003000400030092	5	0	Page 158v	page-158v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-158v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 158v
370	00010003000400030099	5	0	Page 162r	page-162r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-162r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 162r
367	00010003000400030096	5	0	Page 160v	page-160v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-160v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 160v
368	00010003000400030097	5	0	Page 161r	page-161r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-161r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 161r
373	0001000300040003009C	5	0	Page 163v	page-163v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-163v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 163v
369	00010003000400030098	5	0	Page 161v	page-161v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-161v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 161v
371	0001000300040003009A	5	0	Page 162v	page-162v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-162v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 162v
378	0001000300040003009H	5	0	Page 166r	page-166r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-166r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 166r
372	0001000300040003009B	5	0	Page 163r	page-163r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-163r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 163r
374	0001000300040003009D	5	0	Page 164r	page-164r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-164r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 164r
375	0001000300040003009E	5	0	Page 164v	page-164v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-164v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 164v
376	0001000300040003009F	5	0	Page 165r	page-165r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-165r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 165r
377	0001000300040003009G	5	0	Page 165v	page-165v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-165v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 165v
379	0001000300040003009I	5	0	Page 166v	page-166v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-166v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 166v
380	0001000300040003009J	5	0	Page 167r	page-167r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-167r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 167r
381	0001000300040003009K	5	0	Page 167v	page-167v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-167v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 167v
382	0001000300040003009L	5	0	Page 168r	page-168r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-168r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 168r
395	0001000300040003009Y	5	0	Page 174v	page-174v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-174v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 174v
383	0001000300040003009M	5	0	Page 168v	page-168v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-168v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 168v
384	0001000300040003009N	5	0	Page 169r	page-169r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-169r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 169r
403	000100030004000300A6	5	0	Page 178v	page-178v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-178v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 178v
385	0001000300040003009O	5	0	Page 169v	page-169v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-169v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 169v
396	0001000300040003009Z	5	0	Page 175r	page-175r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-175r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 175r
386	0001000300040003009P	5	0	Page 170r	page-170r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-170r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 170r
387	0001000300040003009Q	5	0	Page 170v	page-170v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-170v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 170v
388	0001000300040003009R	5	0	Page 171r	page-171r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-171r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 171r
397	000100030004000300A0	5	0	Page 175v	page-175v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-175v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 175v
389	0001000300040003009S	5	0	Page 171v	page-171v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-171v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 171v
390	0001000300040003009T	5	0	Page 172r	page-172r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-172r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 172r
391	0001000300040003009U	5	0	Page 172v	page-172v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-172v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 172v
398	000100030004000300A1	5	0	Page 176r	page-176r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-176r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 176r
392	0001000300040003009V	5	0	Page 173r	page-173r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-173r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 173r
393	0001000300040003009W	5	0	Page 173v	page-173v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-173v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 173v
404	000100030004000300A7	5	0	Page 179r	page-179r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-179r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 179r
394	0001000300040003009X	5	0	Page 174r	page-174r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-174r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 174r
399	000100030004000300A2	5	0	Page 176v	page-176v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-176v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 176v
400	000100030004000300A3	5	0	Page 177r	page-177r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-177r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 177r
405	000100030004000300A8	5	0	Page 179v	page-179v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-179v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 179v
401	000100030004000300A4	5	0	Page 177v	page-177v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-177v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 177v
402	000100030004000300A5	5	0	Page 178r	page-178r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-178r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 178r
409	000100030004000300AC	5	0	Page 181v	page-181v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-181v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 181v
406	000100030004000300A9	5	0	Page 180r	page-180r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-180r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 180r
407	000100030004000300AA	5	0	Page 180v	page-180v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-180v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 180v
412	000100030004000300AF	5	0	Page 183r	page-183r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-183r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 183r
408	000100030004000300AB	5	0	Page 181r	page-181r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-181r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 181r
410	000100030004000300AD	5	0	Page 182r	page-182r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-182r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 182r
417	000100030004000300AK	5	0	Page 185v	page-185v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-185v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 185v
411	000100030004000300AE	5	0	Page 182v	page-182v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-182v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 182v
413	000100030004000300AG	5	0	Page 183v	page-183v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-183v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 183v
414	000100030004000300AH	5	0	Page 184r	page-184r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-184r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 184r
415	000100030004000300AI	5	0	Page 184v	page-184v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-184v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 184v
416	000100030004000300AJ	5	0	Page 185r	page-185r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-185r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 185r
418	000100030004000300AL	5	0	Page 186r	page-186r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-186r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 186r
419	000100030004000300AM	5	0	Page 186v	page-186v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-186v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 186v
420	000100030004000300AN	5	0	Page 187r	page-187r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-187r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 187r
421	000100030004000300AO	5	0	Page 187v	page-187v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-187v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 187v
434	000100030004000300B1	5	0	Page 194r	page-194r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-194r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 194r
422	000100030004000300AP	5	0	Page 188r	page-188r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-188r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 188r
423	000100030004000300AQ	5	0	Page 188v	page-188v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-188v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 188v
442	000100030004000300B9	5	0	Page 198r	page-198r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-198r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 198r
424	000100030004000300AR	5	0	Page 189r	page-189r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-189r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 189r
435	000100030004000300B2	5	0	Page 194v	page-194v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-194v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 194v
425	000100030004000300AS	5	0	Page 189v	page-189v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-189v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 189v
426	000100030004000300AT	5	0	Page 190r	page-190r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-190r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 190r
427	000100030004000300AU	5	0	Page 190v	page-190v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-190v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 190v
436	000100030004000300B3	5	0	Page 195r	page-195r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-195r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 195r
428	000100030004000300AV	5	0	Page 191r	page-191r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-191r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 191r
429	000100030004000300AW	5	0	Page 191v	page-191v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-191v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 191v
430	000100030004000300AX	5	0	Page 192r	page-192r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-192r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 192r
437	000100030004000300B4	5	0	Page 195v	page-195v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-195v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 195v
431	000100030004000300AY	5	0	Page 192v	page-192v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-192v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 192v
432	000100030004000300AZ	5	0	Page 193r	page-193r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-193r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 193r
443	000100030004000300BA	5	0	Page 198v	page-198v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-198v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 198v
433	000100030004000300B0	5	0	Page 193v	page-193v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-193v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 193v
438	000100030004000300B5	5	0	Page 196r	page-196r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-196r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 196r
439	000100030004000300B6	5	0	Page 196v	page-196v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-196v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 196v
444	000100030004000300BB	5	0	Page 199r	page-199r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-199r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 199r
440	000100030004000300B7	5	0	Page 197r	page-197r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-197r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 197r
441	000100030004000300B8	5	0	Page 197v	page-197v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-197v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 197v
448	000100030004000300BF	5	0	Page 201r	page-201r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-201r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 201r
445	000100030004000300BC	5	0	Page 199v	page-199v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-199v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 199v
446	000100030004000300BD	5	0	Page 200r	page-200r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-200r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 200r
451	000100030004000300BI	5	0	Page 202v	page-202v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-202v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 202v
447	000100030004000300BE	5	0	Page 200v	page-200v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-200v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 200v
449	000100030004000300BG	5	0	Page 201v	page-201v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-201v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 201v
456	000100030004000300BN	5	0	Page 205r	page-205r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-205r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 205r
450	000100030004000300BH	5	0	Page 202r	page-202r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-202r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 202r
452	000100030004000300BJ	5	0	Page 203r	page-203r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-203r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 203r
453	000100030004000300BK	5	0	Page 203v	page-203v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-203v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 203v
454	000100030004000300BL	5	0	Page 204r	page-204r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-204r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 204r
455	000100030004000300BM	5	0	Page 204v	page-204v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-204v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 204v
457	000100030004000300BO	5	0	Page 205v	page-205v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-205v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 205v
458	000100030004000300BP	5	0	Page 206r	page-206r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-206r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 206r
459	000100030004000300BQ	5	0	Page 206v	page-206v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-206v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 206v
460	000100030004000300BR	5	0	Page 207r	page-207r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-207r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 207r
473	000100030004000300C4	5	0	Page 213v	page-213v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-213v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 213v
461	000100030004000300BS	5	0	Page 207v	page-207v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-207v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 207v
462	000100030004000300BT	5	0	Page 208r	page-208r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-208r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 208r
481	000100030004000300CC	5	0	Page 217v	page-217v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-217v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 217v
463	000100030004000300BU	5	0	Page 208v	page-208v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-208v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 208v
474	000100030004000300C5	5	0	Page 214r	page-214r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-214r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 214r
464	000100030004000300BV	5	0	Page 209r	page-209r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-209r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 209r
465	000100030004000300BW	5	0	Page 209v	page-209v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-209v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 209v
466	000100030004000300BX	5	0	Page 210r	page-210r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-210r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 210r
475	000100030004000300C6	5	0	Page 214v	page-214v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-214v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 214v
467	000100030004000300BY	5	0	Page 210v	page-210v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-210v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 210v
468	000100030004000300BZ	5	0	Page 211r	page-211r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-211r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 211r
469	000100030004000300C0	5	0	Page 211v	page-211v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-211v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 211v
476	000100030004000300C7	5	0	Page 215r	page-215r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-215r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 215r
470	000100030004000300C1	5	0	Page 212r	page-212r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-212r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 212r
471	000100030004000300C2	5	0	Page 212v	page-212v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-212v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 212v
482	000100030004000300CD	5	0	Page 218r	page-218r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-218r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 218r
472	000100030004000300C3	5	0	Page 213r	page-213r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-213r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 213r
477	000100030004000300C8	5	0	Page 215v	page-215v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-215v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 215v
478	000100030004000300C9	5	0	Page 216r	page-216r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-216r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 216r
483	000100030004000300CE	5	0	Page 218v	page-218v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-218v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 218v
479	000100030004000300CA	5	0	Page 216v	page-216v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-216v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 216v
480	000100030004000300CB	5	0	Page 217r	page-217r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-217r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 217r
487	000100030004000300CI	5	0	Page 220v	page-220v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-220v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 220v
484	000100030004000300CF	5	0	Page 219r	page-219r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-219r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 219r
485	000100030004000300CG	5	0	Page 219v	page-219v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-219v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 219v
490	000100030004000300CL	5	0	Page 222r	page-222r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-222r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 222r
486	000100030004000300CH	5	0	Page 220r	page-220r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-220r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 220r
488	000100030004000300CJ	5	0	Page 221r	page-221r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-221r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 221r
495	000100030004000300CQ	5	0	Page 224v	page-224v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-224v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 224v
489	000100030004000300CK	5	0	Page 221v	page-221v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-221v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 221v
491	000100030004000300CM	5	0	Page 222v	page-222v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-222v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 222v
492	000100030004000300CN	5	0	Page 223r	page-223r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-223r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 223r
493	000100030004000300CO	5	0	Page 223v	page-223v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-223v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 223v
494	000100030004000300CP	5	0	Page 224r	page-224r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-224r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 224r
496	000100030004000300CR	5	0	Page 225r	page-225r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-225r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 225r
497	000100030004000300CS	5	0	Page 225v	page-225v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-225v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 225v
498	000100030004000300CT	5	0	Page 226r	page-226r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-226r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 226r
499	000100030004000300CU	5	0	Page 226v	page-226v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-226v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 226v
512	000100030004000300D7	5	0	Page 233r	page-233r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-233r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 233r
500	000100030004000300CV	5	0	Page 227r	page-227r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-227r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 227r
501	000100030004000300CW	5	0	Page 227v	page-227v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-227v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 227v
520	000100030004000300DF	5	0	Page 237r	page-237r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-237r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 237r
502	000100030004000300CX	5	0	Page 228r	page-228r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-228r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 228r
513	000100030004000300D8	5	0	Page 233v	page-233v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-233v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 233v
503	000100030004000300CY	5	0	Page 228v	page-228v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-228v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 228v
504	000100030004000300CZ	5	0	Page 229r	page-229r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-229r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 229r
505	000100030004000300D0	5	0	Page 229v	page-229v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-229v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 229v
514	000100030004000300D9	5	0	Page 234r	page-234r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-234r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 234r
506	000100030004000300D1	5	0	Page 230r	page-230r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-230r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 230r
507	000100030004000300D2	5	0	Page 230v	page-230v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-230v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 230v
525	00010003000400040001	5	0	Article 1	article-1	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-1/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 1
508	000100030004000300D3	5	0	Page 231r	page-231r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-231r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 231r
515	000100030004000300DA	5	0	Page 234v	page-234v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-234v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 234v
509	000100030004000300D4	5	0	Page 231v	page-231v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-231v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 231v
510	000100030004000300D5	5	0	Page 232r	page-232r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-232r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 232r
521	000100030004000300DG	5	0	Page 237v	page-237v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-237v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 237v
511	000100030004000300D6	5	0	Page 232v	page-232v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-232v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 232v
516	000100030004000300DB	5	0	Page 235r	page-235r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-235r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 235r
517	000100030004000300DC	5	0	Page 235v	page-235v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-235v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 235v
522	000100030004000300DH	5	0	Page 238r	page-238r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-238r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 238r
518	000100030004000300DD	5	0	Page 236r	page-236r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-236r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 236r
519	000100030004000300DE	5	0	Page 236v	page-236v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-236v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 236v
528	00010003000400040004	5	0	Article 4	article-4	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-4/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 4
37	0001000300040003	4	486	MSS 7	mss-7	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	MSS 7
523	000100030004000300DI	5	0	Page 238v	page-238v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-7/page-238v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 238v
526	00010003000400040002	5	0	Article 2	article-2	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-2/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 2
532	00010003000400040008	5	0	Article 9	article-9	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-9/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 9
527	00010003000400040003	5	0	Article 3	article-3	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-3/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 3
529	00010003000400040005	5	0	Article 5	article-5	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-5/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 5
530	00010003000400040006	5	0	Article 6	article-6	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-6/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 6
531	00010003000400040007	5	0	Article 8	article-8	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-8/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 8
533	00010003000400040009	5	0	Article 10	article-10	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-10/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 10
534	0001000300040004000A	5	0	Article 11	article-11	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-11/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 11
535	0001000300040004000B	5	0	Article 12	article-12	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-12/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 12
536	0001000300040004000C	5	0	Article 13	article-13	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-13/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 13
537	0001000300040004000D	5	0	Article 14	article-14	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-14/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 14
538	0001000300040004000E	5	0	Article 15	article-15	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-15/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 15
550	0001000300040004000Q	5	0	Article 27	article-27	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-27/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 27
539	0001000300040004000F	5	0	Article 16	article-16	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-16/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 16
540	0001000300040004000G	5	0	Article 17	article-17	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-17/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 17
541	0001000300040004000H	5	0	Article 18	article-18	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-18/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 18
551	0001000300040004000R	5	0	Article 28	article-28	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-28/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 28
542	0001000300040004000I	5	0	Article 19	article-19	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-19/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 19
543	0001000300040004000J	5	0	Article 20	article-20	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-20/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 20
558	0001000300040004000Y	5	0	Article 35	article-35	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-35/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 35
544	0001000300040004000K	5	0	Article 21	article-21	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-21/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 21
552	0001000300040004000S	5	0	Article 29	article-29	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-29/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 29
545	0001000300040004000L	5	0	Article 22	article-22	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-22/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 22
546	0001000300040004000M	5	0	Article 23	article-23	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-23/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 23
547	0001000300040004000N	5	0	Article 24	article-24	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-24/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 24
553	0001000300040004000T	5	0	Article 30	article-30	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-30/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 30
548	0001000300040004000O	5	0	Article 25	article-25	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-25/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 25
563	00010003000400040013	5	0	Article 40	article-40	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-40/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 40
549	0001000300040004000P	5	0	Article 26	article-26	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-26/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 26
559	0001000300040004000Z	5	0	Article 36	article-36	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-36/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 36
554	0001000300040004000U	5	0	Article 31	article-31	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-31/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 31
555	0001000300040004000V	5	0	Article 32	article-32	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-32/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 32
556	0001000300040004000W	5	0	Article 33	article-33	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-33/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 33
557	0001000300040004000X	5	0	Article 34	article-34	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-34/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 34
560	00010003000400040010	5	0	Article 37	article-37	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-37/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 37
564	00010003000400040014	5	0	Article 41	article-41	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-41/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 41
561	00010003000400040011	5	0	Article 38	article-38	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-38/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 38
567	00010003000400050001	5	0	Article 1	article-1	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-1/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 1
562	00010003000400040012	5	0	Article 39	article-39	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-39/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 39
524	0001000300040004	4	41	MSS 2	mss-2	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	MSS 2
565	00010003000400040015	5	0	Article 42	article-42	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-2/article-42/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 42
572	00010003000400050006	5	0	Article 6	article-6	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-6/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 6
568	00010003000400050002	5	0	Article 2	article-2	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-2/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 2
569	00010003000400050003	5	0	Article 3	article-3	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-3/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 3
570	00010003000400050004	5	0	Article 4	article-4	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-4/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 4
571	00010003000400050005	5	0	Article 5	article-5	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-5/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 5
573	00010003000400050007	5	0	Article 7	article-7	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-7/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 7
574	00010003000400050008	5	0	Article 8	article-8	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-8/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 8
575	00010003000400050009	5	0	Article 9	article-9	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-9/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 9
576	0001000300040005000A	5	0	Article 10	article-10	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-10/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 10
577	0001000300040005000B	5	0	Article 11	article-11	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-11/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 11
578	0001000300040005000C	5	0	Article 12	article-12	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-12/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 12
590	0001000300040005000O	5	0	Article 24	article-24	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-24/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 24
579	0001000300040005000D	5	0	Article 13	article-13	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-13/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 13
580	0001000300040005000E	5	0	Article 14	article-14	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-14/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 14
606	00010003000400050014	5	0	Article 40	article-40	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-40/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 40
581	0001000300040005000F	5	0	Article 15	article-15	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-15/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 15
591	0001000300040005000P	5	0	Article 25	article-25	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-25/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 25
582	0001000300040005000G	5	0	Article 16	article-16	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-16/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 16
583	0001000300040005000H	5	0	Article 17	article-17	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-17/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 17
598	0001000300040005000W	5	0	Article 32	article-32	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-32/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 32
584	0001000300040005000I	5	0	Article 18	article-18	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-18/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 18
592	0001000300040005000Q	5	0	Article 26	article-26	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-26/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 26
585	0001000300040005000J	5	0	Article 19	article-19	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-19/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 19
586	0001000300040005000K	5	0	Article 20	article-20	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-20/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 20
587	0001000300040005000L	5	0	Article 21	article-21	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-21/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 21
593	0001000300040005000R	5	0	Article 27	article-27	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-27/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 27
588	0001000300040005000M	5	0	Article 22	article-22	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-22/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 22
603	00010003000400050011	5	0	Article 37	article-37	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-37/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 37
589	0001000300040005000N	5	0	Article 23	article-23	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-23/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 23
599	0001000300040005000X	5	0	Article 33	article-33	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-33/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 33
594	0001000300040005000S	5	0	Article 28	article-28	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-28/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 28
595	0001000300040005000T	5	0	Article 29	article-29	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-29/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 29
596	0001000300040005000U	5	0	Article 30	article-30	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-30/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 30
597	0001000300040005000V	5	0	Article 31	article-31	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-31/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 31
600	0001000300040005000Y	5	0	Article 34	article-34	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-34/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 34
604	00010003000400050012	5	0	Article 38	article-38	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-38/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 38
601	0001000300040005000Z	5	0	Article 35	article-35	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-35/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 35
602	00010003000400050010	5	0	Article 36	article-36	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-36/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 36
607	00010003000400050015	5	0	Article 41	article-41	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-41/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 41
605	00010003000400050013	5	0	Article 39	article-39	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-39/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 39
612	0001000300040005001A	5	0	Article 46	article-46	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-46/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 46
608	00010003000400050016	5	0	Article 42	article-42	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-42/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 42
609	00010003000400050017	5	0	Article 43	article-43	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-43/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 43
610	00010003000400050018	5	0	Article 44	article-44	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-44/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 44
611	00010003000400050019	5	0	Article 45	article-45	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-45/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 45
613	0001000300040005001B	5	0	Article 47	article-47	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-47/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 47
614	0001000300040005001C	5	0	Article 48	article-48	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-48/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 48
615	0001000300040005001D	5	0	Article 49	article-49	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-49/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 49
616	0001000300040005001E	5	0	Article 50	article-50	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-50/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 50
629	0001000300040005001R	5	0	Article 63	article-63	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-63/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 63
617	0001000300040005001F	5	0	Article 51	article-51	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-51/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 51
618	0001000300040005001G	5	0	Article 52	article-52	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-52/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 52
637	0001000300040005001Z	5	0	Article 71	article-71	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-71/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 71
619	0001000300040005001H	5	0	Article 53	article-53	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-53/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 53
630	0001000300040005001S	5	0	Article 64	article-64	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-64/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 64
620	0001000300040005001I	5	0	Article 54	article-54	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-54/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 54
621	0001000300040005001J	5	0	Article 55	article-55	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-55/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 55
622	0001000300040005001K	5	0	Article 56	article-56	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-56/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 56
631	0001000300040005001T	5	0	Article 65	article-65	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-65/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 65
623	0001000300040005001L	5	0	Article 57	article-57	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-57/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 57
624	0001000300040005001M	5	0	Article 58	article-58	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-58/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 58
625	0001000300040005001N	5	0	Article 59	article-59	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-59/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 59
632	0001000300040005001U	5	0	Article 66	article-66	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-66/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 66
626	0001000300040005001O	5	0	Article 60	article-60	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-60/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 60
627	0001000300040005001P	5	0	Article 61	article-61	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-61/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 61
638	00010003000400050020	5	0	Article 72	article-72	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-72/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 72
628	0001000300040005001Q	5	0	Article 62	article-62	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-62/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 62
633	0001000300040005001V	5	0	Article 67	article-67	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-67/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 67
634	0001000300040005001W	5	0	Article 68	article-68	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-68/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 68
639	00010003000400050021	5	0	Article 73	article-73	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-73/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 73
635	0001000300040005001X	5	0	Article 69	article-69	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-69/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 69
636	0001000300040005001Y	5	0	Article 70	article-70	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-70/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 70
643	00010003000400050025	5	0	Article 77	article-77	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-77/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 77
640	00010003000400050022	5	0	Article 74	article-74	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-74/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 74
641	00010003000400050023	5	0	Article 75	article-75	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-75/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 75
646	00010003000400050028	5	0	Article 80	article-80	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-80/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 80
642	00010003000400050024	5	0	Article 76	article-76	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-76/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 76
644	00010003000400050026	5	0	Article 78	article-78	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-78/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 78
651	0001000300040005002D	5	0	Article 85	article-85	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-85/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 85
645	00010003000400050027	5	0	Article 79	article-79	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-79/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 79
647	00010003000400050029	5	0	Article 81	article-81	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-81/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 81
648	0001000300040005002A	5	0	Article 82	article-82	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-82/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 82
649	0001000300040005002B	5	0	Article 83	article-83	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-83/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 83
650	0001000300040005002C	5	0	Article 84	article-84	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-84/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 84
652	0001000300040005002E	5	0	Article 86	article-86	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-86/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 86
653	0001000300040005002F	5	0	Article 87	article-87	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-87/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 87
654	0001000300040005002G	5	0	Article 88	article-88	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-88/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 88
655	0001000300040005002H	5	0	Article 89	article-89	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-89/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 89
668	0001000300040005002U	5	0	Article 102	article-102	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-102/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 102
656	0001000300040005002I	5	0	Article 90	article-90	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-90/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 90
657	0001000300040005002J	5	0	Article 91	article-91	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-91/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 91
687	0001000300040005003D	5	0	Article 121	article-121	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-121/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 121
658	0001000300040005002K	5	0	Article 92	article-92	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-92/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 92
669	0001000300040005002V	5	0	Article 103	article-103	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-103/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 103
659	0001000300040005002L	5	0	Article 93	article-93	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-93/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 93
660	0001000300040005002M	5	0	Article 94	article-94	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-94/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 94
676	00010003000400050032	5	0	Article 110	article-110	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-110/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 110
661	0001000300040005002N	5	0	Article 95	article-95	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-95/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 95
670	0001000300040005002W	5	0	Article 104	article-104	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-104/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 104
662	0001000300040005002O	5	0	Article 96	article-96	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-96/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 96
663	0001000300040005002P	5	0	Article 97	article-97	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-97/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 97
664	0001000300040005002Q	5	0	Article 98	article-98	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-98/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 98
671	0001000300040005002X	5	0	Article 105	article-105	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-105/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 105
665	0001000300040005002R	5	0	Article 99	article-99	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-99/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 99
666	0001000300040005002S	5	0	Article 100	article-100	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-100/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 100
681	00010003000400050037	5	0	Article 115	article-115	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-115/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 115
667	0001000300040005002T	5	0	Article 101	article-101	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-101/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 101
677	00010003000400050033	5	0	Article 111	article-111	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-111/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 111
672	0001000300040005002Y	5	0	Article 106	article-106	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-106/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 106
673	0001000300040005002Z	5	0	Article 107	article-107	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-107/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 107
674	00010003000400050030	5	0	Article 108	article-108	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-108/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 108
684	0001000300040005003A	5	0	Article 118	article-118	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-118/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 118
675	00010003000400050031	5	0	Article 109	article-109	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-109/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 109
678	00010003000400050034	5	0	Article 112	article-112	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-112/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 112
682	00010003000400050038	5	0	Article 116	article-116	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-116/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 116
679	00010003000400050035	5	0	Article 113	article-113	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-113/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 113
680	00010003000400050036	5	0	Article 114	article-114	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-114/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 114
686	0001000300040005003C	5	0	Article 120	article-120	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-120/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 120
683	00010003000400050039	5	0	Article 117	article-117	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-117/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 117
685	0001000300040005003B	5	0	Article 119	article-119	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-119/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 119
688	0001000300040005003E	5	0	Article 122	article-122	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-122/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 122
689	0001000300040005003F	5	0	Article 123	article-123	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-123/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 123
690	0001000300040005003G	5	0	Article 124	article-124	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-124/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 124
691	0001000300040005003H	5	0	Article 125	article-125	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-125/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 125
566	0001000300040005	4	129	MSS 3	mss-3	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	MSS 3
933	0001000300040009000B	5	0	Page 006r	page-006r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-006r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 006r
692	0001000300040005003I	5	0	Article 126	article-126	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-126/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 126
693	0001000300040005003J	5	0	Article 127	article-127	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-127/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 127
694	0001000300040005003K	5	0	Article 128	article-128	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-128/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 128
695	0001000300040005003L	5	0	Article 129	article-129	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-3/article-129/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 129
707	0001000300040006000B	5	0	Article 11	article-11	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-11/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 11
697	00010003000400060001	5	0	Article 1	article-1	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-1/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 1
698	00010003000400060002	5	0	Article 2	article-2	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-2/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 2
719	0001000300040006000N	5	0	Article 23	article-23	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-23/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 23
699	00010003000400060003	5	0	Article 3	article-3	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-3/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 3
708	0001000300040006000C	5	0	Article 12	article-12	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-12/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 12
700	00010003000400060004	5	0	Article 4	article-4	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-4/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 4
701	00010003000400060005	5	0	Article 5	article-5	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-5/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 5
715	0001000300040006000J	5	0	Article 19	article-19	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-19/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 19
702	00010003000400060006	5	0	Article 6	article-6	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-6/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 6
709	0001000300040006000D	5	0	Article 13	article-13	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-13/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 13
703	00010003000400060007	5	0	Article 7	article-7	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-7/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 7
704	00010003000400060008	5	0	Article 8	article-8	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-8/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 8
705	00010003000400060009	5	0	Article 9	article-9	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-9/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 9
706	0001000300040006000A	5	0	Article 10	article-10	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-10/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 10
710	0001000300040006000E	5	0	Article 14	article-14	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-14/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 14
716	0001000300040006000K	5	0	Article 20	article-20	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-20/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 20
711	0001000300040006000F	5	0	Article 15	article-15	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-15/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 15
712	0001000300040006000G	5	0	Article 16	article-16	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-16/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 16
713	0001000300040006000H	5	0	Article 17	article-17	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-17/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 17
720	0001000300040006000O	5	0	Article 24	article-24	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-24/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 24
714	0001000300040006000I	5	0	Article 18	article-18	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-18/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 18
717	0001000300040006000L	5	0	Article 21	article-21	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-21/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 21
718	0001000300040006000M	5	0	Article 22	article-22	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-22/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 22
723	0001000300040006000R	5	0	Article 27	article-27	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-27/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 27
721	0001000300040006000P	5	0	Article 25	article-25	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-25/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 25
722	0001000300040006000Q	5	0	Article 26	article-26	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-26/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 26
727	0001000300040006000V	5	0	Article 31	article-31	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-31/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 31
724	0001000300040006000S	5	0	Article 28	article-28	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-28/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 28
725	0001000300040006000T	5	0	Article 29	article-29	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-29/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 29
726	0001000300040006000U	5	0	Article 30	article-30	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-30/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 30
728	0001000300040006000W	5	0	Article 32	article-32	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-32/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 32
729	0001000300040006000X	5	0	Article 33	article-33	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-33/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 33
730	0001000300040006000Y	5	0	Article 34	article-34	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-34/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 34
696	0001000300040006	4	143	MSS 1	mss-1	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	MSS 1
973	0001000300040009001F	5	0	Page 026r	page-026r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-026r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 026r
731	0001000300040006000Z	5	0	Article 35	article-35	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-35/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 35
732	00010003000400060010	5	0	Article 36	article-36	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-36/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 36
733	00010003000400060011	5	0	Article 37	article-37	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-37/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 37
734	00010003000400060012	5	0	Article 38	article-38	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-38/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 38
735	00010003000400060013	5	0	Article 39	article-39	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-39/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 39
736	00010003000400060014	5	0	Article 40	article-40	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-40/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 40
737	00010003000400060015	5	0	Article 41	article-41	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-41/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 41
738	00010003000400060016	5	0	Article 42	article-42	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-42/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 42
739	00010003000400060017	5	0	Article 43	article-43	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-43/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 43
740	00010003000400060018	5	0	Article 44	article-44	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-44/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 44
741	00010003000400060019	5	0	Article 45	article-45	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-45/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 45
742	0001000300040006001A	5	0	Article 46	article-46	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-46/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 46
743	0001000300040006001B	5	0	Article 47	article-47	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-47/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 47
744	0001000300040006001C	5	0	Article 48	article-48	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-48/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 48
745	0001000300040006001D	5	0	Article 49	article-49	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-49/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 49
746	0001000300040006001E	5	0	Article 50	article-50	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-50/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 50
747	0001000300040006001F	5	0	Article 51	article-51	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-51/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 51
748	0001000300040006001G	5	0	Article 52	article-52	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-52/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 52
749	0001000300040006001H	5	0	Article 53	article-53	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-53/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 53
750	0001000300040006001I	5	0	Article 54	article-54	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-54/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 54
751	0001000300040006001J	5	0	Article 55	article-55	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-55/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 55
752	0001000300040006001K	5	0	Article 56	article-56	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-56/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 56
753	0001000300040006001L	5	0	Article 57	article-57	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-57/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 57
754	0001000300040006001M	5	0	Article 58	article-58	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-58/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 58
755	0001000300040006001N	5	0	Article 59	article-59	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-59/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 59
756	0001000300040006001O	5	0	Article 60	article-60	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-60/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 60
757	0001000300040006001P	5	0	Article 61	article-61	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-61/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 61
758	0001000300040006001Q	5	0	Article 62	article-62	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-62/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 62
759	0001000300040006001R	5	0	Article 63	article-63	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-63/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 63
760	0001000300040006001S	5	0	Article 64	article-64	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-64/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 64
761	0001000300040006001T	5	0	Article 65	article-65	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-65/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 65
762	0001000300040006001U	5	0	Article 66	article-66	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-66/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 66
763	0001000300040006001V	5	0	Article 67	article-67	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-67/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 67
764	0001000300040006001W	5	0	Article 68	article-68	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-68/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 68
765	0001000300040006001X	5	0	Article 69	article-69	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-69/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 69
766	0001000300040006001Y	5	0	Article 70	article-70	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-70/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 70
767	0001000300040006001Z	5	0	Article 71	article-71	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-71/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 71
768	00010003000400060020	5	0	Article 72	article-72	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-72/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 72
769	00010003000400060021	5	0	Article 73	article-73	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-73/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 73
1013	0001000300040009002J	5	0	Page 046r	page-046r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-046r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 046r
770	00010003000400060022	5	0	Article 74	article-74	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-74/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 74
771	00010003000400060023	5	0	Article 75	article-75	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-75/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 75
772	00010003000400060024	5	0	Article 76	article-76	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-76/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 76
773	00010003000400060025	5	0	Article 77	article-77	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-77/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 77
774	00010003000400060026	5	0	Article 78	article-78	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-78/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 78
775	00010003000400060027	5	0	Article 79	article-79	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-79/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 79
776	00010003000400060028	5	0	Article 80	article-80	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-80/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 80
777	00010003000400060029	5	0	Article 81	article-81	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-81/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 81
778	0001000300040006002A	5	0	Article 82	article-82	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-82/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 82
779	0001000300040006002B	5	0	Article 83	article-83	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-83/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 83
780	0001000300040006002C	5	0	Article 84	article-84	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-84/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 84
781	0001000300040006002D	5	0	Article 85	article-85	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-85/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 85
782	0001000300040006002E	5	0	Article 86	article-86	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-86/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 86
783	0001000300040006002F	5	0	Article 87	article-87	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-87/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 87
784	0001000300040006002G	5	0	Article 88	article-88	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-88/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 88
785	0001000300040006002H	5	0	Article 89	article-89	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-89/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 89
786	0001000300040006002I	5	0	Article 90	article-90	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-90/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 90
787	0001000300040006002J	5	0	Article 91	article-91	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-91/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 91
788	0001000300040006002K	5	0	Article 92	article-92	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-92/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 92
789	0001000300040006002L	5	0	Article 93	article-93	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-93/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 93
790	0001000300040006002M	5	0	Article 94	article-94	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-94/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 94
791	0001000300040006002N	5	0	Article 95	article-95	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-95/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 95
792	0001000300040006002O	5	0	Article 96	article-96	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-96/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 96
793	0001000300040006002P	5	0	Article 97	article-97	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-97/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 97
794	0001000300040006002Q	5	0	Article 98	article-98	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-98/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 98
795	0001000300040006002R	5	0	Article 99	article-99	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-99/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 99
796	0001000300040006002S	5	0	Article 100	article-100	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-100/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 100
797	0001000300040006002T	5	0	Article 101	article-101	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-101/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 101
798	0001000300040006002U	5	0	Article 102	article-102	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-102/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 102
799	0001000300040006002V	5	0	Article 103	article-103	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-103/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 103
800	0001000300040006002W	5	0	Article 104	article-104	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-104/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 104
801	0001000300040006002X	5	0	Article 105	article-105	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-105/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 105
802	0001000300040006002Y	5	0	Article 106	article-106	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-106/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 106
803	0001000300040006002Z	5	0	Article 107	article-107	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-107/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 107
804	00010003000400060030	5	0	Article 108	article-108	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-108/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 108
805	00010003000400060031	5	0	Article 109	article-109	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-109/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 109
806	00010003000400060032	5	0	Article 110	article-110	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-110/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 110
807	00010003000400060033	5	0	Article 111	article-111	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-111/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 111
808	00010003000400060034	5	0	Article 112	article-112	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-112/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 112
809	00010003000400060035	5	0	Article 113	article-113	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-113/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 113
810	00010003000400060036	5	0	Article 114	article-114	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-114/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 114
811	00010003000400060037	5	0	Article 115	article-115	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-115/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 115
812	00010003000400060038	5	0	Article 116	article-116	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-116/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 116
813	00010003000400060039	5	0	Article 117	article-117	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-117/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 117
814	0001000300040006003A	5	0	Article 118	article-118	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-118/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 118
815	0001000300040006003B	5	0	Article 119	article-119	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-119/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 119
816	0001000300040006003C	5	0	Article 120	article-120	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-120/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 120
817	0001000300040006003D	5	0	Article 121	article-121	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-121/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 121
818	0001000300040006003E	5	0	Article 122	article-122	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-122/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 122
819	0001000300040006003F	5	0	Article 123	article-123	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-123/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 123
820	0001000300040006003G	5	0	Article 124	article-124	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-124/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 124
821	0001000300040006003H	5	0	Article 125	article-125	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-125/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 125
822	0001000300040006003I	5	0	Article 126	article-126	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-126/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 126
823	0001000300040006003J	5	0	Article 127	article-127	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-127/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 127
824	0001000300040006003K	5	0	Article 128	article-128	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-128/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 128
825	0001000300040006003L	5	0	Article 129	article-129	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-129/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 129
826	0001000300040006003M	5	0	Article 130	article-130	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-130/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 130
827	0001000300040006003N	5	0	Article 131	article-131	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-131/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 131
828	0001000300040006003O	5	0	Article 132	article-132	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-132/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 132
829	0001000300040006003P	5	0	Article 133	article-133	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-133/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 133
830	0001000300040006003Q	5	0	Article 134	article-134	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-134/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 134
831	0001000300040006003R	5	0	Article 135	article-135	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-135/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 135
832	0001000300040006003S	5	0	Article 136	article-136	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-136/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 136
833	0001000300040006003T	5	0	Article 137	article-137	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-137/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 137
834	0001000300040006003U	5	0	Article 138	article-138	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-138/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 138
835	0001000300040006003V	5	0	Article 139	article-139	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-139/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 139
836	0001000300040006003W	5	0	Article 140	article-140	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-140/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 140
837	0001000300040006003X	5	0	Article 141	article-141	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-141/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 141
838	0001000300040006003Y	5	0	Article 142	article-142	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-142/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 142
839	0001000300040006003Z	5	0	Article 143	article-143	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-1/article-143/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Article 143
841	00010003000400070001	5	0	1	1	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/1/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	1
842	00010003000400070002	5	0	2	2	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/2/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	2
843	00010003000400070003	5	0	3	3	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/3/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	3
844	00010003000400070004	5	0	4	4	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/4/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	4
845	00010003000400070005	5	0	5	5	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/5/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	5
846	00010003000400070006	5	0	6	6	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/6/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	6
847	00010003000400070007	5	0	7	7	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/7/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	7
848	00010003000400070008	5	0	8	8	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/8/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	8
861	0001000300040007000L	5	0	21	21	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/21/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	21
849	00010003000400070009	5	0	9	9	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/9/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	9
850	0001000300040007000A	5	0	10	10	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/10/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	10
851	0001000300040007000B	5	0	11	11	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/11/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	11
862	0001000300040007000M	5	0	22	22	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/22/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	22
852	0001000300040007000C	5	0	12	12	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/12/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	12
853	0001000300040007000D	5	0	13	13	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/13/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	13
875	0001000300040007000Z	5	0	35	35	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/35/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	35
854	0001000300040007000E	5	0	14	14	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/14/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	14
863	0001000300040007000N	5	0	23	23	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/23/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	23
855	0001000300040007000F	5	0	15	15	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/15/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	15
856	0001000300040007000G	5	0	16	16	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/16/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	16
870	0001000300040007000U	5	0	30	30	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/30/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	30
857	0001000300040007000H	5	0	17	17	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/17/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	17
864	0001000300040007000O	5	0	24	24	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/24/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	24
858	0001000300040007000I	5	0	18	18	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/18/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	18
859	0001000300040007000J	5	0	19	19	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/19/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	19
860	0001000300040007000K	5	0	20	20	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/20/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	20
865	0001000300040007000P	5	0	25	25	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/25/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	25
871	0001000300040007000V	5	0	31	31	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/31/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	31
866	0001000300040007000Q	5	0	26	26	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/26/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	26
867	0001000300040007000R	5	0	27	27	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/27/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	27
879	00010003000400070013	5	0	39	39	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/39/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	39
868	0001000300040007000S	5	0	28	28	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/28/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	28
876	00010003000400070010	5	0	36	36	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/36/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	36
869	0001000300040007000T	5	0	29	29	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/29/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	29
872	0001000300040007000W	5	0	32	32	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/32/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	32
873	0001000300040007000X	5	0	33	33	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/33/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	33
874	0001000300040007000Y	5	0	34	34	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/34/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	34
877	00010003000400070011	5	0	37	37	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/37/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	37
880	00010003000400070014	5	0	40	40	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/40/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	40
878	00010003000400070012	5	0	38	38	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/38/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	38
882	00010003000400070016	5	0	42	42	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/42/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	42
885	00010003000400070019	5	0	45	45	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/45/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	45
881	00010003000400070015	5	0	41	41	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/41/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	41
883	00010003000400070017	5	0	43	43	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/43/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	43
884	00010003000400070018	5	0	44	44	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/44/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	44
886	0001000300040007001A	5	0	46	46	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/46/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	46
887	0001000300040007001B	5	0	47	47	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/47/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	47
888	0001000300040007001C	5	0	48	48	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/48/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	48
889	0001000300040007001D	5	0	49	49	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/49/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	49
890	0001000300040007001E	5	0	50	50	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/50/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	50
891	0001000300040007001F	5	0	51	51	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/51/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	51
912	00010003000400070020	5	0	72	72	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/72/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	72
892	0001000300040007001G	5	0	52	52	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/52/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	52
904	0001000300040007001S	5	0	64	64	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/64/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	64
893	0001000300040007001H	5	0	53	53	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/53/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	53
894	0001000300040007001I	5	0	54	54	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/54/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	54
895	0001000300040007001J	5	0	55	55	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/55/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	55
905	0001000300040007001T	5	0	65	65	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/65/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	65
896	0001000300040007001K	5	0	56	56	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/56/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	56
897	0001000300040007001L	5	0	57	57	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/57/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	57
918	00010003000400080005	5	0	584	584	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-3/584/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	584
898	0001000300040007001M	5	0	58	58	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/58/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	58
906	0001000300040007001U	5	0	66	66	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/66/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	66
899	0001000300040007001N	5	0	59	59	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/59/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	59
900	0001000300040007001O	5	0	60	60	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/60/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	60
901	0001000300040007001P	5	0	61	61	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/61/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	61
907	0001000300040007001V	5	0	67	67	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/67/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	67
902	0001000300040007001Q	5	0	62	62	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/62/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	62
903	0001000300040007001R	5	0	63	63	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/63/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	63
914	00010003000400080001	5	0	331	331	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-3/331/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	331
908	0001000300040007001W	5	0	68	68	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/68/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	68
909	0001000300040007001X	5	0	69	69	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/69/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	69
910	0001000300040007001Y	5	0	70	70	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/70/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	70
915	00010003000400080002	5	0	383	383	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-3/383/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	383
911	0001000300040007001Z	5	0	71	71	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/71/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	71
840	0001000300040007	4	72	Muniments, Series 1	muniments-series-1	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-1/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	Muniments, Series 1
919	00010003000400080006	5	0	586	586	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-3/586/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	586
916	00010003000400080003	5	0	558	558	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-3/558/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	558
917	00010003000400080004	5	0	581	581	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-3/581/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	581
923	00010003000400090001	5	0	Page 001r	page-001r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-001r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 001r
920	00010003000400080007	5	0	587	587	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-3/587/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	587
913	0001000300040008	4	8	Muniments, Series 3	muniments-series-3	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-3/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	Muniments, Series 3
921	00010003000400080008	5	0	594	594	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/muniments-series-3/594/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	594
925	00010003000400090003	5	0	Page 002r	page-002r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-002r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 002r
928	00010003000400090006	5	0	Page 003v	page-003v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-003v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 003v
924	00010003000400090002	5	0	Page 001v	page-001v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-001v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 001v
926	00010003000400090004	5	0	Page 002v	page-002v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-002v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 002v
927	00010003000400090005	5	0	Page 003r	page-003r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-003r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 003r
929	00010003000400090007	5	0	Page 004r	page-004r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-004r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 004r
930	00010003000400090008	5	0	Page 004v	page-004v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-004v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 004v
931	00010003000400090009	5	0	Page 005r	page-005r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-005r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 005r
932	0001000300040009000A	5	0	Page 005v	page-005v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-005v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 005v
934	0001000300040009000C	5	0	Page 006v	page-006v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-006v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 006v
960	00010003000400090012	5	0	Page 019v	page-019v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-019v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 019v
935	0001000300040009000D	5	0	Page 007r	page-007r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-007r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 007r
947	0001000300040009000P	5	0	Page 013r	page-013r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-013r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 013r
936	0001000300040009000E	5	0	Page 007v	page-007v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-007v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 007v
937	0001000300040009000F	5	0	Page 008r	page-008r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-008r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 008r
955	0001000300040009000X	5	0	Page 017r	page-017r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-017r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 017r
938	0001000300040009000G	5	0	Page 008v	page-008v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-008v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 008v
948	0001000300040009000Q	5	0	Page 013v	page-013v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-013v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 013v
939	0001000300040009000H	5	0	Page 009r	page-009r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-009r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 009r
940	0001000300040009000I	5	0	Page 009v	page-009v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-009v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 009v
941	0001000300040009000J	5	0	Page 010r	page-010r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-010r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 010r
949	0001000300040009000R	5	0	Page 014r	page-014r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-014r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 014r
942	0001000300040009000K	5	0	Page 010v	page-010v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-010v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 010v
943	0001000300040009000L	5	0	Page 011r	page-011r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-011r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 011r
944	0001000300040009000M	5	0	Page 011v	page-011v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-011v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 011v
950	0001000300040009000S	5	0	Page 014v	page-014v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-014v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 014v
945	0001000300040009000N	5	0	Page 012r	page-012r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-012r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 012r
956	0001000300040009000Y	5	0	Page 017v	page-017v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-017v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 017v
946	0001000300040009000O	5	0	Page 012v	page-012v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-012v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 012v
951	0001000300040009000T	5	0	Page 015r	page-015r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-015r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 015r
952	0001000300040009000U	5	0	Page 015v	page-015v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-015v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 015v
957	0001000300040009000Z	5	0	Page 018r	page-018r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-018r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 018r
953	0001000300040009000V	5	0	Page 016r	page-016r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-016r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 016r
961	00010003000400090013	5	0	Page 020r	page-020r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-020r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 020r
954	0001000300040009000W	5	0	Page 016v	page-016v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-016v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 016v
958	00010003000400090010	5	0	Page 018v	page-018v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-018v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 018v
959	00010003000400090011	5	0	Page 019r	page-019r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-019r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 019r
964	00010003000400090016	5	0	Page 021v	page-021v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-021v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 021v
962	00010003000400090014	5	0	Page 020v	page-020v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-020v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 020v
969	0001000300040009001B	5	0	Page 024r	page-024r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-024r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 024r
963	00010003000400090015	5	0	Page 021r	page-021r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-021r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 021r
965	00010003000400090017	5	0	Page 022r	page-022r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-022r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 022r
966	00010003000400090018	5	0	Page 022v	page-022v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-022v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 022v
967	00010003000400090019	5	0	Page 023r	page-023r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-023r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 023r
968	0001000300040009001A	5	0	Page 023v	page-023v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-023v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 023v
970	0001000300040009001C	5	0	Page 024v	page-024v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-024v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 024v
971	0001000300040009001D	5	0	Page 025r	page-025r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-025r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 025r
972	0001000300040009001E	5	0	Page 025v	page-025v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-025v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 025v
974	0001000300040009001G	5	0	Page 026v	page-026v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-026v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 026v
1000	00010003000400090026	5	0	Page 039v	page-039v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-039v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 039v
975	0001000300040009001H	5	0	Page 027r	page-027r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-027r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 027r
987	0001000300040009001T	5	0	Page 033r	page-033r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-033r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 033r
976	0001000300040009001I	5	0	Page 027v	page-027v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-027v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 027v
977	0001000300040009001J	5	0	Page 028r	page-028r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-028r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 028r
995	00010003000400090021	5	0	Page 037r	page-037r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-037r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 037r
978	0001000300040009001K	5	0	Page 028v	page-028v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-028v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 028v
988	0001000300040009001U	5	0	Page 033v	page-033v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-033v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 033v
979	0001000300040009001L	5	0	Page 029r	page-029r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-029r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 029r
980	0001000300040009001M	5	0	Page 029v	page-029v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-029v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 029v
981	0001000300040009001N	5	0	Page 030r	page-030r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-030r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 030r
989	0001000300040009001V	5	0	Page 034r	page-034r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-034r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 034r
982	0001000300040009001O	5	0	Page 030v	page-030v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-030v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 030v
983	0001000300040009001P	5	0	Page 031r	page-031r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-031r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 031r
984	0001000300040009001Q	5	0	Page 031v	page-031v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-031v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 031v
990	0001000300040009001W	5	0	Page 034v	page-034v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-034v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 034v
985	0001000300040009001R	5	0	Page 032r	page-032r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-032r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 032r
996	00010003000400090022	5	0	Page 037v	page-037v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-037v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 037v
986	0001000300040009001S	5	0	Page 032v	page-032v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-032v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 032v
991	0001000300040009001X	5	0	Page 035r	page-035r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-035r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 035r
992	0001000300040009001Y	5	0	Page 035v	page-035v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-035v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 035v
997	00010003000400090023	5	0	Page 038r	page-038r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-038r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 038r
993	0001000300040009001Z	5	0	Page 036r	page-036r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-036r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 036r
1001	00010003000400090027	5	0	Page 040r	page-040r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-040r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 040r
994	00010003000400090020	5	0	Page 036v	page-036v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-036v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 036v
998	00010003000400090024	5	0	Page 038v	page-038v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-038v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 038v
999	00010003000400090025	5	0	Page 039r	page-039r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-039r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 039r
1004	0001000300040009002A	5	0	Page 041v	page-041v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-041v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 041v
1002	00010003000400090028	5	0	Page 040v	page-040v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-040v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 040v
1009	0001000300040009002F	5	0	Page 044r	page-044r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-044r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 044r
1003	00010003000400090029	5	0	Page 041r	page-041r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-041r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 041r
1005	0001000300040009002B	5	0	Page 042r	page-042r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-042r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 042r
1006	0001000300040009002C	5	0	Page 042v	page-042v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-042v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 042v
1007	0001000300040009002D	5	0	Page 043r	page-043r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-043r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 043r
1008	0001000300040009002E	5	0	Page 043v	page-043v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-043v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 043v
1010	0001000300040009002G	5	0	Page 044v	page-044v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-044v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 044v
1011	0001000300040009002H	5	0	Page 045r	page-045r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-045r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 045r
1012	0001000300040009002I	5	0	Page 045v	page-045v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-045v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 045v
1014	0001000300040009002K	5	0	Page 046v	page-046v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-046v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 046v
1040	0001000300040009003A	5	0	Page 059v	page-059v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-059v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 059v
1015	0001000300040009002L	5	0	Page 047r	page-047r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-047r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 047r
1027	0001000300040009002X	5	0	Page 053r	page-053r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-053r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 053r
1016	0001000300040009002M	5	0	Page 047v	page-047v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-047v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 047v
1017	0001000300040009002N	5	0	Page 048r	page-048r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-048r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 048r
1035	00010003000400090035	5	0	Page 057r	page-057r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-057r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 057r
1018	0001000300040009002O	5	0	Page 048v	page-048v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-048v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 048v
1028	0001000300040009002Y	5	0	Page 053v	page-053v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-053v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 053v
1019	0001000300040009002P	5	0	Page 049r	page-049r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-049r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 049r
1020	0001000300040009002Q	5	0	Page 049v	page-049v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-049v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 049v
1021	0001000300040009002R	5	0	Page 050r	page-050r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-050r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 050r
1029	0001000300040009002Z	5	0	Page 054r	page-054r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-054r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 054r
1022	0001000300040009002S	5	0	Page 050v	page-050v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-050v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 050v
1023	0001000300040009002T	5	0	Page 051r	page-051r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-051r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 051r
1024	0001000300040009002U	5	0	Page 051v	page-051v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-051v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 051v
1030	00010003000400090030	5	0	Page 054v	page-054v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-054v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 054v
1025	0001000300040009002V	5	0	Page 052r	page-052r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-052r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 052r
1036	00010003000400090036	5	0	Page 057v	page-057v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-057v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 057v
1026	0001000300040009002W	5	0	Page 052v	page-052v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-052v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 052v
1031	00010003000400090031	5	0	Page 055r	page-055r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-055r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 055r
1032	00010003000400090032	5	0	Page 055v	page-055v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-055v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 055v
1037	00010003000400090037	5	0	Page 058r	page-058r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-058r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 058r
1033	00010003000400090033	5	0	Page 056r	page-056r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-056r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 056r
1041	0001000300040009003B	5	0	Page 060r	page-060r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-060r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 060r
1034	00010003000400090034	5	0	Page 056v	page-056v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-056v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 056v
1038	00010003000400090038	5	0	Page 058v	page-058v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-058v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 058v
1039	00010003000400090039	5	0	Page 059r	page-059r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-059r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 059r
1044	0001000300040009003E	5	0	Page 061v	page-061v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-061v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 061v
1042	0001000300040009003C	5	0	Page 060v	page-060v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-060v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 060v
922	0001000300040009	4	124	MSS 8	mss-8	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	MSS 8
1043	0001000300040009003D	5	0	Page 061r	page-061r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-061r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 061r
1048	000100030004000A0001	5	0	Page 001r	page-001r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-001r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 001r
1045	0001000300040009003F	5	0	Page 062r	page-062r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-062r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 062r
1046	0001000300040009003G	5	0	Page 062v	page-062v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-8/page-062v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 062v
1049	000100030004000A0002	5	0	Page 001v	page-001v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-001v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 001v
1050	000100030004000A0003	5	0	Page 002r	page-002r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-002r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 002r
1051	000100030004000A0004	5	0	Page 002v	page-002v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-002v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 002v
1052	000100030004000A0005	5	0	Page 003r	page-003r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-003r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 003r
1053	000100030004000A0006	5	0	Page 003v	page-003v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-003v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 003v
1054	000100030004000A0007	5	0	Page 004r	page-004r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-004r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 004r
1055	000100030004000A0008	5	0	Page 004v	page-004v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-004v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 004v
1067	000100030004000A000K	5	0	Page 010v	page-010v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-010v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 010v
1056	000100030004000A0009	5	0	Page 005r	page-005r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-005r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 005r
1057	000100030004000A000A	5	0	Page 005v	page-005v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-005v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 005v
1083	000100030004000A0010	5	0	Page 018v	page-018v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-018v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 018v
1058	000100030004000A000B	5	0	Page 006r	page-006r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-006r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 006r
1068	000100030004000A000L	5	0	Page 011r	page-011r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-011r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 011r
1059	000100030004000A000C	5	0	Page 006v	page-006v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-006v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 006v
1060	000100030004000A000D	5	0	Page 007r	page-007r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-007r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 007r
1075	000100030004000A000S	5	0	Page 014v	page-014v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-014v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 014v
1061	000100030004000A000E	5	0	Page 007v	page-007v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-007v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 007v
1069	000100030004000A000M	5	0	Page 011v	page-011v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-011v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 011v
1062	000100030004000A000F	5	0	Page 008r	page-008r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-008r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 008r
1063	000100030004000A000G	5	0	Page 008v	page-008v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-008v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 008v
1064	000100030004000A000H	5	0	Page 009r	page-009r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-009r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 009r
1070	000100030004000A000N	5	0	Page 012r	page-012r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-012r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 012r
1065	000100030004000A000I	5	0	Page 009v	page-009v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-009v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 009v
1080	000100030004000A000X	5	0	Page 017r	page-017r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-017r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 017r
1066	000100030004000A000J	5	0	Page 010r	page-010r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-010r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 010r
1076	000100030004000A000T	5	0	Page 015r	page-015r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-015r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 015r
1071	000100030004000A000O	5	0	Page 012v	page-012v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-012v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 012v
1072	000100030004000A000P	5	0	Page 013r	page-013r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-013r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 013r
1073	000100030004000A000Q	5	0	Page 013v	page-013v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-013v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 013v
1074	000100030004000A000R	5	0	Page 014r	page-014r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-014r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 014r
1077	000100030004000A000U	5	0	Page 015v	page-015v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-015v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 015v
1081	000100030004000A000Y	5	0	Page 017v	page-017v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-017v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 017v
1078	000100030004000A000V	5	0	Page 016r	page-016r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-016r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 016r
1079	000100030004000A000W	5	0	Page 016v	page-016v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-016v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 016v
1084	000100030004000A0011	5	0	Page 019r	page-019r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-019r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 019r
1082	000100030004000A000Z	5	0	Page 018r	page-018r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-018r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 018r
1089	000100030004000A0016	5	0	Page 021v	page-021v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-021v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 021v
1085	000100030004000A0012	5	0	Page 019v	page-019v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-019v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 019v
1086	000100030004000A0013	5	0	Page 020r	page-020r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-020r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 020r
1087	000100030004000A0014	5	0	Page 020v	page-020v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-020v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 020v
1088	000100030004000A0015	5	0	Page 021r	page-021r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-021r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 021r
1090	000100030004000A0017	5	0	Page 022r	page-022r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-022r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 022r
1091	000100030004000A0018	5	0	Page 022v	page-022v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-022v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 022v
1092	000100030004000A0019	5	0	Page 023r	page-023r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-023r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 023r
1093	000100030004000A001A	5	0	Page 023v	page-023v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-023v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 023v
1106	000100030004000A001N	5	0	Page 030r	page-030r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-030r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 030r
1094	000100030004000A001B	5	0	Page 024r	page-024r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-024r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 024r
1095	000100030004000A001C	5	0	Page 024v	page-024v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-024v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 024v
1114	000100030004000A001V	5	0	Page 034r	page-034r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-034r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 034r
1096	000100030004000A001D	5	0	Page 025r	page-025r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-025r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 025r
1107	000100030004000A001O	5	0	Page 030v	page-030v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-030v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 030v
1097	000100030004000A001E	5	0	Page 025v	page-025v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-025v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 025v
1098	000100030004000A001F	5	0	Page 026r	page-026r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-026r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 026r
1099	000100030004000A001G	5	0	Page 026v	page-026v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-026v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 026v
1108	000100030004000A001P	5	0	Page 031r	page-031r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-031r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 031r
1100	000100030004000A001H	5	0	Page 027r	page-027r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-027r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 027r
1101	000100030004000A001I	5	0	Page 027v	page-027v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-027v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 027v
1102	000100030004000A001J	5	0	Page 028r	page-028r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-028r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 028r
1109	000100030004000A001Q	5	0	Page 031v	page-031v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-031v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 031v
1103	000100030004000A001K	5	0	Page 028v	page-028v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-028v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 028v
1104	000100030004000A001L	5	0	Page 029r	page-029r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-029r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 029r
1115	000100030004000A001W	5	0	Page 034v	page-034v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-034v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 034v
1105	000100030004000A001M	5	0	Page 029v	page-029v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-029v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 029v
1110	000100030004000A001R	5	0	Page 032r	page-032r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-032r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 032r
1111	000100030004000A001S	5	0	Page 032v	page-032v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-032v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 032v
1116	000100030004000A001X	5	0	Page 035r	page-035r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-035r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 035r
1112	000100030004000A001T	5	0	Page 033r	page-033r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-033r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 033r
1113	000100030004000A001U	5	0	Page 033v	page-033v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-033v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 033v
1120	000100030004000A0021	5	0	Page 037r	page-037r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-037r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 037r
1117	000100030004000A001Y	5	0	Page 035v	page-035v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-035v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 035v
1118	000100030004000A001Z	5	0	Page 036r	page-036r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-036r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 036r
1123	000100030004000A0024	5	0	Page 038v	page-038v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-038v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 038v
1119	000100030004000A0020	5	0	Page 036v	page-036v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-036v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 036v
1121	000100030004000A0022	5	0	Page 037v	page-037v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-037v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 037v
1128	000100030004000A0029	5	0	Page 041r	page-041r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-041r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 041r
1122	000100030004000A0023	5	0	Page 038r	page-038r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-038r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 038r
1124	000100030004000A0025	5	0	Page 039r	page-039r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-039r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 039r
1125	000100030004000A0026	5	0	Page 039v	page-039v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-039v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 039v
1126	000100030004000A0027	5	0	Page 040r	page-040r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-040r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 040r
1127	000100030004000A0028	5	0	Page 040v	page-040v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-040v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 040v
1129	000100030004000A002A	5	0	Page 041v	page-041v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-041v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 041v
1130	000100030004000A002B	5	0	Page 042r	page-042r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-042r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 042r
1131	000100030004000A002C	5	0	Page 042v	page-042v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-042v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 042v
1132	000100030004000A002D	5	0	Page 043r	page-043r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-043r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 043r
1145	000100030004000A002Q	5	0	Page 049v	page-049v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-049v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 049v
1133	000100030004000A002E	5	0	Page 043v	page-043v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-043v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 043v
1134	000100030004000A002F	5	0	Page 044r	page-044r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-044r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 044r
1153	000100030004000A002Y	5	0	Page 053v	page-053v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-053v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 053v
1135	000100030004000A002G	5	0	Page 044v	page-044v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-044v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 044v
1146	000100030004000A002R	5	0	Page 050r	page-050r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-050r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 050r
1136	000100030004000A002H	5	0	Page 045r	page-045r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-045r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 045r
1137	000100030004000A002I	5	0	Page 045v	page-045v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-045v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 045v
1138	000100030004000A002J	5	0	Page 046r	page-046r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-046r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 046r
1147	000100030004000A002S	5	0	Page 050v	page-050v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-050v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 050v
1139	000100030004000A002K	5	0	Page 046v	page-046v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-046v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 046v
1140	000100030004000A002L	5	0	Page 047r	page-047r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-047r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 047r
1141	000100030004000A002M	5	0	Page 047v	page-047v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-047v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 047v
1148	000100030004000A002T	5	0	Page 051r	page-051r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-051r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 051r
1142	000100030004000A002N	5	0	Page 048r	page-048r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-048r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 048r
1143	000100030004000A002O	5	0	Page 048v	page-048v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-048v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 048v
1154	000100030004000A002Z	5	0	Page 054r	page-054r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-054r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 054r
1144	000100030004000A002P	5	0	Page 049r	page-049r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-049r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 049r
1149	000100030004000A002U	5	0	Page 051v	page-051v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-051v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 051v
1150	000100030004000A002V	5	0	Page 052r	page-052r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-052r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 052r
1155	000100030004000A0030	5	0	Page 054v	page-054v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-054v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 054v
1151	000100030004000A002W	5	0	Page 052v	page-052v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-052v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 052v
1152	000100030004000A002X	5	0	Page 053r	page-053r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-053r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 053r
1159	000100030004000A0034	5	0	Page 056v	page-056v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-056v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 056v
1156	000100030004000A0031	5	0	Page 055r	page-055r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-055r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 055r
1157	000100030004000A0032	5	0	Page 055v	page-055v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-055v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 055v
1162	000100030004000A0037	5	0	Page 058r	page-058r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-058r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 058r
1158	000100030004000A0033	5	0	Page 056r	page-056r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-056r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 056r
1160	000100030004000A0035	5	0	Page 057r	page-057r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-057r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 057r
1167	000100030004000A003C	5	0	Page 060v	page-060v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-060v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 060v
1161	000100030004000A0036	5	0	Page 057v	page-057v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-057v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 057v
1163	000100030004000A0038	5	0	Page 058v	page-058v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-058v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 058v
1164	000100030004000A0039	5	0	Page 059r	page-059r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-059r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 059r
1165	000100030004000A003A	5	0	Page 059v	page-059v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-059v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 059v
1166	000100030004000A003B	5	0	Page 060r	page-060r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-060r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 060r
1168	000100030004000A003D	5	0	Page 061r	page-061r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-061r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 061r
1169	000100030004000A003E	5	0	Page 061v	page-061v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-061v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 061v
1170	000100030004000A003F	5	0	Page 062r	page-062r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-062r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 062r
1047	000100030004000A	4	124	MSS 9	mss-9	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	MSS 9
1171	000100030004000A003G	5	0	Page 062v	page-062v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-9/page-062v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 062v
1185	000100030004000C0006	5	0	Page 02v	page-02v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-02v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 02v
1173	000100030004000B0001	5	0	Page 01r	page-01r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-19/page-01r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 01r
1193	000100030004000C000E	5	0	Page 06v	page-06v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-06v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 06v
1174	000100030004000B0002	5	0	Page 01v	page-01v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-19/page-01v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 01v
1186	000100030004000C0007	5	0	Page 03r	page-03r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-03r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 03r
1175	000100030004000B0003	5	0	Page 02r	page-02r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-19/page-02r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 02r
1176	000100030004000B0004	5	0	Page 02v	page-02v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-19/page-02v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 02v
1177	000100030004000B0005	5	0	Page 03r	page-03r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-19/page-03r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 03r
1172	000100030004000B	4	6	MSS 19	mss-19	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-19/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	MSS 19
1178	000100030004000B0006	5	0	Page 03v	page-03v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-19/page-03v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 03v
1187	000100030004000C0008	5	0	Page 03v	page-03v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-03v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 03v
1180	000100030004000C0001	5	0	Page 00r	page-00r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-00r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 00r
1181	000100030004000C0002	5	0	Page 00v	page-00v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-00v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 00v
1188	000100030004000C0009	5	0	Page 04r	page-04r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-04r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 04r
1182	000100030004000C0003	5	0	Page 01r	page-01r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-01r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 01r
1183	000100030004000C0004	5	0	Page 01v	page-01v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-01v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 01v
1194	000100030004000C000F	5	0	Page 07r	page-07r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-07r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 07r
1184	000100030004000C0005	5	0	Page 02r	page-02r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-02r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 02r
1189	000100030004000C000A	5	0	Page 04v	page-04v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-04v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 04v
1205	000100030004000C000Q	5	0	Page 12v	page-12v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-12v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 12v
1190	000100030004000C000B	5	0	Page 05r	page-05r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-05r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 05r
1195	000100030004000C000G	5	0	Page 07v	page-07v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-07v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 07v
1191	000100030004000C000C	5	0	Page 05v	page-05v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-05v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 05v
1192	000100030004000C000D	5	0	Page 06r	page-06r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-06r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 06r
1199	000100030004000C000K	5	0	Page 09v	page-09v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-09v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 09v
1196	000100030004000C000H	5	0	Page 08r	page-08r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-08r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 08r
1202	000100030004000C000N	5	0	Page 11r	page-11r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-11r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 11r
1197	000100030004000C000I	5	0	Page 08v	page-08v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-08v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 08v
1198	000100030004000C000J	5	0	Page 09r	page-09r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-09r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 09r
1200	000100030004000C000L	5	0	Page 10r	page-10r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-10r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 10r
1204	000100030004000C000P	5	0	Page 12r	page-12r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-12r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 12r
1201	000100030004000C000M	5	0	Page 10v	page-10v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-10v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 10v
1203	000100030004000C000O	5	0	Page 11v	page-11v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-11v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 11v
1206	000100030004000C000R	5	0	Page 13r	page-13r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-13r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 13r
1207	000100030004000C000S	5	0	Page 13v	page-13v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-13v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 13v
1208	000100030004000C000T	5	0	Page 14r	page-14r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-14r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 14r
1209	000100030004000C000U	5	0	Page 14v	page-14v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-14v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 14v
1210	000100030004000C000V	5	0	Page 15r	page-15r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-15r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 15r
1211	000100030004000C000W	5	0	Page 15v	page-15v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-15v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 15v
1212	000100030004000C000X	5	0	Page 16r	page-16r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-16r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 16r
1225	000100030004000C001A	5	0	Page 22v	page-22v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-22v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 22v
1213	000100030004000C000Y	5	0	Page 16v	page-16v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-16v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 16v
1214	000100030004000C000Z	5	0	Page 17r	page-17r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-17r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 17r
1215	000100030004000C0010	5	0	Page 17v	page-17v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-17v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 17v
1226	000100030004000C001B	5	0	Page 23r	page-23r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-23r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 23r
1216	000100030004000C0011	5	0	Page 18r	page-18r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-18r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 18r
1217	000100030004000C0012	5	0	Page 18v	page-18v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-18v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 18v
1218	000100030004000C0013	5	0	Page 19r	page-19r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-19r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 19r
1227	000100030004000C001C	5	0	Page 23v	page-23v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-23v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 23v
1219	000100030004000C0014	5	0	Page 19v	page-19v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-19v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 19v
1220	000100030004000C0015	5	0	Page 20r	page-20r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-20r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 20r
1221	000100030004000C0016	5	0	Page 20v	page-20v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-20v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 20v
1228	000100030004000C001D	5	0	Page 24r	page-24r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-24r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 24r
1222	000100030004000C0017	5	0	Page 21r	page-21r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-21r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 21r
1223	000100030004000C0018	5	0	Page 21v	page-21v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-21v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 21v
1224	000100030004000C0019	5	0	Page 22r	page-22r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-22r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 22r
1229	000100030004000C001E	5	0	Page 24v	page-24v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-24v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 24v
1230	000100030004000C001F	5	0	Page 25r	page-25r	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-25r/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 25r
1179	000100030004000C	4	52	MSS 20	mss-20	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/		f		\N	\N	f	30	\N	f	\N	\N	\N	\N	MSS 20
1231	000100030004000C001G	5	0	Page 25v	page-25v	t	f	/home-3/a-catalogue-of-the-manuscript-and-muniment-images/mss-20/page-25v/		f		\N	\N	f	29	\N	f	\N	\N	\N	\N	Page 25v
\.


--
-- Name: wagtailcore_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailcore_page_id_seq', 1231, true);


--
-- Data for Name: wagtailcore_pagerevision; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailcore_pagerevision (id, submitted_for_moderation, created_at, content_json, approved_go_live_at, page_id, user_id) FROM stdin;
1	f	2018-10-22 15:40:10.602343+00	{"seo_title": "", "search_description": "", "content_type": 27, "title": "Home", "draft_title": "Home", "url_path": "/home-3/", "path": "00010003", "locked": false, "go_live_at": null, "expired": false, "expire_at": null, "slug": "home-3", "last_published_at": null, "body": "[{\\"id\\": \\"1b9b0a3b-5421-441f-b128-e6b9b67bf777\\", \\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><h2>Introduction to the Henslowe-Alleyn Digitisation Project</h2><p><a href=\\\\\\"images/pubimg/full/.\\\\\\"></a>The Archive of Dulwich College in London, England, holds thousands of pages of manuscripts left to the College by its founder, the eminent actor Edward Alleyn (1566-1626). This archive includes his personal and professional papers and those he inherited from his father-in-law Philip Henslowe (d. 1616). As a group, these manuscripts comprise the largest and most important single extant archive of material on the professional theatre and dramatic performance in early modern England, the age of Shakespeare, Marlowe, Jonson, Middleton, Heywood, Dekker, Chettle, and so many of their contemporaries and colleagues.</p><p>Henslowe and Alleyn built and expanded several London public playhouses, including the Rose, the Fortune, and the Hope, the foundations of some of which have recently been discovered or excavated by Museum of London staff. Named by King James I as Joint \\\\u2018Masters of the Royal Game of Bears, Bulls and Mastiff Dogs\\\\u2019, Henslowe and Alleyn also staged such blood sports as bull- and bear- and lion-baiting at the Bear Garden and other venues, including royal palaces.</p><p>Henslowe and Alleyn commissioned plays from dramatists and ran several of the most successful acting companies of the time, including the Lord Strange\\\\u2019s Men and the Lord Admiral\\\\u2019s Men, for which Alleyn performed such famous roles as Dr Faustus and Tamburlaine. The sole surviving actor\\\\u2019s \\\\u2018part\\\\u2019 (or script) from the period, for the play <i>Orlando Furioso</i>, is in the Dulwich archive, as is the \\\\u2018plot\\\\u2019 (or prompter&#x27;s outline) of the play <i>The Second Part of the Seven Deadly Sins</i>, one of only six plots from this period known to survive in part or in whole. In fact, most of what modern scholars know about the early modern English theatre, both as financial enterprise and artistic endeavour, comes from the study of the Henslowe and Alleyn papers at Dulwich College.</p><p>The Henslowe-Alleyn Digitisation Project has two aims and objectives: first, to protect and conserve these increasingly fragile manuscripts, and, second, to make their contents much more widely available in a free electronic archive and website, not only to specialist scholars but to all those interested in early modern English drama and theatre history, as well as social, economic, regional, architectural, and legal history, and palaeography and manuscript studies. It is the hope of the Henslowe Alleyn Digitisation Project members that the use of these manuscripts in electronic and digital form will not be confined to students and scholars but to a wide-ranging and ever-changing community of readers in a variety of ways.</p>\\"}]", "first_published_at": null, "subtitle": "", "depth": 2, "latest_revision_created_at": null, "live": true, "has_unpublished_changes": false, "owner": null, "show_in_menus": true, "numchild": 4, "pk": 4, "live_revision": null}	\N	4	1
2	f	2018-10-22 15:40:20.571231+00	{"seo_title": "", "search_description": "", "content_type": 31, "title": "About the Project", "draft_title": "About the Project", "url_path": "/home-3/about-the-project/", "path": "000100030001", "locked": false, "go_live_at": null, "expired": false, "expire_at": null, "slug": "about-the-project", "last_published_at": null, "body": "[{\\"id\\": \\"5971f92c-34c7-4d99-96c3-e6c97e8908b0\\", \\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><h2>The Henslowe-Alleyn Papers, Past, Present and Future</h2><p>For over two hundred and fifty years, most of the Henslowe-Alleyn papers remained unbound and stored in the chest in which they had lain since the founding of the College by Edward Alleyn in 1619. Many individual documents, both large and small, were left in their original condition: folded up into small packets (a form of storage which preceded the use of envelopes). The volume comprising Henslowe\\\\u2019s Diary began to be borrowed from the library during the 18th and 19th centuries by the scholars Edmond Malone, John Payne Collier, and J. O. Halliwell-Phillips, among others. In fact, during this time, some of its pages were removed or otherwise destroyed (fragments have since been sold or auctioned and are now at the British Library, Bodleian Library, Belvoir Castle, and the Folger Shakespeare Library). In the early 19th century, staff at Dulwich were successful in reclaiming the play <i>The Telltale</i> and the plot of <i>the Second Part of the Seven Deadly Sins</i> from an auction, but over the years many other items were dispersed (and have not yet been definitively identified), including about one hundred play manuscripts and a number of printed books bequeathed to the College in 1687 by the actor and bibliophile William Cartwright the younger.</p><p>In the 1870s, the Governors of Dulwich College asked George Warner, an expert at the British Museum, to catalogue the manuscripts. Warner spent many years assessing the contents of the archive as he found it, expertly opening, repairing and ordering the documents in the archive, finally having them bound into a set of 36 volumes which he named the \\\\u2018Alleyn Papers\\\\u2019. He left the muniments, some of which are extremely large in size, unbound. In 1881, he published <i>The Catalogue of the Manuscripts and Muniments of Alleyn\\\\u2019s College of God\\\\u2019s Gift at Dulwich</i> (London: Longmans, Green, and Co.). Further discoveries at the archive were listed by Francis Bickley in the Second Series of <i>The Catalogue of the Manuscripts and Muniments of Alleyn\\\\u2019s College of God\\\\u2019s Gift at Dulwich</i> (London: privately printed, 1903).</p><p>Half of these manuscript volumes and most of the muniments concern the private affairs and non-theatrical businesses of the Henslowe and Alleyn families, as well as the history of Dulwich College since its inception. It is the other half of these volumes, representing the theatrical affairs of Henslowe and Alleyn, that are the subject of this website and electronic archive.</p><p>Less than half of the theatrical items in the Henslowe-Alleyn Papers have ever been transcribed, and these transcriptions are largely available only in out-of-print editions. R. A. Foakes\\\\u2019s 1977 photographic facsimile edition of two volumes of manuscripts (<i>The Henslowe Papers</i>) had a limited printing and only covers 20% of the relevant archive. The 2002 reprinting of Foakes\\\\u2019s standard 1961 edition of <i>Henslowe&#x27;s Diary</i> (Cambridge University Press) has widely encouraged scholars to pursue other material in the Dulwich archive. The archive is of value also to Museum of London archaeologists, who are now using new technology, such as radar scanning, to examine the original sites in Southwark and Shoreditch of various early modern playhouses, including the Theatre, the Globe, and the Rose, and who are radically re-evaluating their data about the building of these playhouses. Although transcriptions of the over 2200 pages of manuscripts are not yet available in this electronic archive and website, the members of the Henslowe-Alleyn Digitisation Project hope that making the manuscripts themselves available as photographic images will encourage further study and use of this very rich resource not just by literary, theatrical and manuscripts scholars, economic, social and regional historians and archaeologists but students, actors, directors and other theatre personnel, as well as all members of the general population of readers who are interested in the greatest age of English professional drama and theatrical production.</p><p>This Project is designed for research purposes only. For reasons of copyright, images and content are not downloadable from the website or the electronic archive, nor can any material be used, copied, circulated or reproduced in any format without permission and acknowledgement. The copyright of all the manuscripts in the Alleyn Papers belongs to the Governors of Dulwich College. For digital photographs or reproductions of any of the manuscripts, for permissions to reproduce them in any format, or for more information about the manuscript photography, the website and electronic archive, please use see Copyrights, Reproductions and Permissions.</p><p>The Project has been graciously supported by grants from The Leverhulme Trust, The British Academy, The Thriplow Charitable Trust, The Pilgrim Trust, the Henry E. Huntington Library, the Folger Shakepeare Library, the British and American Bibliographical Societies, and The University of Reading, for which the members of the Project remain very grateful.</p>\\"}]", "first_published_at": null, "subtitle": "", "depth": 3, "latest_revision_created_at": null, "live": true, "has_unpublished_changes": false, "owner": null, "show_in_menus": true, "numchild": 5, "pk": 5, "live_revision": null}	\N	5	1
3	f	2018-10-22 15:40:38.872758+00	{"seo_title": "", "search_description": "", "content_type": 31, "title": "Histories", "draft_title": "Example: simple markup", "url_path": "/home-3/example-simple-markup/", "path": "000100030002", "locked": false, "go_live_at": null, "expired": false, "expire_at": null, "slug": "example-simple-markup", "last_published_at": null, "body": "[{\\"id\\": \\"140ed86d-e0f7-4291-abab-3299664ce625\\", \\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><h2>Front Contents</h2><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><h2>Heading 2</h2><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><h3>Heading 3</h3><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><h4>Heading 4</h4><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><p>Heading 5</p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><p>Heading 6</p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><h2>Right hand content</h2><p>Right hand content is on for the site. The exceptions are: <a href=\\\\\\"/.html\\\\\\">home</a>, the first page of <a href=\\\\\\"//.html\\\\\\">ng003</a>, the group g3 in filebase which consists of the type02 pages and the group g3_01 in filebase which consists of the type01 pages surrounding type02, ie <a href=\\\\\\"/.html\\\\\\">type02 index</a> and following. <a href=\\\\\\"/.html\\\\\\">Test_II_01</a>, is defined as on in the xml file, overriding the off stated in filebase of the group g3.</p><h2>Links</h2><p>External to the site:</p><ul><li>Link to an external site, <a href=\\\\\\"http://www.google.com\\\\\\">the google search engine</a>. Default in the same window.</li><li>Link to an external site, <a href=\\\\\\"http://www.google.com\\\\\\">the google search engine</a>, in an external window</li><li>Link to the same external site <a href=\\\\\\"http://www.google.com\\\\\\">http://www.google.com</a>, this time using &lt;xptr&gt;</li><li>Link to an <a href=\\\\\\"mailto:paul.spence@kcl.ac.uk\\\\\\">email</a></li></ul><p>Internal to the site:</p><ul><li>Link to <a href=\\\\\\"/.html\\\\\\">another page</a> internal to the site (type01)</li><li>Link to <a href=\\\\\\"/.html\\\\\\">another page</a> internal to the site and in new window (type01)</li><li>Link to <a href=\\\\\\"/.html\\\\\\">another page</a> internal to the site (type02)</li><li>Link to <a href=\\\\\\"/ng003/ng003_07.html\\\\\\">another page</a> internal to the site (type03)</li><li>Link to <a href=\\\\\\"/.html\\\\\\">another page</a> internal to the site (type04)</li></ul><p>Internal to the page:</p><ul><li>Link <a href=\\\\\\"#anchor1\\\\\\">internal to this page</a>, using a pointer to an anchor</li><li>Link <a href=\\\\\\"#anchor2\\\\\\">internal to this page</a>, using a pointer to a paragraph</li><li>Link <a href=\\\\\\"#anchor3\\\\\\">internal to this page</a>, using a pointer to a division header</li></ul><h2>Box Header</h2><p>Box paragraph</p><ul><li>list item 1</li><li>list item 2</li><li>list item 3</li></ul><h2>Normal text with footnotes</h2><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus.<a href=\\\\\\"#fn01\\\\\\">1</a> Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo.<a href=\\\\\\"#fn02\\\\\\">2</a> Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus.</p><p>Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.<a href=\\\\\\"#fn03\\\\\\">3</a></p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus.<a href=\\\\\\"#fn04\\\\\\">4</a> Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis.<a href=\\\\\\"#fn05\\\\\\">5</a> Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.<a href=\\\\\\"#fn06\\\\\\">6</a></p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus.<a href=\\\\\\"#fn07\\\\\\">7</a> Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.<a href=\\\\\\"#fn08\\\\\\">8</a></p><p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.<a href=\\\\\\"#fn09\\\\\\">9</a> Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><p><b>Fusce gravida blandit turpis.</b> Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. <i>Phasellus ultrices libero non lectus.</i> In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. <b><i>Curabitur lectus turpis</i></b>, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus.</p><h3>Pre-formatted text</h3><p>&lt;xsl:when test=&quot;@rend=&#x27;pre&#x27;&quot;&gt; &lt;pre&gt; &lt;xsl:apply-templates/&gt; &lt;/pre&gt; &lt;/xsl:when&gt;</p><h2>Back Contents: Bibliography</h2><h3>Primary</h3><ul><li>AuthorFirstName, <i>article title</i>, <i>journal title</i>, pp abc-xyz.</li><li>And a book with a <i>title</i></li><li>And a book with a <i>title</i></li></ul><h3>Secondary</h3><ul><li>And a book with a <i>title</i></li><li>And a book with a <i>title</i></li><li>And a book with a <i>title</i></li></ul><h2>Back Contents: Glossary</h2><p>Glossary label headGlossary<i> item</i> head label1item1 label2item2 label3item4</p><h3>Footnotes</h3><p>1.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. <a href=\\\\\\"#fnLink01\\\\\\">Back to context...</a>2.Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. Vivamus lacinia. Phasellus ultrices libero non lectus. In vel nulla a ligula venenatis cursus. Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. <a href=\\\\\\"#fnLink02\\\\\\">Back to context...</a>3.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. <a href=\\\\\\"#fnLink03\\\\\\">Back to context...</a>4.Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. <a href=\\\\\\"#fnLink04\\\\\\">Back to context...</a>5.Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. Donec purus arcu, scelerisque non, convallis vitae, tincidunt et, tellus. <a href=\\\\\\"#fnLink05\\\\\\">Back to context...</a>6.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. <a href=\\\\\\"#fnLink06\\\\\\">Back to context...</a>7.Nam et ipsum. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. <a href=\\\\\\"#fnLink07\\\\\\">Back to context...</a>8.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec porta ligula vitae nibh. Sed malesuada erat in justo. Sed risus odio, imperdiet sit amet, malesuada at, hendrerit sit amet, pede. Maecenas dignissim bibendum velit. <a href=\\\\\\"#fnLink08\\\\\\">Back to context...</a>9.Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce gravida blandit turpis. Curabitur lectus turpis, adipiscing nec, pellentesque eu, vestibulum vitae, turpis. <a href=\\\\\\"#fnLink09\\\\\\">Back to context...</a></p>\\"}]", "first_published_at": null, "subtitle": "", "depth": 3, "latest_revision_created_at": null, "live": true, "has_unpublished_changes": false, "owner": null, "show_in_menus": true, "numchild": 2, "pk": 11, "live_revision": null}	\N	11	1
4	f	2018-10-22 15:40:46.666851+00	{"seo_title": "", "search_description": "", "content_type": 31, "title": "Digital Essays", "draft_title": "Digital Essays", "url_path": "/home-3/digital-essays/", "path": "000100030003", "locked": false, "go_live_at": null, "expired": false, "expire_at": null, "slug": "digital-essays", "last_published_at": null, "body": "[{\\"id\\": \\"a3484b22-1df6-404f-845b-5f3189da7fe9\\", \\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><h2>Introduction</h2><p>In order to understand the richness and scope of the images in the Henslowe Alleyn electronic archive, members of the Henslowe-Alleyn Digitisation Project have contributed \\\\u2018digital essays\\\\u2019 on a representative sample of these wide-ranging documents. Included are essays on poems, personal letters, private leases and deeds, public or government indentures and letters patent, \\\\u2018diaries\\\\u2019 or account books, a theatrical part, a theatrical plot, and a play manuscript, all of which reveal numerous aspects of theatrical production and performance.</p><p>More broadly, all of these documents are unique and invaluable witnesses to literary, theatrical, social and economic history in the English early modern age, in which theatre entrepreneurs such as Henslowe and Alleyn could, in effect, collaborate with monarchs, privy councillors, aristocrats, and religious and social leaders, as well as everyday colleagues in the theatre industry such as dramatists, actors, tailors, carpenters, tradesmen, scriveners and even the &#x27;watermen&#x27; who rowed playhouse customers across the Thames. The papers of Henslowe and Alleyn record both ordinary and extraordinary daily life, in which the acts of contracting plays, inspecting new costumes, bailing actors from debtors&#x27; prison, and sharing festive meals with &#x27;poor brethren&#x27; co-existed with performing at court for the monarch and dining at the homes of many of the most influential figures in the kingdom. These manuscripts therefore demonstrate that there was not always a strict or hierarchical division between those seeking patronage at the most basic level and those offering it at the highest level.</p><p>Above all, these digital essays suggest that rather than being powerless, marginalised or scandalous, early modern theatre professionals moved successfully among and prospered in all political, economic and social spheres. Thus, these essays offer us the strongest possible documentary evidence that early modern English drama and performance did not simply reflect culture but create it.</p><h2>List of Essays</h2><p>George Warner and Francis Bickely catalogued the Henslowe-Alleyn papers by topic in numerous volumes of manuscripts; for these catalogues, see series 1 and 2 of <i>The Catalogue of the Manuscripts and Muniments of Alleyn\\\\u2019s College of God\\\\u2019s Gift at Dulwich</i> (London, 1881, 1903). The digital essays are presented in the order of the catalogue number of the documents under discussion.</p><p>Manuscripts in MSS 1</p><ul><li>\\\\u2018W.P\\\\u2019s Letter to Edward Alleyn with a Copy of Verses Addressed to \\\\u2018sweete Nedd\\\\u2019, by H. R. Woudhuysen.</li><li>\\\\u2018An Inventory of Theatrical Apparel (c. 1601/2)\\\\u2019, by S. P. Cerasano.</li><li>\\\\u2018A Letter from Nathan Field, Robert Daborne and Philip Massinger to Philip Henslowe (c. 1614)\\\\u2019, by R. A. Foakes and Grace Ioppolo.</li><li>\\\\u2018Robert Daborne&#x27;s Contracts to Write Plays for Philip Henslowe (1613)\\\\u2019, by Grace Ioppolo.</li><li>\\\\u2018Robert Daborne&#x27;s Foul Papers and Fair Copies (1613)&#x27;, by Grace Ioppolo.</li><li>\\\\u2018Ben Jonson\\\\u2019s Autograph Fair Copies of Two Poems\\\\u2019, by Peter Beal.</li><li>The \\\\u2018Part\\\\u2019 of Orlando in Robert Greene\\\\u2019s play <i>Orlando Furioso</i>&#x27;, by R. A. Foakes.</li></ul><p>Manuscripts in MSS 2</p><ul><li>\\\\u2018A Draft of the Royal Patent for the Mastership of the Game of Bears, Bulls, and Mastiff Dogs (November 24, 1604)\\\\u2019, by S. P. Cerasano.</li></ul><p>Manuscripts in MSS 7</p><ul><li>\\\\u2018Henslowe\\\\u2019s Diary (1591-1609)\\\\u2019, by S. P. Cerasano.</li></ul><p>Manuscripts in MSS 9</p><ul><li>\\\\u2018The Diary of Edward Alleyn (1617-1622)\\\\u2019, by Grace Ioppolo.</li></ul><p>Manuscripts in MSS 19</p><ul><li>\\\\u2018The &#x27;Platt&#x27; (or Plot) of <i>The Second Part of the Seven Deadly Sins</i>\\\\u2019, by R. A. Foakes.</li></ul><p>Manuscripts in MSS 20</p><ul><li>\\\\u2018The Manuscript of <i>The Telltale</i>\\\\u2019, by R. A. Foakes, Peter Beal and Grace Ioppolo.</li></ul><p>Muniments, Series 1 and 3</p><ul><li>\\\\u2018The Deed of Partnership in the Rose Playhouse (January 10, 1587)\\\\u2019, by Julian Bowsher and S. P. Cerasano.</li><li>\\\\u2018The Contract for the Fortune Playhouse (1600)\\\\u2019, by R. A. Foakes.</li><li>\\\\u2018The Foundation Deed of God\\\\u2019s Gift College (1619)\\\\u2019, by Jan Piggott.</li></ul>\\"}]", "first_published_at": null, "subtitle": "", "depth": 3, "latest_revision_created_at": null, "live": true, "has_unpublished_changes": false, "owner": null, "show_in_menus": true, "numchild": 15, "pk": 14, "live_revision": null}	\N	14	1
5	f	2018-10-22 15:40:54.265893+00	{"seo_title": "", "search_description": "", "content_type": 28, "title": "A Catalogue of the Manuscript and Muniment Images", "draft_title": "A Catalogue of the Manuscript and Muniment Images", "url_path": "/home-3/a-catalogue-of-the-manuscript-and-muniment-images/", "path": "000100030004", "locked": false, "go_live_at": null, "expired": false, "expire_at": null, "slug": "a-catalogue-of-the-manuscript-and-muniment-images", "last_published_at": null, "body": "[{\\"id\\": \\"377b4505-1098-43e9-b15b-96844dd306fa\\", \\"type\\": \\"paragraph\\", \\"value\\": \\"<p></p><h2>Introduction</h2><p>Catalogue Adapted by Grace Ioppolo from George Warner, <i>The Catalogue of the Manuscripts and Muniments of Alleyn\\\\u2019s College of God\\\\u2019s Gift at Dulwich</i> (London: Longmans, Green, and Co, 1881); and Francis Bickley, <i>The Second Series of The Catalogue of the Manuscripts and Muniments of Alleyn\\\\u2019s College of God\\\\u2019s Gift at Dulwich</i> (London: privately printed, 1903).</p><p>The main aim of the Henslowe-Alleyn Digitisation Project is to provide the best possible images of every page of the manuscripts relating to theatrical affairs in the Henslowe-Alleyn Papers at Dulwich College. However, this aim had to be adjusted to suit the funding, resources and equipment available during photography and the conservation of the manuscripts being photographed.</p><h2>The Photography of the Images</h2><p></p><p>Dr David Cooper, assisted by Prof Grace Ioppolo, and, often, Mrs Gill Cooper, photographed each page of the manuscripts in 600 dpi resolution with professional equipment, including a tripod-mounted Sinar camera, two tripod-mounted lights, and specialised Macintosh software to process each photograph. The set-up of each photograph took between 5 and 30 minutes, and the photographs presented here of each image resulted from 16-64 photographs, which were integrated by computer software into one single photograph.</p><p>In order to protect this archive of fragile vellum, parchment and paper manuscripts, the photography of manuscripts in bound volumes was done using a specially-designed cradle (produced under Dr Cooper\\\\u2019s supervision) that used a vacuum pump to lightly flatten each page against the cradle. In this way, neither the manuscripts nor the binding of their volumes sustained any damage during photography. Larger unbound items, including the muniments, were photographed while placed flat on the floor, using a special, and more complicated, photography process. All of the items, whether bound or unbound, were photographed against a black background that provides the best possible contrast and offers remarkably clear images of watermarks in the paper manuscripts.</p><p>As many pages as possible, including of blank verso or recto pages, were photographed. An exception to this rule were the versos of the Orlando \\\\u2018part\\\\u2019, which were not photographed (and contained no text or markings at all). As the \\\\u2018part\\\\u2019 was originally put together as a continuous scroll, successive recto images give a close representation of its original state.</p><p>Dr Cooper\\\\u2019s method of photography produces the best possible result for bound and unbound manuscripts. In only a very few instances is any text obscured by the 19th century binding of the volumes or by the attachment of seals after the completion of manuscripts or muniments. A small number of manuscripts, including those that are still tightly folded and cannot be opened flat, were too fragile to photograph at this time. It is possible that with further funding, more manuscripts in the archive will be photographed and their images added to the site.</p><p>All photography was done at Dulwich College between August 2004 and September 2007. Dr and Mrs Cooper and Prof. Ioppolo remain very grateful to the generous support offered by staff at Dulwich College throughout that time.</p><h2>The Processing of the Images</h2><p>Dr and Mrs Cooper and Prof. Ioppolo processed the images using Adobe Photoshop; this processing mainly consisted of rotating and/or straightening the images and cropping and regularising the background. The resolution of the images was so high that further enhancement was not necessary.</p><p>All images have been rotated to a position in which the text can be most easily read. Thus, some of the images are not in the same position in which the original pages are currently bound. Examples of this can be found in the versos of numerous pages, especially in the latter part of Henslowe\\\\u2019s \\\\u2018Diary\\\\u2019, which was turned upside down on occasion so that Henslowe could write from the last pages forward. The images of these \\\\u2018upside down\\\\u2019 original pages, and many others, including those versos of letters containing addresses, have been rotated right side up.</p><h2>The Order of the Images</h2><p>These images are offered as \\\\u2018thumbnails\\\\u2019, that is, a small view of each image, which users can click on to bring up that image.</p><p>As noted elsewhere in this website, the numbering of images follows the cataloguing of George Warner and Charles Bickley in series 1 and 2 of <i>The Catalogue of the Manuscripts and Muniments of Alleyn\\\\u2019s College of God\\\\u2019s Gift at Dulwich</i> (London, 1881, 1903); both volumes are widely available at major libraries. Prof. Ioppolo has produced a very condensed version of these catalogues for this website.</p><p>As part of their cataloguing, Warner and Bickley used pencil to foliate the volumes of manuscript; that is, they used a pencil to number each recto (or right-hand) page in succession and did not number the verso (or left-hand) page. Warner\\\\u2019s and Bickley\\\\u2019s folio numbers supercede those originally written out by the authors of the documents. Items such as Henslowe\\\\u2019s and Alleyn\\\\u2019s \\\\u2018Diaries&#x27; and the manuscript of <i>The Telltale</i> (volumes 7, 9 and 20), which were already bound at the time of cataloguing can therefore be easily indexed by these folio numbers. For example, folio 50r or 50v in Henslowe&#x27;s Diary can be found under the image numbers 07-50r and 07-50v.</p><p>However, Warner and Bickley also had to catalogue hundreds of pages of unbound manuscripts, many consisting of four or more, rather than two, pages each. For example, an individual document can be in the form of a bifolium, that is, a large sheet of paper folded vertically once to produce four pages, or in the form of a bifolium and some single pages. Thus, in MSS 1, 2, 3, and 5, for example, Warner and Bickley placed numerous individual documents (or \\\\u2018Articles\\\\u2019 as they called them) in succession. Although they foliated these documents, they indexed them by Article number. Hence, for example, the fourteenth document in MSS 1 is indexed as Article 14 (even though it begins with folio 19). On this website and electronic archive, such items are also represented by Article number, for example, as 01-14, with successive recto and verso numbers included (as in 01-14-01r, 01-14-01v, 01-14-02r, 01-14-02v).</p><p>It is thus important to note that this website does not use the original folio numbers assigned to any &#x27;Article&#x27; by Warner and Bickley. This website does use the original folio numbers assigned to manuscripts that do not consist of \\\\u2018Articles\\\\u2019.</p><p>The members of the Project hope that additional funding will become available in the future to allow us to offer simple transcriptions of most, if not all, of these images. Until then, for the transcription and study of the images of Henslowe\\\\u2019s &#x27;Diary&#x27;, we recommend the use of R. A. Foakes\\\\u2019s edition (Cambridge: Cambridge University Press, reprinted in 2002).</p>\\"}]", "first_published_at": null, "subtitle": "", "depth": 3, "latest_revision_created_at": null, "live": true, "has_unpublished_changes": false, "owner": null, "show_in_menus": true, "numchild": 12, "pk": 30, "live_revision": null}	\N	30	1
\.


--
-- Name: wagtailcore_pagerevision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailcore_pagerevision_id_seq', 5, true);


--
-- Data for Name: wagtailcore_pageviewrestriction; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailcore_pageviewrestriction (id, password, page_id, restriction_type) FROM stdin;
\.


--
-- Data for Name: wagtailcore_pageviewrestriction_groups; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailcore_pageviewrestriction_groups (id, pageviewrestriction_id, group_id) FROM stdin;
\.


--
-- Name: wagtailcore_pageviewrestriction_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_groups_id_seq', 1, false);


--
-- Name: wagtailcore_pageviewrestriction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailcore_pageviewrestriction_id_seq', 1, false);


--
-- Data for Name: wagtailcore_site; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailcore_site (id, hostname, port, is_default_site, root_page_id, site_name) FROM stdin;
1	localhost	80	t	4	\N
\.


--
-- Name: wagtailcore_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailcore_site_id_seq', 1, true);


--
-- Data for Name: wagtaildocs_document; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtaildocs_document (id, title, file, created_at, uploaded_by_user_id, collection_id, file_size) FROM stdin;
\.


--
-- Name: wagtaildocs_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtaildocs_document_id_seq', 1, false);


--
-- Data for Name: wagtailembeds_embed; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailembeds_embed (id, url, max_width, type, html, title, author_name, provider_name, thumbnail_url, width, height, last_updated) FROM stdin;
\.


--
-- Name: wagtailembeds_embed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailembeds_embed_id_seq', 1, false);


--
-- Data for Name: wagtailforms_formsubmission; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailforms_formsubmission (id, form_data, submit_time, page_id) FROM stdin;
\.


--
-- Name: wagtailforms_formsubmission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailforms_formsubmission_id_seq', 1, false);


--
-- Data for Name: wagtailimages_image; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailimages_image (id, title, file, width, height, created_at, focal_point_x, focal_point_y, focal_point_width, focal_point_height, uploaded_by_user_id, file_size, collection_id, file_hash) FROM stdin;
\.


--
-- Name: wagtailimages_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailimages_image_id_seq', 1, false);


--
-- Data for Name: wagtailimages_rendition; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailimages_rendition (id, file, width, height, focal_point_key, image_id, filter_spec) FROM stdin;
\.


--
-- Name: wagtailimages_rendition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailimages_rendition_id_seq', 1, false);


--
-- Data for Name: wagtailredirects_redirect; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailredirects_redirect (id, old_path, is_permanent, redirect_link, redirect_page_id, site_id) FROM stdin;
\.


--
-- Name: wagtailredirects_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailredirects_redirect_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_editorspick; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailsearch_editorspick (id, sort_order, description, page_id, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_editorspick_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailsearch_editorspick_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_query; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailsearch_query (id, query_string) FROM stdin;
\.


--
-- Name: wagtailsearch_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailsearch_query_id_seq', 1, false);


--
-- Data for Name: wagtailsearch_querydailyhits; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailsearch_querydailyhits (id, date, hits, query_id) FROM stdin;
\.


--
-- Name: wagtailsearch_querydailyhits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailsearch_querydailyhits_id_seq', 1, false);


--
-- Data for Name: wagtailusers_userprofile; Type: TABLE DATA; Schema: public; Owner: henslowe
--

COPY public.wagtailusers_userprofile (id, submitted_notifications, approved_notifications, rejected_notifications, user_id, preferred_language, current_time_zone, avatar) FROM stdin;
\.


--
-- Name: wagtailusers_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: henslowe
--

SELECT pg_catalog.setval('public.wagtailusers_userprofile_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: cms_catalogue_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.cms_catalogue
    ADD CONSTRAINT cms_catalogue_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: cms_catalogueentry_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.cms_catalogueentry
    ADD CONSTRAINT cms_catalogueentry_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: cms_homepage_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.cms_homepage
    ADD CONSTRAINT cms_homepage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: cms_image_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.cms_image
    ADD CONSTRAINT cms_image_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: cms_richtextpage_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.cms_richtextpage
    ADD CONSTRAINT cms_richtextpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collection_path_key; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_path_key UNIQUE (path);


--
-- Name: wagtailcore_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_collection
    ADD CONSTRAINT wagtailcore_collection_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq UNIQUE (collectionviewrestriction_id, group_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_collectionviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collectionviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq UNIQUE (group_id, collection_id, permission_id);


--
-- Name: wagtailcore_groupcollectionpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcollectionpermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppageper_group_id_page_id_permiss_0898bdf8_uniq UNIQUE (group_id, page_id, permission_type);


--
-- Name: wagtailcore_grouppagepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppagepermission_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_page_path_key; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_path_key UNIQUE (path);


--
-- Name: wagtailcore_page_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pagerevision_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq UNIQUE (pageviewrestriction_id, group_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageviewrestriction_groups_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_pageviewrestriction_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageviewrestriction_pkey PRIMARY KEY (id);


--
-- Name: wagtailcore_site_hostname_port_2c626d70_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_hostname_port_2c626d70_uniq UNIQUE (hostname, port);


--
-- Name: wagtailcore_site_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_pkey PRIMARY KEY (id);


--
-- Name: wagtaildocs_document_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_pkey PRIMARY KEY (id);


--
-- Name: wagtailembeds_embed_url_max_width_8a2922d8_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailembeds_embed
    ADD CONSTRAINT wagtailembeds_embed_url_max_width_8a2922d8_uniq UNIQUE (url, max_width);


--
-- Name: wagtailforms_formsubmission_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsubmission_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_image_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_pkey PRIMARY KEY (id);


--
-- Name: wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq UNIQUE (image_id, filter_spec, focal_point_key);


--
-- Name: wagtailimages_rendition_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendition_pkey PRIMARY KEY (id);


--
-- Name: wagtailredirects_redirect_old_path_site_id_783622d7_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_old_path_site_id_783622d7_uniq UNIQUE (old_path, site_id);


--
-- Name: wagtailredirects_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_redirect_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_editorspick_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editorspick_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_query_query_string_key; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailsearch_query
    ADD CONSTRAINT wagtailsearch_query_query_string_key UNIQUE (query_string);


--
-- Name: wagtailsearch_querydailyhits_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_pkey PRIMARY KEY (id);


--
-- Name: wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_querydailyhits_query_id_date_1dd232e6_uniq UNIQUE (query_id, date);


--
-- Name: wagtailusers_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_pkey PRIMARY KEY (id);


--
-- Name: wagtailusers_userprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: wagtailcore_collection_path_d848dc19_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_collection_path_d848dc19_like ON public.wagtailcore_collection USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_collectionview_collectionviewrestriction__47320efd; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_collectionview_collectionviewrestriction__47320efd ON public.wagtailcore_collectionviewrestriction_groups USING btree (collectionviewrestriction_id);


--
-- Name: wagtailcore_collectionviewrestriction_collection_id_761908ec; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_collectionviewrestriction_collection_id_761908ec ON public.wagtailcore_collectionviewrestriction USING btree (collection_id);


--
-- Name: wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_collectionviewrestriction_groups_group_id_1823f2a3 ON public.wagtailcore_collectionviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_collection_id_5423575a; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_groupcollectionpermission_collection_id_5423575a ON public.wagtailcore_groupcollectionpermission USING btree (collection_id);


--
-- Name: wagtailcore_groupcollectionpermission_group_id_05d61460; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_groupcollectionpermission_group_id_05d61460 ON public.wagtailcore_groupcollectionpermission USING btree (group_id);


--
-- Name: wagtailcore_groupcollectionpermission_permission_id_1b626275; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_groupcollectionpermission_permission_id_1b626275 ON public.wagtailcore_groupcollectionpermission USING btree (permission_id);


--
-- Name: wagtailcore_grouppagepermission_group_id_fc07e671; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_grouppagepermission_group_id_fc07e671 ON public.wagtailcore_grouppagepermission USING btree (group_id);


--
-- Name: wagtailcore_grouppagepermission_page_id_710b114a; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_grouppagepermission_page_id_710b114a ON public.wagtailcore_grouppagepermission USING btree (page_id);


--
-- Name: wagtailcore_page_content_type_id_c28424df; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_page_content_type_id_c28424df ON public.wagtailcore_page USING btree (content_type_id);


--
-- Name: wagtailcore_page_first_published_at_2b5dd637; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_page_first_published_at_2b5dd637 ON public.wagtailcore_page USING btree (first_published_at);


--
-- Name: wagtailcore_page_live_revision_id_930bd822; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_page_live_revision_id_930bd822 ON public.wagtailcore_page USING btree (live_revision_id);


--
-- Name: wagtailcore_page_owner_id_fbf7c332; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_page_owner_id_fbf7c332 ON public.wagtailcore_page USING btree (owner_id);


--
-- Name: wagtailcore_page_path_98eba2c8_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_page_path_98eba2c8_like ON public.wagtailcore_page USING btree (path varchar_pattern_ops);


--
-- Name: wagtailcore_page_slug_e7c11b8f; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f ON public.wagtailcore_page USING btree (slug);


--
-- Name: wagtailcore_page_slug_e7c11b8f_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_page_slug_e7c11b8f_like ON public.wagtailcore_page USING btree (slug varchar_pattern_ops);


--
-- Name: wagtailcore_pagerevision_created_at_66954e3b; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_pagerevision_created_at_66954e3b ON public.wagtailcore_pagerevision USING btree (created_at);


--
-- Name: wagtailcore_pagerevision_page_id_d421cc1d; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_pagerevision_page_id_d421cc1d ON public.wagtailcore_pagerevision USING btree (page_id);


--
-- Name: wagtailcore_pagerevision_submitted_for_moderation_c682e44c; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_pagerevision_submitted_for_moderation_c682e44c ON public.wagtailcore_pagerevision USING btree (submitted_for_moderation);


--
-- Name: wagtailcore_pagerevision_user_id_2409d2f4; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_pagerevision_user_id_2409d2f4 ON public.wagtailcore_pagerevision USING btree (user_id);


--
-- Name: wagtailcore_pageviewrestri_pageviewrestriction_id_f147a99a; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_pageviewrestri_pageviewrestriction_id_f147a99a ON public.wagtailcore_pageviewrestriction_groups USING btree (pageviewrestriction_id);


--
-- Name: wagtailcore_pageviewrestriction_groups_group_id_6460f223; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_pageviewrestriction_groups_group_id_6460f223 ON public.wagtailcore_pageviewrestriction_groups USING btree (group_id);


--
-- Name: wagtailcore_pageviewrestriction_page_id_15a8bea6; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_pageviewrestriction_page_id_15a8bea6 ON public.wagtailcore_pageviewrestriction USING btree (page_id);


--
-- Name: wagtailcore_site_hostname_96b20b46; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_site_hostname_96b20b46 ON public.wagtailcore_site USING btree (hostname);


--
-- Name: wagtailcore_site_hostname_96b20b46_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_site_hostname_96b20b46_like ON public.wagtailcore_site USING btree (hostname varchar_pattern_ops);


--
-- Name: wagtailcore_site_root_page_id_e02fb95c; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailcore_site_root_page_id_e02fb95c ON public.wagtailcore_site USING btree (root_page_id);


--
-- Name: wagtaildocs_document_collection_id_23881625; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtaildocs_document_collection_id_23881625 ON public.wagtaildocs_document USING btree (collection_id);


--
-- Name: wagtaildocs_document_uploaded_by_user_id_17258b41; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtaildocs_document_uploaded_by_user_id_17258b41 ON public.wagtaildocs_document USING btree (uploaded_by_user_id);


--
-- Name: wagtailforms_formsubmission_page_id_e48e93e7; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailforms_formsubmission_page_id_e48e93e7 ON public.wagtailforms_formsubmission USING btree (page_id);


--
-- Name: wagtailimages_image_collection_id_c2f8af7e; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailimages_image_collection_id_c2f8af7e ON public.wagtailimages_image USING btree (collection_id);


--
-- Name: wagtailimages_image_created_at_86fa6cd4; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailimages_image_created_at_86fa6cd4 ON public.wagtailimages_image USING btree (created_at);


--
-- Name: wagtailimages_image_uploaded_by_user_id_5d73dc75; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailimages_image_uploaded_by_user_id_5d73dc75 ON public.wagtailimages_image USING btree (uploaded_by_user_id);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201 ON public.wagtailimages_rendition USING btree (filter_spec);


--
-- Name: wagtailimages_rendition_filter_spec_1cba3201_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailimages_rendition_filter_spec_1cba3201_like ON public.wagtailimages_rendition USING btree (filter_spec varchar_pattern_ops);


--
-- Name: wagtailimages_rendition_image_id_3e1fd774; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailimages_rendition_image_id_3e1fd774 ON public.wagtailimages_rendition USING btree (image_id);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b ON public.wagtailredirects_redirect USING btree (old_path);


--
-- Name: wagtailredirects_redirect_old_path_bb35247b_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailredirects_redirect_old_path_bb35247b_like ON public.wagtailredirects_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: wagtailredirects_redirect_redirect_page_id_b5728a8f; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailredirects_redirect_redirect_page_id_b5728a8f ON public.wagtailredirects_redirect USING btree (redirect_page_id);


--
-- Name: wagtailredirects_redirect_site_id_780a0e1e; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailredirects_redirect_site_id_780a0e1e ON public.wagtailredirects_redirect USING btree (site_id);


--
-- Name: wagtailsearch_editorspick_page_id_28cbc274; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailsearch_editorspick_page_id_28cbc274 ON public.wagtailsearch_editorspick USING btree (page_id);


--
-- Name: wagtailsearch_editorspick_query_id_c6eee4a0; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailsearch_editorspick_query_id_c6eee4a0 ON public.wagtailsearch_editorspick USING btree (query_id);


--
-- Name: wagtailsearch_query_query_string_e785ea07_like; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailsearch_query_query_string_e785ea07_like ON public.wagtailsearch_query USING btree (query_string varchar_pattern_ops);


--
-- Name: wagtailsearch_querydailyhits_query_id_2185994b; Type: INDEX; Schema: public; Owner: henslowe
--

CREATE INDEX wagtailsearch_querydailyhits_query_id_2185994b ON public.wagtailsearch_querydailyhits USING btree (query_id);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_catalogue_page_ptr_id_010dbab3_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.cms_catalogue
    ADD CONSTRAINT cms_catalogue_page_ptr_id_010dbab3_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_catalogueentry_page_ptr_id_885c72ee_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.cms_catalogueentry
    ADD CONSTRAINT cms_catalogueentry_page_ptr_id_885c72ee_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_homepage_page_ptr_id_3967ea6a_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.cms_homepage
    ADD CONSTRAINT cms_homepage_page_ptr_id_3967ea6a_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_image_page_ptr_id_6f9eeab3_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.cms_image
    ADD CONSTRAINT cms_image_page_ptr_id_6f9eeab3_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cms_richtextpage_page_ptr_id_eb2bfc13_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.cms_richtextpage
    ADD CONSTRAINT cms_richtextpage_page_ptr_id_eb2bfc13_fk_wagtailcore_page_id FOREIGN KEY (page_ptr_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collecti_collection_id_761908ec_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction
    ADD CONSTRAINT wagtailcore_collecti_collection_id_761908ec_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco FOREIGN KEY (collectionviewrestriction_id) REFERENCES public.wagtailcore_collectionviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_collectionviewrestriction_groups
    ADD CONSTRAINT wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcol_group_id_05d61460_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_group_id_05d61460_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_groupcollectionpermission
    ADD CONSTRAINT wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_grouppag_page_id_710b114a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_grouppagepermission
    ADD CONSTRAINT wagtailcore_grouppag_page_id_710b114a_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_content_type_id_c28424df_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_content_type_id_c28424df_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_live_revision_id_930bd822_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_live_revision_id_930bd822_fk_wagtailco FOREIGN KEY (live_revision_id) REFERENCES public.wagtailcore_pagerevision(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_page
    ADD CONSTRAINT wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevi_page_id_d421cc1d_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevi_page_id_d421cc1d_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pagerevision
    ADD CONSTRAINT wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageview_group_id_6460f223_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_group_id_6460f223_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction
    ADD CONSTRAINT wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_pageviewrestriction_groups
    ADD CONSTRAINT wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco FOREIGN KEY (pageviewrestriction_id) REFERENCES public.wagtailcore_pageviewrestriction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailcore_site
    ADD CONSTRAINT wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id FOREIGN KEY (root_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document_collection_id_23881625_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_collection_id_23881625_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtaildocs_document
    ADD CONSTRAINT wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user FOREIGN KEY (uploaded_by_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailforms_formsubmission
    ADD CONSTRAINT wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco FOREIGN KEY (collection_id) REFERENCES public.wagtailcore_collection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailimages_image
    ADD CONSTRAINT wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user FOREIGN KEY (uploaded_by_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailimages_rendition
    ADD CONSTRAINT wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim FOREIGN KEY (image_id) REFERENCES public.wagtailimages_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco FOREIGN KEY (redirect_page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailredirects_red_site_id_780a0e1e_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailredirects_redirect
    ADD CONSTRAINT wagtailredirects_red_site_id_780a0e1e_fk_wagtailco FOREIGN KEY (site_id) REFERENCES public.wagtailcore_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editor_page_id_28cbc274_fk_wagtailco; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editor_page_id_28cbc274_fk_wagtailco FOREIGN KEY (page_id) REFERENCES public.wagtailcore_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailsearch_editorspick
    ADD CONSTRAINT wagtailsearch_editor_query_id_c6eee4a0_fk_wagtailse FOREIGN KEY (query_id) REFERENCES public.wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailsearch_queryd_query_id_2185994b_fk_wagtailse; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailsearch_querydailyhits
    ADD CONSTRAINT wagtailsearch_queryd_query_id_2185994b_fk_wagtailse FOREIGN KEY (query_id) REFERENCES public.wagtailsearch_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: henslowe
--

ALTER TABLE ONLY public.wagtailusers_userprofile
    ADD CONSTRAINT wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

