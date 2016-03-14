font = {}

-- get roboto fonts
font.roboto = {
  thin = "assets/fonts/Roboto-Thin.ttf",
  light = "assets/fonts/Roboto-Light.ttf",
  regular = "assets/fonts/Roboto-Regular.ttf",
  medium = "assets/fonts/Roboto-Medium.ttf",
  bold = "assets/fonts/Roboto-Bold.ttf",
  black = "assets/fonts/Roboto-Black.ttf",

  thinItalic = "assets/fonts/Roboto-ThinItalic.ttf",
  lightItalic = "assets/fonts/Roboto-LightItalic.ttf",
  regularItalic = "assets/fonts/Roboto-Italic.ttf",
  mediumItalic = "assets/fonts/Roboto-MediumItalic.ttf",
  boldItalic = "assets/fonts/Roboto-BoldItalic.ttf",
  blackItalic = "assets/fonts/Roboto-BlackItalic.ttf"
}

-- set base font
font.base = love.graphics.newFont(font.roboto.light, 60)

font.header = love.graphics.newFont(font.roboto.thin, 180)
font.footer = love.graphics.newFont(font.roboto.thin, 60)

return font