local talk = {
  active = false,
  bg = {
    a2 = 240,
    a3 = 225,
    bottomborder = 100,
    topborder = 25,
    y = 750
  },
  tx = {
    top = 50,
    bottom = 50,
    left = 150,
    right = 100
  },
  c1 = {255, 255, 255, 255},
  c2dark = {52, 11, 74, 255},
  c2light = {104, 22, 148, 255},
  ctx = {
    drag = 8,
    head = 4,
    hh = 8,
    sz = 24,
    x = 1840,
    y = 1035,
  },
  queue = {}
}
I.talk = talk

function talk:load()

end

function talk:draw()
  util.drawrectv(0, self.bg.y - self.bg.topborder, 1920, self.bg.topborder, {0, 0, 0, 0}, {0, 0, 0, self.bg.a2})
  util.drawrectv(0, self.bg.y, 1920, 1080 - self.bg.y - self.bg.bottomborder, {0, 0, 0, self.bg.a2}, {0, 0, 0, self.bg.a2})
  if self.bg.bottomborder > 0 then
    util.drawrectv(0, 1080 - self.bg.bottomborder, 1920, self.bg.bottomborder, {0, 0, 0, self.bg.a2}, {0, 0, 0, self.bg.a3})
  end

  local p1x = talk.ctx.x - talk.ctx.sz
  local py = talk.ctx.y - talk.ctx.sz
  local p2x = talk.ctx.x + talk.ctx.sz
  local phy = py - talk.ctx.head

  local pyd = py + talk.ctx.drag
  local ctxyd = talk.ctx.y + talk.ctx.drag

  love.graphics.setColor(talk.c2light)
  love.graphics.polygon('fill', p1x, pyd, p1x, phy, p2x, phy, p2x, pyd, talk.ctx.x, ctxyd)

  util.drawrectv(p1x, py - talk.ctx.head - talk.ctx.hh, talk.ctx.sz * 2, talk.ctx.hh, {talk.c1[1], talk.c1[2], talk.c1[3], 0}, talk.c1)
  love.graphics.setColor(talk.c1)
  love.graphics.polygon('fill', p1x, py, p1x, phy, p2x, phy, p2x, py, talk.ctx.x, talk.ctx.y)
end

function talk:update(dt)
end

return talk
