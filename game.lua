game = {}

game.x = 1024
game.y = 768

game.noPlayers = love.joystick.getJoystickCount()
game.noNpcs = 100

game.isPlaying = false
game.isReady = false
game.readyCount = 0
game.deadCount = 0

game.playerColors = {
  {66, 126, 159},
  {119, 77, 133},
  {105, 142, 68},
  {209, 167, 114},
  {195, 114, 75}
}

return game