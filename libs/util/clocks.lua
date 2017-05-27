local cron = require('libs.3rdparty.cron')

local clocks = {}

function util.after(duration, callback)
  local clock = cron.after(duration, callback)
  clock.stop = function()
    local ci = table.ifind(clocks, clock)
    if ci then table.remove(clocks, ci) end
  end
  table.insert(clocks, clock)
  return clock
end

function util.updateclocks(dt)
  if #clocks > 0 then
    local toremove = {}
    for k,v in ipairs(clocks) do
      if v:update(dt) then
        table.insert(toremove, k)
      end
    end
    for k,v in ipairs(toremove) do
      table.remove(clocks, v)
    end
  end
end
