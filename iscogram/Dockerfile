FROM golang:1.12.5-alpine as build-step
RUN apk add --update --no-cache ca-certificates git

WORKDIR /go/src/iscogram
ENV GO111MODULE=on

COPY setup.sh .

RUN sh setup.sh
COPY . .

RUN CGO_ENABLED=0 go build -o /go/bin/iscogram app.go

FROM scratch
COPY --from=build-step /go/bin/iscogram /go/bin/iscogram

ENTRYPOINT [ "/go/bin/iscogram" ]
