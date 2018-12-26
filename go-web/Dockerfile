FROM golang:alpine AS build-env
ADD . /work
WORKDIR /work
RUN go build -o hello main.go

FROM alpine
COPY --from=build-env /work/hello /usr/local/bin/hello
#ENTRYPOINT ["/usr/local/bin/hello"]
CMD /usr/local/bin/hello

EXPOSE 8080:8080
