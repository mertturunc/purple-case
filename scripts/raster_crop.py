# this script is used to crop the raster to the bounding box

import rasterio
from shapely.geometry import box
import geopandas as gpd
from rasterio.mask import mask

# input raster (ALOS PALSAR Level 2 GeoTIFF)
input_raster = "./raster/HH-ALPSRP228400790-H2.2_UA.tif"

# bounding box (WGS84)
bbox_wgs84 = (28.753995, 40.108817, 29.319104, 40.336879)  # (minx, miny, maxx, maxy)

output_raster = "./data/cropped_alos_palsar.tif"

# source: https://rasterio.readthedocs.io/en/stable/api/rasterio.mask.html
with rasterio.open(input_raster) as src:
    print("raster bounds:", src.bounds)
    print("raster CRS:", src.crs)
    # bbox to box
    bbox_geom = box(*bbox_wgs84)
    # gdf as 4326
    gdf = gpd.GeoDataFrame({'geometry': [bbox_geom]}, crs="EPSG:4326")
    # 4326 to utm
    gdf_proj = gdf.to_crs(src.crs)
    # mask
    shapes = [gdf_proj.iloc[0].geometry]
    out_image, out_transform = mask(src, shapes, crop=True)
    out_meta = src.meta.copy()
    out_meta.update({
        "driver": "GTiff",
        "height": out_image.shape[1],
        "width": out_image.shape[2],
        "transform": out_transform
    })
    with rasterio.open(output_raster, "w", **out_meta) as dest:
        dest.write(out_image)

print("raster kaydedildi:", output_raster)
