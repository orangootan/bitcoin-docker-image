FROM alpine:3.10.1
RUN apk upgrade \
    --repository https://nl.alpinelinux.org/alpine/edge/main \
    --no-cache
RUN apk add boost-chrono=1.69.0-r5 \
            boost-thread=1.69.0-r5 \
            boost-filesystem=1.69.0-r5 \
            libstdc++=8.3.0-r0 \
    --repository https://nl.alpinelinux.org/alpine/edge/main \
    --no-cache
RUN apk add bitcoin=0.17.1-r2 \
    --repository https://nl.alpinelinux.org/alpine/edge/community \
    --no-cache && \
    mkdir /var/lib/bitcoin && \
    cp /etc/bitcoin.conf /var/lib/bitcoin/ && \
    chown -R bitcoin:bitcoin /var/lib/bitcoin
#VOLUME /var/lib/bitcoin
USER bitcoin
ENTRYPOINT ["bitcoind"]
CMD ["-datadir=/var/lib/bitcoin"]
