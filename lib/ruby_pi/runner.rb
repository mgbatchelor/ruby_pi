class Runner

  def initialize(brain, scanner, processor)
    @brain = brain
    @scanner = scanner
    @processor = processor
    @window = 0
    @ips = 0
  end

  def run
    while(true) do
      now = Time.now
      @brain.ingest(@scanner.scan)
      @brain.state(now.to_f) do |state|
        @processor.process(state)
      end
      count_ips(now)
    end
  end

  def count_ips(now)
    if @window == now.to_i
      @ips += 1
    else
      puts "IPS: #{@ips}"
      @window = now.to_i
      @ips = 0
    end
  end
end
