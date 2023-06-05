ARG A_VERSION=3.17
ARG G_VERSION=1.20-alpine3.17

FROM golang:${G_VERSION} AS builder

WORKDIR /app

COPY go.mod .
COPY go.sum .
COPY main.go .

RUN go build -o main .

FROM alpine:${A_VERSION} AS runner

WORKDIR /app

COPY --from=builder /app/main .
COPY public public
COPY templates templates

ENV PORT=3000 INSTANCE_NAME=do-bear INSTANCE_HASH=HASHER GIN_MODE=release

EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD curl -f http://localhost:${PORT}/healthz || exit 1

ENTRYPOINT [ "./main" ]