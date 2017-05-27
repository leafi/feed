function util.startswith(s, pfx)
  return string.sub(s, 1, #pfx) == pfx
end
