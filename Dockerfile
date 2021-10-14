FROM alpine:3.14.2
RUN apk upgrade --no-cache
RUN apk add bitcoin=22.0-r0 \
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
