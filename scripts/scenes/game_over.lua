game_over_scene = scene:extend({
  init = function(_ENV)
    -- update high score
    if dget(0) < score then
      dset(0, score)
    end

    -- initialize button
    again_button = button({
      y = 42,
      text = "❎ aGAIN",
    })

    -- disable input for 30 frames so player
    -- doesn't skip game over screen
    input_enabled = false
    async(function()
      wait(30)
      input_enabled = true
    end)
  end,

  update = function(_ENV)
    -- load title screen on any input
    if input_enabled and input() then
      scene:load(title_scene)
    end
  end,

  draw = function(_ENV)
    -- draw game scene
    game_scene.draw(_ENV)

    -- draw game over
    spr(21,16,13,4,3)
    if (input_enabled) again_button:draw()
  end
})
