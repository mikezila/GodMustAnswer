class Mob < GameObject
  def initialize(game, origin)
    super game
    @move_speed = 3
    @origin = origin
    @x = origin.x
    @y = origin.y
  end

  def move_left
    @move_speed.times do
      @box.origin.x -= 1
    end
  end

  def move_right
    @move_speed.times do
      @box.origin.x += 1
    end
  end

  def move_down
    @move_speed.times do
      @box.origin.y += 1
    end
  end

  def move_up
    @move_speed.times do
      @box.origin.y -= 1
    end
  end
end
