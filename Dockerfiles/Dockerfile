FROM klakegg/hugo:0.81.0-onbuild AS hugo
ENV HUGO_CMD=--minify
ENV HUGO_ENV_ARG=production
ENV HUGO_ENV=production
FROM nginx:latest
COPY --from=hugo /target /var/www/blog.yungen.studio/public
COPY ./Dockerfiles/. /etc/nginx/