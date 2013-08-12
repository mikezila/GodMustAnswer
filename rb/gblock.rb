class GBlock < StaticObject # < GameObject

  def initialize(game, origin)
    super game, origin
    self.tags.push("gblock")
    @gfx = Gosu::Image.new($window,gfx("gblock"),false)
    @box = generate_box
  end

  def update
    super
  end

  def draw
    super
  end
end
