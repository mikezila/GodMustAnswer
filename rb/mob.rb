class Mob < GameObject
  def initialize(game, origin)
    super game
    @move_speed = 1
    @origin = origin
    @x = origin.x
    @y = origin.y
  end

  def move_left
    @box.origin.x -= 1
  end

  def move_right
    @box.origin.x += 1
  end

  def move_down
    @box.origin.y += 1
  end

  def move_up
    @box.origin.y -= 1
  end
end
