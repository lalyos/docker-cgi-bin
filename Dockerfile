FROM ubuntu
RUN apt-get update
RUN apt-get install -y curl nginx
RUN echo 'lunch time soon ...' >  /var/www/html/index.html
ENV TITLE=lunchtime
COPY start.sh /
RUN chmod +x /start.sh 
CMD ["/start.sh"]