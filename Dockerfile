FROM alpine:3.6
RUN apk add busybox=1.27.1-r0 \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    --no-cache
RUN apk add bitcoin=0.15.0.1-r2 \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    --no-cache && \
    mkdir /var/lib/bitcoin && \
    cp /etc/bitcoin.conf /var/lib/bitcoin/ && \
    chown -R bitcoin:bitcoin /var/lib/bitcoin
VOLUME /var/lib/bitcoin
USER bitcoin
ENTRYPOINT ["bitcoind"]
CMD ["-datadir=/var/lib/bitcoin"]
