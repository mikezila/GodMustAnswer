class Vector2

  attr_reader :x, :y

  def initialize(x,y,name="Unnamed")
    @x = x
    @y = y
  end

  def to_s
    "\"#{@name}\": X:#{@x} Y:#{@y}"
  end
end
