FROM golang:1.12.5-alpine as build-step
RUN apk add --update --no-cache ca-certificates git

WORKDIR /go-app
COPY go.mod .
COPY go.sum .

RUN go mod download
COPY . .

RUN go build -o /go/bin/go-app

FROM scratch
COPY --from=build-step /go/bin/go-app /go/bin/go-app

ENTRYPOINT [ "/go/bin/go-app" ]