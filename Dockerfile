FROM alpine

COPY config.json /etc/vvv/config.json

ARG vname
ENV vname=${vname}

RUN apk update \
  && apk add --no-cache ca-certificates wget unzip \
  && mkdir -p /app/ \
  && cd /app/ \
  && wget https://github.com/v${vname}y/v${vname}y-core/releases/latest/download/v${vname}y-linux-64.zip -O vvv.zip \
  && unzip vvv.zip \
  && rm -rf vvv.zip \
  && ln -s v${vname}y vvv

ENTRYPOINT [ "/app/vvv", "-config=/etc/vvv/config.json" ]
