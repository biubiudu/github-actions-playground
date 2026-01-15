FROM golang:1.21-alpine AS builder
WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o hello-world main.go

FROM alpine:latest
WORKDIR /root/

COPY --from=builder /app/hello-world .

CMD ["./hello-world"]