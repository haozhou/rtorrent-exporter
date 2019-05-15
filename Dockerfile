FROM golang:latest as builder
WORKDIR /tmp/
RUN git clone https://github.com/mdlayher/rtorrent_exporter.git
WORKDIR /tmp/rtorrent_exporter/cmd/rtorrent_exporter
RUN go get -d .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -a -installsuffix cgo .
RUN apt-get update && apt-get install -y upx-ucl
RUN upx -9 rtorrent_exporter

FROM gcr.io/distroless/static
LABEL maintainer="Henry Zhou <henryzhou2008@gmail.com>"
COPY --from=builder /tmp/rtorrent_exporter/cmd/rtorrent_exporter/rtorrent_exporter /

ENTRYPOINT ["/rtorrent_exporter"]
EXPOSE 9135/tcp
