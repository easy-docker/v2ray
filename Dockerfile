FROM v2ray/official

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

ADD start.sh /start.sh

RUN chmod +x /start.sh

VOLUME ["/v2ray"]

EXPOSE 9011

CMD ["/start.sh"]
