class DemoWorkerHigh < DemoWorkerBase
  sidekiq_options queue: 'high_priority'

  def perform
    super
    DemoWorkerHigh.perform_async
  end
end