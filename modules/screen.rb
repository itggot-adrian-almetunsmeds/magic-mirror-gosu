# frozen_string_literal: true

# Handles screen properties
class Screen
  def self.screen_resolution
    # rubocop:disable Security/Open
    x = open('|wmic path Win32_VideoController get'\
      ' CurrentVerticalResolution,CurrentHorizontalResolution /format:value')
    x = x.read.to_s
    # rubocop:enable Security/Open
    x = x.gsub('CurrentVerticalResolution=', '')
    x = x.gsub('CurrentHorizontalResolution=', '')
    x.split
  end
end
