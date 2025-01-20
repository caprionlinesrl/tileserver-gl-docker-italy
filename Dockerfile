FROM node:23-bookworm AS builder

RUN apt-get update && apt-get install -y tilemaker
RUN wget https://download.geofabrik.de/europe/italy-latest.osm.pbf
RUN tilemaker --input italy-latest.osm.pbf --output conf/italy.mbtiles

COPY conf /conf

FROM maptiler/tileserver-gl:v5.1.2

COPY --from=builder /conf /conf
CMD ["-c", "/conf/conf.json"]
