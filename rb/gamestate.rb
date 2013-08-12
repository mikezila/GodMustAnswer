class GameState

  attr_reader :objects, :player

  def initialize
    @objects = Array.new
  end

  def button_down(id)
    nil
  end

def load(name)
    debug("Loading objects...")
    @objects.clear
    raw_objects = Array.new

    File.open(map("#{name}"),"rb") do |file|
      raw_objects = Marshal.load(file)
    end

    raw_objects.each do |raw|
      if raw.type == "block"
        @objects.push(Block.new(self,raw.origin))
      end
    end
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
