# frozen_string_literal: true

require 'gosu'
Dir['modules/**/*.rb'].sort.each do |f|
  p f
  require_relative f
end

# Acts as the main property of the magic mirror frontend
class MirrorWindow < Gosu::Window
  def initialize(language) # rubocop:disable Metrics/AbcSize
    # TODO [#7]: [#4]: Make this url configurable
    #
    # ie. by using a config file or user input
    @server_url = 'localhost:9292'
    temp = Screen.screen_resolution
    @window_width = temp[0].to_i
    @window_height = temp[1].to_i
    super(@window_width, @window_height)
    @font = Gosu::Font.new(self, Gosu.default_font_name, 20)
    @translation = Translation.new(language, @server_url)

    @margin = 20

    @scale_x = 1.4
    @scale_y = 1.4

    @width_offsets = []
    @width_offsets << (@font.text_width("<b>#{TimeComponent.new.time}</b>") * @scale_x)
    @width_offsets << (@font.text_width("#{TimeComponent.new.date.reverse[0]}"\
      " #{TimeComponent.new.date.reverse[1]} #{TimeComponent.new.date.reverse[2]}") * @scale_x)

    @markup_height = @font.height

    @number_of_weather_entries = 4
    @weather = Weather.new
    Websocket.ws_establish
    # @ws.ws_establish

  end

  # Handles updating of entities in gosu
  def update;end

  # Draws entities in gosu
  def draw # rubocop:disable Metrics/AbcSize
    @font.draw_markup("<b>#{TimeComponent.new.time}</b>", (@window_width - @width_offsets[0] - @margin),
                      @margin, 1, scale_x = @scale_x, scale_y = @scale_y)
    @font.draw_markup("#{TimeComponent.new.date.reverse[0]}"\
      " #{TimeComponent.new.date.reverse[1]} #{TimeComponent.new.date.reverse[2]}",
                      (@window_width - @width_offsets[1] - @margin), 60, 1,
                      scale_x = @scale_x, scale_y = @scale_y)

    @font.draw_markup(@weather.temp?(0), @margin, @margin + (@markup_height*@scale_y)-(12*@scale_y), 0, scale_x = @scale_x*2, scale_y = @scale_y*2)

    Gosu::Image.new('./weather/' + @weather.symbol?(0) + '.png').draw(100 + @margin, @margin, 1, scale_x = @scale_x*2, scale_y = @scale_y*2)

    @number_of_weather_entries.times do |i|
      @font.draw_markup(@weather.temp?(i + 1), @margin, 100 + i * 48 + @markup_height * @scale_y - 6*2, 1,
                        scale_x = @scale_x, scale_y = @scale_y)
      weather_symbol_path = './weather/' + @weather.symbol?(i) + '.png'
      Gosu::Image.new(weather_symbol_path).draw(50 + @margin, 100 + i * 48, 1, scale_x = 2, scale_y = 2)
    end
  end
end

window = MirrorWindow.new('en')
window.show
