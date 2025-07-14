# this script is a one time operation to import data to the database
# it is not meant to be run again
# and again

import os
import pandas as pd
import geopandas as gpd
from sqlalchemy import create_engine, text
from geoalchemy2 import WKTElement

# db config (we can use .env but its a case study)
DB_USER = os.getenv('PGUSER', 'postgres')
DB_PASS = os.getenv('PGPASSWORD', '1234')
DB_HOST = os.getenv('PGHOST', 'localhost')
DB_PORT = os.getenv('PGPORT', '5432')
DB_NAME = os.getenv('PGDATABASE', 'purple')

def create_database():
    admin_engine = create_engine(f"postgresql+psycopg2://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/postgres")
    with admin_engine.connect() as conn:
        result = conn.execute(text("SELECT 1 FROM pg_database WHERE datname = :db_name"), {"db_name": DB_NAME})
        if not result.fetchone():
            conn.execute(text("COMMIT"))
            conn.execute(text(f"CREATE DATABASE {DB_NAME}"))
    admin_engine.dispose()
    
    engine = create_engine(f"postgresql+psycopg2://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}")
    #with open('scripts/db_init.sql', 'r') as f:
    #    with engine.begin() as conn:
    #        conn.execute(text(f.read()))
    return engine

def import_csv(file_path, table_name, lon_col=None, lat_col=None, col_map=None):
    if file_path.endswith('.csv'):
        df = pd.read_csv(file_path)
    else:
        df = pd.read_excel(file_path)
    
    # name cleaning
    df.columns = df.columns.str.replace(' ', '_').str.replace(r'[^\w]', '', regex=True)
    
    # apply column mapping
    if col_map:
        clean_map = {k.replace(' ', '_').replace(r'[^\w]', ''): v for k, v in col_map.items()}
        df = df.rename(columns=clean_map)
    

    if lon_col:
        lon_col = lon_col.replace(' ', '_').replace(r'[^\w]', '')
    if lat_col:
        lat_col = lat_col.replace(' ', '_').replace(r'[^\w]', '')
    
    if lon_col and lat_col and lon_col in df.columns and lat_col in df.columns:
        with engine.begin() as conn:
            for _, row in df.iterrows():
                if pd.notna(row[lon_col]) and pd.notna(row[lat_col]):
                    # get columns that exist in both dataframe and database schema
                    schema_cols = []
                    if table_name == 'warehouses':
                        schema_cols = ['warehouse_name', 'city_name']
                    elif table_name == 'orders':
                        schema_cols = ['order_id', 'basket_value', 'delivery_duration', 'profit', 'revenue', 'client_id']
                    
                    values = {}
                    for col in df.columns:
                        if col not in [lon_col, lat_col] and col in schema_cols and pd.notna(row[col]):
                            values[col] = row[col]
                    
                    if values:
                        placeholders = ', '.join([f":{col}" for col in values.keys()])
                        cols_str = ', '.join(values.keys())
                        sql = f"INSERT INTO {table_name} ({cols_str}, location) VALUES ({placeholders}, ST_Transform(ST_SetSRID(ST_MakePoint(:lon, :lat), 4326), 3857))"
                        values['lon'] = row[lon_col]
                        values['lat'] = row[lat_col]
                        conn.execute(text(sql), values)
    else:
        df.to_sql(table_name, engine, if_exists='append', index=False)

def import_spatial(file_path, table_name):
    gdf = gpd.read_file(file_path)
    gdf = gdf.rename_geometry('location')
    gdf = gdf.to_crs(epsg=3857)
    
    # convert multi polygon to polygon
    def convert_to_polygon(geom):
        if geom.geom_type == 'MultiPolygon':
            return max(geom.geoms, key=lambda p: p.area)
        return geom
    
    gdf['location'] = gdf['location'].apply(convert_to_polygon)
    
    # get table schema and keep only matching columns
    with engine.begin() as conn:
        result = conn.execute(text(f"SELECT column_name FROM information_schema.columns WHERE table_name = '{table_name}' AND column_name != 'id'"))
        db_columns = [row[0] for row in result.fetchall()]
    
    # keep only columns that exist in target table
    keep_cols = [col for col in gdf.columns if col in db_columns or col == 'location']
    gdf = gdf[keep_cols]
    
    gdf.to_postgis(table_name, engine, if_exists='append', index=False)

# create database and import data
engine = create_database()
data_bursa = 'notebooks/ORDERS_SERVICE_AREA/data_Bursa'
# csv xls imports
import_csv('data/warehouse.csv', 'warehouses', 'Longitude', 'Latitude', 
          {'Warehouse1': 'warehouse_name', 'City_Name': 'city_name'})
import_csv('data/order.csv', 'orders', 'longitude', 'latitude', 
          {'delivery_duration': 'delivery_duration'})
import_csv(f'{data_bursa}/bursa_nbh_fixed.csv', 'neighborhood_with_pop')
import_csv(f'{data_bursa}/bursa_district_age_fixed.csv', 'district_with_age')

# sSpatial imports
import_spatial(f'{data_bursa}/Bursa_service_areas_iso_voronoi.gpkg', 'service_areas_iso')
import_spatial(f'{data_bursa}/Bursa_service_areas_nbh_voronoi.gpkg', 'service_areas_nbh')
import_spatial(f'{data_bursa}/Bursa_neighbourhoods.geojson', 'neighborhoods')
import_spatial(f'{data_bursa}/Bursa_districts.geojson', 'districts')

print("içeri aktarma tamamlandı")
