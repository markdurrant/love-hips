require("game")
require("controller")
require("player")

function love.load()
  windowWidth = 500
  windowHeight = 500

  love.window.setMode(windowWidth, windowHeight)
end

function love.update(dt)
  for i = 1, game.noPlayers do
    controller[i].x = controller[i].joy:getAxis(1)
    controller[i].y = controller[i].joy:getAxis(2)

    if controller[i].x > 0.2 or controller[i].x < -0.2 then
      player[i].x = player[i].x + controller[i].x * controller.speed
    end
    if controller[i].y > 0.2 or controller[i].y < -0.2 then
      player[i].y = player[i].y + controller[i].y * controller.speed
    end
  end
end

function love.draw()
  love.graphics.setColor(player.color)
  for i = 1, game.noPlayers do
    love.graphics.circle("fill", player[i].x, player[i].y, player.r)
  end
end