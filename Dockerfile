FROM node:10-buster AS builder

COPY conf /conf
RUN wget -O /conf/mbtiles/italy.mbtiles https://ondaplatform.s3.amazonaws.com/maps/maptiler-osm-2017-07-03-v3.6.1-europe_italy.mbtiles


FROM maptiler/tileserver-gl:v3.1.1

COPY --from=builder /conf /conf
CMD ["-c", "/conf/conf.json"]
