# This is a prototype/scratchpad for the player, just a ball to move around to work on collisions.

class Ball < Mob # < GameObject

  attr_accessor :jumping
  attr_reader :grounded

  def initialize(game,origin)
    super game, origin
    @jumping = @grounded = @block_left = @block_right = @block_above = false
    @gfx = Gosu::Image.load_tiles($window, gfx("eid"), 60, 88, false)
    @box = generate_box
    @gravity_factor = 4
    @jump_height = 155
    @current_jump = 0
  end

  def update
    self.box.update
    @gravity_factor.times do
      self.physics
      self.gravity
    end
  end

  def generate_box
    origin = Vector2.new(@origin.x-1,@origin.y-1)
    Box2D.new(origin, @gfx[0].height+1, @gfx[0].width+1)
  end

  def jump
    if @jumping
      @jumping = false unless @current_jump < @jump_height
      self.box.origin.y -= 5
      @current_jump += 5
      debug(@current_jump)
    end
  end

  # This is messy I think.
  def physics
    # Clean up from last run, so collision detection can begin anew.
    cannidates = Array.new
    @grounded = false

    # Find all the objects we're touching, so we can work with them instead of every gameobject.
    self.game.objects.each do |object|
      if self.box.collides?(object.box)
        
        # Check all the objects we're touching for tags we care about
        if object.tags.include? "kill"
          self.die
        elsif object.tags.include? "goal"
          self.at_goal
        end
          
        cannidates.push(object)
      end
    end

    # Deal with our lucky winners and see what's what.
    cannidates.each do |cannidate|
      
      # Are one of our feet between the cannidates left and right bounds?
      # Holy moley.
      if self.box.left_foot.x > cannidate.box.origin.x and self.box.left_foot.x < cannidate.box.origin.x + cannidate.box.width or self.box.right_foot.x < cannidate.box.origin.x + cannidate.box.width and self.box.right_foot.x > cannidate.box.origin.x
        if cannidate.tags.include? "solid" 
          @grounded = true
          @current_jump = 0
          debug("Grounded. Feet Y: #{self.box.left_foot.y} Boxtop Y: #{cannidate.box.origin.y}")
        end
      end
    end
  end

  def die
    debug("Hit deadly object")
  end

  def at_goal
    debug("Touching the goal")
  end

  def gravity
    unless @grounded or @jumping or self.box.origin.y + self.box.height > $window.height
      self.box.origin.y += 1
    end
  end

  def draw
    @gfx[0].draw(@box.origin.x,@box.origin.y,Zorder::Mob)
    @box.draw if DEBUG
  end
end
