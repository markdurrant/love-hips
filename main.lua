-- load modules
require("util")
require("window")
require("gameState")
require("font")
require("menus")
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

  -- draw menu
  menu.draw()
end