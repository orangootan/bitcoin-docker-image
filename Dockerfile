FROM alpine:3.13.0
RUN apk upgrade --no-cache
RUN apk add boost1.75-thread=1.75.0-r4 \
            boost1.75-filesystem=1.75.0-r4 \
    --repository https://nl.alpinelinux.org/alpine/edge/main \
    --no-cache
RUN apk add bitcoin=0.21.0-r0 \
    --repository https://nl.alpinelinux.org/alpine/edge/community \
    --no-cache && \
    mkdir /var/lib/bitcoin && \
    cp /etc/bitcoin.conf /var/lib/bitcoin/ && \
    chown -R bitcoin:bitcoin /var/lib/bitcoin && \
    sed -i 's/daemon=1/daemon=0/g' /var/lib/bitcoin/bitcoin.conf
#VOLUME /var/lib/bitcoin
USER bitcoin
ENTRYPOINT ["bitcoind"]
CMD ["-datadir=/var/lib/bitcoin"]
