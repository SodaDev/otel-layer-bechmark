package main

import (
	"github.com/Ryanair/gofrlib/frotel"
	"otel-layer-bechmark/OtelDecoupled/cmd/handler"
	"otel-layer-bechmark/OtelDecoupled/cmd/internal"
)

var (
	provider     = internal.NewProvider()
	loggerConfig = provider.ProvideLoggerConfig()
)

func main() {
	lambdaHandler := handler.New(loggerConfig)
	frotel.Start(lambdaHandler.Handle)
}
