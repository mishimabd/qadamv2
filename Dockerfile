FROM golang:latest
WORKDIR /build
COPY ././
RUN go build -o main.go
CMD ["./main"]