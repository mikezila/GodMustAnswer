class Block < GameObject

  def initialize(game, origin)
    super game
    @origin = origin
    self.tags.push("block")
    @gfx = Gosu::Image.new($window,gfx("block"),false)
    self.calc_box
  end

  def update
    super
    if self.box.collides?(self.game.player.box)
      self.box.highlight = true
    else
      self.box.highlight = false
    end
  end

  def draw
    super
    @gfx.draw(@origin.x,@origin.y,Zorder::Block)
  end
end
