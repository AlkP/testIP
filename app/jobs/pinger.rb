class Pinger
  @queue = :ping

  def self.perform(id)
    address = Address.find(id)
    test_in = Time.now
    @icmp = Net::Ping::External.new(address.ip)
    duration = @icmp.ping ? @icmp.duration : 0
    Tested.create(address: address, test_in: test_in, duration: duration)
  end
end