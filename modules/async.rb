# frozen_string_literal: true

require_relative 'weather'

# Handles async calling
class Async
  # Makes async operation possible
  #
  # object - Object (Object to call method on)
  # method - String (Name of method to be called)
  #
  # Returns nothing
  #
  def self.quue(object, method, cookie)
    object.send(method, time, cookie)
  end
end
