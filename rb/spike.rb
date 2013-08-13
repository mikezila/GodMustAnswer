class Spike < StaticObject # < GameObject

  def initialize(game, origin)
    super game, origin
    @type = "spike"
    @tags.push("kill")
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
