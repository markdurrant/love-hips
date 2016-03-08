require("game")
require("controller")
require("player")
require("npc")

function love.load()
  windowWidth = game.x
  windowHeight = game.y

  love.window.setMode(windowWidth, windowHeight)
end

function love.update(dt)

  -- move players
  for i = 1, game.noPlayers do
    controller[i].x = controller[i].joy:getAxis(1)
    controller[i].y = controller[i].joy:getAxis(2)

    -- fix controller sensativity
    if controller[i].x > 0.2 or controller[i].x < -0.2 then
      player[i].x = player[i].x + controller[i].x * controller.speed
    end
    if controller[i].y > 0.2 or controller[i].y < -0.2 then
      player[i].y = player[i].y + controller[i].y * controller.speed
    end

    -- check for screen edge
    if player[i].x > game.x - player.r then
      player[i].x = game.x - player.r
    elseif player[i].x < 0 + player.r then
      player[i].x = 0 + player.r
    end
    if player[i].y > game.y - player.r then
      player[i].y = game.y - player.r
    elseif player[i].y < 0 + player.r then
      player[i].y = 0 + player.r
    end
  end
end

function love.draw()
  -- draw players
  love.graphics.setColor(player.color)
  for i = 1, game.noPlayers do
    love.graphics.circle("fill", player[i].x, player[i].y, player.r)
  end

  -- draw npcs
  love.graphics.setColor(npc.color)
  for i = 1, game.noNpc do
    love.graphics.circle("fill", npc[i].x, npc[i].y, npc.r)
  end
end