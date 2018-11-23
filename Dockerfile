FROM alpine:3.7

RUN apk add --no-cache curl && \
    echo "http://alpine.rsyslog.com/3.7/stable" >> /etc/apk/repositories && \
    curl http://alpine.rsyslog.com/rsyslog@lists.adiscon.com-5a55e598.rsa.pub > \
        /etc/apk/keys/rsyslog@lists.adiscon.com-5a55e598.rsa.pub && \
    apk --no-cache update && \
    apk add --no-cache rsyslog rsyslog-imptcp rsyslog-mmjsonparse logrotate && \
    mkdir -p /var/lib/logrotate

ADD root/ /

#USER 1001

ENTRYPOINT ["/container-entrypoint"]

CMD ["rsyslogd", "-n", "-f", "/rsyslog.conf"]
