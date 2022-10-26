# syntax=docker/dockerfile:1

FROM rust:1.64-alpine3.16 as builder
COPY . .
RUN apk add --no-cache musl-dev
RUN cargo install --path .

FROM alpine:latest
RUN apk add --no-cache bash
COPY --from=builder /usr/local/cargo/bin/hello-world /usr/local/bin/hello-world
CMD ["hello-world"]

