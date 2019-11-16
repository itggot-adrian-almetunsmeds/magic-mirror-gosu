# frozen_string_literal: true

require 'httparty'
require_relative 'web_handler.rb'

class Translation
  def initialize(language, server_url)
    # TODO [$5dd08c3f9396ae000c795554]: Make it use the avaliable translation when it is
    # unable to fetch one from the back end
    response = WebHandler.request("http://#{server_url}/api/"\
        "translations/#{language}")
    File.open('translations.json', 'w') { |file| file.write(response.body) }
  end
end
