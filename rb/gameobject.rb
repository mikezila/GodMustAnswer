class GameObject

  attr_reader :tags, :game, :box, :origin, :x, :y

  def initialize(game)
    @game = game
    @tags = Array.new
    @deleted = false
  end

  def calc_box
    @box = Box2D.new(@origin,@gfx.height,@gfx.width)
  end

  def add_tag(tag)
    self.tags.push(tag)
  end

  def origin
    self.box.origin
  end

  def type
    self.tags[0]
  end

  def deleted?
    @deleted
  end

  def delete
    @deleted = true
  end

  def update
    self.box.update(@origin)
  end

  def draw
    self.box.draw if self.box
  end
end
