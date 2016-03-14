-- load modules
require("util")
require("window")
require("font")
require("character")
require("npc")

function love.load()
  -- set window props
  window.setWindow()
end

function love.update(dt)
  -- update npc.list props
  npc.update()
end

function love.draw()
  -- draw npc.list
  npc.draw()

  -- draw text
  love.graphics.setFont(font.base)
  love.graphics.setColor({255, 255, 255})
  love.graphics.print("LÖVE", 10, 10)
end