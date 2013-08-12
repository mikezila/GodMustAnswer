# The tower of heaven lay in ruin.  Yet still you climb.
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
require code("editorobject")
require code("static_bg")
require code("ball")

require code("editor")
require code("level1")

class GameWindow < Gosu::Window
  def initialize
    super 640,480,false
    $window = self

    @gamestates = Array.new
    @current_state = 0
    #editor = Editor.new
    debug_room = Level1.new

    #@gamestates.push(editor)
    @gamestates.push(debug_room)
  end
  
  def needs_cursor?
    true
  end
  
  def button_up(id)
    @gamestates[@current_state].button_up(id)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      self.close
    else
      @gamestates[@current_state].button_down(id)
    end
  end

  def update
    self.caption = "God Must Answer - v#{VERSION} - FPS: #{Gosu::fps}"
    @gamestates[@current_state].update
  end
  
  def draw
    @gamestates[@current_state].draw
  end
end

GameWindow.new.show
