npc = {}

-- set number of npcs
npc.numberOfNpcs = 50

-- add npcs to list
npc.list = {}
for i = 1, npc.numberOfNpcs do
  local n = {}
  n.x = math.random(character.r * 2, window.x - character.r * 2)
  n.y = math.random(character.r *2, window.y - character.r * 2)
  n.r = character.r
  n.d = math.random(0, 360) -- npc direction
  n.v = math.random(1, 5) -- npc velocity
  n.alive = true
  n.color = util.hex2rgb(character.color[math.random(table.getn(character.color))]) -- get a random color string & convert to rgb

  table.insert(npc.list, n)
end

-- update npc props
npc.update = function ()
  for i in ipairs(npc.list) do
    local n = npc.list[i]
    -- if not in bounds flip direction
    if character.inBounds(n.x, n.y) == false then
      n.d = util.flipD(n.d)
    end
    -- move npc
    n.x = n.x + math.cos(n.d) * n.v
    n.y = n.y + math.sin(n.d) * n.v
  end
end

-- draw npc.list
npc.draw = function ()
  love.graphics.setBlendMode("screen")
  for i in ipairs(npc.list) do
    local n = npc.list[i]
    love.graphics.setColor(n.color)
    love.graphics.circle("fill", n.x, n.y, n.r)
  end
  love.graphics.setBlendMode("alpha")
end

return npc