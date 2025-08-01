FROM alpine:latest

RUN apk add --no-cache curl unzip

RUN curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip \
    && unzip v2ray.zip -d /v2ray \
    && rm -f v2ray.zip

WORKDIR /v2ray

COPY config.json .

CMD ["./v2ray", "-config", "config.json"]
