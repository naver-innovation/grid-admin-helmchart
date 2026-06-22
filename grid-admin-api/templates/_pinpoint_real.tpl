{{/* vim: set filetype=mustache: */}}
{{- define "pinpoint.custom.config.real" -}}
profiler.sampling.rate={{ .Values.spring.pinpointSampleRate }}
profiler.applicationservertype=SPRING_BOOT
profiler.tomcat.excludeurl=/monitor/l7check.html, /actuator/*, /metrics
profiler.spring.webflux.client.param=true
profiler.spring.webflux.client.cookie.sampling.rate=20
profiler.log4j.logging.transactioninfo=false
profiler.kafka.producer.enable=true
profiler.kafka.consumer.enable=true
profiler.springkafka.consumer.enable=true
profiler.kafka.consumer.entryPoint=
profiler.ignore-error-handler.excludePinpointFailure.class-name=com.navercorp.example.ExcludePinpointFailure
profiler.ignore-error-handler.excludePinpointFailure.exception-message@contains=
profiler.sql.error.enable=false
profiler.transport.grpc.collector.ip=pinpoint-collector-prod.naver-innovation.net
profiler.micrometer.otlp.url=http://pinpoint-collector-prod.naver-innovation.net:15200/opentelemetry

###########################################################
# URI Stat
###########################################################
profiler.uri.stat.enable=true
profiler.uri.stat.spring.webmvc.enable=true
profiler.uri.stat.spring.webmvc.useuserinput=false
profiler.uri.stat.spring.webflux.enable=true
profiler.uri.stat.spring.webflux.useuserinput=false
profiler.uri.stat.vertx.enable=false
profiler.uri.stat.vertx.useuserinput=false
{{- end -}}
