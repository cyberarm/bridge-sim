begin
  require_relative "../cyberarm_engine/lib/cyberarm_engine"
rescue LoadError
  require "cyberarm_engine"
end

class BridgeSim
  ROOT_PATH = File.expand_path(".", __dir__)
  MEDIA_PATH = "#{ROOT_PATH}/media"
end

require_relative "lib/theme"
require_relative "lib/window"
require_relative "lib/states/main_menu"
require_relative "lib/states/game"
require_relative "lib/objects/segment"
require_relative "lib/objects/vehicle"
require_relative "lib/objects/terrain"
require_relative "lib/level"
require_relative "lib/levels/zero"

BridgeSim::Window.new(width: 1280, height: 720, resizable: true).show
