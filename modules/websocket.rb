# frozen_string_literal: true

# Faye::WebSocket.new

# ws.on(:open/:close/:message)

# kolla :channel

# läs dat i array med nyckeln :message

require 'eventmachine'
require 'mechanize'
require 'sucker_punch'
require 'websocket-client-simple'
require_relative 'async.rb'

# Hanldes all Websocket connections
class Websocket
  include SuckerPunch::Job
  # Tries to establish a ws connection
  #
  # cookie - String containing 'rack.session=xyz'
  def ws_establish(cookie)
    hedaders = { cookie: cookie }
    p '_______________-'
    p hedaders[:cookie]
    p '_______________-'

    # TODO [$5dd08c3f9396ae000c795555]: Websocket connection is not recognised
    #
    # After a connection has been made as indicated here
    # the Backend Server have not identified there being a connection
    # causing no data to be transmitted back to ``` ws.on :message ```
    ws = WebSocket::Client::Simple.connect 'ws://localhost:9292/', options = { headers: hedaders }
    ws.on :open do |_event|
      p '-----------------------------'
      p 'connection open'
      p '-----------------------------'
    end

    ws.on :message do |msg|
      p msg
    end

    ws.on :close do |_event|
      p '-----------------------------'
      p 'connection closed'
      p '-----------------------------'
    end
  end

  def perform
    # Uses Mechanize gem to simulate a browser
    a = Mechanize.new do |agent|
      agent.user_agent_alias = 'Mac Safari'
    end

    # Connects to the server and signs in using the given credentials
    # Then retrives the rack cookie for authentication in ws handshake
    a.get('http://localhost:9292/login') do |page|
      res = page.form_with(action: '/login') do |login|
        login.name = 'admin'
        login.password = 'admin'
      end.submit
      cookie = page.header['set-cookie']
      # Async.quue(Weather, ws_establish, cookie.split(';').first)
      ws_establish(cookie.split(';').first)
    end
  end
end
