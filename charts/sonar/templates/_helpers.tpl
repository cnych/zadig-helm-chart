{{/*
Expand the name of the chart.
*/}}
{{- define "sonar.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sonar.fullname" -}}
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
{{- define "sonar.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sonar.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sonar.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
=====================================================
=                   MYSQL SETTINGS                  =
=====================================================
*/}}
{{- define "zadig.microservice.sonar.mysql.labels" -}}
app.kubernetes.io/component: sonar-mysql
{{ include "zadig.labels" . }}
{{- end }}

{{- define "zadig.microservice.sonar.mysql.selectorLabels" -}}
app.kubernetes.io/component: sonar-mysql
{{ include "zadig.selectorLabels" . }}
{{- end }}

{{/*
=====================================================
=                 SONARQUBE SETTINGS                =
=====================================================
*/}}
{{- define "zadig.microservice.sonar.qube.labels" -}}
app.kubernetes.io/component: sonarqube
{{ include "zadig.labels" . }}
{{- end }}

{{- define "zadig.microservice.sonar.qube.selectorLabels" -}}
app.kubernetes.io/component: sonarqube
{{ include "zadig.selectorLabels" . }}
{{- end }}
