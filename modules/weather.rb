# Faye::WebSocket.new

# ws.on(:open/:close/:message)

# kolla :channel

# läs dat i array med nyckeln :message

require 'faye'
require 'faye/websocket'
require 'eventmachine'

ws = Faye::WebSocket::Client.new('ws://localhost:9292/')

p '-----------------------------'
p 'Websocket'
p ws
p '-----------------------------'

if ws
    ws.on(:open) do |event|

        p '-----------------------------'
        p"connection open"
        p '-----------------------------'

    end

    ws.on(:close) do |event|
        
        p '-----------------------------'
        p "connection closed"
        p '-----------------------------'

    end
end
# EM.run {



# }