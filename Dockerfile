FROM golang:alpine AS go

COPY ./main.go /app/main.go
COPY ./go.mod /app/go.mod
COPY ./go.sum /app/go.sum
WORKDIR /app
RUN go build -o gcsproxy

FROM alpine:3.14

COPY --from=go /app/gcsproxy /usr/local/bin/gcsproxy
RUN chmod +x /usr/local/bin/gcsproxy
