FROM python:3.10.11-alpine3.18

WORKDIR /app

COPY . .
RUN pip install -r requirements.txt

ENV PORT=3000 INSTANCE_NAME=do-bear INSTANCE_HASH=HASHER GIN_MODE=release

EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 CMD curl -f http://localhost:${PORT}/healthz || exit 1

ENTRYPOINT [ "python", "main.py" ]