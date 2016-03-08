controller = {}

controller.speed = 1
controller.coolDown = 1

for i = 1, game.noPlayers do
  c = {}
  c.joy = love.joystick.getJoysticks()[i]
  c.x = 0
  c.y = 0
  c.coolDownTimer = 0
  c.isCool = true
  table.insert(controller, c)
end

return controller