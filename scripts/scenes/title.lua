title_scene = scene:extend({
  init = function(_ENV)
    -- set transition table to game palette
    transition.transition_table = [[
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
