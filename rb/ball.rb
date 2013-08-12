# This is a prototype/scratchpad for the player, just a ball to move around to work on collisions.

class Ball < Mob # < GameObject

  attr_accessor :jumping

  def initialize(game,origin)
    super game, origin
    @jumping = @grounded = @block_left = @block_right = @block_above = false
    self.tags.push("ball")
    @gfx = Gosu::Image.new($window, gfx("ball"), false)
    @box = generate_box
  end

  def update
    super
    self.gravity unless self.grounded? or self.jumping?
    @origin = Vector2.new(@x,@y)
    @box.update(@origin)
    self.check_col
  end

  def jumping?
    @jumping
  end

  # I don't like this.  Using a single "foot" point is a bad idea.
  # Maybe two will work better?
  def check_col
    # Clean up from last run, so collision detection can begin anew.
    cannidates = Array.new
    @grounded = false

    # Find all the objects we're touching, so we can work with them instead of every gameobject.
    self.game.objects.each do |object|
      if self.box.collides?(object.box)
        cannidates.push(object)
      end
    end

    # Check to see if we're standing on any of them.
    cannidates.each do |cannidate|
      if self.box.left_foot.x > cannidate.box.origin.x and self.box.left_foot.x < cannidate.box.origin.x + cannidate.box.width or self.box.right_foot.x < cannidate.box.origin.x + cannidate.box.width and self.box.right_foot.x > cannidate.box.origin.x
        @grounded = true
        debug("grounded")
      end
    end
  end

  def grounded?
    @grounded
  end

  def gravity
    self.move_down unless self.y + self.box.height == $window.height
  end

  def draw
    super
    @gfx.draw(@x,@y,Zorder::Mob)
    @box.draw if DEBUG
  end
end
