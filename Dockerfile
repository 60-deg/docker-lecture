FROM golang:1.12.5-alpine
RUN apk add --update --no-cache ca-certificates git

WORKDIR /work
COPY . .

RUN go build -o app
ENTRYPOINT [ "app" ]