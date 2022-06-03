require 'prometheus_exporter/server'
require 'prometheus_exporter/client'
require 'prometheus_exporter/instrumentation'

port = 9292
server = PrometheusExporter::Server::WebServer.new bind: '0.0.0.0', port: port
server.start

PrometheusExporter::Client.default = PrometheusExporter::LocalClient.new(collector: server.collector)