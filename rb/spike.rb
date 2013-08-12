class Spike < StaticObject # < GameObject

  def initialize(game, origin)
    super game, origin
    self.tags.push("spike")
    @gfx = Gosu::Image.new($window,gfx("spike"),false)
    @box = generate_box
  end

  def update
    super
  end

  def draw
    super
  end
end
