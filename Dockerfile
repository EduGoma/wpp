FROM debian:11.6-slim AS builder
WORKDIR /opt/wpp
COPY . .
RUN apt-get update \
    && apt-get install -y build-essential \
    && make \
    && apt-get purge -y build-essential \
    && apt-get -y autoremove \
    && apt-get clean 

FROM debian:11.6-slim AS runtime
CMD ["./demo"]
EXPOSE 5000
WORKDIR /opt/wpp
COPY --from=builder /opt/wpp/demo .

