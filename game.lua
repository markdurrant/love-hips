game = {}

game.x = 1024
game.y = 768

game.noPlayers = love.joystick.getJoystickCount()
game.noNpcs = 20

game.isPlaying = false
game.isReady = false
game.readyCount = 0
game.deadCount = 0

return game