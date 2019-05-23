FROM ubuntu:18.04 as build
WORKDIR /usr/src/app
RUN apt-get update && apt-get install -y wget unzip build-essential libsqlite3-dev zlib1g-dev       && \
    wget https://github.com/mapbox/tippecanoe/archive/b550c7b4a6343f5310fae82c8794648bf77afa3a.zip  && \
    for f in *.zip; do unzip $f && rm $f; done                                                      && \
    mv tippecanoe* tippecanoe                                                                       && \
    cd tippecanoe                                                                                   && \
    make -j$(nproc) && make install

FROM ubuntu:18.04 as runtime
RUN apt-get update && apt-get install -y libsqlite3-0
COPY --from=build /usr/local/bin/tippecanoe            \
                  /usr/local/bin/tippecanoe-enumerate  \
                  /usr/local/bin/tippecanoe-decode     \
                  /usr/local/bin/tippecanoe-json-tool  \
                  /usr/local/bin/
ENTRYPOINT ["tippecanoe"]
CMD ["--help"]
