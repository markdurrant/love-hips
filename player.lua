player = {}

player.r = 10
player.color = {250, 0, 125}

for i = 1, game.noPlayers do
  p = {}
  p.x = 250
  p.y = 250
  table.insert(player, p)
end

return player