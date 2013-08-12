class StaticObject < GameObject

  def initialize(game, origin)
    super game
    @origin = origin
  end

  def update
    super
    unless EDITOR
      if self.box.collides?(self.game.player.box)
        self.box.highlight = true
      else
        self.box.highlight = false
      end
    end
  end

  def draw
    super
    @gfx.draw(@origin.x,@origin.y,Zorder::Block)
    self.box.draw if self.box if DEBUG
  end
end
