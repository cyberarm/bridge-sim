class BridgeSim
  class States
    class Game < CyberarmEngine::GuiState
      def setup
        theme(THEME)

        background 0xff_ffbe6f..0xff_99c1f1

        stack(width: 1.0, height: 1.0) do
          # Menu Items
          flow(width: 1.0, height: 64) do
            background 0x44_333333

            flow(width: 0.33, height: 1.0, padding: 8) do
              button(get_image("#{MEDIA_PATH}/icons/music_on.png"), image_height: 1.0) do |btn|
                if btn.value == get_image("#{MEDIA_PATH}/icons/music_on.png")
                  btn.value = get_image("#{MEDIA_PATH}/icons/music_off.png")
                else
                  btn.value = get_image("#{MEDIA_PATH}/icons/music_on.png")
                end
              end

              button get_image("#{MEDIA_PATH}/icons/plus.png"), image_height: 1.0
              button get_image("#{MEDIA_PATH}/icons/minus.png"), image_height: 1.0

              button(get_image("#{MEDIA_PATH}/icons/trash.png"), image_height: 1.0) do
                @segments.clear
              end
            end

            # Ready / Reset Button
            flow(width: 0.33, height: 1.0, padding: 8) do
              flow(fill: true)
              button "READY?", width: 1.0, max_width: 256, height: 1.0
              flow(fill: true)
              background 0x22_ffffff
            end
          end

          # Game Info
          flow(width: 172, fill: true, padding: 8) do
            background 0x22_000000

            stack(width: 100, height: 1.0) do
              para "Score:"
              para ""
              para "Time:"
              para "Segments:"
              para "Vehicles:"
            end
            stack(fill: true, height: 1.0) do
              @score_label = para "909090"
              para ""
              @time_label = para "999"
              @segment_label = para "0/6"
              @vehicle_label = para "0/1"
            end
          end
        end

        @level = @options[:level] || Levels::Zero.new

        @segments = []
        @vehicles = []
        @anchors = [
          CyberarmEngine::Vector.new(100, window.height / 2),
          CyberarmEngine::Vector.new(window.width / 2, window.height / 2),
        ]
      end

      def draw
        super

        Gosu.scale(1, 1) do
          Gosu.draw_circle(window.width - 128, 128, 64, 36, 0x77_ffa348, 3000)

          if @drag_start
            anchor = nearest_anchor
            pos = anchor || CyberarmEngine::Vector.new(window.mouse_x, window.mouse_y)

            Gosu.draw_arc(@drag_start.x, @drag_start.y, 8, 1.0, 36, 2, Gosu::Color::YELLOW, Float::INFINITY)
            Gosu.draw_line(@drag_start.x, @drag_start.y, Gosu::Color::YELLOW, pos.x, pos.y, Gosu::Color::YELLOW, Float::INFINITY)

            Gosu.draw_arc(pos.x, pos.y, 8, 1.0, 36, 2, Gosu::Color::YELLOW, Float::INFINITY) if anchor
          end

          @anchors.each do |vector|
            next unless nearest_anchor == vector
            next if anchor_in_use(vector)

            Gosu.draw_arc(vector.x, vector.y, 8, 1.0, 36, 2, Gosu::Color::YELLOW, Float::INFINITY)
          end

          @segments.each(&:draw)
          @vehicles.each(&:draw)
        end
      end

      def update
        super

        @segment_label.value = "#{@segments.size}/?"
        @vehicles.each(&:update)
      end

      def button_down(id)
        super

        case id
        when Gosu::MS_LEFT
          if (anchor = nearest_anchor)
            @drag_start = anchor unless anchor_in_use(anchor)
          end
        end
      end

      def button_up(id)
        super

        case id
        when Gosu::MS_LEFT
          if @drag_start && (anchor = nearest_anchor)
            @segments << Objects::Segment.new(segments: [@drag_start, anchor], auto_manage: false) if anchor != @drag_start
          end

          @drag_start = nil
        end
      end

      def nearest_anchor(pos = CyberarmEngine::Vector.new(window.mouse_x, window.mouse_y))
        @anchors.find { |v| v.distance(pos) <= 16 }
      end

      def anchor_in_use(anchor)
        @segments.find do |segment|
          segment.head == anchor || segment.tail == anchor
        end
      end
    end
  end
end
