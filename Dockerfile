FROM alpine
RUN apk add -U curl  postgresql-client busybox-extras bash
RUN mkdir /cgi-bin
COPY ./db /cgi-bin/db
RUN chmod +x /cgi-bin/db
ENV DBHOST=""
CMD httpd -f -h /