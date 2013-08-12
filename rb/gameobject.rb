class GameObject

  attr_reader :tags, :game, :box, :origin, :x, :y

  def initialize(game)
    @game = game
    @tags = Array.new
    @deleted = false
  end

  def generate_box
    Box2D.new(@origin, @gfx.height, @gfx.width)
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
  end

  def draw
  end
end
