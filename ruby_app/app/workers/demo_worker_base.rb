class DemoWorkerBase
  include Sidekiq::Worker

  def initialize
    @random = Random.new
  end

  def perform
    sleep @random.rand(10)
  end
end