# frozen_string_literal: true

# Handles everything related to the weather component
# class Weather
# end

# frozen_string_literal: true

require 'json'

class Weather # rubocop:disable Style/Documentation
  def initialize
    # get data
    # rawdata = File.readlines('modules/weather.txt').first
    message = File.read('modules/weather.txt')
    @data = JSON.parse(message)

    # p @data[0]
  end

  def temp?(time)
    @data[time]['temp'].gsub(' Cel', '')
  end

  def wind_speed?(time)
    @data[time]['wind_speed']
  end

  def humidity?(time)
    @data[time]['humidity']
  end

  def thunder_chance?(time)
    @data[time]['thunder']
  end

  def max_gust_speed?(time)
    @data[time]['wind_gust']
  end

  def symbol?(time)
    @data[time]['symbol']
  end
end
