# frozen_string_literal: true

# Faye::WebSocket.new

# ws.on(:open/:close/:message)

# kolla :channel

# läs dat i array med nyckeln :message

require 'faye'
require 'faye/websocket'
require 'eventmachine'
require 'mechanize'

# Tries to establish a ws connection
#
# cookie - String containing 'rack.session=xyz'
def ws_establish(cookie)
  EM.run do
    hedaders = { headers: { 'Cookie' => cookie } }
    p hedaders
    p '_______________-'
    # Refer to this https://www.rubydoc.info/github/faye/faye-websocket-ruby/file/README.md
    # for setting up this
    # TODO: FIXME: THIS IS NOT DONE YET.
    ws = Faye::WebSocket::Client.new('ws://localhost:9292/', nil, hedaders)

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
end

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
  ws_establish(cookie.split(';').first)
end
