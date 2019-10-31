FROM golang:1.13-alpine
RUN apk add git build-base
WORKDIR /go/src/github.com/myorg/myapp
COPY . .
RUN go get -d -v ./...
RUN go build -o myapp
EXPOSE 9005
ENTRYPOINT ./myapp