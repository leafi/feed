-- Declares global 'util'.
util = {}

-- Stop allowing reads from undefined globals
require('libs.3rdparty.strict')

-- Patch coroutine resume funcs
--  coroutine.resume(...)
--  coroutine.resumeWithName(name, ...)
require('libs.util.coroutine-patch')

--  table.containsv(t, v)
--  table.deepcopy(from, maybeTo)
--  table.getsortedkeys(t)
--  table.ifind(t, v)
--  table.pack(...)
require('libs.util.table-patch')

-- 30log is for classes
util.class = require('libs.3rdparty.30log-clean')

-- Draw rectangle with vertical color gradient
--  util.drawrectv(x, y, w, h, colorTop, colorBottom)
util.drawrectv = require('libs.util.drawrectv')

-- Iconfont!
--  util.iconfont(text, sz)
util.iconfont = require('libs.util.iconfont')

-- Break to live lua console & mess with _G['inspectables']/_G['I'] support
-- (Needs table.pack from table-patch)
--  util.breaktoconsole()
--  util.forceconsoleresume()
--  util.inspect(...)
require('libs.util.inspectables')

--  util.after(duration, fun)
--  util.updateclocks(dt)
require('libs.util.clocks')

--  util.startswith(s, prefix)
require('libs.util.misc')

--  util.clamp(v, min, max)
--  util.eps(x, eps)
--  util.normalise(x, y)
--  util.round(num, idp)
--  util.sawtooth(x)
--  util.triangle(x)
--  util.sign(x)
--  util.within(x1, y1, x2, y2, maybeEps)
require('libs.util.num')

--  util.isprofiling()
--  util.startprofiling()
--  util.finishprofiling(filename)
require('libs.util.profiling')

return util
