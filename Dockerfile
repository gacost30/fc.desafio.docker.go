FROM golang:alpine AS build

WORKDIR /app
COPY . .

RUN CGO_ENABLE=0 go build -o hello hello.go

FROM scratch
WORKDIR /app
COPY --from=build /app/hello .

CMD ["./hello"]
