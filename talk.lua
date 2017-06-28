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
end

function talk:update(dt)
end

return talk
