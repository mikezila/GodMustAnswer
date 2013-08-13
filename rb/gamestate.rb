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
      case raw.type
      when "block"
        @objects.push(Block.new(self,raw.origin))
        debug("block found")
      when "gblock"
        @objects.push(GBlock.new(self,raw.origin))
        debug("gold block found")
      when "door"
        @objects.push(Door.new(self,raw.origin))
        debug("door found")
      when "spike"
        @objects.push(Spike.new(self,raw.origin))
        debug("spike found")
      when "blockaddon"
        @objects.push(BlockAddon.new(self,raw.origin))
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
