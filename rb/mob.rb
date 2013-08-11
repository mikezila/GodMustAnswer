class Mob < GameObject
  def initialize(game, origin)
    super game
    @move_speed = 1
    @x = origin.x
    @y = origin.y
  end

  def move_left
    @x -= 1 * @move_speed
  end

  def move_right
    @x += 1 * @move_speed
  end

  def move_down
    @y += 1 * @move_speed
  end

  def move_up
    @y -= 1 * @move_speed
  end
end
