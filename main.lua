-- get real randoms
math.randomseed(os.time())

require("game")
require("player")
require("npc")

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
      -- expload bomb
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
          player[b].color = {150, 150, 200}
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

  for i = 1, game.noNpcs do
    -- keep time for npc motion
    npc[i].dirTimer = npc[i].dirTimer + dt

    -- randomise npc direction
    if npc[i].dirTimer >= npc[i].dirLimit then
      npc[i].dir = love.math.random(360)
      npc[i].dirLimit = love.math.random(2)
      npc[i].dirTimer = 0
    end

    if npc[i].x > game.x - player.r then
      npc[i].x = game.x - player.r
      npc[i].dir = love.math.random(360)
    elseif npc[i].x < 0 + player.r then
      npc[i].x = 0 + player.r
      npc[i].dir = love.math.random(360)
    end
    if npc[i].y > game.y - player.r then
      npc[i].y = game.y - player.r
      npc[i].dir = love.math.random(360)
    elseif npc[i].y < 0 + player.r then
      npc[i].y = 0 + player.r
      npc[i].dir = love.math.random(360)
    end

    -- move npc
    npc[i].y = npc[i].y + math.sin(npc[i].dir * math.pi/180)
    npc[i].x = npc[i].x + math.cos(npc[i].dir * math.pi/180)
  end
end

function love.draw()
  -- draw bombs
  for i = 1, game.noPlayers do
    love.graphics.setColor(player[i].bomb.color)
    love.graphics.circle("fill", player[i].bomb.x, player[i].bomb.y, player[i].bomb.r)
  end

  -- draw npc
  for i = 1, game.noNpcs do
    love.graphics.setColor(npc[i].color)
    love.graphics.circle("fill", npc[i].x, npc[i].y, player.r)
  end

  -- draw players
  for i = 1, game.noPlayers do
    love.graphics.setColor(player[i].color)
    love.graphics.circle("fill", player[i].x, player[i].y, player.r)
  end
end