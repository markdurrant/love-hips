require("game")
require("player")

function love.load()
  windowWidth = game.x
  windowHeight = game.y

  love.window.setMode(windowWidth, windowHeight)

  love.graphics.setBackgroundColor(25, 25, 50)
end

function love.update(dt)
  for i = 1, game.noPlayers do
    -- move players if alive
    if player[i].isAlive then
      player[i].x = player[i].x + player[i].joy:getAxis(1) * 2
      player[i].y = player[i].y + player[i].joy:getAxis(2) * 2
    end

    -- expload bombs
    if player[i].bomb.isCool and player[i].joy:isDown(1,2,3,4,5,6,7,8) then
      --
      player[i].bomb.exp = true
      player[i].bomb.r = player.bombR
      player[i].bomb.color[4] = 255
      player[i].bomb.x = player[i].x
      player[i].bomb.y = player[i].y

      -- kill player if in blast radius
      for b = 1, game.noPlayers do
        if b ~= i and
          ((player[i].bomb.x - player[b].x)^2 + (player[i].bomb.y - player[b].y)^2)^ 0.5 <= player.bombR + player.r
          then
          print("player " .. i .. " killed " .. " player " .. b)

          player[b].isAlive = false
          player[b].color = {0, 0, 0}
        end
      end
      --
      player[i].bomb.isCool = false
    elseif player[i].bomb.cdt >= player.cooldown then
      player[i].bomb.cdt = 0
      player[i].bomb.isCool = true
    elseif player[i].bomb.isCool == false then
      player[i].bomb.cdt = player[i].bomb.cdt + dt
    end

    -- reduce opacity of bomb when triggered then shirnk
    if player[i].bomb.color[4] >= 5 then
      player[i].bomb.color[4] = player[i].bomb.color[4] - dt * 200
    else
      player[i].bomb.exp = false
      player[i].bomb.r = 0
    end
  end
end

function love.draw()
  -- draw bombs
  for i = 1, game.noPlayers do
    love.graphics.setColor(player[i].bomb.color)
    love.graphics.circle("fill", player[i].bomb.x, player[i].bomb.y, player[i].bomb.r)
  end

  -- draw players
  for i = 1, game.noPlayers do
    love.graphics.setColor(player[i].color)
    love.graphics.circle("fill", player[i].x, player[i].y, player.r)
  end
end