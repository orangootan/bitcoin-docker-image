FROM alpine:3.11.5
RUN apk upgrade --no-cache
RUN apk add boost-chrono=1.72.0-r4 \
            boost-thread=1.72.0-r4 \
            boost-filesystem=1.72.0-r4 \
    --repository https://nl.alpinelinux.org/alpine/edge/main \
    --no-cache
RUN apk add bitcoin=0.19.1-r0 \
    --repository https://nl.alpinelinux.org/alpine/edge/community \
    --no-cache && \
    mkdir /var/lib/bitcoin && \
    cp /etc/bitcoin.conf /var/lib/bitcoin/ && \
    chown -R bitcoin:bitcoin /var/lib/bitcoin
#VOLUME /var/lib/bitcoin
USER bitcoin
ENTRYPOINT ["bitcoind"]
CMD ["-datadir=/var/lib/bitcoin"]
