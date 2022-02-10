#!/bin/sh
if [ ! -f /v2ray/config.json ]; then
    mkdir -p /v2ray/
    echo -e '{"inbounds":[{"port":9011,"protocol":"vmess","settings":{"clients":[{"id":"\c' > /v2ray/config.json
    if [ ! $UUID ]; then
        UUID=`cat /proc/sys/kernel/random/uuid`
        echo "${UUID}"
    fi
    echo -e "${UUID}\c" >> /v2ray/config.json
    echo '","alterId":0}]},"streamSettings":{"network":"ws","wsSettings":{"path":"/movie"}}}],"outbounds":[{"protocol":"freedom","settings":{}},{"protocol":"blackhole","settings":{},"tag":"block"}],"routing":{"domainStrategy":"AsIs","rules":[{"type":"field","outboundTag":"block","protocol":["bittorrent"]}]}}' >> /v2ray/config.json
fi
/usr/bin/v2ray -config=/v2ray/config.json
