FROM golang:1.13-alpine AS build-env
RUN apk add git build-base
WORKDIR /go/src/github.com/myorg/myapp
COPY . .
RUN go get -d -v ./...
RUN go build -o myapp

FROM alpine
WORKDIR /opt/myapp
COPY --from=build-env /go/src/github.com/myorg/myapp/myapp /opt/myapp/myapp
COPY ./static/dist ./static/dist
COPY ./templates ./templates
COPY ./config.json ./config.json
RUN sed -i 's/127.0.0.1/0.0.0.0/' ./config.json
EXPOSE 9005
ENTRYPOINT ./myapp