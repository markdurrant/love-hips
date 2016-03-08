npc = {}

for i = 1, game.noNpcs do
  n = {}
  n.color = game.playerColors[math.random(1,5)]
  n.x = math.random(player.r * 2, game.x - player.r * 2)
  n.y = math.random(player.r * 2, game.y - player.r * 2)
  n.dir = love.math.random(360)
  n.dirTimer = 0
  n.dirLimit = love.math.random() * 3
  table.insert(npc, n)
end

return npc