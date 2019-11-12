FROM alpine
RUN apk add -U curl busybox-extras bash
RUN mkdir /cgi-bin
COPY ./cgi-bin/db /cgi-bin/db
RUN chmod +x /cgi-bin/db
ENV DBHOST=""
CMD httpd -f -h /