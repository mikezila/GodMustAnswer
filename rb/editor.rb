class Editor < GameState
  def initialize
    super
    @bg = StaticBG.new
    @gfx = Array.new
    block = Gosu::Image.new($window,gfx("block"),false)
    door = Gosu::Image.new($window,gfx("door"),false)
    spike = Gosu::Image.new($window,gfx("spike"),false)
    gblock = Gosu::Image.new($window,gfx("gblock"),false)
    blocka = Gosu::Image.new($window,gfx("blockaddon"),false)
    @gfx.push(block,gblock,door,spike,blocka)
    @raw_objects = Array.new
    @map_name = "editor"
    @selected = 0
    @camera_y = @camera_x = 0
    @camera_step = 25
  end

  def button_up(id)
    nil
  end

  def button_down(id)
    if id == Gosu::MsLeft
      self.place
    end
    if id == Gosu::MsWheelUp
      @selected += 1 unless @selected == @gfx.length - 1
    elsif id == Gosu::MsWheelDown
      @selected -= 1 unless @selected == 0
    end
    if id == Gosu::KbBackspace
      self.undo
    end
    if id == Gosu::KbQ
      self.save
    end
    if id == Gosu::KbP
      self.load(@map_name)
    end

    # Editor "camera" controls.
    if id == Gosu::KbRight
      @camera_x += @camera_step
    elsif id == Gosu::KbLeft
      @camera_x -= @camera_step
    elsif id == Gosu::KbUp
      @camera_y -= @camera_step
    elsif id == Gosu::KbDown
      @camera_y += @camera_step
    end
        
  end

  def place
    # This takes the camera position into account.
    spot = Vector2.new($window.mouse_x + @camera_x, $window.mouse_y + @camera_y)
    
    case @selected
    when 0
      @objects.push(Block.new(self,spot))
    when 1
      @objects.push(GBlock.new(self,spot))
    when 2
      @objects.push(Door.new(self,spot))
    when 3
      @objects.push(Spike.new(self,spot))
    when 4
      @objects.push(BlockAddon.new(self,spot))
    end
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
    File.open(map("#{@map_name}"),"wb") do |file|
      Marshal.dump(raw_objects, file)
    end
  end

  def update
    super
    @bg.update
  end

  def draw
    $window.translate(-@camera_x, -@camera_y) do
      super
    end
    @bg.draw
    @gfx[@selected].draw($window.mouse_x,$window.mouse_y,Zorder::Dev)
  end
end
