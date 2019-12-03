require 'wisper'

class Broadcaster

    include Wisper::Publisher

    def new_weather?(message)

        puts "hello"
        broadcast(:new_weather, message)

    end

end

class Subscriber

    def new_weather(message)

        puts "bye"

    end

end