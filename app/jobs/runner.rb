class Runner
  @queue = :run

  def self.perform
    addresses = Address.only_working
    addresses.each do |address|
      Resque.enqueue(Pinger, address.id)
    end
  end
end