# frozen_string_literal: true

require 'httparty'

# Handles web based functionallity
class WebHandler
  def self.request(url)
    HTTParty.get(url)
  rescue StandardError
    raise "Failed to fetch translations. Unable to connect to #{url}"
  end
end
