FROM klakegg/hugo:0.81.0-onbuild AS hugo
FROM nginx:latest
COPY --from=hugo /target /var/www/blog.yungen.studio/public
RUN  rm /etc/nginx/conf.d/*.conf
COPY ./Dockerfiles/nginx.conf /etc/nginx/conf.d/
COPY ./Dockerfiles/. /etc/nginx/