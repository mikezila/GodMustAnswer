class Editor < GameState
  def initialize
    super
    @gfx = Gosu::Image.new($window,gfx("block"),false)
    @raw_objects = Array.new
  end

  def button_down(id)
    if id == Gosu::MsLeft
      self.place
    end
    if id == Gosu::KbBackspace
      self.undo
    end
    if id == Gosu::KbQ
      self.save
    end
    if id == Gosu::KbP
      self.load
    end
  end

  def place
    spot = Vector2.new($window.mouse_x,$window.mouse_y)
    @objects.push(Block.new(self,spot))
  end

  def undo
    @objects.pop unless @objects.length == 0
  end

  def save
    raw_objects = Array.new

    @objects.each do |object|
      raw_objects.push(EditorObject.new(object.type,object.origin))
    end

    debug("Saving objects...")
    File.open(map("editor"),"wb") do |file|
      Marshal.dump(raw_objects, file)
    end
  end

  def load
    debug("Loading objects...")
    @objects.clear
    @raw_objects.clear

    File.open(map("editor"),"rb") do |file|
      @raw_objects = Marshal.load(file)
    end

    @raw_objects.each do |raw|
      if raw.type == "block"
        @objects.push(Block.new(self,raw.origin))
      end
    end

  end

  def update
    super
  end

  def draw
    super
    @gfx.draw($window.mouse_x,$window.mouse_y,Zorder::Dev)
  end
end
