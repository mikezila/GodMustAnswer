class GameState

  attr_reader :objects, :player

  def initialize
    @objects = Array.new
    @player = nil
  end

  def button_down(id)
    nil
  end

  def update
    @objects.each do |object|
      object.update
    end

    @objects.delete_if do |object|
      object.deleted?
    end
  end

  def draw
    @objects.each do |object|
      object.draw
    end
  end
end
