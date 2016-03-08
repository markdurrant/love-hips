game = {}

game.x = 500
game.y = 500

game.noPlayers = love.joystick.getJoystickCount()
game.noNpcs = 20

game.isPlaying = false
game.isReady = false
game.readyCount = 0

return game