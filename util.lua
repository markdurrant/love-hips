util = {}

-- convert hex string to rgb table
util.hex2rgb = function (hex)
  hex = hex:gsub("#", "")
  return { tonumber("0x" .. hex:sub(1,2)), tonumber("0x" .. hex:sub(3,4)), tonumber("0x" .. hex:sub(5,6))}
end

-- flip direction
util.flipD = function (d)
  if d > 180 then d = d - 180 else d = d - 180 end
  return d
end

return util