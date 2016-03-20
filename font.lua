font = {}

-- get source code pro fonts
font.scp = {
  extraLight = "assets/fonts/SourceCodePro-ExtraLight.ttf",
  light = "assets/fonts/SourceCodePro-Light.ttf",
  regular = "assets/fonts/SourceCodePro-Regular.ttf",
  medium = "assets/fonts/SourceCodePro-Medium.ttf",
  semibold = "assets/fonts/SourceCodePro-Semibold.ttf",
  bold = "assets/fonts/SourceCodePro-Bold.ttf",
  black = "assets/fonts/SourceCodePro-Black.ttf",

  extraLightIt = "assets/fonts/SourceCodePro-ExtraLightIt.ttf",
  lightIt = "assets/fonts/SourceCodePro-LightIt.ttf",
  regularIt = "assets/fonts/SourceCodePro-It.ttf",
  mediumIt = "assets/fonts/SourceCodePro-MediumIt.ttf",
  semiboldIt = "assets/fonts/SourceCodePro-SemiboldIt.ttf",
  boldIt = "assets/fonts/SourceCodePro-BoldIt.ttf",
  blackIt = "assets/fonts/SourceCodePro-BlackIt.ttf"
}

-- set base font
font.base = love.graphics.newFont(font.scp.medium, 60)

font.header = love.graphics.newFont(font.scp.light, 180)
font.footer = love.graphics.newFont(font.scp.light, 60)

return font