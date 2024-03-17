build: test
	sam build -b deployments/

test:
	mkdir -p testResults
	if go test ./... -json -cover -coverprofile coverage.out > testResults.json; then \
  		go tool cover -html coverage.out -o testResults/coverage.html; \
		cat testResults.json | go-test-report -o testResults/test_report.html; \
	else \
	   	echo 'Application tests failed. open test_report.html for details'; \
	   	go tool cover -html coverage.out -o testResults/coverage.html; \
		cat testResults.json | go-test-report -o testResults/test_report.html; \
		exit 1 ;\
	fi

deploy:
	sam deploy \
		--template-file deployments/template.yaml \
	    --stack-name otel-layer-performance \
	    --s3-bucket $(shell aws ssm get-parameter --name sam-bucket-name --query "Parameter.Value" --output text) \
	    --s3-prefix=otel-layer-bechmark \
	    --no-confirm-changeset --no-fail-on-empty-changeset \
		--tags Project=OTEL-LAYER-BECHMARK \
		--parameter-overrides \
			Environment="DEV" \
            LogLevel="INFO" \
		--capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND

deploy_local: build
	make deploy s3Bucket=coreapi-jenkins-cloudformation-package vpc=SANDBOX env=DEV version=localTest

build-NoOtelFunction:
	go mod tidy
	GOOS=linux GOARCH=arm64 go build -o bootstrap NoOtel/cmd/main.go
	cp bootstrap $(ARTIFACTS_DIR)/bootstrap

build-OtelFunction:
	go mod tidy
	GOOS=linux GOARCH=arm64 go build -o bootstrap Otel/cmd/main.go
	cp bootstrap $(ARTIFACTS_DIR)/bootstrap
