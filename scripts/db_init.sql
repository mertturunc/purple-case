-- PostGIS uzantısını etkinleştirir
CREATE EXTENSION IF NOT EXISTS postgis;

-- Depo tablosu
CREATE TABLE warehouses (
    id SERIAL PRIMARY KEY,
    warehouse_name VARCHAR(100),
    city_name VARCHAR(100),
    location GEOMETRY(Point, 3857)
);

-- Sipariş tablosu
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_id BIGINT,
    location GEOMETRY(Point, 3857),
    basket_value NUMERIC,
    delivery_duration NUMERIC,
    profit NUMERIC,
    revenue NUMERIC,
    client_id VARCHAR(100)
);

-- Servis Alanları Tablosu
CREATE TABLE service_areas (
    id SERIAL PRIMARY KEY,
    service_area_name VARCHAR(100),
    location GEOMETRY(Polygon, 3857)
);

-- Mahalle tablosu
CREATE TABLE neighborhoods (
    id SERIAL PRIMARY KEY,
    neighborhood_name VARCHAR(100),
    location GEOMETRY(Polygon, 3857)
);

-- İlçe tablosu
CREATE TABLE districts (
    id SERIAL PRIMARY KEY,
    district_name VARCHAR(100),
    location GEOMETRY(Polygon, 3857)
);

-- TUİK Mahalle Yaş Tablosu
CREATE TABLE neighborhood_age_distribution (
    id SERIAL PRIMARY KEY,
    neighborhood_name VARCHAR(100)
);

-- TUİK İlçe Cinsiyet Dağılımı Tablosu
CREATE TABLE district_gender_distribution (
    id SERIAL PRIMARY KEY,
    district_name VARCHAR(100)
);