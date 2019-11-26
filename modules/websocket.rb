# # frozen_string_literal: true

# # Faye::WebSocket.new

# # ws.on(:open/:close/:message)

# # kolla :channel

# # läs dat i array med nyckeln :message

require 'eventmachine'
require 'mechanize'
require 'sucker_punch'
require 'websocket-client-simple'
require 'faye/websocket'
require_relative 'async.rb'

# Hanldes all Websocket connections
class Websocket
  include SuckerPunch::Job
  # Tries to establish a ws connection
  #
  # cookie - String containing 'rack.session=xyz'
  def ws_establish()
    ws = WebSocket::Client::Simple.connect 'ws://localhost:9292/socket'
    ws.on :open do |_event|
      p '-----------------------------'
      p 'connection open'
      p '-----------------------------'
      token = File.read('token.txt')
      ws.send(token)
    end

#     ws.on :message do |msg|
#       p msg
#     end

#     ws.on :close do |_event|
#       p '-----------------------------'
#       p 'connection closed'
#       p '-----------------------------'
#     end
#   end

#   def perform
#     # Uses Mechanize gem to simulate a browser
#     a = Mechanize.new do |agent|
#       agent.user_agent_alias = 'Mac Safari'
#     end


ws_establish()
