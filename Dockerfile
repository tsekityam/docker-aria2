#
# Dockerfile for aria2
#

FROM alpine
LABEL maintainer="me@kytse.com"

ENV RPC_SECRET passwd
ENV RPC_SECURE false

# Install aria2
RUN apk update && apk add aria2 --no-cache

# Create working directory
RUN mkdir /home/aria2 && \
  mkdir /home/aria2/Downloads && \
  mkdir /home/aria2/.config && touch /home/aria2/.config/fullchain.pem && touch /home/aria2/.config/privkey.pem

EXPOSE 6800

CMD aria2c \
  --rpc-secret=${RPC_SECRET} \
  --enable-rpc --rpc-listen-all=true \
  --rpc-allow-origin-all \
  --dir=/home/aria2/Downloads \
  --rpc-certificate=/home/aria2/.config/fullchain.pem \
  --rpc-private-key=/home/aria2/.config/privkey.pem \
  --rpc-secure=${RPC_SECURE}
