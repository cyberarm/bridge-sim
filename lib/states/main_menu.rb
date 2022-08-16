class BridgeSim
  class States
    class MainMenu < CyberarmEngine::GuiState
      def setup
        theme(THEME)

        background 0xff_63452c

        flow(width: 1.0, height: 1.0) do
          stack(width: 386, height: 1.0, padding: 8) do
            background 0x22_000000

            banner "BridgeSim", width: 1.0, text_align: :center

            flow(width: 1.0, height: 4) do
              background 0xff_000000
            end

            tagline "A game by cyberarm for the third Gosu Game Jam."

            button "PLAY", margin_top: 16, width: 1.0 do
              push_state(States::Game)
            end

            flow(fill: true)

            button "QUIT", width: 1.0 do
              window.close
            end
          end

          stack(fill: true, height: 1.0, padding: 32) do
            tagline "Construct bridges to get the trucks across the gorges.\n" \
                    "The segments must not block the trucks, build down if need be.", width: 1.0, max_with: 512

            flow(fill: true)

            tagline "Thanks to Kenney (https://kenney.nl) for game icons, CC-0."
          end
        end
      end
    end
  end
end
