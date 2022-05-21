FROM --platform=${TARGETPLATFORM} alpine:latest
LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

WORKDIR /root
ARG TARGETPLATFORM
ARG TAG
COPY v2ray.sh /root/v2ray.sh

RUN set -ex \
    && apk add --no-cache tzdata openssl ca-certificates \
    && mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray \
    && chmod +x /root/v2ray.sh \
    && /root/v2ray.sh "${TARGETPLATFORM}" "v4.45.0"

ADD start.sh /start.sh

RUN chmod +x /start.sh

VOLUME ["/v2ray"]

EXPOSE 9011

CMD ["/start.sh"]
