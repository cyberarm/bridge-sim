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
              button get_image("#{MEDIA_PATH}/icons/trash.png"), image_height: 1.0
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
              para "909090"
              para ""
              para "999"
              para "0/6"
              para "0/1"
            end
          end
        end
      end

      def draw
        super

        Gosu.scale(1, 1) do
          Gosu.draw_circle(window.width - 128, 128, 64, 36, 0x77_ffa348, 3000)
        end
      end

      def update
        super
      end
    end
  end
end
