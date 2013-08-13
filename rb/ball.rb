# This is a prototype/scratchpad for the player, just a ball to move around to work on collisions.

class Ball < Mob # < GameObject

  attr_accessor :jumping

  def initialize(game,origin)
    super game, origin
    @jumping = @grounded = @block_left = @block_right = @block_above = false
    self.tags.push("ball")
    @gfx = Gosu::Image.new($window, gfx("ball"), false)
    @box = generate_box
    @move_speed = 2
  end

  def generate_box
    origin = Vector2.new(@origin.x - 1, @origin.y - 1)
    Box2D.new(origin, @gfx.height+1, @gfx.width+1)
  end

  def update
    self.box.update
    @move_speed.times do
      self.physics
      self.gravity
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
        cannidates.push(object)
      end
    end

    # Deal with our lucky winners and see what's what.
    cannidates.each do |cannidate|
      
      # Are one of our feet between the cannidates left and right bounds?
      # Holy moley.
      if self.box.left_foot.x > cannidate.box.origin.x and self.box.left_foot.x < cannidate.box.origin.x + cannidate.box.width or self.box.right_foot.x < cannidate.box.origin.x + cannidate.box.width and self.box.right_foot.x > cannidate.box.origin.x
        @grounded = true
        debug("Grounded. Feet Y: #{self.box.left_foot.y} Boxtop Y: #{cannidate.box.origin.y}")
      end
    end
  end

  def gravity
    unless @grounded or @jumping
      debug("gravity happening")
      self.box.origin.y += 1
    end
  end

  def draw
    @gfx.draw(@box.origin.x,@box.origin.y,Zorder::Mob)
    @box.draw if DEBUG
  end
end
