FROM node:10-buster AS builder

COPY conf /conf
RUN wget -O /conf/mbtiles/italy.mbtiles https://ondaplatform.s3.amazonaws.com/maps/maptiler-osm-2020-02-10-v3.11-europe_italy.mbtiles

FROM maptiler/tileserver-gl:v4.10.0

COPY --from=builder /conf /conf
CMD ["-c", "/conf/conf.json"]
