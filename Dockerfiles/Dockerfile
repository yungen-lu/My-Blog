FROM klakegg/hugo:0.81.0-onbuild AS hugo
FROM nginx:latest
COPY --from=hugo /target /var/www/blog.yungen.studio/public
COPY ./Dockerfiles/. /etc/nginx/