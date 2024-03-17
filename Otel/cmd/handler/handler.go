package handler

import (
	"context"
	"github.com/Ryanair/gofrlib/log"
)

type LambdaHandler struct {
	loggerConfig log.Configuration
}

func New(loggerConfig log.Configuration) *LambdaHandler {
	return &LambdaHandler{loggerConfig: loggerConfig}
}

func (lh *LambdaHandler) Handle(ctx context.Context) (map[string]string, error) {
	log.Init(lh.loggerConfig)

	return map[string]string{
		"mode": "otel",
	}, nil
}
