class Block < GameObject

  def initialize(game,origin)
    super game
    @origin = origin
    self.tags.push("block")
    @gfx = Gosu::Image.new($window,gfx("block"),false)
    self.calc_box
  end

  def calc_box
    @box = Box2D.new(@origin,@gfx.height,@gfx.width)
  end

  def update
    super
  end

  def draw
    super
    @gfx.draw(@origin.x,@origin.y,Zorder::Block)
  end
end
