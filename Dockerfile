FROM node:10-buster AS builder

COPY conf /conf
RUN wget -O /conf/mbtiles/italy.mbtiles https://openmaptiles.os.zhdk.cloud.switch.ch/v3.3/extracts/italy.mbtiles


FROM maptiler/tileserver-gl:v3.1.1

COPY --from=builder /conf /conf
CMD ["-c", "/conf/conf.json"]
