class GameObject

  attr_reader :tags, :game, :box

  def initialize(game)
    @game = game
    @box = nil
    @tags = Array.new
    @deleted = false
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
    self.box.update if self.box
  end

  def draw
    self.box.draw if self.box
  end
end
