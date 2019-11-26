# frozen_string_literal: true

require 'json'

# Handles timeComponent
class TimeComponent
  attr_reader :time, :date

  # Initializes a new TimeComponent
  def initialize
    @translations = JSON.parse(File.read('translations.json'))['time']
    data = Time.now.to_s[0..9].split('-')
    @time = Time.now.to_s[11..-7]
    @date = [data[0], month(data[1].to_i), data[2]]
  end

  # Returns the current month based on value
  #
  # value - Integer (number of month)
  #
  # Returns a string containing a month
  def month(value)
    case value
    when 1
      @translations['jan']
    when 2
      @translations['feb']
    when 3
      @translations['mar']
    when 4
      @translations['apr']
    when 5
      @translations['may']
    when 6
      @translations['june']
    when 7
      @translations['july']
    when 8
      @translations['aug']
    when 9
      @translations['sep']
    when 10
      @translations['oct']
    when 11
      @translations['nov']
    when 12
      @translations['dec']
    end
  end
end
