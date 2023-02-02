FROM debian
CMD ["./demo"]
EXPOSE 5000
WORKDIR /opt/wpp
RUN apt update
RUN apt install -y build-essential
COPY . .
RUN make

