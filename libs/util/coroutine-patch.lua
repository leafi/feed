-- Patches coroutine resume funcs so errors are reported
local _coroutine_resume = coroutine.resume
function coroutine.resume(...)
  local state, result = _coroutine_resume(...)
  if not state then
    error(tostring(result), 2)
  end
  return state, result
end

function coroutine.resumeWithName(nom, ...)
  local state, result = _coroutine_resume(...)
  if not state then
    print('  ')
    print('vvvvvvvvvvvvvv')
    print('vvvv RESULTING FROM EXECUTION IN COROUTINE ' .. nom .. ' vvvv')
    print('vvvvvvvvvvvvvv')
    error(tostring(result), 2)
  end
  return state, result
end
