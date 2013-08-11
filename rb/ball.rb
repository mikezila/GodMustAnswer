class Ball < Mob # < GameObject

  def initialize(game,origin)
    super game, origin
    @origin = origin
    @grounded = false
    @x = origin.x
    @y = origin.y
    self.tags.push("ball")
    @gfx = Gosu::Image.new($window, gfx("ball"), false)
    self.calc_box
  end

  def update
    super
    @origin = Vector2.new(@x,@y)
    @box.update(@origin)
    self.gravity unless self.grounded?
  end

  def grounded?
    self.game.objects.each do |object|
      if self.box.collides?(object.box)
        self.box.highlight = true
        if self.box.origin.y < object.box.origin.y or self.box.origin.y + self.box.width < object.box.origin.y 
          return true
          break
        end
      else
        self.box.highlight = false
        return false
      end
    end
  end

  def gravity
    self.calc_box
    self.move_down unless self.y + self.box.height == $window.height
  end

  def draw
    super
    @gfx.draw(@x,@y,Zorder::Mob)
  end
end
