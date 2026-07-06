--
-- PostgreSQL database dump
--

\restrict p7vf8zTE8OJ6LBf15nXf1Ydv378vFXXEfmfBJB6kb7pBHud3I0VD9QBSgz3AcWq

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Ubuntu 16.14-0ubuntu0.24.04.1)

-- Started on 2026-07-06 10:42:26 -05

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

DROP DATABASE postgres;
--
-- TOC entry 3504 (class 1262 OID 5)
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\unrestrict p7vf8zTE8OJ6LBf15nXf1Ydv378vFXXEfmfBJB6kb7pBHud3I0VD9QBSgz3AcWq
\connect postgres
\restrict p7vf8zTE8OJ6LBf15nXf1Ydv378vFXXEfmfBJB6kb7pBHud3I0VD9QBSgz3AcWq

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
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 3504
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 16483)
-- Name: dataset_riwisupply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dataset_riwisupply (
    "MovementDate" character varying(50),
    "SupplierName" character varying(50),
    "SupplierCity" character varying(50),
    "Warehouse" character varying(50),
    "WarehouseCity" character varying(50),
    "ProductName" character varying(50),
    "Category" character varying(50),
    "Quantity" integer,
    "UnitPrice" integer,
    "MovementType" character varying(50),
    "PurchaseOrder" character varying(50)
);


ALTER TABLE public.dataset_riwisupply OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16426)
-- Name: riwi_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.riwi_categories (
    riwi_id_category integer NOT NULL,
    riwi_name_category character varying(50) NOT NULL
);


ALTER TABLE public.riwi_categories OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16425)
-- Name: riwi_categories_riwi_id_category_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.riwi_categories_riwi_id_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riwi_categories_riwi_id_category_seq OWNER TO postgres;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 221
-- Name: riwi_categories_riwi_id_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.riwi_categories_riwi_id_category_seq OWNED BY public.riwi_categories.riwi_id_category;


--
-- TOC entry 216 (class 1259 OID 16389)
-- Name: riwi_cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.riwi_cities (
    riwi_id_city integer NOT NULL,
    riwi_name_city character varying(50) NOT NULL
);


ALTER TABLE public.riwi_cities OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16388)
-- Name: riwi_cities_riwi_id_city_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.riwi_cities_riwi_id_city_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riwi_cities_riwi_id_city_seq OWNER TO postgres;

--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 215
-- Name: riwi_cities_riwi_id_city_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.riwi_cities_riwi_id_city_seq OWNED BY public.riwi_cities.riwi_id_city;


--
-- TOC entry 226 (class 1259 OID 16449)
-- Name: riwi_inventory_movements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.riwi_inventory_movements (
    riwi_id_movement integer NOT NULL,
    riwi_movement_date date NOT NULL,
    riwi_id_supplier integer NOT NULL,
    riwi_id_warehouse integer NOT NULL,
    riwi_id_product integer NOT NULL,
    riwi_quantity integer NOT NULL,
    riwi_unit_price numeric(12,2) NOT NULL,
    riwi_movement_type character varying(3) NOT NULL,
    riwi_purchase_order character varying(50) NOT NULL,
    CONSTRAINT riwi_inventory_movements_riwi_movement_type_check CHECK (((riwi_movement_type)::text = ANY ((ARRAY['IN'::character varying, 'OUT'::character varying])::text[]))),
    CONSTRAINT riwi_inventory_movements_riwi_quantity_check CHECK ((riwi_quantity > 0)),
    CONSTRAINT riwi_inventory_movements_riwi_unit_price_check CHECK ((riwi_unit_price >= (0)::numeric))
);


ALTER TABLE public.riwi_inventory_movements OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16448)
-- Name: riwi_inventory_movements_riwi_id_movement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.riwi_inventory_movements_riwi_id_movement_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riwi_inventory_movements_riwi_id_movement_seq OWNER TO postgres;

--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 225
-- Name: riwi_inventory_movements_riwi_id_movement_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.riwi_inventory_movements_riwi_id_movement_seq OWNED BY public.riwi_inventory_movements.riwi_id_movement;


--
-- TOC entry 224 (class 1259 OID 16435)
-- Name: riwi_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.riwi_products (
    riwi_id_product integer NOT NULL,
    riwi_name_product character varying(100) NOT NULL,
    riwi_id_category integer NOT NULL
);


ALTER TABLE public.riwi_products OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16434)
-- Name: riwi_products_riwi_id_product_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.riwi_products_riwi_id_product_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riwi_products_riwi_id_product_seq OWNER TO postgres;

--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 223
-- Name: riwi_products_riwi_id_product_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.riwi_products_riwi_id_product_seq OWNED BY public.riwi_products.riwi_id_product;


--
-- TOC entry 218 (class 1259 OID 16398)
-- Name: riwi_suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.riwi_suppliers (
    riwi_id_supplier integer NOT NULL,
    riwi_name_supplier character varying(100) NOT NULL,
    riwi_id_city integer NOT NULL
);


ALTER TABLE public.riwi_suppliers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16397)
-- Name: riwi_suppliers_riwi_id_supplier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.riwi_suppliers_riwi_id_supplier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riwi_suppliers_riwi_id_supplier_seq OWNER TO postgres;

--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 217
-- Name: riwi_suppliers_riwi_id_supplier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.riwi_suppliers_riwi_id_supplier_seq OWNED BY public.riwi_suppliers.riwi_id_supplier;


--
-- TOC entry 220 (class 1259 OID 16412)
-- Name: riwi_warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.riwi_warehouses (
    riwi_id_warehouse integer NOT NULL,
    riwi_name_warehouse character varying(100) NOT NULL,
    riwi_id_city integer NOT NULL
);


ALTER TABLE public.riwi_warehouses OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16473)
-- Name: riwi_vw_active_inventory; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.riwi_vw_active_inventory AS
 SELECT w.riwi_name_warehouse,
    p.riwi_name_product,
    COALESCE(sum(
        CASE
            WHEN ((m.riwi_movement_type)::text = 'IN'::text) THEN m.riwi_quantity
            ELSE (- m.riwi_quantity)
        END), (0)::bigint) AS riwi_current_stock
   FROM ((public.riwi_warehouses w
     CROSS JOIN public.riwi_products p)
     LEFT JOIN public.riwi_inventory_movements m ON (((w.riwi_id_warehouse = m.riwi_id_warehouse) AND (p.riwi_id_product = m.riwi_id_product))))
  GROUP BY w.riwi_name_warehouse, p.riwi_name_product;


ALTER VIEW public.riwi_vw_active_inventory OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16478)
-- Name: riwi_vw_supplier_purchases; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.riwi_vw_supplier_purchases AS
 SELECT s.riwi_name_supplier,
    c.riwi_name_category,
    sum(((m.riwi_quantity)::numeric * m.riwi_unit_price)) AS riwi_total_spent
   FROM (((public.riwi_suppliers s
     JOIN public.riwi_inventory_movements m ON ((s.riwi_id_supplier = m.riwi_id_supplier)))
     JOIN public.riwi_products p ON ((m.riwi_id_product = p.riwi_id_product)))
     JOIN public.riwi_categories c ON ((p.riwi_id_category = c.riwi_id_category)))
  WHERE ((m.riwi_movement_type)::text = 'IN'::text)
  GROUP BY s.riwi_name_supplier, c.riwi_name_category;


ALTER VIEW public.riwi_vw_supplier_purchases OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16411)
-- Name: riwi_warehouses_riwi_id_warehouse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.riwi_warehouses_riwi_id_warehouse_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.riwi_warehouses_riwi_id_warehouse_seq OWNER TO postgres;

--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 219
-- Name: riwi_warehouses_riwi_id_warehouse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.riwi_warehouses_riwi_id_warehouse_seq OWNED BY public.riwi_warehouses.riwi_id_warehouse;


--
-- TOC entry 3307 (class 2604 OID 16429)
-- Name: riwi_categories riwi_id_category; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_categories ALTER COLUMN riwi_id_category SET DEFAULT nextval('public.riwi_categories_riwi_id_category_seq'::regclass);


--
-- TOC entry 3304 (class 2604 OID 16392)
-- Name: riwi_cities riwi_id_city; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_cities ALTER COLUMN riwi_id_city SET DEFAULT nextval('public.riwi_cities_riwi_id_city_seq'::regclass);


--
-- TOC entry 3309 (class 2604 OID 16452)
-- Name: riwi_inventory_movements riwi_id_movement; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_inventory_movements ALTER COLUMN riwi_id_movement SET DEFAULT nextval('public.riwi_inventory_movements_riwi_id_movement_seq'::regclass);


--
-- TOC entry 3308 (class 2604 OID 16438)
-- Name: riwi_products riwi_id_product; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_products ALTER COLUMN riwi_id_product SET DEFAULT nextval('public.riwi_products_riwi_id_product_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 16401)
-- Name: riwi_suppliers riwi_id_supplier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_suppliers ALTER COLUMN riwi_id_supplier SET DEFAULT nextval('public.riwi_suppliers_riwi_id_supplier_seq'::regclass);


--
-- TOC entry 3306 (class 2604 OID 16415)
-- Name: riwi_warehouses riwi_id_warehouse; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_warehouses ALTER COLUMN riwi_id_warehouse SET DEFAULT nextval('public.riwi_warehouses_riwi_id_warehouse_seq'::regclass);


--
-- TOC entry 3498 (class 0 OID 16483)
-- Dependencies: 229
-- Data for Name: dataset_riwisupply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dataset_riwisupply ("MovementDate", "SupplierName", "SupplierCity", "Warehouse", "WarehouseCity", "ProductName", "Category", "Quantity", "UnitPrice", "MovementType", "PurchaseOrder") FROM stdin;
2026-04-01	Aceros del Norte S.A.S	Cartagena	Bodega Costa	Santa Marta	Disco de Corte 4.5	Herramienta	148	115388	OUT	PO-1049
2026-02-14	Aceros del Norte S.A.S	Cartagena	Bodega Costa	Santa Marta	Electrodo E6013	Consumible	27	35506	IN	PO-1041
2026-01-01	Industriales SAS	Barranquilla	Bodega Costa	Santa Marta	Guante Nitrilo	EPP	70	14290	IN	PO-1022
2026-02-16	Aceros del Norte S.A.S	Cartagena	Centro Logistico Norte	Cartagena	Guantes de Nitrilo	Elementos Protección	160	117524	IN	PO-1075
2026-02-28	Industriales S.A.S	Barranquila	Bodega Central	Barranquilla	Electrodo E6013	Consumible	40	139836	OUT	PO-1091
2026-03-06	Aceros del Norte S.A.S	Cartagena	Bod. Central	Barranquila	Disco de Corte 4.5	Herramienta	130	88512	OUT	PO-1041
2026-01-20	Aceros del Norte	Cartagena	Bodega Central	Barranquilla	Soldadura E6013	Consumibles	33	43746	OUT	PO-1059
2026-04-13	INDUSTRIALES SAS	B/quilla	Bodega Costa	Santa Marta	Guante Nitrilo	EPP	119	23022	OUT	PO-1035
2026-04-17	Suministros Global SAS	Sta Marta	Bod. Central	Barranquila	Guantes de Nitrilo	Elementos Protección	185	123653	IN	PO-1032
2026-02-02	Suministros Global SAS	Sta Marta	Bod. Central	Barranquila	Electrodo E6013	Consumible	87	123108	OUT	PO-1009
2026-05-23	ACEROS NORTE	Ctg	Bodega Costa	Santa Marta	Guantes de Nitrilo	Elementos Protección	175	39944	IN	PO-1040
2026-03-19	Aceros del Norte S.A.S	Cartagena	Bod. Central	Barranquila	Disco Corte 4.5	Herramientas	199	118291	OUT	PO-1023
2026-01-25	INDUSTRIALES SAS	B/quilla	Centro Logistico Norte	Cartagena	Guante Nitrilo	EPP	131	71980	OUT	PO-1029
2026-03-15	ACEROS NORTE	Ctg	Bodega Costa	Santa Marta	Disco de Corte 4.5	Herramienta	134	89964	OUT	PO-1035
2026-03-12	Industriales SAS	Barranquilla	Bodega Central	Barranquilla	Disco Corte 4.5	Herramientas	124	52910	IN	PO-1094
2026-04-26	INDUSTRIALES SAS	B/quilla	Bodega Central	Barranquilla	Disco Corte 4.5	Herramientas	61	136736	IN	PO-1034
2026-03-03	INDUSTRIALES SAS	B/quilla	Centro Logistico Norte	Cartagena	Disco de Corte 4.5	Herramienta	169	18022	OUT	PO-1043
2026-03-21	Aceros del Norte	Cartagena	Bodega Costa	Santa Marta	Casco Industrial	EPP	192	108802	OUT	PO-1083
2026-03-11	Aceros del Norte	Cartagena	Centro Logistico Norte	Cartagena	Electrodo E6013	Consumible	78	37943	OUT	PO-1036
\.


--
-- TOC entry 3493 (class 0 OID 16426)
-- Dependencies: 222
-- Data for Name: riwi_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.riwi_categories (riwi_id_category, riwi_name_category) FROM stdin;
1	Herramientas
2	Consumibles
3	EPP
\.


--
-- TOC entry 3487 (class 0 OID 16389)
-- Dependencies: 216
-- Data for Name: riwi_cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.riwi_cities (riwi_id_city, riwi_name_city) FROM stdin;
1	Cartagena
2	Santa Marta
3	Barranquilla
\.


--
-- TOC entry 3497 (class 0 OID 16449)
-- Dependencies: 226
-- Data for Name: riwi_inventory_movements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.riwi_inventory_movements (riwi_id_movement, riwi_movement_date, riwi_id_supplier, riwi_id_warehouse, riwi_id_product, riwi_quantity, riwi_unit_price, riwi_movement_type, riwi_purchase_order) FROM stdin;
1	2026-04-01	1	1	1	148	115388.00	OUT	PO-1049
2	2026-02-14	1	1	2	27	35506.00	IN	PO-1041
3	2026-01-01	2	1	3	70	14290.00	IN	PO-1022
4	2026-02-16	1	2	3	160	117524.00	IN	PO-1075
5	2026-02-28	2	3	2	40	139836.00	OUT	PO-1091
6	2026-03-06	1	3	1	130	88512.00	OUT	PO-1041
7	2026-01-20	1	3	2	33	43746.00	OUT	PO-1059
8	2026-04-13	2	1	3	119	23022.00	OUT	PO-1035
9	2026-04-17	3	3	3	185	123653.00	IN	PO-1032
10	2026-02-02	3	3	2	87	123108.00	OUT	PO-1009
11	2026-05-23	1	1	3	175	39944.00	IN	PO-1040
12	2026-03-19	1	3	1	199	118291.00	OUT	PO-1023
13	2026-01-25	2	2	3	131	71980.00	OUT	PO-1029
14	2026-03-15	1	1	1	134	89964.00	OUT	PO-1035
15	2026-03-12	2	3	1	124	52910.00	IN	PO-1094
16	2026-04-26	2	3	1	61	136736.00	IN	PO-1034
17	2026-03-03	2	2	1	169	18022.00	OUT	PO-1043
18	2026-03-21	1	1	4	192	108802.00	OUT	PO-1083
19	2026-03-11	1	2	2	78	37943.00	OUT	PO-1036
\.


--
-- TOC entry 3495 (class 0 OID 16435)
-- Dependencies: 224
-- Data for Name: riwi_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.riwi_products (riwi_id_product, riwi_name_product, riwi_id_category) FROM stdin;
1	Disco de Corte 4.5	1
2	Electrodo E6013	2
3	Guantes de Nitrilo	3
4	Casco Industrial	3
\.


--
-- TOC entry 3489 (class 0 OID 16398)
-- Dependencies: 218
-- Data for Name: riwi_suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.riwi_suppliers (riwi_id_supplier, riwi_name_supplier, riwi_id_city) FROM stdin;
2	Industriales S.A.S	3
3	Suministros Global S.A.S	2
4	Nuevo Proveedor S.A.S	1
1	Aceros del Norte y Sur S.A.S	1
\.


--
-- TOC entry 3491 (class 0 OID 16412)
-- Dependencies: 220
-- Data for Name: riwi_warehouses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.riwi_warehouses (riwi_id_warehouse, riwi_name_warehouse, riwi_id_city) FROM stdin;
1	Bodega Costa	2
2	Centro Logistico Norte	1
3	Bodega Central	3
\.


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 221
-- Name: riwi_categories_riwi_id_category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.riwi_categories_riwi_id_category_seq', 3, true);


--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 215
-- Name: riwi_cities_riwi_id_city_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.riwi_cities_riwi_id_city_seq', 3, true);


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 225
-- Name: riwi_inventory_movements_riwi_id_movement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.riwi_inventory_movements_riwi_id_movement_seq', 19, true);


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 223
-- Name: riwi_products_riwi_id_product_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.riwi_products_riwi_id_product_seq', 6, true);


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 217
-- Name: riwi_suppliers_riwi_id_supplier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.riwi_suppliers_riwi_id_supplier_seq', 4, true);


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 219
-- Name: riwi_warehouses_riwi_id_warehouse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.riwi_warehouses_riwi_id_warehouse_seq', 3, true);


--
-- TOC entry 3326 (class 2606 OID 16431)
-- Name: riwi_categories riwi_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_categories
    ADD CONSTRAINT riwi_categories_pkey PRIMARY KEY (riwi_id_category);


--
-- TOC entry 3328 (class 2606 OID 16433)
-- Name: riwi_categories riwi_categories_riwi_name_category_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_categories
    ADD CONSTRAINT riwi_categories_riwi_name_category_key UNIQUE (riwi_name_category);


--
-- TOC entry 3314 (class 2606 OID 16394)
-- Name: riwi_cities riwi_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_cities
    ADD CONSTRAINT riwi_cities_pkey PRIMARY KEY (riwi_id_city);


--
-- TOC entry 3316 (class 2606 OID 16396)
-- Name: riwi_cities riwi_cities_riwi_name_city_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_cities
    ADD CONSTRAINT riwi_cities_riwi_name_city_key UNIQUE (riwi_name_city);


--
-- TOC entry 3334 (class 2606 OID 16457)
-- Name: riwi_inventory_movements riwi_inventory_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_inventory_movements
    ADD CONSTRAINT riwi_inventory_movements_pkey PRIMARY KEY (riwi_id_movement);


--
-- TOC entry 3330 (class 2606 OID 16440)
-- Name: riwi_products riwi_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_products
    ADD CONSTRAINT riwi_products_pkey PRIMARY KEY (riwi_id_product);


--
-- TOC entry 3332 (class 2606 OID 16442)
-- Name: riwi_products riwi_products_riwi_name_product_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_products
    ADD CONSTRAINT riwi_products_riwi_name_product_key UNIQUE (riwi_name_product);


--
-- TOC entry 3318 (class 2606 OID 16403)
-- Name: riwi_suppliers riwi_suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_suppliers
    ADD CONSTRAINT riwi_suppliers_pkey PRIMARY KEY (riwi_id_supplier);


--
-- TOC entry 3320 (class 2606 OID 16405)
-- Name: riwi_suppliers riwi_suppliers_riwi_name_supplier_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_suppliers
    ADD CONSTRAINT riwi_suppliers_riwi_name_supplier_key UNIQUE (riwi_name_supplier);


--
-- TOC entry 3322 (class 2606 OID 16417)
-- Name: riwi_warehouses riwi_warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_warehouses
    ADD CONSTRAINT riwi_warehouses_pkey PRIMARY KEY (riwi_id_warehouse);


--
-- TOC entry 3324 (class 2606 OID 16419)
-- Name: riwi_warehouses riwi_warehouses_riwi_name_warehouse_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_warehouses
    ADD CONSTRAINT riwi_warehouses_riwi_name_warehouse_key UNIQUE (riwi_name_warehouse);


--
-- TOC entry 3338 (class 2606 OID 16468)
-- Name: riwi_inventory_movements fk_movement_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_inventory_movements
    ADD CONSTRAINT fk_movement_product FOREIGN KEY (riwi_id_product) REFERENCES public.riwi_products(riwi_id_product);


--
-- TOC entry 3339 (class 2606 OID 16458)
-- Name: riwi_inventory_movements fk_movement_supplier; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_inventory_movements
    ADD CONSTRAINT fk_movement_supplier FOREIGN KEY (riwi_id_supplier) REFERENCES public.riwi_suppliers(riwi_id_supplier);


--
-- TOC entry 3340 (class 2606 OID 16463)
-- Name: riwi_inventory_movements fk_movement_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_inventory_movements
    ADD CONSTRAINT fk_movement_warehouse FOREIGN KEY (riwi_id_warehouse) REFERENCES public.riwi_warehouses(riwi_id_warehouse);


--
-- TOC entry 3337 (class 2606 OID 16443)
-- Name: riwi_products fk_product_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_products
    ADD CONSTRAINT fk_product_category FOREIGN KEY (riwi_id_category) REFERENCES public.riwi_categories(riwi_id_category);


--
-- TOC entry 3335 (class 2606 OID 16406)
-- Name: riwi_suppliers fk_supplier_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_suppliers
    ADD CONSTRAINT fk_supplier_city FOREIGN KEY (riwi_id_city) REFERENCES public.riwi_cities(riwi_id_city);


--
-- TOC entry 3336 (class 2606 OID 16420)
-- Name: riwi_warehouses fk_warehouse_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.riwi_warehouses
    ADD CONSTRAINT fk_warehouse_city FOREIGN KEY (riwi_id_city) REFERENCES public.riwi_cities(riwi_id_city);


-- Completed on 2026-07-06 10:42:27 -05

--
-- PostgreSQL database dump complete
--

\unrestrict p7vf8zTE8OJ6LBf15nXf1Ydv378vFXXEfmfBJB6kb7pBHud3I0VD9QBSgz3AcWq

