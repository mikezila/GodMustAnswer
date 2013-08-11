class Box2D

  attr_reader :origin, :height, :width
  attr_accessor :highlight

  def initialize(vec2, height, width)
    @origin = vec2
    @highlight = false
    @height = height
    @width = width
    @x = vec2.x
    @y = vec2.y
    @points = Array.new
    self.calc_points
  end

  def update(origin)
    @origin = origin
    self.calc_points
  end

  # The "v" variables are the four points of the box going from
  # top left, top right, bottom left, bottom right, OpenGL-style
  def calc_points
    # @origin would be v1, defined in the constructor, since its just the vector2 that was passed then.
    @v2 = Vector2.new(self.origin.x + self.width, self.origin.y)
    @v3 = Vector2.new(self.origin.x, self.origin.y + self.height)
    @v4 = Vector2.new(self.origin.x + width, self.origin.y + self.height)

    # Put those points in an array, so we can get them later in one neat package.
    @points.push(@origin,@v2,@v3,@v4)
  end

  def collides?(other)
    if (other.origin.x >= self.origin.x + self.width) # to the right
      return false
    elsif (other.origin.x + other.width <= self.origin.x) # to the left
      return false
    elsif (other.origin.y >= self.origin.y + self.height) # it's under
      return false
    elsif (other.origin.y + other.height <= self.origin.y) # it's above
      return false
    else
      return true
    end   
  end

  def draw
    self.debug_draw if DEBUG
  end

  # Lines are drawn to points seemingly out-of-order so that we get a box instead of a Z
  def debug_draw
    color = Gosu::Color::RED
    color = Gosu::Color::GREEN if @highlight
    $window.draw_line(self.origin.x,self.origin.y,color,@v2.x,@v2.y,color,Zorder::Dev)
    $window.draw_line(@v2.x,@v2.y,color,@v4.x,@v4.y,color,Zorder::Dev)
    $window.draw_line(@v4.x,@v4.y,color,@v3.x,@v3.y,color,Zorder::Dev)
    $window.draw_line(@v3.x,@v3.y,color,self.origin.x,self.origin.y,color,Zorder::Dev)
  end

  def to_a
    @points
  end
end
