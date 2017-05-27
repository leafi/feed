-- Imports loads of stuff, adds convenience funcs, declares globals, enables strict
require('libs.util')

-- if enabled, profile game & write results to ProFi.txt on quit (SLOW)
local enableProfiling = false

local currentstate = {}

function love.load()
  if enableProfiling then util.startprofiling() end

  if currentstate.load then currentstate.load() end
end

function love.keyreleased(key, scancode)
  if currentstate.keyreleased then currentstate:keyreleased(key, scancode) end
end

function love.keypressed(key, scancode, isrepeat)
  if love.keyboard.isDown('z') and (love.keyboard.isDown('lctrl') or love.keyboard.isDown('rctrl')) then
    util.breaktoconsole()
  end

  if currentstate.keypressed then currentstate:keypressed(key, scancode, isrepeat) end
end

function love.textinput(text)
  if currentstate.textinput then currentstate:textinput(text) end
end

function love.mousepressed(x, y, button, istouch)
  if currentstate.mousepressed then currentstate:mousepressed(x, y, button, istouch) end
end

function love.mousemoved(x, y, dx, dy, istouch)
  if currentstate.mousemoved then currentstate:mousemoved(x, y, dx, dy, istouch) end
end

function love.mousereleased(x, y, button, istouch)
  if currentstate.mousereleased then currentstate:mousereleased(x, y, button, istouch) end
end

function love.threaderror(thread, errorstr)
  print('  ')
  print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvv')
  print("ERROR ON THREAD!!!\n\n" .. errorstr)
  print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^')
  print('  ')
  error("\n\nERROR ON THREAD!!!\n\n" .. errorstr)
end

function love.update(dt)
  -- <15 fps? fuck it; slow down.
  if dt > 1/15 then dt = 1/15 end

  util.updateclocks(dt)

  if currentstate.update then currentstate:update(dt) end

  --collectgarbage("step", 1)
end

function love.draw()
  local desiredAspect = 1280/720
  local actualAspect = love.graphics.getWidth()/love.graphics.getHeight()
  if actualAspect > desiredAspect then
    local xoff = love.graphics.getWidth() - (desiredAspect * love.graphics.getHeight())
    --love.graphics.setScissor(math.floor(xoff/2), 0, love.graphics.getWidth() - xoff, love.graphics.getHeight())
    love.graphics.translate(math.floor(xoff/2), 0)
    love.graphics.scale(desiredAspect * love.graphics.getHeight() / 1280, love.graphics.getHeight() / 720)
  else
    local yoff = love.graphics.getHeight() - (love.graphics.getWidth()/desiredAspect)
    --love.graphics.setScissor(0, math.floor(yoff/2), love.graphics.getWidth(), love.graphics.getHeight() - yoff)
    love.graphics.translate(0, math.floor(yoff/2))
    love.graphics.scale(love.graphics.getWidth() / 1280, (love.graphics.getWidth()/desiredAspect)/720)
  end
  -- !! DRAW !!
end

function love.quit()
  if util.isprofiling() then util.finishprofiling('ProFi.txt') end
end
