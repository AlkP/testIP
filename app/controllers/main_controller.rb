class MainController < ApplicationController

  def ping
    addresses = Address.only_working
    addresses.each do |address|
      Resque.enqueue(Pinger, address.id)
    end
  end

  def filter
  end

  def data_request

  end

end
