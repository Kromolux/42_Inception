FROM alpine:3.15

COPY conf/setup.sh /tmp/setup.sh
COPY conf/index.html /tmp/index.html


ENTRYPOINT [ "sh", "/tmp/setup.sh" ]