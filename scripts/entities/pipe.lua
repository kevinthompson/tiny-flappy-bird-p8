pipe = game_object:extend({
  x = 64,
  y = 16,
  h = 16,

  update = function(_ENV)
    -- move pipe by global speed
    x -= global.speed
  end,

  draw = function(_ENV)
    -- draw both pipe segments
    sspr(16, 5, 8, 1, x, 0, 8, y - 8)
    spr(2, x, y - 8, 1, 1, false, true)
    spr(2, x, y + h)
    sspr(16, 5, 8, 1, x, y + h + 8, 8, 56 - (y + h + 8))
  end
})
