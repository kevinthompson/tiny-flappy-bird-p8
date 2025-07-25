-- parent class for objects with lifecycle loop
game_object = class:extend({
  init = noop,
  update = noop,
  draw = noop
})
