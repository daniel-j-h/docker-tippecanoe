# Docker images for tippecanoe

Pre-built Docker images for [tippecanoe](https://github.com/mapbox/tippecanoe) so you don't have to compile it from source.


# Usage

Run via

    docker run danieljh/tippecanoe

Example

    docker run -v ~/osm:/data danieljh/tippecanoe -o /data/berlin.mbtiles -zg --drop-densest-as-needed /data/berlin.geojson


# Building

    docker build -r danieljh/tippecanoe .
