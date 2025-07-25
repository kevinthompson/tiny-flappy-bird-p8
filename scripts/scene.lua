scene = game_object:extend({
  load = function(_ENV, new_scene)
    if new_scene != current then
      current = new_scene
      current:init()
    end
  end
})
