FROM debian:bullseye-slim
CMD ["./demo"]
EXPOSE 5000
WORKDIR /opt/wpp
RUN apt-get update
RUN apt-get install -y build-essential
COPY . .
RUN make

