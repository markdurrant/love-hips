require("controller")
require("player")

function love.load()
  windowWidth = 500
  windowHeight = 500

  love.window.setMode(windowWidth, windowHeight)
end

function love.update(dt)
  controller[1].x = controller[1].joy:getAxis(1)
  controller[1].y = controller[1].joy:getAxis(2)

  if controller[1].x > 0.2 or controller[1].x < -0.2 then
    player[1].x = player[1].x + controller[1].x * controller.speed
  end
  if controller[1].y > 0.2 or controller[1].y < -0.2 then
    player[1].y = player[1].y + controller[1].y * controller.speed
  end
end

function love.draw()
  love.graphics.setColor(player.color)
  love.graphics.circle("fill", player[1].x, player[1].y, player.r)
end