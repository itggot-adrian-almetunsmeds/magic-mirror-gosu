# frozen_string_literal: true

require 'eventmachine'
require 'mechanize'
require 'sucker_punch'
require 'websocket-client-simple'
require 'faye/websocket'
require_relative 'async.rb'

# Hanldes all Websocket connections
class Websocket
  include SuckerPunch::Job
  def initialize; end

  # Tries to establish a ws connection
  #
  # cookie - String containing 'rack.session=xyz'
  def self.ws_establish
    ws = WebSocket::Client::Simple.connect 'ws://localhost:9292/socket'
    ws.on :open do |_|
      p '---------------'
      p 'connection open'
      p '---------------'
      token = File.read('token.txt')
      ws.send(token)
    end

    ws.on :message do |msg|
      data = JSON.parse(msg.data)
      if data['channel'] == 'weather'
        File.write('weather.txt', data['message'])
      end
    end

    ws.on :close do |_|
      p '-----------------'
      p 'connection closed'
      p '-----------------'
    end
  end
end
