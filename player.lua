player = {}

player.r = 10
player.color = {50, 250, 125}

for i = 1, game.noPlayers do
  p = {}
  p.x = love.math.random(20, game.x - 20)
  p.y = love.math.random(20, game.y - 20)
  table.insert(player, p)
end

return player