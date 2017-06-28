-- Adds function for drawing rectangle with vertical gradient (via shader)

local vertexSrc = [[
  vec4 position(mat4 transform_projection, vec4 vertex_position)
  {
    return transform_projection * vertex_position;
  }
]]

local pixelSrc = [[
  uniform vec4 colorTop;
  uniform vec4 colorBottom;

  vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords)
  {
    vec4 texturecolor = Texel(texture, texture_coords);
    // return texturecolor * color * mix(colorTop, colorBottom, texture_coords.y);
    return texturecolor * mix(colorTop, colorBottom, texture_coords.y);
  }
]]

local shader = love.graphics.newShader(pixelSrc, vertexSrc)

local whitetex = love.graphics.newImage(love.image.newImageData(2, 2, string.rep(string.char(255), 16)))

-- resets shader!!!
return function (x, y, w, h, colorTop, colorBottom)
  love.graphics.setShader(shader)

  shader:sendColor('colorTop', colorTop)
  shader:sendColor('colorBottom', colorBottom)

  -- can't use love.graphics.rectangle b/c we need texture coords to work out where we are
  love.graphics.draw(whitetex, x, y, 0, w / 2, h / 2)

  love.graphics.setShader()
end
