class Mob < GameObject
  def initialize(x,y)
    super
    self.tags.push("mob")
    @move_speed = 1
    @x = @y = 0
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

  def warp(x,y)
    @x = x
    @y = y
  end
end
