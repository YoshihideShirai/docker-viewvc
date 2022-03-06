FROM debian:bullseye-slim

ARG VIEWVC_VERSION
ARG VIEWVC_REFS

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    supervisor curl ca-certificates \
    cvs cvsgraph fcgiwrap mime-support subversion \
    nginx-light \
    python3-chardet python3-pygments python3-subversion \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /var/www/html \
 && curl -L https://github.com/viewvc/viewvc/archive/refs/${VIEWVC_REFS}/${VIEWVC_VERSION}.tar.gz -o /tmp/viewvc.tar.gz \
 && tar xzf /tmp/viewvc.tar.gz -C /tmp \
 && /bin/bash -c "cd /tmp/viewvc-${VIEWVC_VERSION}; echo -e \"/usr/local/viewvc\n\n\" | python3 viewvc-install" \
 && rm -rf /tmp/viewvc-${VIEWVC_VERSION} /tmp/viewvc.tar.gz

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY config/entrypoint.sh /

EXPOSE 80

CMD ["/entrypoint.sh"]
