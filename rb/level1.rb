class Level1 < GameState
  def initialize
    super
    self.load("map1")
    @bg = StaticBG.new
    @player = Ball.new(self, Vector2.new(120,300))
  end

  def button_down(id)
    if id == Gosu::KbSpace
      @player.jumping = true if @player.grounded == true
    end
  end

  def button_up(id)
    if id == Gosu::KbSpace
      @player.jumping = false
    end
  end

  def update
    super
    @bg.update
    @player.update

    if $window.button_down?(Gosu::KbSpace)
      @player.jump
    end
    if $window.button_down?(Gosu::KbLeft)
      @player.move_left
    elsif $window.button_down?(Gosu::KbRight)
      @player.move_right
    end
    if $window.button_down?(Gosu::KbDown)
      @player.move_down
    end
  end

  def draw
    super
    @bg.draw
    @player.draw
  end
end
