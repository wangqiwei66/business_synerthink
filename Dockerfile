FROM binartist/flutter-web-builder AS build

WORKDIR /app
COPY . /app

ARG TARGET

RUN flutter pub get
RUN flutter build web --release --web-renderer html


FROM alpine:3.18
WORKDIR /app
COPY --from=build /app/build/web .
RUN chmod a+r -R .
RUN mkdir /var/www

CMD cp -r . /var/www
