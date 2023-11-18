FROM  instructure/canvas-lms:stable

# removing encrypted files
RUN  rm /home/docker/.gem/ruby/2.4.0/gems/rubyzip-1.2.1/test/data/zipWithEncryption.zip \
     && rm /home/docker/.gem/ruby/2.4.0/cache/rubyzip-1.2.1.gem

# copy config files
COPY  ./config/* /usr/src/app/config/
COPY  ./conf/canvas_no_ssl.conf /etc/apache2/sites-enabled/canvas.conf

EXPOSE 80 443
