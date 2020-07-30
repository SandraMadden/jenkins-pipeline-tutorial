FROM golang:alpine as builder

COPY . /code
WORKDIR /code

# Run unit tests
ENV CGO_ENABLED 0
RUN go test

# Build app
RUN go build -o sample-app

FROM alpine

COPY --from=builder /code/sample-app /sample-app
CMD /sample-app
