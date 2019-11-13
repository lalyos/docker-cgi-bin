FROM alpine
RUN apk add -U curl  postgresql-client busybox-extras bash

COPY index.html /www/
COPY db dbadmin /www/cgi-bin/
RUN chmod +x /www/cgi-bin/*

ENV PGUSER=postgres
ENV PGPASSWORD=secret
ENV PGHOST=mydb

CMD httpd -f -h /www