class Vector2

  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  # This wraps Gosu's distance calculator to accept Vector2
  def Vector2.distance(point1,point2)
    Gosu::distance(point1.x,point1.y,point2.x,point2.y)
  end

  def to_s
    "\"#{@name}\": X:#{@x} Y:#{@y}"
  end
end
