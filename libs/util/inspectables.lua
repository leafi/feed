-- Live inspector support - press CTRL+Z in-game to break to the console!
-- Have a look at & modify things in the inspectables table, then press CTRL+D to resume the game.
inspectables = {}
I = inspectables

util.inspect = require('libs.3rdparty.inspect')
local interlu = require('libs.3rdparty.interlu')

interlu.intercept = function(line)
  if line == 'step' or line == 'next' then return 'I.step()' end
  return line
end

function util.breaktoconsole()
  print('--')
  print('!!! INTERRUPTING (in-game ^Z) !!!')
  print('Use ^D in console when done.')
  print('--')
  for k,v in pairs(inspectables) do
    print('I.' .. k .. ':', util.inspect(v))
  end
  interlu.interact()
  print('Resuming...')
end

function util.forceconsoleresume()
  interlu.forcebreak = true
end
