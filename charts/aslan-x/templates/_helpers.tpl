{{/*
Expand the name of the chart.
*/}}
{{- define "aslan-x.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "aslan-x.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "aslan-x.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "zadig.microservice.aslan-x.labels" -}}
app.kubernetes.io/component: aslanx
{{ include "zadig.labels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "zadig.microservice.aslan-x.selectorLabels" -}}
app.kubernetes.io/component: aslanx
{{ include "zadig.selectorLabels" . }}
{{- end }}

{{- define "zadig.microservice.aslan-x.port" -}}
25002
{{- end }}
