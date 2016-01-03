FROM alpine:3.3

ENV GLIBC_URL     https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64
ENV GLIBC_VERSION 2.21-r2

RUN apk add --update -t deps wget ca-certificates openssl \
 && wget "${GLIBC_URL}/glibc-${GLIBC_VERSION}.apk" "${GLIBC_URL}/glibc-bin-${GLIBC_VERSION}.apk" -P /tmp \
 && apk add --allow-untrusted "/tmp/glibc-${GLIBC_VERSION}.apk" "/tmp/glibc-bin-${GLIBC_VERSION}.apk" \
 && /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib \
 && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
 && rm /tmp/* /var/cache/apk/*

ENV MUXY_VERSION 0.0.1

RUN wget https://github.com/mefellows/muxy/releases/download/v${MUXY_VERSION}/linux_amd64.zip -O /tmp/muxy.zip \
 && cd /bin \
 && unzip /tmp/muxy.zip \
 && rm /tmp/muxy.zip

ENTRYPOINT ["/bin/muxy"]
