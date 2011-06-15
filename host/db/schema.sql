--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.4
-- Dumped by pg_dump version 9.0.4
-- Started on 2011-06-14 21:22:28 EDT

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- TOC entry 7 (class 2615 OID 16395)
-- Name: core; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA core;


SET search_path = core, pg_catalog;

--
-- TOC entry 1522 (class 1259 OID 16453)
-- Dependencies: 7
-- Name: account_products_id_seq; Type: SEQUENCE; Schema: core; Owner: -
--

CREATE SEQUENCE account_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1518 (class 1259 OID 16411)
-- Dependencies: 1807 7
-- Name: account_products; Type: TABLE; Schema: core; Owner: -; Tablespace: 
--

CREATE TABLE account_products (
    id integer DEFAULT nextval('account_products_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    account_subtype_id integer NOT NULL
);


--
-- TOC entry 1523 (class 1259 OID 16455)
-- Dependencies: 7
-- Name: account_subtypes_id_seq; Type: SEQUENCE; Schema: core; Owner: -
--

CREATE SEQUENCE account_subtypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1517 (class 1259 OID 16401)
-- Dependencies: 1806 7
-- Name: account_subtypes; Type: TABLE; Schema: core; Owner: -; Tablespace: 
--

CREATE TABLE account_subtypes (
    id integer DEFAULT nextval('account_subtypes_id_seq'::regclass) NOT NULL,
    account_type_id smallint,
    name character varying(50) NOT NULL
);


--
-- TOC entry 1524 (class 1259 OID 16457)
-- Dependencies: 7
-- Name: account_types_id_seq; Type: SEQUENCE; Schema: core; Owner: -
--

CREATE SEQUENCE account_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1516 (class 1259 OID 16396)
-- Dependencies: 1805 7
-- Name: account_types; Type: TABLE; Schema: core; Owner: -; Tablespace: 
--

CREATE TABLE account_types (
    name character varying(50) NOT NULL,
    id smallint DEFAULT nextval('account_types_id_seq'::regclass) NOT NULL,
    normal_balance smallint NOT NULL
);


--
-- TOC entry 1525 (class 1259 OID 16459)
-- Dependencies: 7
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: core; Owner: -
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1520 (class 1259 OID 16426)
-- Dependencies: 1809 7
-- Name: accounts; Type: TABLE; Schema: core; Owner: -; Tablespace: 
--

CREATE TABLE accounts (
    id bigint DEFAULT nextval('accounts_id_seq'::regclass) NOT NULL,
    number character varying(17) NOT NULL,
    account_product_id integer NOT NULL,
    name character varying(50),
    customer_id bigint NOT NULL
);


--
-- TOC entry 1526 (class 1259 OID 16461)
-- Dependencies: 7
-- Name: customers_id_seq; Type: SEQUENCE; Schema: core; Owner: -
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1519 (class 1259 OID 16421)
-- Dependencies: 1808 7
-- Name: customers; Type: TABLE; Schema: core; Owner: -; Tablespace: 
--

CREATE TABLE customers (
    id integer DEFAULT nextval('customers_id_seq'::regclass) NOT NULL,
    name character varying(100) NOT NULL,
    address1 character varying(50) NOT NULL,
    address2 character varying(50),
    city character varying(35) NOT NULL,
    state character(2) NOT NULL,
    zip character(9) NOT NULL,
    is_business boolean NOT NULL
);


--
-- TOC entry 1527 (class 1259 OID 16463)
-- Dependencies: 7
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: core; Owner: -
--

CREATE SEQUENCE transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 1521 (class 1259 OID 16443)
-- Dependencies: 1810 7
-- Name: transactions; Type: TABLE; Schema: core; Owner: -; Tablespace: 
--

CREATE TABLE transactions (
    id bigint DEFAULT nextval('transactions_id_seq'::regclass) NOT NULL,
    offset_id bigint NOT NULL,
    account_id bigint NOT NULL,
    amount bigint NOT NULL,
    description character varying(100) NOT NULL
);


--
-- TOC entry 1816 (class 2606 OID 16415)
-- Dependencies: 1518 1518
-- Name: account_products_pkey; Type: CONSTRAINT; Schema: core; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_products
    ADD CONSTRAINT account_products_pkey PRIMARY KEY (id);


--
-- TOC entry 1814 (class 2606 OID 16405)
-- Dependencies: 1517 1517
-- Name: account_subtypes_pkey; Type: CONSTRAINT; Schema: core; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_subtypes
    ADD CONSTRAINT account_subtypes_pkey PRIMARY KEY (id);


--
-- TOC entry 1812 (class 2606 OID 16400)
-- Dependencies: 1516 1516
-- Name: account_types_pkey; Type: CONSTRAINT; Schema: core; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_types
    ADD CONSTRAINT account_types_pkey PRIMARY KEY (id);


--
-- TOC entry 1820 (class 2606 OID 16432)
-- Dependencies: 1520 1520 1520
-- Name: accounts_number_account_product_id_key; Type: CONSTRAINT; Schema: core; Owner: -; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_number_account_product_id_key UNIQUE (number, account_product_id);


--
-- TOC entry 1822 (class 2606 OID 16430)
-- Dependencies: 1520 1520
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: core; Owner: -; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 1818 (class 2606 OID 16425)
-- Dependencies: 1519 1519
-- Name: customers_pkey; Type: CONSTRAINT; Schema: core; Owner: -; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 1824 (class 2606 OID 16447)
-- Dependencies: 1521 1521
-- Name: transactions_pkey; Type: CONSTRAINT; Schema: core; Owner: -; Tablespace: 
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 1826 (class 2606 OID 16416)
-- Dependencies: 1518 1813 1517
-- Name: account_products_account_subtype_id_fkey; Type: FK CONSTRAINT; Schema: core; Owner: -
--

ALTER TABLE ONLY account_products
    ADD CONSTRAINT account_products_account_subtype_id_fkey FOREIGN KEY (account_subtype_id) REFERENCES account_subtypes(id);


--
-- TOC entry 1825 (class 2606 OID 16406)
-- Dependencies: 1517 1811 1516
-- Name: account_subtypes_account_type_id_fkey; Type: FK CONSTRAINT; Schema: core; Owner: -
--

ALTER TABLE ONLY account_subtypes
    ADD CONSTRAINT account_subtypes_account_type_id_fkey FOREIGN KEY (account_type_id) REFERENCES account_types(id);


--
-- TOC entry 1827 (class 2606 OID 16433)
-- Dependencies: 1815 1518 1520
-- Name: accounts_account_product_id_fkey; Type: FK CONSTRAINT; Schema: core; Owner: -
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_account_product_id_fkey FOREIGN KEY (account_product_id) REFERENCES account_products(id);


--
-- TOC entry 1828 (class 2606 OID 16438)
-- Dependencies: 1519 1817 1520
-- Name: accounts_customer_id_fkey; Type: FK CONSTRAINT; Schema: core; Owner: -
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES customers(id);


--
-- TOC entry 1829 (class 2606 OID 16448)
-- Dependencies: 1821 1520 1521
-- Name: transactions_account_id_fkey; Type: FK CONSTRAINT; Schema: core; Owner: -
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_account_id_fkey FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- TOC entry 1830 (class 2606 OID 16471)
-- Dependencies: 1823 1521 1521
-- Name: transactions_offset_id_fkey; Type: FK CONSTRAINT; Schema: core; Owner: -
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_offset_id_fkey FOREIGN KEY (offset_id) REFERENCES transactions(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2011-06-14 21:22:28 EDT

--
-- PostgreSQL database dump complete
--

