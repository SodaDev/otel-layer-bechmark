package handler

import (
	"context"
	"github.com/Ryanair/gofrlib/frotel"
	"github.com/Ryanair/gofrlib/log"
	"go.opentelemetry.io/otel/attribute"
)

type LambdaHandler struct {
	loggerConfig log.Configuration
}

func New(loggerConfig log.Configuration) *LambdaHandler {
	return &LambdaHandler{loggerConfig: loggerConfig}
}

func (lh *LambdaHandler) Handle(ctx context.Context) (map[string]string, error) {
	log.Init(lh.loggerConfig)
	frotel.AddToCurrentSpan(ctx, attribute.String("mode", "decoupled"))

	return map[string]string{
		"mode": "decoupled",
	}, nil
}
