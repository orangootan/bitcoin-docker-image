FROM alpine:3.8
RUN apk upgrade \
    --repository http://nl.alpinelinux.org/alpine/edge/main \
    --no-cache
RUN apk add boost-chrono=1.67.0-r2 \
            boost-thread=1.67.0-r2 \
            boost-system=1.67.0-r2 \
            boost-filesystem=1.67.0-r2 \
#            boost-program_options=1.67.0-r2 \
#            libressl2.7-libcrypto=2.7.4-r1 \
            libstdc++=8.2.0-r1 \
    --repository http://nl.alpinelinux.org/alpine/edge/main \
    --no-cache
RUN apk add bitcoin=0.17.0.1-r0 \
    --repository http://nl.alpinelinux.org/alpine/edge/community \
    --no-cache && \
    mkdir /var/lib/bitcoin && \
    cp /etc/bitcoin.conf /var/lib/bitcoin/ && \
    chown -R bitcoin:bitcoin /var/lib/bitcoin
#VOLUME /var/lib/bitcoin
USER bitcoin
ENTRYPOINT ["bitcoind"]
CMD ["-datadir=/var/lib/bitcoin"]
