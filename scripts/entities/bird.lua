bird = game_object:extend({
  -- position
  x = 20,
  y = 16,

  -- speed
  ys = 0,

  -- animation
  frames = {4,4,5,6,6,3},
  frame = 4,

  update = function(_ENV)
    -- update animation
    frame = min(frame + .5, #frames)

    -- apply gravity
    ys += 0.05

    -- flap
    if input() then
      sfx(0)
      ys -= 2
      frame = 1
    end

    -- restrict speed
    ys = mid(-1, ys, 2)

    -- move character
    y += ys
  end,

  draw = function(_ENV)
    spr(frames[frame\1],x,y)
  end
})
