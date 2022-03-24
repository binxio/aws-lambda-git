FROM public.ecr.aws/lambda/python:3.8

RUN mkdir -p /var/task/{bin,lib}
RUN yum install -y git zip

WORKDIR /var/task

RUN cp /usr/bin/git /var/task/bin && \
    cp /usr/libexec/git-core/git-remote-http /var/task/bin

RUN cp /usr/lib64/libpcre2-8.so.0 /var/task/lib/ && \
    cp /usr/lib64/libcurl.so.4 /var/task/lib/ && \
    cp /usr/lib64/libexpat.so.1 /var/task/lib/ && \
    cp /usr/lib64/libnghttp2.so.14 /var/task/lib/ && \
    cp /usr/lib64/libidn2.so.0 /var/task/lib/ && \
    cp /usr/lib64/libssh2.so.1 /var/task/lib/ && \
    cp /usr/lib64/libldap-2.4.so.2 /var/task/lib/ && \
    cp /usr/lib64/libunistring.so.0 /var/task/lib/ && \
    cp /usr/lib64/libsasl2.so.3 /var/task/lib/ && \
    cp /usr/lib64/libssl3.so /var/task/lib/ && \
    cp /usr/lib64/libsmime3.so /var/task/lib/ && \
    cp /usr/lib64/libnss3.so /var/task/lib/ && \
    cp /usr/lib64/liblber-2.4.so.2 /var/task/lib/

RUN zip -r9 /tmp/libraries.zip *

CMD [ "function.handler" ]
