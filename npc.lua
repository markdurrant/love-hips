npc = {}

npc.r = 10
npc.color = {0, 250, 125}

for i = 1, game.noNpc do
  n = {}
  n.x = love.math.random() * game.x
  n.y = love.math.random() * game.y
  table.insert(npc, n)
end

return npc