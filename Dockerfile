FROM alpine:3.12.0
RUN apk upgrade --no-cache
RUN apk add boost-thread=1.72.0-r6 \
            boost-filesystem=1.72.0-r6 \
    --repository https://nl.alpinelinux.org/alpine/edge/main \
    --no-cache
RUN apk add bitcoin=0.20.0-r0 \
    --repository https://nl.alpinelinux.org/alpine/edge/community \
    --no-cache && \
    mkdir /var/lib/bitcoin && \
    cp /etc/bitcoin.conf /var/lib/bitcoin/ && \
    chown -R bitcoin:bitcoin /var/lib/bitcoin
#VOLUME /var/lib/bitcoin
USER bitcoin
ENTRYPOINT ["bitcoind"]
CMD ["-datadir=/var/lib/bitcoin"]
