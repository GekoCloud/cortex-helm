{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "cortex.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create unified labels for cortex components
*/}}
{{- define "cortex.common.matchLabels" -}}
app: {{ template "cortex.name" . }}
release: {{ .Release.Name }}
{{- end -}}

{{- define "cortex.common.metaLabels" -}}
chart: {{ .Chart.Name }}-{{ .Chart.Version }}
heritage: {{ .Release.Service }}
{{- end -}}

{{- define "cortex.alertmanager.labels" -}}
{{ include "cortex.alertmanager.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.alertmanager.matchLabels" -}}
component: {{ .Values.alertmanager.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.configs.labels" -}}
{{ include "cortex.configs.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.configs.matchLabels" -}}
component: {{ .Values.configs.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.configsDb.labels" -}}
{{ include "cortex.configsDb.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.configsDb.matchLabels" -}}
component: {{ .Values.configsDb.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.consul.labels" -}}
{{ include "cortex.consul.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.consul.matchLabels" -}}
component: {{ .Values.consul.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.distributor.labels" -}}
{{ include "cortex.distributor.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.distributor.matchLabels" -}}
component: {{ .Values.distributor.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.dynamodb.labels" -}}
{{ include "cortex.dynamodb.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.dynamodb.matchLabels" -}}
component: {{ .Values.dynamodb.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.ingester.labels" -}}
{{ include "cortex.ingester.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.ingester.matchLabels" -}}
component: {{ .Values.ingester.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.memcached.labels" -}}
{{ include "cortex.memcached.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.memcached.matchLabels" -}}
component: {{ .Values.memcached.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.nginx.labels" -}}
{{ include "cortex.nginx.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.nginx.matchLabels" -}}
component: {{ .Values.nginx.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.querier.labels" -}}
{{ include "cortex.querier.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.querier.matchLabels" -}}
component: {{ .Values.querier.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.queryFrontend.labels" -}}
{{ include "cortex.queryFrontend.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.queryFrontend.matchLabels" -}}
component: {{ .Values.queryFrontend.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.retrieval.labels" -}}
{{ include "cortex.retrieval.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.retrieval.matchLabels" -}}
component: {{ .Values.retrieval.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.ruler.labels" -}}
{{ include "cortex.ruler.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.ruler.matchLabels" -}}
component: {{ .Values.ruler.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.s3.labels" -}}
{{ include "cortex.s3.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.s3.matchLabels" -}}
component: {{ .Values.s3.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{- define "cortex.tableManager.labels" -}}
{{ include "cortex.tableManager.matchLabels" . }}
{{ include "cortex.common.metaLabels" . }}
{{- end -}}

{{- define "cortex.tableManager.matchLabels" -}}
component: {{ .Values.tableManager.name | quote }}
{{ include "cortex.common.matchLabels" . }}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified alertmanager name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.alertmanager.fullname" -}}
{{- if .Values.alertmanager.fullnameOverride -}}
{{- .Values.alertmanager.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.alertmanager.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.alertmanager.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified configs name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.configs.fullname" -}}
{{- if .Values.configs.fullnameOverride -}}
{{- .Values.configs.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.configs.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.configs.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified configs-db name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.configsDb.fullname" -}}
{{- if .Values.configsDb.fullnameOverride -}}
{{- .Values.configsDb.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.configsDb.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.configsDb.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified consul name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.consul.fullname" -}}
{{- if .Values.consul.fullnameOverride -}}
{{- .Values.consul.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.consul.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.consul.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified distributor name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.distributor.fullname" -}}
{{- if .Values.distributor.fullnameOverride -}}
{{- .Values.distributor.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.distributor.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.distributor.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified dynamodb name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.dynamodb.fullname" -}}
{{- if .Values.dynamodb.fullnameOverride -}}
{{- .Values.dynamodb.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.dynamodb.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.dynamodb.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified ingester name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.ingester.fullname" -}}
{{- if .Values.ingester.fullnameOverride -}}
{{- .Values.ingester.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.ingester.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.ingester.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified memcached name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.memcached.fullname" -}}
{{- if .Values.memcached.fullnameOverride -}}
{{- .Values.memcached.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.memcached.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.memcached.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified nginx name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.nginx.fullname" -}}
{{- if .Values.nginx.fullnameOverride -}}
{{- .Values.nginx.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.nginx.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.nginx.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified querier name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.querier.fullname" -}}
{{- if .Values.querier.fullnameOverride -}}
{{- .Values.querier.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.querier.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.querier.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified query-frontend name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.queryFrontend.fullname" -}}
{{- if .Values.queryFrontend.fullnameOverride -}}
{{- .Values.queryFrontend.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.queryFrontend.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.queryFrontend.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified retrieval name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.retrieval.fullname" -}}
{{- if .Values.retrieval.fullnameOverride -}}
{{- .Values.retrieval.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.retrieval.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.retrieval.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified ruler name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.ruler.fullname" -}}
{{- if .Values.ruler.fullnameOverride -}}
{{- .Values.ruler.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.ruler.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.ruler.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified s3 name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.s3.fullname" -}}
{{- if .Values.s3.fullnameOverride -}}
{{- .Values.s3.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.s3.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.s3.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified table-manager name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "cortex.tableManager.fullname" -}}
{{- if .Values.tableManager.fullnameOverride -}}
{{- .Values.tableManager.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.tableManager.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.tableManager.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}
