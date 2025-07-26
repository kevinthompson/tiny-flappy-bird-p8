poke(0x5f2e, 1)   -- enable alternate palette
poke(0x5f5c, 255) -- disable key repeat
poke(0x5f2c, 3)   -- set resolution to 64x64
poke(0x5f2d, 1)   -- enable devkit for keyboard & mouse

-- define cart id for saving data
cartdata("tiny_flappy_bird")

-- setup global references
global = _ENV
_noop = function()end
_after_draw = _noop

-- initialize cartridge
function _init()
	scene:load(splash_scene)
end

-- update cartridge
function _update60()
  -- track mouse state
  mouse_was_down = mouse_down or false
  mouse_down = stat(34) & 1 > 0

  -- update coroutines
  async:update()

  -- update current scene
  scene.current:update()
end

-- draw current scene
function _draw()
  scene.current:draw()
  _after_draw()
end
