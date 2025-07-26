title_scene = scene:extend({
  init = function(_ENV)
    pal(split("1,133,3,4,131,6,7,137,9,138,139,12,13,143,15,0"), 1)

    -- get high score
    best = dget(0)

    -- initialize button
    play_button = button({
      y = best > 0 and 42 or 40,
      text = "❎ pLAY",
    })
  end,

  update = function(_ENV)
    -- load game if any button pressed
    if input() then
      scene:load(game_scene)
    end
  end,

  draw = function(_ENV)
    cls(12)

    -- draw high score
    if best > 0 then
      local str = "best " .. tostr(best)
      ? "\#1" .. str, 32 - #str * 2, 2, 7
    end

    -- draw title
    local ty = best > 0 and 11 or 7
    spr(7,15,ty,2,1)
    spr(16,12,ty + 4,5,3)

    -- draw "button"
    play_button:draw()

    local pipes = {
      pipe({ x = 2, y = 6, h = 6 }),
      pipe({ x = 54, y = 42, h = 8 })
    }

    for p in all(pipes) do
      p:draw()
    end

    -- draw floor
    for x=0,56,8 do
      spr(1,x,56)
    end
  end
})
