bird = game_object:extend({
  x = 20,
  y = 16,

  ys = 0,
  frames = {4,4,5,6,6,3},
  frame = 4,

  update = function(_ENV)
    frame = min(frame + .5, #frames)
    ys += 0.05

    if input() then
      sfx(0)
      ys -= 2
      frame = 1
    end

    ys = mid(-1, ys, 2)
    y += ys
  end,

  draw = function(_ENV)
    spr(frames[frame\1],x,y)
  end
})
