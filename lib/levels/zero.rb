class BridgeSim
  class Levels
    class Zero < Level
      def setup
        vehicles 1
        max_segments 1
        terrain(:a, :left)
        terrain(:c, :right)
      end
    end
  end
end
