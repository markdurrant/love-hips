window = {}

-- set window dimensions (* 2 for retina)
window.x = 1024 * 2
window.y = 768 * 2

-- set window props
window.setWindow = function ()
  love.window.setMode(window.x / 2, window.y / 2, {
    fullscreen = false,
    msaa = 4,
    highdpi = true
  })
  love.graphics.setBackgroundColor(util.hex2rgb("#282d3d"))
end

return window