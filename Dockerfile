#
# Dockerfile for aria2
#

FROM alpine
LABEL maintainer="me@kytse.com"

# Install aria2
RUN apk update && apk add aria2 --no-cache

EXPOSE 6800

CMD aria2c --conf-path=/config/aria2.conf
