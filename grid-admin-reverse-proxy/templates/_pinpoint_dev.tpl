{{/* vim: set filetype=mustache: */}}
{{- define "pinpoint.custom.config.dev" -}}
profiler.sampling.rate={{ .Values.spring.pinpointSampleRate }}
profiler.applicationservertype=SPRING_BOOT
profiler.tomcat.excludeurl=/monitor/l7check.html, /actuator/*, /metrics
profiler.ignore-error-handler.excludePinpointFailure.class-name=com.navercorp.example.ExcludePinpointFailure
profiler.ignore-error-handler.excludePinpointFailure.exception-message@contains=
profiler.sql.error.enable=false
profiler.transport.grpc.collector.ip=pinpoint-collector-dev.naver-innovation.net
profiler.micrometer.otlp.url=http://pinpoint-collector-dev.naver-innovation.net:15200/opentelemetry
{{- end -}}
