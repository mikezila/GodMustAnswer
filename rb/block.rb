class Block < StaticObject # < GameObject

  def initialize(game, origin)
    super game, origin
    @type = "block"
    @tags.push("solid")
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

class BlockAddon < StaticObject # < GameObject

  def initialize(game, origin)
    super game, origin
    @type = "blockaddon"
    @tags.push("solid")
    @gfx = Gosu::Image.new($window,gfx("blockaddon"),false)
    @box = generate_box
  end

  def update
    super
  end

  def draw
    super
  end
end