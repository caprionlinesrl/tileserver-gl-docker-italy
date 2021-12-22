To build docker container:
```
docker build --no-cache -t caprionlinesrl/tileserver-gl-docker-italy:1.0.0 -t caprionlinesrl/tileserver-gl-docker-italy:latest .
```

To run the container:
```
docker run --rm -it -p 8080:8080 caprionlinesrl/tileserver-gl-docker-italy:1.0.0
```

Updated maps:
```
https://data.maptiler.com/downloads/tileset/osm/europe/italy/
https://openmaptiles.os.zhdk.cloud.switch.ch/v3.3/extracts/italy.mbtiles
```
