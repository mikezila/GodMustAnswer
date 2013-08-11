class Static_BG
  def initialize
    @gfx = Gosu::Image.new($window, gfx("static_bg"), true)
  end

  def update
    nil
  end

  def draw
    @gfx.draw(0,0,Zorder::BG)
  end
end
