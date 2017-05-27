
function util.clamp(val, min, max)
  if val < min then
    return min
  elseif val > max then
    return max
  else
    return val
  end
end

function util.eps(x, eps)
  eps = eps or 2
  return math.abs(x) < eps
end

function util.normalise(x, y)
  if x == 0 and y == 0 then
    return 0, 0
  end

  local norm = (x^2 + y^2)^0.5
  return x/norm, y/norm
end

function util.round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function util.sawtooth(t)
  return 2*(t - math.floor(t + 0.5))
end

function util.triangle(t)
  return math.abs(util.sawtooth(t))
end

function util.sign(x)
  if x == 0 then
    return 0
  end

  return (x > 0) and 1 or -1
end

function util.within(x1, y1, x2, y2, eps)
  eps = eps or 0.1
  return (((x1-x2)^2 + (y1-y2)^2)^0.5) < eps
end
