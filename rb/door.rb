class Door < StaticObject # < GameObject

  def initialize(game, origin)
    super game, origin
    @type = "door"
    @tags.push("goal")
    @gfx = Gosu::Image.new($window,gfx("door"),false)
    @box = generate_box
  end

  def update
    super
  end

  def draw
    super
  end
end
