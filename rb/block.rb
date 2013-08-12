class Block < StaticObject # < GameObject

  def initialize(game, origin)
    super game, origin
    self.tags.push("block","solid")
    @gfx = Gosu::Image.new($window,gfx("block"),false)
    @box = generate_box
  end

  def update
    super
  end

  def draw
    super
  end
end
