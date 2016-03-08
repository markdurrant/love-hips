npc = {}

npc.r = 10
npc.color = {0, 250, 125}

for i = 1, game.noNpc do
  n = {}
  n.x = love.math.random(20, game.x - 20)
  n.y = love.math.random(20, game.y - 20)
  n.dir = love.math.random(360)
  n.dirTimer = 0
  n.dirLimit = love.math.random() * 3
  table.insert(npc, n)
end

return npc