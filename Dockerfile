FROM golang:alpine AS go

COPY ./main.go /app/main.go
WORKDIR /app
RUN go build -o gcsproxy

FROM alpine:3.14

COPY --from=go /app/gcsproxy /usr/local/bin/gcsproxy
RUN chmod +x /usr/local/bin/gcsproxy
