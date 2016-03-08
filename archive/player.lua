player = {}

player.r = 10
player.color = {50, 250, 125}
player.bombR = 30

for i = 1, game.noPlayers do
  p = {}
  p.x = love.math.random(20, game.x - 20)
  p.y = love.math.random(20, game.y - 20)
  p.bombX = 0
  p.bombY = 0
  p.bombR = 0
  p.bombTimer = 0
  table.insert(player, p)
end

return player