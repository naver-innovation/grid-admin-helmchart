{{/* vim: set filetype=mustache: */}}
{{- define "default.name" -}}
{{ .Values.ncc.instance | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
인스턴스 서비스 명
*/}}
{{- define "instance.service.name" -}}
  {{- if eq .Values.nameSuffix "real" -}}
{{ .Values.appName }}
  {{- else -}}
{{ .Values.appName }}-{{ .Values.nameSuffix }}
  {{- end -}}
{{- end -}}

{{/*
NCC Pipeline 관련 배포 정보.
Pipeline을 통해 관리되는 모든 리소스의 라벨에 포함해야 함.
*/}}
{{- define "ncc.labels" -}}
app.kubernetes.io/name: {{ .Values.ncc.application }}
app.kubernetes.io/instance: {{ .Values.ncc.instance }}
app.kubernetes.io/version: {{ .Values.ncc.version | quote }}
ncc.navercorp.com/installation: {{ .Values.ncc.installation | quote }}
{{- end -}}

{{/*
NCC Pipeline 관련 배포 정보를 사용하는 셀렉터.
*/}}
{{- define "ncc.selectors" -}}
app.kubernetes.io/name: {{ .Values.ncc.application }}
app.kubernetes.io/instance: {{ .Values.ncc.instance }}
ncc.navercorp.com/installation: {{ .Values.ncc.installation | quote }}
{{- end -}}

{{/*
배포 환경에 따른 Pinpoint Profiles
*/}}
{{- define "pinpoint.profiles" -}}
  {{- if .Values.forReal -}}
release
  {{- else -}}
local
  {{- end -}}
{{- end -}}

{{/*
배포 환경에 따른 pinpoint.custom.config
*/}}
{{- define "pinpoint.custom.config" -}}
  {{- if .Values.forReal -}}
{{ include "pinpoint.custom.config.real" . }}
  {{- else -}}
{{ include "pinpoint.custom.config.dev" . }}
  {{- end -}}
{{- end -}}
