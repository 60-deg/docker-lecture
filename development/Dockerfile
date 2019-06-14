FROM golang:1.12.5-alpine as build-step
RUN apk add --update --no-cache ca-certificates git

WORKDIR /go/src/lecture-app
ENV GO111MODULE=on
RUN go get -u github.com/pilu/fresh

COPY go.mod .
COPY go.sum .

RUN go mod download
COPY . .

COPY development/fresh.conf ./

ENTRYPOINT [ "fresh" ]
