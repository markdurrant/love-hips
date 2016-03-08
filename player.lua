player = {}

player.r = 10
player.bombR = 30

player.cooldown = 1

for i = 1, game.noPlayers do
  p = {}
  p.joy = love.joystick.getJoysticks()[i]
  p.x = math.random(player.r * 2, game.x - player.r * 2)
  p.y = math.random(player.r * 2, game.y - player.r * 2)
  p.isAlive = true
  p.color = {0, 255, 125}

  p.bomb = {}
  p.bomb.x = 0
  p.bomb.y = 0
  p.bomb.r = 0
  p.bomb.color = {50, 50, 125, 255}
  p.bomb.isCool = true
  p.bomb.cdt = 0
  p.bomb.exp = false

  table.insert(player, p)
end

return player