class DemoWorkerLow < DemoWorkerBase
  sidekiq_options queue: 'low_priority'

  def perform
    super
    DemoWorkerLow.perform_async
  end
end