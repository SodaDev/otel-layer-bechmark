RESULTS_DIR_NAME=results/$(date -Iminutes)
mkdir -p $RESULTS_DIR_NAME
K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=./$RESULTS_DIR_NAME/nootel-html-report.html k6 run ./nootel-script.js
K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=./$RESULTS_DIR_NAME/otel-html-report.html k6 run ./otel-script.js
K6_WEB_DASHBOARD=true K6_WEB_DASHBOARD_EXPORT=./$RESULTS_DIR_NAME/decoupled-html-report.html k6 run ./decoupled-script.js