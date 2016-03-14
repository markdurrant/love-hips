menu = {}

menu.header = "LÖVE"
menu.footer = "game state\npaused = " .. tostring(gs.isPaused)

menu.options = {}
function menu.addOption(text, action)
  local option = {}
  option.text = text
  option.active = false
  option.action = action

  table.insert(menu.options, option)
end

menu.addOption("start", function() gs.isPaused = true end)
menu.addOption("exit", function() love.quit() end)

menu.update = function()
end

menu.draw = function()
  love.graphics.setColor({255, 255, 255})

  love.graphics.setFont(font.header)
  love.graphics.print(menu.header, 40, 40)

  local optContent = ""
  for i, v in ipairs(menu.options) do
    if v.active or i == 1 then
      optContent = optContent .. "Ø "
    else
      optContent = optContent .. "O "
    end
    optContent = optContent .. v.text .. "\n"
  end
  love.graphics.setFont(font.base)
  love.graphics.print(optContent, 40, 240)
end

return menu