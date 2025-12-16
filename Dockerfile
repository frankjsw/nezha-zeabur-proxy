FROM nginx:1.29-alpine AS builder
RUN apk add --no-cache --virtual .build-deps gcc libc-dev make openssl-dev pcre2-dev zlib-dev linux-headers bash
RUN wget "http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz" -O nginx.tar.gz && tar -zxvf nginx.tar.gz && rm nginx.tar.gz && mv /nginx-${NGINX_VERSION} /nginx-src
WORKDIR /nginx-src
RUN CONFARGS=$(nginx -V 2>&1 | grep "configure arguments" | cut -d ":" -f 2-) && sh -c "./configure $CONFARGS --with-http_grpc_module" && make && make install

FROM nginx:1.29-alpine
COPY --from=builder /usr/sbin/nginx /usr/sbin/nginx
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
