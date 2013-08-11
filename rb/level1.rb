class Level1 < GameState
  def initialize
    super
    self.load("map1")
    @bg = Static_BG.new
    @player = Ball.new(self, Vector2.new(60,300))
  end

  def update
    super
    @bg.update
    @player.update

    if $window.button_down?(Gosu::KbLeft)
      @player.move_left
    elsif $window.button_down?(Gosu::KbRight)
      @player.move_right
    end
  end

  def draw
    super
    @bg.draw
    @player.draw
  end
end
