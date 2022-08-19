class BridgeSim
  class Level
    include CyberarmEngine::Common

    def initialize
      @vehicles = 0
      @segments = 0
      @terrain = []

      setup
    end

    def vehicles(number)
    end

    def max_segments(number)
    end

    def terrain(type, position)
      pos = case position
            when :left
              CyberarmEngine::Vector.new(0, window.height / 2)
            when :middle
              CyberarmEngine::Vector.new(0, window.height / 2)
            when :right
              CyberarmEngine::Vector.new(0, window.height / 2)
            end

      @terrain << Objects::Terrain.new(type: type, position: position, auto_manage: false)
    end
  end
end
