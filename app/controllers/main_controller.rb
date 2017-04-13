class MainController < ApplicationController

  def ping
    Resque.enqueue(Runner)
  end

  def filter
  end

  def data_request
    address = Address.where("ip = ?", params[:request][:ip])
    testeds_withnull = Tested.where(address: address)
                        .where("test_in > ?", params[:request][:from])
                        .where("test_in < ?", params[:request][:to])
    counts_withnull = testeds_withnull.count
    testeds = testeds_withnull.where("duration > 0").order(:duration)
    min = testeds.minimum(:duration)
    max = testeds.maximum(:duration)
    average = testeds.average(:duration)
    testeds_duration = testeds.map(&:duration)
    counts = testeds.count
    sigma = Math.sqrt(average)
    lost = 100 - ((counts * 100) / counts_withnull)
    if counts.even?
      median = (testeds_duration[counts/2 - 1] + testeds_duration[counts/2])/2
    else
      median = testeds_duration[(counts - 1) / 2]
    end

    @data_request = {min: min, max: max, average: average, median: median, sigma: sigma, lost: lost}

  end

  private

  def sigma

  end

end
