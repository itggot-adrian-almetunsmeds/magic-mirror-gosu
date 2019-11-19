require 'json'


class Weather
    
    def initialize
        
        # get data
        rawdata = File.readlines('modules/weather.txt').first
        @data = JSON.parse(rawdata)

        # p @data[0]

    end

    def temp?(time)

        @data[time]["temp"].gsub(' Cel', '')
        
    end

    def wind_speed?(time)

        @data[time]["wind_speed"]

    end

    def humidity?(time)

        @data[time]["humidity"]

    end

    def thunder_chance?(time)

        @data[time]["thunder"]

    end

    def max_gust_speed?(time)

        @data[time]["wind_gust"]

    end

    def symbol?(time)

        @data[time]["symbol"]

    end

end