class Box2D

  attr_reader :origin, :left_foot, :right_foot, :height, :width
  attr_accessor :highlight

  def initialize(vec2, height, width)
    @origin = vec2
    @highlight = false
    @height = height
    @width = width
    @x = vec2.x
    @y = vec2.y
    @feet = nil
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
    # Feet is a reference point for the center of the box'x bottom edge, a small "tail" is drawn on it pointing down
    @left_foot = Vector2.new(@v3.x + (Vector2.distance(@v3,@v4)/3), @v3.y)
    @right_foot = Vector2.new(@v3.x + ((Vector2.distance(@v3,@v4)/3)*2), @v3.y)
  end

  def collides?(other) # Other should be another Box2D object
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

  # Lines are drawn to points seemingly out-of-order so that we get a box instead of a Z
  def draw
    color = Gosu::Color::RED
    color = Gosu::Color::GREEN if @highlight
    $window.draw_line(self.origin.x,self.origin.y,color,@v2.x,@v2.y,color,Zorder::Dev)
    $window.draw_line(@v2.x,@v2.y,color,@v4.x,@v4.y,color,Zorder::Dev)
    $window.draw_line(@v4.x,@v4.y,color,@v3.x,@v3.y,color,Zorder::Dev)
    $window.draw_line(@v3.x,@v3.y,color,self.origin.x,self.origin.y,color,Zorder::Dev)
    $window.draw_line(@left_foot.x,@left_foot.y+3,color,@right_foot.x,@right_foot.y+3,color,Zorder::Dev)
  end
end
