# The tower of heaven lie in ruin.  Yet still you climb.
# Such defiance.  You seek the truth.  God Must Answer.

require 'gosu'

def code(name)
  File.expand_path("rb/#{name}.rb", File.dirname(__FILE__))
end

require code("gameobject")
require code("gamestate")
require code("mob")
require code("player")
require code("misc")
require code("box2d")
require code("vector2")
require code("block")

require code("level1")

class GameWindow < Gosu::Window
  def initialize
    super 640,480,false
    $window = self

    self.caption = "God Must Answer - v#{VERSION}"
    @gamestates = Array.new
    @current_state = 0
    debug_room = Level1.new

    @gamestates.push(debug_room)
  end
  
  def needs_cursor?
    true
  end
  
  def button_down(id)
    if id == Gosu::KbEscape
      self.close
    else
      @gamestates[@current_state].button_down(id)
    end
  end

  def update
    @gamestates[@current_state].update
  end
  
  def draw
    @gamestates[@current_state].draw
  end
end

GameWindow.new.show
