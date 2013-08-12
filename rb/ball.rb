class Ball < Mob # < GameObject

  attr_accessor :jumping

  def initialize(game,origin)
    super game, origin
    @jumping = @grounded = false
    self.tags.push("ball")
    @gfx = Gosu::Image.new($window, gfx("ball"), false)
    @box = generate_box
  end

  def update
    super
    @origin = Vector2.new(@x,@y)
    @box.update(@origin)
    self.gravity unless self.grounded? or self.jumping?
  end

  def jumping?
    @jumping
  end

  def grounded?
    @grounded
  end

  def gravity
    self.move_down unless self.y + self.box.height == $window.height
    self.box.update(@origin)
  end

  def draw
    super
    @gfx.draw(@x,@y,Zorder::Mob)
    @box.draw if DEBUG
  end
end
