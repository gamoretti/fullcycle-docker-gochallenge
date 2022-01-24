FROM golang:latest AS builder

WORKDIR /go
COPY ./go/src ./src
RUN go build -o ./bin ./src/main.go

FROM scratch
WORKDIR /app
COPY --from=builder /go/bin/ .
CMD ["./main"]