FROM eclipse-temurin:21 AS builder

RUN wget https://github.com/onthegomap/planetiler/releases/download/v0.8.3/planetiler.jar
RUN java -Xmx16G -jar planetiler.jar --area=italy --download --output=italy.mbtiles
COPY conf /conf

FROM maptiler/tileserver-gl:v5.1.2

COPY --from=builder /conf /conf
COPY --from=builder /italy.mbtiles /conf/mbtiles/italy.mbtiles

CMD ["-c", "/conf/conf.json"]
