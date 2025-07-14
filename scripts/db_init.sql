CREATE TABLE "public"."district_gender_distribution" (
    id integer DEFAULT nextval('district_gender_distribution_id_seq'::regclass) NOT NULL,
    district_name character varying(100),
    CONSTRAINT district_gender_distribution_pkey PRIMARY KEY (id)
);

CREATE TABLE "public"."district_with_age" (
    city text,
    district text,
    id bigint,
    Erkek_ve_04 bigint,
    Erkek_ve_1014 bigint,
    Erkek_ve_1519 bigint,
    Erkek_ve_2024 bigint,
    Erkek_ve_2529 bigint,
    Erkek_ve_3034 bigint,
    Erkek_ve_3539 bigint,
    Erkek_ve_4044 bigint,
    Erkek_ve_4549 bigint,
    Erkek_ve_5054 bigint,
    Erkek_ve_5559 bigint,
    Erkek_ve_59 bigint,
    Erkek_ve_6064 bigint,
    Erkek_ve_6569 bigint,
    Erkek_ve_7074 bigint,
    Erkek_ve_7579 bigint,
    Erkek_ve_8084 bigint,
    Erkek_ve_8589 bigint,
    Erkek_ve_90 bigint,
    Kadın_ve_04 bigint,
    Kadın_ve_1014 bigint,
    Kadın_ve_1519 bigint,
    Kadın_ve_2024 bigint,
    Kadın_ve_2529 bigint,
    Kadın_ve_3034 bigint,
    Kadın_ve_3539 bigint,
    Kadın_ve_4044 bigint,
    Kadın_ve_4549 bigint,
    Kadın_ve_5054 bigint,
    Kadın_ve_5559 bigint,
    Kadın_ve_59 bigint,
    Kadın_ve_6064 bigint,
    Kadın_ve_6569 bigint,
    Kadın_ve_7074 bigint,
    Kadın_ve_7579 bigint,
    Kadın_ve_8084 bigint,
    Kadın_ve_8589 bigint,
    Kadın_ve_90 bigint
);

CREATE TABLE "public"."districts" (
    id integer DEFAULT nextval('districts_id_seq'::regclass) NOT NULL,
    district_name character varying(100),
    location geometry(Polygon,3857),
    CONSTRAINT districts_pkey PRIMARY KEY (id)
);

CREATE TABLE "public"."neighborhood_age_distribution" (
    id integer DEFAULT nextval('neighborhood_age_distribution_id_seq'::regclass) NOT NULL,
    neighborhood_name character varying(100),
    CONSTRAINT neighborhood_age_distribution_pkey PRIMARY KEY (id)
);

CREATE TABLE "public"."neighborhood_with_pop" (
    city text,
    district text,
    municipality text,
    neighbourhood text,
    id bigint,
    nufus bigint
);

CREATE TABLE "public"."neighborhoods" (
    id integer DEFAULT nextval('neighborhoods_id_seq'::regclass) NOT NULL,
    neighborhood_name character varying(100),
    location geometry(Polygon,3857),
    CONSTRAINT neighborhoods_pkey PRIMARY KEY (id)
);

CREATE TABLE "public"."orders" (
    id integer DEFAULT nextval('orders_id_seq'::regclass) NOT NULL,
    order_id bigint,
    location geometry(Point,3857),
    basket_value numeric,
    delivery_duration numeric,
    profit numeric,
    revenue numeric,
    client_id character varying(100),
    CONSTRAINT orders_pkey PRIMARY KEY (id)
);

CREATE TABLE "public"."service_areas_iso" (
    location geometry(Polygon,3857)
);

CREATE TABLE "public"."service_areas_nbh" (
    location geometry(Polygon,3857)
);

CREATE TABLE "public"."warehouses" (
    id integer DEFAULT nextval('warehouses_id_seq'::regclass) NOT NULL,
    warehouse_name character varying(100),
    city_name character varying(100),
    location geometry(Point,3857),
    CONSTRAINT warehouses_pkey PRIMARY KEY (id)
);