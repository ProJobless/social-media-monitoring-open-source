--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_types; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE account_types (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: account_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_types_id_seq OWNED BY account_types.id;


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    name character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    phone character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    account_type_id integer,
    organization_list text,
    reseller_id integer,
    street character varying(255),
    street1 character varying(255),
    country_code_id integer,
    city character varying(255),
    state character varying(255),
    postalcode character varying(255),
    web character varying(255),
    country_id integer
);


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: accounts_keywords; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE accounts_keywords (
    account_id integer NOT NULL,
    keyword_id integer NOT NULL
);


--
-- Name: accounts_resellers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE accounts_resellers (
    account_id integer,
    reseller_id integer
);


--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    resource_id character varying(255) NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_id integer,
    author_type character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    namespace character varying(255)
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE admin_users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admin_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admin_users_id_seq OWNED BY admin_users.id;


--
-- Name: aggregate_results; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE aggregate_results (
    id integer NOT NULL,
    organization_id integer,
    photos integer,
    videos integer,
    score integer,
    reviews integer,
    review_avg double precision,
    tweets integer,
    tweets_new integer,
    fb_likes integer,
    fb_likes_new integer,
    mentions integer,
    mentions_new integer,
    blog_posts integer,
    blog_posts_new integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    followers integer,
    following integer,
    listed integer,
    reviews_new integer,
    negative_reviews integer,
    negative_reviews_new integer,
    neutral_reviews integer,
    neutral_reviews_new integer,
    positive_reviews integer,
    positive_reviews_new integer,
    competitor_results character varying(255),
    fs_checkins_count integer,
    fs_users_count integer,
    fs_tip_count integer
);


--
-- Name: aggregate_results_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE aggregate_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aggregate_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE aggregate_results_id_seq OWNED BY aggregate_results.id;


--
-- Name: authentications; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authentications (
    id integer NOT NULL,
    user_id integer,
    provider character varying(255),
    uid character varying(255),
    token character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: authentications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authentications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authentications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authentications_id_seq OWNED BY authentications.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    catgroup character varying(255),
    category_id integer,
    country_id integer
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: categories_organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categories_organizations (
    category_id integer,
    organization_id integer
);


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    country_id integer NOT NULL,
    division_id integer,
    geonames_id integer NOT NULL,
    name character varying(255) NOT NULL,
    ascii_name character varying(255),
    alternate_name text,
    latitude numeric(14,8) NOT NULL,
    longitude numeric(14,8) NOT NULL,
    country_iso_code_two_letters character varying(255),
    admin_1_code character varying(255),
    admin_2_code character varying(255),
    admin_3_code character varying(255),
    admin_4_code character varying(255),
    population integer,
    elevation integer,
    geonames_timezone_id integer
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: command_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE command_items (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: command_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE command_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: command_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE command_items_id_seq OWNED BY command_items.id;


--
-- Name: competitors_organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE competitors_organizations (
    organization_a_id integer NOT NULL,
    organization_b_id integer NOT NULL
);


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contacts (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    phone character varying(255),
    city character varying(255),
    country character varying(255),
    subject character varying(255),
    comment text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: content_providers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE content_providers (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    url character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: content_providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE content_providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: content_providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE content_providers_id_seq OWNED BY content_providers.id;


--
-- Name: content_providers_proxies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE content_providers_proxies (
    content_provider_id integer NOT NULL,
    proxy_id integer NOT NULL
);


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    iso_code_two_letter character varying(255) NOT NULL,
    iso_code_three_letter character varying(255) NOT NULL,
    iso_number integer NOT NULL,
    name character varying(255) NOT NULL,
    capital character varying(255),
    area_in_square_km integer,
    population integer,
    continent character varying(255),
    currency_code character varying(255),
    currency_name character varying(255),
    phone character varying(255),
    languages character varying(255),
    geonames_id integer
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: country_codes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE country_codes (
    id integer NOT NULL,
    code character varying(255),
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: country_codes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE country_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: country_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE country_codes_id_seq OWNED BY country_codes.id;


--
-- Name: crawler_jobs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE crawler_jobs (
    id integer NOT NULL,
    token character varying(255),
    keywords character varying(255),
    processed boolean,
    city character varying(255),
    country character varying(255),
    provider character varying(255),
    organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: crawler_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE crawler_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: crawler_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE crawler_jobs_id_seq OWNED BY crawler_jobs.id;


--
-- Name: credit_cards; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE credit_cards (
    id integer NOT NULL,
    user_id integer NOT NULL,
    stripe_customer_id character varying(255),
    card_zip character varying(255),
    card_cvc character varying(255),
    card_type character varying(255),
    next_bill_on date,
    month_expiration integer,
    year_expiration integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE credit_cards_id_seq OWNED BY credit_cards.id;


--
-- Name: database_counts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE database_counts (
    id integer NOT NULL,
    tweets integer,
    twitter_users integer,
    keywords integer,
    users integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: database_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE database_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: database_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE database_counts_id_seq OWNED BY database_counts.id;


--
-- Name: divisions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE divisions (
    id integer NOT NULL,
    country_id integer,
    code character varying(255),
    full_code character varying(255),
    name character varying(255),
    ascii_name character varying(255),
    geonames_id integer
);


--
-- Name: divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE divisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE divisions_id_seq OWNED BY divisions.id;


--
-- Name: facebook_urls; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE facebook_urls (
    id integer NOT NULL,
    url character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: facebook_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE facebook_urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: facebook_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE facebook_urls_id_seq OWNED BY facebook_urls.id;


--
-- Name: facebook_urls_organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE facebook_urls_organizations (
    organization_id integer NOT NULL,
    facebook_url_id integer NOT NULL
);


--
-- Name: facebookpages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE facebookpages (
    id integer NOT NULL,
    organization_id integer,
    url character varying(255),
    title character varying(255),
    likes integer,
    talking integer,
    where_here integer,
    posts integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: facebookpages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE facebookpages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: facebookpages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE facebookpages_id_seq OWNED BY facebookpages.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE failed_jobs (
    id integer NOT NULL,
    organization_id integer,
    schedule_id integer,
    retry_count integer,
    reason character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE failed_jobs_id_seq OWNED BY failed_jobs.id;


--
-- Name: folders; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE folders (
    id integer NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: folders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE folders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE folders_id_seq OWNED BY folders.id;


--
-- Name: foursquare_counts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE foursquare_counts (
    id integer NOT NULL,
    foursquare_venue_id integer,
    checkins_count integer,
    users_count integer,
    tip_count integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: foursquare_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE foursquare_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: foursquare_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE foursquare_counts_id_seq OWNED BY foursquare_counts.id;


--
-- Name: foursquare_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE foursquare_users (
    id integer NOT NULL,
    name character varying(255),
    first_name character varying(255),
    city character varying(255),
    gender character varying(255),
    foursquare_user_id character varying(255),
    photo character varying(255),
    url character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: foursquare_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE foursquare_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: foursquare_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE foursquare_users_id_seq OWNED BY foursquare_users.id;


--
-- Name: foursquare_venues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE foursquare_venues (
    id integer NOT NULL,
    foursquare_id character varying(255),
    name character varying(255),
    phone character varying(255),
    category character varying(255),
    organization_id integer,
    top_category character varying(255),
    address character varying(255),
    city character varying(255),
    postalcode character varying(255),
    state character varying(255),
    lat character varying(255),
    lng character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: foursquare_venues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE foursquare_venues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: foursquare_venues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE foursquare_venues_id_seq OWNED BY foursquare_venues.id;


--
-- Name: foursquare_venues_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE foursquare_venues_users (
    foursquare_venue_id integer NOT NULL,
    foursquare_user_id integer NOT NULL
);


--
-- Name: geodata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE geodata (
    id integer NOT NULL,
    country character varying(255),
    region character varying(255),
    city character varying(255),
    postalcode character varying(255),
    latitude character varying(255),
    longitude character varying(255),
    metrocode character varying(255),
    areacode character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: geodata_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE geodata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: geodata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE geodata_id_seq OWNED BY geodata.id;


--
-- Name: history_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE history_items (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    organization_id integer
);


--
-- Name: history_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE history_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: history_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE history_items_id_seq OWNED BY history_items.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE items (
    id integer NOT NULL,
    subject character varying(255),
    body text,
    rating double precision,
    kind_id integer,
    folder integer,
    visible boolean,
    source integer,
    reminder timestamp without time zone,
    new boolean,
    organization_id integer,
    reviewer_id integer,
    completed boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    properties hstore
);


--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: job_observers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE job_observers (
    id integer NOT NULL,
    schedule_id integer,
    retry_count integer,
    organization_id integer,
    failed boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: job_observers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE job_observers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: job_observers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE job_observers_id_seq OWNED BY job_observers.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE jobs (
    id integer NOT NULL,
    org_id integer,
    stage integer,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE jobs_id_seq OWNED BY jobs.id;


--
-- Name: keywords; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE keywords (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE keywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE keywords_id_seq OWNED BY keywords.id;


--
-- Name: keywords_organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE keywords_organizations (
    keyword_id integer,
    organization_id integer
);


--
-- Name: kinds; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE kinds (
    id integer NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: kinds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE kinds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: kinds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE kinds_id_seq OWNED BY kinds.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE likes (
    id integer NOT NULL,
    count integer,
    organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE likes_id_seq OWNED BY likes.id;


--
-- Name: listings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE listings (
    id integer NOT NULL,
    organization_id integer,
    name character varying(255),
    content_provider character varying(255),
    phone character varying(255),
    street character varying(255),
    zip character varying(255),
    city character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: listings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE listings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE listings_id_seq OWNED BY listings.id;


--
-- Name: magellans; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE magellans (
    id integer NOT NULL,
    city__id integer,
    processed boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: magellans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE magellans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: magellans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE magellans_id_seq OWNED BY magellans.id;


--
-- Name: mercury_images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE mercury_images (
    id integer NOT NULL,
    image_file_name character varying(255),
    image_content_type character varying(255),
    image_file_size integer,
    image_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: mercury_images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE mercury_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mercury_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE mercury_images_id_seq OWNED BY mercury_images.id;


--
-- Name: my_competitors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE my_competitors (
    id integer NOT NULL,
    name character varying(255),
    street character varying(255),
    zipcode character varying(255),
    city character varying(255),
    phone character varying(255),
    short_profile character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organization_id integer
);


--
-- Name: my_competitors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE my_competitors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: my_competitors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE my_competitors_id_seq OWNED BY my_competitors.id;


--
-- Name: network_weathers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE network_weathers (
    id integer NOT NULL,
    sentiment double precision,
    public_keyword_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: network_weathers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE network_weathers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: network_weathers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE network_weathers_id_seq OWNED BY network_weathers.id;


--
-- Name: organization_links; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organization_links (
    id integer NOT NULL,
    bing_id character varying(255),
    organization_id integer,
    bing_display_url character varying(255),
    url character varying(255),
    title character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organization_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organization_links_id_seq OWNED BY organization_links.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organizations (
    id integer NOT NULL,
    name character varying(255),
    street character varying(255),
    street2 character varying(255),
    postalcode character varying(255),
    city character varying(255),
    state character varying(255),
    phone1 character varying(255),
    phone2 character varying(255),
    competitors text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    url character varying(255),
    yahooslug character varying(255),
    account_id integer,
    scheduled boolean,
    facebook character varying(255),
    twitter character varying(255),
    latitude double precision,
    longitude double precision,
    category_id integer,
    country_code_id integer,
    reviewers_list text,
    gmaps boolean,
    cat_name character varying(255),
    city_id integer
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: organizations_twitter_urls; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organizations_twitter_urls (
    organization_id integer NOT NULL,
    twitter_url_id integer NOT NULL
);


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pages (
    id integer NOT NULL,
    name character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying(255)
);


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE plans (
    id integer NOT NULL,
    name character varying(255),
    price numeric(10,0),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE plans_id_seq OWNED BY plans.id;


--
-- Name: provider_slugs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE provider_slugs (
    id integer NOT NULL,
    content_provider_id integer,
    organization_id integer,
    slug character varying(255),
    bad boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: provider_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE provider_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: provider_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE provider_slugs_id_seq OWNED BY provider_slugs.id;


--
-- Name: proxies; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE proxies (
    id integer NOT NULL,
    ip character varying(255),
    port character varying(255),
    tested boolean,
    bad boolean,
    country character varying(255),
    last_used timestamp without time zone,
    content_provider_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: proxies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE proxies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proxies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE proxies_id_seq OWNED BY proxies.id;


--
-- Name: public_keywords; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public_keywords (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: public_keywords_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public_keywords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public_keywords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public_keywords_id_seq OWNED BY public_keywords.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE purchases (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE purchases_id_seq OWNED BY purchases.id;


--
-- Name: rankings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rankings (
    id integer NOT NULL,
    rank integer,
    content_provider_id integer,
    organization_id integer,
    keyword_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    url character varying(255),
    name character varying(255),
    token character varying(255),
    results hstore,
    ranks text
);


--
-- Name: rankings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rankings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rankings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rankings_id_seq OWNED BY rankings.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ratings (
    id integer NOT NULL,
    ratingcount integer,
    rating double precision,
    content_provider_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organization_id integer
);


--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ratings_id_seq OWNED BY ratings.id;


--
-- Name: recommendations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE recommendations (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    kind integer
);


--
-- Name: recommendations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE recommendations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recommendations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE recommendations_id_seq OWNED BY recommendations.id;


--
-- Name: reseller_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reseller_categories (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: reseller_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reseller_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reseller_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reseller_categories_id_seq OWNED BY reseller_categories.id;


--
-- Name: reseller_commissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reseller_commissions (
    id integer NOT NULL,
    name character varying(255),
    percentage integer,
    notes character varying(255),
    reseller_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: reseller_commissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reseller_commissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reseller_commissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reseller_commissions_id_seq OWNED BY reseller_commissions.id;


--
-- Name: resellers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE resellers (
    id integer NOT NULL,
    company character varying(255),
    name character varying(255),
    first_name character varying(255),
    street character varying(255),
    street2 character varying(255),
    city character varying(255),
    state character varying(255),
    postalcode character varying(255),
    reseller_category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sub_domain character varying(255),
    logo character varying(255),
    country_code_id integer,
    email character varying(255),
    website character varying(255),
    twitter character varying(255),
    facebook character varying(255),
    phone character varying(255)
);


--
-- Name: resellers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE resellers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: resellers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE resellers_id_seq OWNED BY resellers.id;


--
-- Name: resellers_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE resellers_users (
    reseller_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- Name: reviewers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reviewers (
    id integer NOT NULL,
    name character varying(255),
    content_provider_id integer,
    slug character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    imageurl character varying(255),
    review_count integer,
    average_review double precision
);


--
-- Name: reviewers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reviewers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reviewers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reviewers_id_seq OWNED BY reviewers.id;


--
-- Name: reviewers_reviews; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reviewers_reviews (
    reviewer_id integer,
    review_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE reviews (
    id integer NOT NULL,
    organization_id integer,
    content_provider_id integer,
    reviewer character varying(255),
    reviewer_slug character varying(255),
    review_date date,
    body text,
    rating double precision,
    processed boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reviewer_id integer,
    review_provider_id character varying(255),
    title character varying(255),
    review_url character varying(255)
);


--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255),
    resource_id integer,
    resource_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schedules (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organization_id integer,
    sequence_id integer,
    in_progress boolean,
    scheduled timestamp without time zone
);


--
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE schedules_id_seq OWNED BY schedules.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: sentiments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sentiments (
    id integer NOT NULL,
    word character varying(255),
    language character varying(2),
    value double precision,
    "position" character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tested boolean,
    correct boolean
);


--
-- Name: sentiments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sentiments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sentiments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sentiments_id_seq OWNED BY sentiments.id;


--
-- Name: sequence_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sequence_items (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sequence_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sequence_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sequence_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sequence_items_id_seq OWNED BY sequence_items.id;


--
-- Name: sequence_items_sequences; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sequence_items_sequences (
    sequence_item_id integer,
    sequence_id integer
);


--
-- Name: sequences; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sequences (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sequences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sequences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sequences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sequences_id_seq OWNED BY sequences.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sessions (
    id integer NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: slug_urls; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE slug_urls (
    id integer NOT NULL,
    slug character varying(255),
    content_provider_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: slug_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE slug_urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slug_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE slug_urls_id_seq OWNED BY slug_urls.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE subscriptions (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    plan_id integer
);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- Name: task_results; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE task_results (
    id integer NOT NULL,
    organization_id integer,
    task_id integer,
    relevant boolean,
    status integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: task_results_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE task_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: task_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE task_results_id_seq OWNED BY task_results.id;


--
-- Name: task_translations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE task_translations (
    id integer NOT NULL,
    task_id integer,
    language_id integer,
    header character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: task_translations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE task_translations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: task_translations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE task_translations_id_seq OWNED BY task_translations.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tasks (
    id integer NOT NULL,
    name character varying(255),
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    weight integer
);


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: timer_options; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE timer_options (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: timer_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE timer_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: timer_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE timer_options_id_seq OWNED BY timer_options.id;


--
-- Name: tweets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tweets (
    id integer NOT NULL,
    tweet_id character varying(255),
    content character varying(255),
    in_reply_to character varying(255),
    re_tweets integer,
    created_at timestamp without time zone NOT NULL,
    sentiment double precision,
    updated_at timestamp without time zone NOT NULL,
    twitter_user_id character varying(255),
    favorites_count integer
);


--
-- Name: tweets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tweets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tweets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tweets_id_seq OWNED BY tweets.id;


--
-- Name: twitter_counts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE twitter_counts (
    id integer NOT NULL,
    twitter_url_id integer,
    followers integer,
    following integer,
    tweets integer,
    listed integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: twitter_counts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twitter_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twitter_counts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twitter_counts_id_seq OWNED BY twitter_counts.id;


--
-- Name: twitter_urls; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE twitter_urls (
    id integer NOT NULL,
    url character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: twitter_urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twitter_urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twitter_urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twitter_urls_id_seq OWNED BY twitter_urls.id;


--
-- Name: twitter_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE twitter_users (
    id integer NOT NULL,
    twitter_id integer,
    screen_name character varying(255),
    name character varying(255),
    followers integer,
    following integer,
    listed integer,
    total_statuses integer,
    image_url character varying(255),
    language character varying(2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "from" character varying(255),
    user_since date
);


--
-- Name: twitter_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE twitter_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: twitter_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE twitter_users_id_seq OWNED BY twitter_users.id;


--
-- Name: uptime_monitors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE uptime_monitors (
    id integer NOT NULL,
    organization_id integer,
    load_time double precision,
    time_stamp timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    url character varying(255)
);


--
-- Name: uptime_monitors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE uptime_monitors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uptime_monitors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE uptime_monitors_id_seq OWNED BY uptime_monitors.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    account_id integer,
    api_key character varying(255),
    name character varying(255),
    reseller_id integer,
    is_reseller boolean,
    referred_by integer,
    authentication_token character varying(255)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users_roles (
    user_id integer,
    role_id integer
);


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE versions (
    id integer NOT NULL,
    item_type character varying(255) NOT NULL,
    item_id integer NOT NULL,
    event character varying(255) NOT NULL,
    whodunnit character varying(255),
    object text,
    created_at timestamp without time zone
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: web_contents; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE web_contents (
    id integer NOT NULL,
    user_id integer,
    job_id integer,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: web_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE web_contents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: web_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE web_contents_id_seq OWNED BY web_contents.id;


--
-- Name: work_queues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE work_queues (
    id integer NOT NULL,
    schedule_id integer,
    retry_count integer,
    queue_name character varying(255),
    url character varying(255),
    org_id integer,
    content_provider character varying(255),
    keywords character varying(255),
    misc character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    invisible boolean
);


--
-- Name: work_queues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE work_queues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: work_queues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE work_queues_id_seq OWNED BY work_queues.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_types ALTER COLUMN id SET DEFAULT nextval('account_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_users ALTER COLUMN id SET DEFAULT nextval('admin_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY aggregate_results ALTER COLUMN id SET DEFAULT nextval('aggregate_results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authentications ALTER COLUMN id SET DEFAULT nextval('authentications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY command_items ALTER COLUMN id SET DEFAULT nextval('command_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY content_providers ALTER COLUMN id SET DEFAULT nextval('content_providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY country_codes ALTER COLUMN id SET DEFAULT nextval('country_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY crawler_jobs ALTER COLUMN id SET DEFAULT nextval('crawler_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY credit_cards ALTER COLUMN id SET DEFAULT nextval('credit_cards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY database_counts ALTER COLUMN id SET DEFAULT nextval('database_counts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY divisions ALTER COLUMN id SET DEFAULT nextval('divisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY facebook_urls ALTER COLUMN id SET DEFAULT nextval('facebook_urls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY facebookpages ALTER COLUMN id SET DEFAULT nextval('facebookpages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY failed_jobs ALTER COLUMN id SET DEFAULT nextval('failed_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY folders ALTER COLUMN id SET DEFAULT nextval('folders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY foursquare_counts ALTER COLUMN id SET DEFAULT nextval('foursquare_counts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY foursquare_users ALTER COLUMN id SET DEFAULT nextval('foursquare_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY foursquare_venues ALTER COLUMN id SET DEFAULT nextval('foursquare_venues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY geodata ALTER COLUMN id SET DEFAULT nextval('geodata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY history_items ALTER COLUMN id SET DEFAULT nextval('history_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY job_observers ALTER COLUMN id SET DEFAULT nextval('job_observers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY jobs ALTER COLUMN id SET DEFAULT nextval('jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY keywords ALTER COLUMN id SET DEFAULT nextval('keywords_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY kinds ALTER COLUMN id SET DEFAULT nextval('kinds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY likes ALTER COLUMN id SET DEFAULT nextval('likes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY listings ALTER COLUMN id SET DEFAULT nextval('listings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY magellans ALTER COLUMN id SET DEFAULT nextval('magellans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY mercury_images ALTER COLUMN id SET DEFAULT nextval('mercury_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY my_competitors ALTER COLUMN id SET DEFAULT nextval('my_competitors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY network_weathers ALTER COLUMN id SET DEFAULT nextval('network_weathers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organization_links ALTER COLUMN id SET DEFAULT nextval('organization_links_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY plans ALTER COLUMN id SET DEFAULT nextval('plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY provider_slugs ALTER COLUMN id SET DEFAULT nextval('provider_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY proxies ALTER COLUMN id SET DEFAULT nextval('proxies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public_keywords ALTER COLUMN id SET DEFAULT nextval('public_keywords_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY purchases ALTER COLUMN id SET DEFAULT nextval('purchases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rankings ALTER COLUMN id SET DEFAULT nextval('rankings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ratings ALTER COLUMN id SET DEFAULT nextval('ratings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY recommendations ALTER COLUMN id SET DEFAULT nextval('recommendations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reseller_categories ALTER COLUMN id SET DEFAULT nextval('reseller_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reseller_commissions ALTER COLUMN id SET DEFAULT nextval('reseller_commissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY resellers ALTER COLUMN id SET DEFAULT nextval('resellers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reviewers ALTER COLUMN id SET DEFAULT nextval('reviewers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY schedules ALTER COLUMN id SET DEFAULT nextval('schedules_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sentiments ALTER COLUMN id SET DEFAULT nextval('sentiments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sequence_items ALTER COLUMN id SET DEFAULT nextval('sequence_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sequences ALTER COLUMN id SET DEFAULT nextval('sequences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY slug_urls ALTER COLUMN id SET DEFAULT nextval('slug_urls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY task_results ALTER COLUMN id SET DEFAULT nextval('task_results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY task_translations ALTER COLUMN id SET DEFAULT nextval('task_translations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY timer_options ALTER COLUMN id SET DEFAULT nextval('timer_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tweets ALTER COLUMN id SET DEFAULT nextval('tweets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twitter_counts ALTER COLUMN id SET DEFAULT nextval('twitter_counts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twitter_urls ALTER COLUMN id SET DEFAULT nextval('twitter_urls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY twitter_users ALTER COLUMN id SET DEFAULT nextval('twitter_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY uptime_monitors ALTER COLUMN id SET DEFAULT nextval('uptime_monitors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY web_contents ALTER COLUMN id SET DEFAULT nextval('web_contents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY work_queues ALTER COLUMN id SET DEFAULT nextval('work_queues_id_seq'::regclass);


--
-- Name: account_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_types
    ADD CONSTRAINT account_types_pkey PRIMARY KEY (id);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: aggregate_results_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY aggregate_results
    ADD CONSTRAINT aggregate_results_pkey PRIMARY KEY (id);


--
-- Name: authentications_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY authentications
    ADD CONSTRAINT authentications_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: command_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY command_items
    ADD CONSTRAINT command_items_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: content_providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY content_providers
    ADD CONSTRAINT content_providers_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: country_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY country_codes
    ADD CONSTRAINT country_codes_pkey PRIMARY KEY (id);


--
-- Name: crawler_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY crawler_jobs
    ADD CONSTRAINT crawler_jobs_pkey PRIMARY KEY (id);


--
-- Name: credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY credit_cards
    ADD CONSTRAINT credit_cards_pkey PRIMARY KEY (id);


--
-- Name: database_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY database_counts
    ADD CONSTRAINT database_counts_pkey PRIMARY KEY (id);


--
-- Name: divisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY divisions
    ADD CONSTRAINT divisions_pkey PRIMARY KEY (id);


--
-- Name: facebook_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY facebook_urls
    ADD CONSTRAINT facebook_urls_pkey PRIMARY KEY (id);


--
-- Name: facebookpages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY facebookpages
    ADD CONSTRAINT facebookpages_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: folders_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY folders
    ADD CONSTRAINT folders_pkey PRIMARY KEY (id);


--
-- Name: foursquare_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY foursquare_counts
    ADD CONSTRAINT foursquare_counts_pkey PRIMARY KEY (id);


--
-- Name: foursquare_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY foursquare_users
    ADD CONSTRAINT foursquare_users_pkey PRIMARY KEY (id);


--
-- Name: foursquare_venues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY foursquare_venues
    ADD CONSTRAINT foursquare_venues_pkey PRIMARY KEY (id);


--
-- Name: geodata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY geodata
    ADD CONSTRAINT geodata_pkey PRIMARY KEY (id);


--
-- Name: history_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY history_items
    ADD CONSTRAINT history_items_pkey PRIMARY KEY (id);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: job_observers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY job_observers
    ADD CONSTRAINT job_observers_pkey PRIMARY KEY (id);


--
-- Name: jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY keywords
    ADD CONSTRAINT keywords_pkey PRIMARY KEY (id);


--
-- Name: likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: listings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY listings
    ADD CONSTRAINT listings_pkey PRIMARY KEY (id);


--
-- Name: magellans_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY magellans
    ADD CONSTRAINT magellans_pkey PRIMARY KEY (id);


--
-- Name: mercury_images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY mercury_images
    ADD CONSTRAINT mercury_images_pkey PRIMARY KEY (id);


--
-- Name: my_competitors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY my_competitors
    ADD CONSTRAINT my_competitors_pkey PRIMARY KEY (id);


--
-- Name: network_weathers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY network_weathers
    ADD CONSTRAINT network_weathers_pkey PRIMARY KEY (id);


--
-- Name: organization_links_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organization_links
    ADD CONSTRAINT organization_links_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: provider_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provider_slugs
    ADD CONSTRAINT provider_slugs_pkey PRIMARY KEY (id);


--
-- Name: proxies_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY proxies
    ADD CONSTRAINT proxies_pkey PRIMARY KEY (id);


--
-- Name: public_keywords_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY public_keywords
    ADD CONSTRAINT public_keywords_pkey PRIMARY KEY (id);


--
-- Name: purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rankings
    ADD CONSTRAINT rankings_pkey PRIMARY KEY (id);


--
-- Name: ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (id);


--
-- Name: reseller_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reseller_categories
    ADD CONSTRAINT reseller_categories_pkey PRIMARY KEY (id);


--
-- Name: reseller_commissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reseller_commissions
    ADD CONSTRAINT reseller_commissions_pkey PRIMARY KEY (id);


--
-- Name: resellers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY resellers
    ADD CONSTRAINT resellers_pkey PRIMARY KEY (id);


--
-- Name: reviewers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reviewers
    ADD CONSTRAINT reviewers_pkey PRIMARY KEY (id);


--
-- Name: reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: sentiments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sentiments
    ADD CONSTRAINT sentiments_pkey PRIMARY KEY (id);


--
-- Name: sequence_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sequence_items
    ADD CONSTRAINT sequence_items_pkey PRIMARY KEY (id);


--
-- Name: sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sequences
    ADD CONSTRAINT sequences_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: slug_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY slug_urls
    ADD CONSTRAINT slug_urls_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: task_results_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY task_results
    ADD CONSTRAINT task_results_pkey PRIMARY KEY (id);


--
-- Name: task_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY task_translations
    ADD CONSTRAINT task_translations_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: timer_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY timer_options
    ADD CONSTRAINT timer_options_pkey PRIMARY KEY (id);


--
-- Name: tweets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tweets
    ADD CONSTRAINT tweets_pkey PRIMARY KEY (id);


--
-- Name: twitter_counts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY twitter_counts
    ADD CONSTRAINT twitter_counts_pkey PRIMARY KEY (id);


--
-- Name: twitter_urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY twitter_urls
    ADD CONSTRAINT twitter_urls_pkey PRIMARY KEY (id);


--
-- Name: twitter_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY twitter_users
    ADD CONSTRAINT twitter_users_pkey PRIMARY KEY (id);


--
-- Name: types_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY kinds
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: uptime_monitors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY uptime_monitors
    ADD CONSTRAINT uptime_monitors_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: web_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY web_contents
    ADD CONSTRAINT web_contents_pkey PRIMARY KEY (id);


--
-- Name: work_queues_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY work_queues
    ADD CONSTRAINT work_queues_pkey PRIMARY KEY (id);


--
-- Name: index_accounts_on_city; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_accounts_on_city ON accounts USING btree (city);


--
-- Name: index_accounts_on_country_code_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_accounts_on_country_code_id ON accounts USING btree (country_code_id);


--
-- Name: index_accounts_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_accounts_on_name ON accounts USING btree (name);


--
-- Name: index_accounts_on_reseller_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_accounts_on_reseller_id ON accounts USING btree (reseller_id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_admin_notes_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_admin_notes_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_email ON admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON admin_users USING btree (reset_password_token);


--
-- Name: index_categories_on_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_categories_on_category_id ON categories USING btree (category_id);


--
-- Name: index_categories_on_group; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_categories_on_group ON categories USING btree (catgroup);


--
-- Name: index_cities_on_geonames_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_cities_on_geonames_id ON cities USING btree (geonames_id);


--
-- Name: index_countries_on_geonames_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_countries_on_geonames_id ON countries USING btree (geonames_id);


--
-- Name: index_countries_on_iso_code_two_letter; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_countries_on_iso_code_two_letter ON countries USING btree (iso_code_two_letter);


--
-- Name: index_country_codes_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_country_codes_on_code ON country_codes USING btree (code);


--
-- Name: index_country_codes_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_country_codes_on_name ON country_codes USING btree (name);


--
-- Name: index_divisions_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_divisions_on_code ON divisions USING btree (code);


--
-- Name: index_divisions_on_full_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_divisions_on_full_code ON divisions USING btree (full_code);


--
-- Name: index_divisions_on_geonames_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_divisions_on_geonames_id ON divisions USING btree (geonames_id);


--
-- Name: index_failed_jobs_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_failed_jobs_on_organization_id ON failed_jobs USING btree (organization_id);


--
-- Name: index_failed_jobs_on_schedule_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_failed_jobs_on_schedule_id ON failed_jobs USING btree (schedule_id);


--
-- Name: index_folders_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_folders_on_name ON folders USING btree (name);


--
-- Name: index_foursquare_counts_on_foursquare_venue_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_foursquare_counts_on_foursquare_venue_id ON foursquare_counts USING btree (foursquare_venue_id);


--
-- Name: index_foursquare_users_on_city; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_foursquare_users_on_city ON foursquare_users USING btree (city);


--
-- Name: index_foursquare_users_on_foursquare_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_foursquare_users_on_foursquare_user_id ON foursquare_users USING btree (foursquare_user_id);


--
-- Name: index_foursquare_venues_on_category; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_foursquare_venues_on_category ON foursquare_venues USING btree (category);


--
-- Name: index_foursquare_venues_on_foursquare_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_foursquare_venues_on_foursquare_id ON foursquare_venues USING btree (foursquare_id);


--
-- Name: index_foursquare_venues_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_foursquare_venues_on_name ON foursquare_venues USING btree (name);


--
-- Name: index_foursquare_venues_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_foursquare_venues_on_organization_id ON foursquare_venues USING btree (organization_id);


--
-- Name: index_geodata_on_city; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_geodata_on_city ON geodata USING btree (city);


--
-- Name: index_geodata_on_country; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_geodata_on_country ON geodata USING btree (country);


--
-- Name: index_geodata_on_postalcode; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_geodata_on_postalcode ON geodata USING btree (postalcode);


--
-- Name: index_geodata_on_region; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_geodata_on_region ON geodata USING btree (region);


--
-- Name: index_history_items_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_history_items_on_organization_id ON history_items USING btree (organization_id);


--
-- Name: index_history_items_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_history_items_on_user_id ON history_items USING btree (user_id);


--
-- Name: index_items_on_completed; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_items_on_completed ON items USING btree (completed);


--
-- Name: index_items_on_folder; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_items_on_folder ON items USING btree (folder);


--
-- Name: index_items_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_items_on_organization_id ON items USING btree (organization_id);


--
-- Name: index_items_on_reviewer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_items_on_reviewer_id ON items USING btree (reviewer_id);


--
-- Name: index_items_on_source; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_items_on_source ON items USING btree (source);


--
-- Name: index_items_on_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_items_on_type ON items USING btree (kind_id);


--
-- Name: index_items_on_visible; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_items_on_visible ON items USING btree (visible);


--
-- Name: index_job_observers_on_failed; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_job_observers_on_failed ON job_observers USING btree (failed);


--
-- Name: index_job_observers_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_job_observers_on_organization_id ON job_observers USING btree (organization_id);


--
-- Name: index_job_observers_on_schedule_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_job_observers_on_schedule_id ON job_observers USING btree (schedule_id);


--
-- Name: index_listings_on_content_provider; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_listings_on_content_provider ON listings USING btree (content_provider);


--
-- Name: index_listings_on_org_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_listings_on_org_id ON listings USING btree (organization_id);


--
-- Name: index_my_competitors_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_my_competitors_on_name ON my_competitors USING btree (name);


--
-- Name: index_organization_links_on_bing_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organization_links_on_bing_id ON organization_links USING btree (bing_id);


--
-- Name: index_organization_links_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organization_links_on_organization_id ON organization_links USING btree (organization_id);


--
-- Name: index_organization_links_on_url; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organization_links_on_url ON organization_links USING btree (url);


--
-- Name: index_organizations_on_cat_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_cat_name ON organizations USING btree (cat_name);


--
-- Name: index_organizations_on_category_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_category_id ON organizations USING btree (category_id);


--
-- Name: index_organizations_on_country_code_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_country_code_id ON organizations USING btree (country_code_id);


--
-- Name: index_organizations_on_gmaps; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_gmaps ON organizations USING btree (gmaps);


--
-- Name: index_organizations_on_postalcode; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_postalcode ON organizations USING btree (postalcode);


--
-- Name: index_organizations_on_scheduled; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_scheduled ON organizations USING btree (scheduled);


--
-- Name: index_pages_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_pages_on_name ON pages USING btree (name);


--
-- Name: index_pages_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_pages_on_slug ON pages USING btree (slug);


--
-- Name: index_plans_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_plans_on_name ON plans USING btree (name);


--
-- Name: index_provider_slugs_on_content_provider_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_provider_slugs_on_content_provider_id ON provider_slugs USING btree (content_provider_id);


--
-- Name: index_provider_slugs_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_provider_slugs_on_organization_id ON provider_slugs USING btree (organization_id);


--
-- Name: index_reseller_commissions_on_reseller_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reseller_commissions_on_reseller_id ON reseller_commissions USING btree (reseller_id);


--
-- Name: index_resellers_on_sub_domain; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_resellers_on_sub_domain ON resellers USING btree (sub_domain);


--
-- Name: index_reviewers_on_content_provider_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reviewers_on_content_provider_id ON reviewers USING btree (content_provider_id);


--
-- Name: index_reviewers_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reviewers_on_name ON reviewers USING btree (name);


--
-- Name: index_reviewers_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reviewers_on_slug ON reviewers USING btree (slug);


--
-- Name: index_reviews_on_review_url; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reviews_on_review_url ON reviews USING btree (review_url);


--
-- Name: index_reviews_on_reviewer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_reviews_on_reviewer_id ON reviews USING btree (reviewer_id);


--
-- Name: index_roles_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name ON roles USING btree (name);


--
-- Name: index_roles_on_name_and_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_roles_on_name_and_resource_type_and_resource_id ON roles USING btree (name, resource_type, resource_id);


--
-- Name: index_schedules_on_in_progress; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_schedules_on_in_progress ON schedules USING btree (in_progress);


--
-- Name: index_schedules_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_schedules_on_organization_id ON schedules USING btree (organization_id);


--
-- Name: index_schedules_on_scheduled; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_schedules_on_scheduled ON schedules USING btree (scheduled);


--
-- Name: index_schedules_on_sequence_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_schedules_on_sequence_id ON schedules USING btree (sequence_id);


--
-- Name: index_sentiments_on_correct; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sentiments_on_correct ON sentiments USING btree (correct);


--
-- Name: index_sentiments_on_tested; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sentiments_on_tested ON sentiments USING btree (tested);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sessions_on_session_id ON sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sessions_on_updated_at ON sessions USING btree (updated_at);


--
-- Name: index_slug_urls_on_content_provider_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_slug_urls_on_content_provider_id ON slug_urls USING btree (content_provider_id);


--
-- Name: index_slug_urls_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_slug_urls_on_slug ON slug_urls USING btree (slug);


--
-- Name: index_subscriptions_on_plan_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_plan_id ON subscriptions USING btree (plan_id);


--
-- Name: index_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_subscriptions_on_user_id ON subscriptions USING btree (user_id);


--
-- Name: index_task_results_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_task_results_on_organization_id ON task_results USING btree (organization_id);


--
-- Name: index_task_results_on_relevant; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_task_results_on_relevant ON task_results USING btree (relevant);


--
-- Name: index_task_results_on_status; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_task_results_on_status ON task_results USING btree (status);


--
-- Name: index_task_results_on_task_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_task_results_on_task_id ON task_results USING btree (task_id);


--
-- Name: index_task_translations_on_language_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_task_translations_on_language_id ON task_translations USING btree (language_id);


--
-- Name: index_task_translations_on_task_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_task_translations_on_task_id ON task_translations USING btree (task_id);


--
-- Name: index_tasks_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_tasks_on_name ON tasks USING btree (name);


--
-- Name: index_tweets_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_tweets_on_created_at ON tweets USING btree (created_at);


--
-- Name: index_tweets_on_in_reply_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_tweets_on_in_reply_to ON tweets USING btree (in_reply_to);


--
-- Name: index_tweets_on_tweet_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_tweets_on_tweet_id ON tweets USING btree (tweet_id);


--
-- Name: index_tweets_on_twitter_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_tweets_on_twitter_user_id ON tweets USING btree (twitter_user_id);


--
-- Name: index_twitter_counts_on_twitter_url_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_twitter_counts_on_twitter_url_id ON twitter_counts USING btree (twitter_url_id);


--
-- Name: index_twitter_users_on_from; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_twitter_users_on_from ON twitter_users USING btree ("from");


--
-- Name: index_twitter_users_on_language; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_twitter_users_on_language ON twitter_users USING btree (language);


--
-- Name: index_twitter_users_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_twitter_users_on_name ON twitter_users USING btree (name);


--
-- Name: index_twitter_users_on_screen_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_twitter_users_on_screen_name ON twitter_users USING btree (screen_name);


--
-- Name: index_twitter_users_on_twitter_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_twitter_users_on_twitter_id ON twitter_users USING btree (twitter_id);


--
-- Name: index_uptime_monitors_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_uptime_monitors_on_organization_id ON uptime_monitors USING btree (organization_id);


--
-- Name: index_uptime_monitors_on_time_stamp; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_uptime_monitors_on_time_stamp ON uptime_monitors USING btree (time_stamp);


--
-- Name: index_users_on_account_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_account_id ON users USING btree (account_id);


--
-- Name: index_users_on_api_key; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_api_key ON users USING btree (api_key);


--
-- Name: index_users_on_authentication_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_authentication_token ON users USING btree (authentication_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_is_reseller; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_is_reseller ON users USING btree (is_reseller);


--
-- Name: index_users_on_referred_by; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_referred_by ON users USING btree (referred_by);


--
-- Name: index_users_on_reseller_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_reseller_id ON users USING btree (reseller_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_roles_on_user_id_and_role_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_roles_on_user_id_and_role_id ON users_roles USING btree (user_id, role_id);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: index_web_contents_on_job_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_web_contents_on_job_id ON web_contents USING btree (job_id);


--
-- Name: index_web_contents_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_web_contents_on_user_id ON web_contents USING btree (user_id);


--
-- Name: index_work_queues_on_content_provider; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_work_queues_on_content_provider ON work_queues USING btree (content_provider);


--
-- Name: index_work_queues_on_invisible; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_work_queues_on_invisible ON work_queues USING btree (invisible);


--
-- Name: index_work_queues_on_org_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_work_queues_on_org_id ON work_queues USING btree (org_id);


--
-- Name: index_work_queues_on_queue_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_work_queues_on_queue_name ON work_queues USING btree (queue_name);


--
-- Name: index_work_queues_on_retry_count; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_work_queues_on_retry_count ON work_queues USING btree (retry_count);


--
-- Name: index_work_queues_on_schedule_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_work_queues_on_schedule_id ON work_queues USING btree (schedule_id);


--
-- Name: items_properties; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX items_properties ON items USING gin (properties);


--
-- Name: rankings_results; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX rankings_results ON rankings USING gin (results);


--
-- Name: review_body; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX review_body ON reviews USING gin (to_tsvector('english'::regconfig, body));


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20130208024300');

INSERT INTO schema_migrations (version) VALUES ('20130212020124');

INSERT INTO schema_migrations (version) VALUES ('20130212021334');

INSERT INTO schema_migrations (version) VALUES ('20130212021900');

INSERT INTO schema_migrations (version) VALUES ('20130213010447');

INSERT INTO schema_migrations (version) VALUES ('20130215024431');

INSERT INTO schema_migrations (version) VALUES ('20130217181348');

INSERT INTO schema_migrations (version) VALUES ('20130217181603');

INSERT INTO schema_migrations (version) VALUES ('20130217182328');

INSERT INTO schema_migrations (version) VALUES ('20130217185005');

INSERT INTO schema_migrations (version) VALUES ('20130217193027');

INSERT INTO schema_migrations (version) VALUES ('20130217193536');

INSERT INTO schema_migrations (version) VALUES ('20130217235936');

INSERT INTO schema_migrations (version) VALUES ('20130218042659');

INSERT INTO schema_migrations (version) VALUES ('20130222234207');

INSERT INTO schema_migrations (version) VALUES ('20130222234239');

INSERT INTO schema_migrations (version) VALUES ('20130224011856');

INSERT INTO schema_migrations (version) VALUES ('20130425221456');