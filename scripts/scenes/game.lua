game_scene = scene:extend({
  init = function(_ENV)
    global.speed = 0.5
    global.pipes = {}
    global.player = bird()
    global.score = 0
    global.scroll = 0

    sfx(2)

    _ENV:spawn_pipe()
  end,

  update = function(_ENV)
    player:update()

    if player.y > 54 or player.y < -8 then
      _ENV:end_game()
    end

    global.scroll = (scroll + speed) % 8

    for pipe in all(pipes) do
      pipe:update()

      if pipe.x < player.x + 4 and pipe.x + 7 > player.x then
        if player.y < pipe.y or player.y + 3 > pipe.y + pipe.h then
          _ENV:end_game()
        end
      elseif pipe.x < player.x and not pipe.scored then
        sfx(1)
        global.score += 1
        pipe.scored = true
      end

      if pipe.x < -8 then
        del(pipes, pipe)
        _ENV:spawn_pipe()
      end
    end
  end,

  draw = function(_ENV)
    cls(12)

    -- draw ground
    for x=-scroll,-scroll+64,8 do
      spr(1,x,56)
    end

    -- draw pipes
    for pipe in all(pipes) do
      pipe:draw()
    end

    -- score
    ? "\#1" .. score, 32 - #tostr(score) * 2, 2, 7

    player:draw()
  end,

  spawn_pipe = function(_ENV)
    local new_pipe = pipe()
    new_pipe.y = 8 + rnd(40 - new_pipe.h)\1
    add(pipes, new_pipe)
  end,

  end_game = function(_ENV)
    sfx(3)
    scene:load(game_over_scene)
  end
})