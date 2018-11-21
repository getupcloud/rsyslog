FROM alpine:3.7

RUN apk add --no-cache rsyslog logrotate && \
    mkdir -p /var/lib/logrotate

ADD root/ /

#USER 1001

ENTRYPOINT ["/container-entrypoint"]

CMD ["rsyslogd", "-n", "-f", "/rsyslog.conf"]
