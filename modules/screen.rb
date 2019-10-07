# frozen_string_literal: true

class Screen
  def self.screen_resolution
    x = open('|wmic path Win32_VideoController get'\
    ' CurrentVerticalResolution,CurrentHorizontalResolution /format:value')
    x = x.read.to_s
    x = x.gsub('CurrentVerticalResolution=', '')
    x = x.gsub('CurrentHorizontalResolution=', '')
    x.split
  end
end
