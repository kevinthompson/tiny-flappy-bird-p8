async = class:extend({
  coroutines = {},

  __call = function(_ENV, key, func)
    if type(key) == "function" then
      func = key
      key = nil
    end

    if (key != nil) _ENV:delete(key)
    return add(coroutines, { key, cocreate(func) })
  end,

  init = function(_ENV)
    _ENV:reset()
  end,

  reset = function(_ENV)
    coroutines = {}
  end,

  update = function(_ENV, routines)
    for r in all(coroutines) do
      if costatus(r[2]) != "dead" then
        assert(coresume(r[2]))
      else
        del(coroutines, r)
      end
    end
  end,

  delete = function(_ENV, key_or_routine)
    if type(key_or_routine) == "string" then
      for r in all(coroutines) do
        if r[1] == key_or_routine then
          del(coroutines, r)
        end
      end
    else
      del(coroutines, routine)
    end
  end
})

function wait(frames)
  for i = 1, frames do
    yield()
  end
end