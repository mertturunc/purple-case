# this script is used to merge and crop rasters to the bounding box
# alos palsar didn't work, so i used srtm

import rasterio
from rasterio.merge import merge
from rasterio.mask import mask
from shapely.geometry import box
import glob
import os

os.environ['PROJ_LIB'] = r".\.venv\Lib\site-packages\rasterio\proj_data"


bbox = box(28.753995, 40.108817, 29.319104, 40.336879)  # WGS84 bbox
input_folder = "./raster"
output_raster = "./data/working_area_srtm.tif"

files = glob.glob(os.path.join(input_folder, "*.tif"))
srcs = [rasterio.open(f) for f in files]
mosaic, out_trans = merge(srcs)
meta = srcs[0].meta.copy()
for src in srcs: src.close()

meta.update({"driver": "GTiff", "height": mosaic.shape[1], "width": mosaic.shape[2], "transform": out_trans})

with rasterio.MemoryFile() as memfile:
    with memfile.open(**meta) as dataset:
        dataset.write(mosaic)
        bbox_proj = rasterio.warp.transform_geom("EPSG:4326", dataset.crs, bbox.__geo_interface__)
        out_image, out_transform = mask(dataset, [bbox_proj], crop=True)
        meta.update({"height": out_image.shape[1], "width": out_image.shape[2], "transform": out_transform})
        with rasterio.open(output_raster, "w", **meta) as dest:
            dest.write(out_image)

print("raster kaydedildi:", output_raster)
