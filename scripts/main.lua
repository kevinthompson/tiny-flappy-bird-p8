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

-- define transition table for fade transitions
custom_transition_table = [[
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
  1,1,129,129,129,129,129,129,129,129,0,0,0,0,0
  133,130,130,130,130,128,128,128,128,128,128,128,0,0,0
  3,3,3,131,131,131,131,129,129,129,129,129,0,0,0
  4,4,132,132,132,132,132,132,130,128,128,128,128,0,0
  131,131,131,1,129,129,129,129,129,129,129,0,0,0,0
  6,6,134,13,13,13,141,5,5,5,133,130,128,128,0
  7,6,6,6,134,134,134,134,5,5,5,133,130,128,0
  137,137,4,4,4,4,132,132,132,132,128,128,128,128,0
  9,9,9,4,4,4,4,132,132,132,128,128,128,128,0
  138,138,138,138,5,5,5,5,133,133,128,128,128,128,0
  139,139,3,3,3,3,3,131,129,129,129,129,0,0,0
  12,12,12,140,140,140,140,131,131,131,1,129,129,129,0
  13,13,141,141,5,5,5,133,133,130,129,129,128,128,0
  143,143,134,134,4,4,4,5,132,132,133,130,128,128,0
  15,143,143,134,134,134,134,5,5,5,133,133,128,128,0
]]

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
