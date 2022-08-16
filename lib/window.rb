class BridgeSim
  class Window < CyberarmEngine::Window
    def setup
      @cursor = get_image("#{MEDIA_PATH}/cursors/pointer.png")

      push_state(States::MainMenu)
      # push_state(States::Game)
    end

    def draw
      super

      @cursor.draw(mouse_x, mouse_y, Float::INFINITY)
    end
  end
end
