#Misc classes/helping hands

DEBUG = false
VERSION = 0.3

module Zorder
  Dev = 99
  BG = 0
  Block = 1
  Mob = 2
  HUD = 3
end

def debug(message)
  puts "#{Time.now.strftime("%H:%M:%S.%L")} - \t#{message}" if DEBUG
end

def gfx(name)
  File.expand_path("gfx/#{name}.png", File.dirname(__FILE__))
end

def music(name)
  File.expand_path("music/#{name}.ogg", File.dirname(__FILE__))
end

def sfx(name)
  File.expand_path("sfx/#{name}.ogg", File.dirname(__FILE__))
end

def map(name)
  File.expand_path("map/#{name}.map", File.dirname(__FILE__))
end
