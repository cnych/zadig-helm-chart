{{/*
Expand the name of the chart.
*/}}
{{- define "clair.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "clair.fullname" -}}
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
{{- define "clair.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "clair.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "clair.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
=====================================================
=            CLAIR MICROSERVICE SETTINGS            =
=====================================================
*/}}
{{- define "zadig.microservice.clair.server.port" -}}
6060
{{- end }}

{{- define "zadig.microservice.clair.server.healthPort" -}}
6061
{{- end }}

{{- define "zadig.microservice.clair.client.port" -}}
34002
{{- end }}

{{- define "zadig.microservice.clair.labels" -}}
app.kubernetes.io/component: clair
{{ include "zadig.labels" . }}
{{- end }}

{{- define "zadig.microservice.clair.selectorLabels" -}}
app.kubernetes.io/component: clair
{{ include "zadig.selectorLabels" . }}
{{- end }}

{{/*
=====================================================
=                 POSTGRES SETTINGS                 =
=====================================================
*/}}
{{- define "zadig.db.postgres.port" -}}
5432
{{- end }}

{{- define "zadig.db.postgres.labels" -}}
app.kubernetes.io/component: postgres
{{ include "zadig.labels" . }}
{{- end }}

{{- define "zadig.db.postgres.selectorLabels" -}}
app.kubernetes.io/component: postgres
{{ include "zadig.selectorLabels" . }}
{{- end }}
