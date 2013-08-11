class GameObject

  attr_reader :x, :y, :tags, :game, :box

  def initialize(game)
    @game = game
    @tags = Array.new
    @deleted = false
  end

  def add_tag(tag)
    self.tags.push(tag)
  end

  def deleted?
    @deleted
  end

  def delete
    @deleted = true
  end

  def update
    self.box.update if self.box
  end

  def draw
    self.box.draw if self.box
  end
end
