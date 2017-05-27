(To be updated (read: completed) properly eventually.)

30log-clean.lua: no mods, luacheck blacklisted (warnings benign)
cron.lua: no mods
inspect.lua: no mods
interlu.lua: no mods except some typo bugfix someone pointed out & cleaned for luacheck
ProFi.lua: no mods(?), luacheck blacklisted (too complicated)

======
persistence.lua
======

Messed with a lot by me (leaf). It wouldn't be reasonable to upgrade this library
if a new version became available.

We ensure tables are outputted sorted on keys. We also exclude table entries
when the key is a string and the value is nil.

We also skip any table entry whose value is a function (whereas the original code
could serialize simple functions).

Additionally, we skip any table entry whose key begins with three underscores (___).

======
LOVE Frames
======

(Luacheck blacklisted... too complicated)

Originally from Kenney Shields, now from https://github.com/cyborgize/LoveFrames
Commit d22546b Apr 7 2016

It would be possible to upgrade this library.

Patch we need to LoveFrames/init.lua:

In loveframes.update() change:

if loveframes.config["ENABLE_SYSTEM_CURSORS"] then 

To:

if loveframes.hoverobject and loveframes.config["ENABLE_SYSTEM_CURSORS"] then

This could be replaced with messing with the loveframes.config metatable from the outside, I guess.

=====
strict.lua
=====

Modified to only errors on reads from undefined globals. Not writes.

Could probably change it back, but this was necessary in a previous project.

Use Luacheck! We got a .luacheckrc!!
