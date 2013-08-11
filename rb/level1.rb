class Level1 < GameState
  def initialize
    super
    self.set_statics
  end

  def set_statics
    block = Block.new(self, Vector2.new(10,10))
    block2 = Block.new(self, Vector2.new(30,20))
    block3 = Block.new(self, Vector2.new(30,50))
    self.objects.push(block,block2,block3)
  end

  def update
    super
  end

  def draw
    super
  end
end
