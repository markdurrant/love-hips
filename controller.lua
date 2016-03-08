controller = {}

controller.speed = 10

controller.one = {}
controller.one.joy = love.joystick.getJoysticks()[1]
controller.one.x = 0
controller.one.y = 0

controller.two = {}
controller.two.joy = love.joystick.getJoysticks()[2]
controller.two.x = 0
controller.two.y = 0

controller.three = {}
controller.three.joy = love.joystick.getJoysticks()[3]
controller.three.x = 0
controller.three.y = 0

controller.four = {}
controller.four.joy = love.joystick.getJoysticks()[4]
controller.four.x = 0
controller.four.y = 0


return controller