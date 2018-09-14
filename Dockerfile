FROM golang:1.10.2-alpine3.7 AS builder
WORKDIR $GOPATH/src/github.com/hellofresh/wine-order-service
COPY . .
RUN apk add --update make git
RUN make deps && make build

FROM alpine:3.7
RUN addgroup -S hellofresh && adduser -S -G hellofresh hellofresh
USER hellofresh
EXPOSE 8000
COPY --from=builder /go/src/github.com/hellofresh/wine-order-service/out/wine-order-service /
CMD ["./wine-order-service"]
