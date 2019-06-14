# build

FROM golang:1.12.5-alpine as build-step
RUN apk add --update --no-cache ca-certificates git

WORKDIR /go/src/iscogram
ENV GO111MODULE=on

COPY setup.sh .

RUN sh setup.sh
COPY . .

RUN CGO_ENABLED=0 go build -o /go/bin/iscogram app.go

# run

FROM alpine:3.9

RUN apk add --update --no-cache openssl tar
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY --from=build-step /go/bin/iscogram ./iscogram
COPY ./templates ./templates
COPY ./public ./public

EXPOSE 8000

ENTRYPOINT [ "iscogram" ]
