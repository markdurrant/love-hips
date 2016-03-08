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

    -- drop bombs
    if controller[i].isCool and controller[i].joy:isDown(1, 2, 3, 4, 5, 6, 7) then
      controller[i].isCool = false
      player[i].bombR = 1
    end
    if controller[i].isCool == false then
      controller[i].coolDownTimer = controller[i].coolDownTimer + dt
    end
    if controller[i].coolDownTimer >= controller.coolDown then
      controller[i].isCool = true
      controller[i].coolDownTimer = 0
    end
    if player[i].bombR > 0 then
      player[i].bombX = player[i].x
      player[i].bombY = player[i].y
      player[i].bombR = player[i].bombR + dt * 50
    end
    if player[i].bombR >= player.bombR then
      player[i].bombR = 0
    end
  end

  -- move npcs
  for i = 1, game.noNpc do
    -- keep time for npc motion
    npc[i].dirTimer = npc[i].dirTimer + dt

    -- randomise npc direction
    if npc[i].dirTimer >= npc[i].dirLimit then
      npc[i].dir = love.math.random(360)
      npc[i].dirLimit = love.math.random(2)
      npc[i].dirTimer = 0
    end

    if npc[i].x > game.x - npc.r then
      npc[i].x = game.x - npc.r
      npc[i].dir = love.math.random(360)
    elseif npc[i].x < 0 + npc.r then
      npc[i].x = 0 + npc.r
      npc[i].dir = love.math.random(360)
    end
    if npc[i].y > game.y - npc.r then
      npc[i].y = game.y - npc.r
      npc[i].dir = love.math.random(360)
    elseif npc[i].y < 0 + npc.r then
      npc[i].y = 0 + npc.r
      npc[i].dir = love.math.random(360)
    end

    -- move npc
    npc[i].y = npc[i].y + math.sin(npc[i].dir * math.pi/180)
    npc[i].x = npc[i].x + math.cos(npc[i].dir * math.pi/180)
  end
end

function love.draw()
  -- draw bombs
  love.graphics.setColor(game.bombColor)
  for i = 1, game.noPlayers do
    love.graphics.circle("line", player[i].bombX, player[i].bombY, player[i].bombR)
  end

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