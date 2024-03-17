package main

import (
	"github.com/aws/aws-lambda-go/lambda"
	"otel-layer-bechmark/NoOtel/cmd/handler"
	"otel-layer-bechmark/NoOtel/cmd/internal"
)

var (
	provider     = internal.NewProvider()
	loggerConfig = provider.ProvideLoggerConfig()
)

func main() {
	lambdaHandler := handler.New(loggerConfig)
	lambda.Start(lambdaHandler.Handle)
}
