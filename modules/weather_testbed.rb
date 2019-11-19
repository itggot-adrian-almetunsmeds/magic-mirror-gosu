require 'json'


class Qweqxe
    
    def initialize
        
        # get data
        rawdata = File.readlines('modules/weather.txt').first
        @data = JSON.parse(rawdata)

        p @data[0]

    end

    def current_temp?

        @data[0]["temp"]
        
    end

    def self.current_wind_speed?

        @data[0]["wind_speed"]

    end

    def self.current_humidity?

        @data[0]["humidity"]

    end

    def self.current_thunder_chance?

        @data[0]["thunder"]

    end

    def self.current_max_gust_speed?

        @data[0]["wind_gust"]

    end

    def self.current_symbol?

        @data[0]["symbol"]

    end

end