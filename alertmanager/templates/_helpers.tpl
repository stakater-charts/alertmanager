{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "alertmanager.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "alertmanager.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "alertmanager.labels.selector" -}}
app: {{ template "alertmanager.name" . }}
{{ template "alertmanager.labels.groupAndProvider" . }}
{{- end -}}

{{- define "alertmanager.labels.stakater" -}}
{{ template "alertmanager.labels.selector" . }}
version: "{{ .Values.alertmanager.labels.version }}"
{{- end -}}

{{- define "alertmanager.labels.groupAndProvider" -}}
group: {{ .Values.alertmanager.labels.group }}
provider: {{ .Values.alertmanager.labels.provider }}
{{- end -}}

{{- define "alertmanager.labels.chart" -}}
chart: "{{ .Chart.Name }}-{{ .Chart.Version }}"
release: {{ .Release.Name | quote }}
heritage: {{ .Release.Service | quote }}
{{- end -}}
