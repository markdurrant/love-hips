require("controller")
require("player")

function love.load()
  windowWidth = 500
  windowHeight = 500

  love.window.setMode(windowWidth, windowHeight)
end

function love.update(dt)
  controller.one.x = controller.one.joy:getAxis(1)
  controller.one.y = controller.one.joy:getAxis(2)

  if controller.one.x > 0.2 or controller.one.x < -0.2 then
    player.one.x = player.one.x + controller.one.x * controller.speed
  end
  if controller.one.y > 0.2 or controller.one.y < -0.2 then
    player.one.y = player.one.y + controller.one.y * controller.speed
  end

  controller.two.x = controller.two.joy:getAxis(1)
  controller.two.y = controller.two.joy:getAxis(2)

  if controller.two.x > 0.2 or controller.two.x < -0.2 then
    player.two.x = player.two.x + controller.two.x * controller.speed
  end
  if controller.two.y > 0.2 or controller.two.y < -0.2 then
    player.two.y = player.two.y + controller.two.y * controller.speed
  end
end

function love.draw()
  love.graphics.setColor(player.color)
  love.graphics.circle("fill", player.one.x, player.one.y, player.r)
  love.graphics.circle("fill", player.two.x, player.two.y, player.r)
end