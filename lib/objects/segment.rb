class BridgeSim
  class Objects
    class Segment < CyberarmEngine::GameObject
      def setup
        @segments = @options[:segments].sort { |v| v.x }
        @midpoint = CyberarmEngine::Vector.new((head.x + tail.x) / 2.0, (head.y + tail.y) / 2.0)
      end

      def draw

        Gosu.draw_arc(head.x, head.y, 8, 1.0, 36, 2, Gosu::Color::YELLOW, Float::INFINITY)
        Gosu.draw_arc(tail.x, tail.y, 8, 1.0, 36, 2, Gosu::Color::YELLOW, Float::INFINITY)
        Gosu.draw_line(head.x, head.y, Gosu::Color::YELLOW, tail.x, tail.y, Gosu::Color::YELLOW, Float::INFINITY)

        Gosu.draw_arc(midpoint.x, midpoint.y, 8, 1.0, 36, 2, Gosu::Color::CYAN, Float::INFINITY)
      end

      def head
        @segments.first
      end

      def midpoint
        @midpoint
      end

      def tail
        @segments.last
      end

      def normal
      end
    end
  end
end
