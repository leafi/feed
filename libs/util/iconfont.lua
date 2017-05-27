local iconfontBySize = {}

return function(tex, sz)
  local rsz = util.round(sz)
  if not iconfontBySize[rsz] then
    iconfontBySize[rsz] = {
      cache = {},
      font = love.graphics.newFont('data/fonts/materialdesignicons-webfont.ttf', rsz)
    }
  end

  local fntc = iconfontBySize[rsz]

  if not fntc.cache[tex] then
    fntc.cache[tex] = love.graphics.newText(fntc.font, tex)
  end

  return fntc.cache[tex]
end
