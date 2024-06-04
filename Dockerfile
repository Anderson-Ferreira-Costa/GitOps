# Use a multi-stage build to create a minimal image
FROM golang:1.17-alpine AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o server main.go

FROM scratch
COPY --from=builder /app/server /server
EXPOSE 8080
CMD ["/server"]

