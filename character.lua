character = {}

-- character radius
character.r = 28

-- character color list
character.color = {
  "#b80d11",
  "#c3c512",
  "#0cba12",
  "#0bbabe",
  "#9e0ec9"
}

-- check if character is in bounds
character.inBounds = function (x, y)
  return x > character.r and x < window.x - character.r and y > character.r and y < window.y - character.r
end

return character