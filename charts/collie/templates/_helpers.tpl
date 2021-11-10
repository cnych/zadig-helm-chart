{{/*
Expand the name of the chart.
*/}}
{{- define "collie.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "collie.fullname" -}}
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
{{- define "collie.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "collie.serviceAccountName" -}}
sa-{{ .Release.Name }}
{{- end }}

{{/*
=====================================================
=                   CFAPI SETTINGS                  =
=====================================================
*/}}
{{- define "zadig.microservice.collie.cfapi.port" -}}
28010
{{- end }}

{{- define "zadig.microservice.collie.cfapi.labels" -}}
app.kubernetes.io/component: cfapi
{{ include "zadig.labels" . }}
{{- end }}

{{- define "zadig.microservice.collie.cfapi.selectorLabels" -}}
app.kubernetes.io/component: cfapi
{{ include "zadig.selectorLabels" . }}
{{- end }}

{{/*
=====================================================
=                  LOGMON SETTINGS                  =
=====================================================
*/}}
{{- define "zadig.microservice.collie.logmon.port" -}}
28088
{{- end }}

{{- define "zadig.microservice.collie.logmon.labels" -}}
app.kubernetes.io/component: logmon
{{ include "zadig.labels" . }}
{{- end }}

{{- define "zadig.microservice.collie.logmon.selectorLabels" -}}
app.kubernetes.io/component: logmon
{{ include "zadig.selectorLabels" . }}
{{- end }}

{{/*
=====================================================
=                   NSQD SETTINGS                   =
=====================================================
*/}}
{{- define "zadig.microservice.collie.nsqd.labels" -}}
app.kubernetes.io/component: nsqd
{{ include "zadig.labels" . }}
{{- end }}

{{- define "zadig.microservice.collie.nsqd.selectorLabels" -}}
app.kubernetes.io/component: nsqd
{{ include "zadig.selectorLabels" . }}
{{- end }}

{{/*
=====================================================
=                  SERVER SETTINGS                  =
=====================================================
*/}}
{{- define "zadig.microservice.collie.server.port" -}}
28080
{{- end }}

{{- define "zadig.microservice.collie.server.labels" -}}
app.kubernetes.io/component: server
{{ include "zadig.labels" . }}
{{- end }}

{{- define "zadig.microservice.collie.server.selectorLabels" -}}
app.kubernetes.io/component: server
{{ include "zadig.selectorLabels" . }}
{{- end }}
