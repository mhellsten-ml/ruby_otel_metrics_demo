# frozen_string_literal: true

Sidekiq.configure_server do |config|
  #Dotenv::Railtie.load
  Rails.logger.info "Using Redis at #{ENV['REDIS_SIDEKIQ_URL']}"

  config.redis = { url: ENV['REDIS_SIDEKIQ_URL'], id: nil }
  config.death_handlers << PrometheusExporter::Instrumentation::Sidekiq.death_handler
  config.server_middleware do |chain|
    chain.add PrometheusExporter::Instrumentation::Sidekiq
  end

  config.on :startup do
    PrometheusExporter::Instrumentation::Process.start type: 'sidekiq'
    PrometheusExporter::Instrumentation::SidekiqQueue.start
  end
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_SIDEKIQ_URL'], id: nil }
end

Rails.application.reloader.to_prepare do
  DemoWorkerLow.perform_async
  DemoWorkerHigh.perform_async
end