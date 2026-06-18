{{/* vim: set filetype=mustache: */}}
{{- define "default.name" -}}
{{ .Values.ncc.instance | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "instance.service.name" -}}
  {{- if eq .Values.nameSuffix "real" -}}
{{ .Values.appName }}
  {{- else -}}
{{ .Values.appName }}-{{ .Values.nameSuffix }}
  {{- end -}}
{{- end -}}

{{- define "ncc.labels" -}}
app.kubernetes.io/name: {{ .Values.ncc.application }}
app.kubernetes.io/instance: {{ .Values.ncc.instance }}
app.kubernetes.io/version: {{ .Values.ncc.version | quote }}
ncc.navercorp.com/installation: {{ .Values.ncc.installation | quote }}
{{- end -}}

{{- define "ncc.selectors" -}}
app.kubernetes.io/name: {{ .Values.ncc.application }}
app.kubernetes.io/instance: {{ .Values.ncc.instance }}
ncc.navercorp.com/installation: {{ .Values.ncc.installation | quote }}
{{- end -}}

{{- define "pinpoint.profiles" -}}
  {{- if .Values.forReal -}}
release
  {{- else -}}
local
  {{- end -}}
{{- end -}}

{{- define "pinpoint.custom.config" -}}
  {{- if .Values.forReal -}}
{{ include "pinpoint.custom.config.real" . }}
  {{- else -}}
{{ include "pinpoint.custom.config.dev" . }}
  {{- end -}}
{{- end -}}
