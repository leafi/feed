local AQC = util.class('AQC', {
  ax = 50,
  ay = 50,
  bx = 100,
  by = 200,
  cx1 = 75,
  cy1 = 75,
  cx2 = 75,
  cy2 = 75
})

-- animated quadratic curve.
-- allows animating the control point between two given positions, yeah?

function AQC:init()
  self.selected = nil
  self.curve = love.math.newBezierCurve(
    self.ax,
    self.ay,
    self.cx1,
    self.cy1,
    self.bx,
    self.by
  )
end

local function curvepc(curve, i, x, y)
  local ox, oy = self.curve:getControlPoint(i)
  if (ox ~= x) or (oy ~= y) then self.curve:setControlPoint(i, x, y) end
end

function AQC:_checkupdate()
  curvepc(self.curve, 1, self.ax, self.ay)
  curvepc(self.curve, 2, self.cx1, self.cy1)
  curvepc(self.curve, 3, self.bx, self.by)
end

function AQC:debugdraw()
  self:_checkupdate()

  love.graphics.setColor(50, 50, 50, 128)
  love.graphics.line(self.ax, self.ay, self.cx1, self.cy1)
  love.graphics.line(self.cx1, self.cy1, self.bx, self.by)

  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.line(self.curve:render())

  -- highlight the points and that, innit
  love.graphics.setColor(255, 0, 0, 255)
  love.graphics.circle('line', self.ax, self.ay, 4)
  love.graphics.circle('line', self.bx, self.by, 4)
  love.graphics.circle('fill', self.cx1, self.cy1, 2)
end

function AQC:mousedown(x, y)
  if (x >= self.ax - 1) and (x <= self.ax + 1) and (y >= self.ay - 1) and (y <= self.ay + 1) then
    self.selected = 'a'
  elseif (x >= self.bx - 1) and (x <= self.bx + 1) and (y >= self.by - 1) and (y <= self.by + 1) then
    self.selected = 'b'
  elseif (x >= self.cx1 - 1) and (x <= self.cx1 + 1) and (y >= self.cy1 - 1) and (y <= self.cy1 + 1) then
    self.selected = 'c1'
  else
    return false
  end
  return true
end

function AQC:mousemove(x, y)
  if self.selected == 'a' then
    self.ax = x
    self.ay = y
  elseif self.selected == 'b' then
    self.bx = x
    self.by = y
  elseif self.selected == 'c1' then
    self.cx1 = x
    self.cy1 = y
  else
    return false
  end
  return true
end

function AQC:mouseup(x, y)
  if self.selected ~= nil then
    self.selected = nil
    return true
  end
end

return AQC
