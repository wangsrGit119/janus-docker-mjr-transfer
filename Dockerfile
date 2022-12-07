FROM alpine:3.17.0
COPY ./janus-pp-rec /usr/local/bin/janus-pp-rec
RUN apk update && apk add bash glib ffmpeg jansson &&  rm -rf /var/cache/apk/*
