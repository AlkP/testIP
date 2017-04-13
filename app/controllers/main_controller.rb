class MainController < ApplicationController

  def ping
    Resque.enqueue(Runner)
  end

  def filter
  end

  def data_request

  end

end
