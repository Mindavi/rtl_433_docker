from alpine:3.9 as builder
RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --no-cache build-base cmake git librtlsdr-dev
RUN git clone https://github.com/merbanan/rtl_433.git
WORKDIR /rtl_433
RUN mkdir build
WORKDIR /rtl_433/build
RUN cmake ..
RUN make -j

from alpine:3.9
RUN apk add --no-cache librtlsdr --repository http://nl.alpinelinux.org/alpine/edge/testing
COPY --from=builder /rtl_433/build/src/rtl_433 /usr/bin/rtl_433
ENTRYPOINT ["/usr/bin/rtl_433"]
