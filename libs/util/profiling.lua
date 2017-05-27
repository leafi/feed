-- Glorified ProFi wrapper
-- mostly just to keep this junk out of main.lua...

local ProFi = require('libs.3rdparty.ProFi')
local profiling = false

function util.isprofiling()
  return profiling
end

function util.startprofiling()
  if profiling then error('already started profiling') end
  ProFi:start()
  profiling = true
end

function util.finishprofiling(path)
  if not profiling then error('cannot finish profiling when we did not start') end
  ProFi:stop()
  ProFi:writeReport(path)
end
