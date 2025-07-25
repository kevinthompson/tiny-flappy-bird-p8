splash_scene = scene:extend({
  init = function(_ENV)
    -- splash palette
    -- pal({129,128,3,4,5,134,7,132,9,135,11,12,13,143,15,0},1)

    -- set transion table to palette
    transition.transition_table = [[
      0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
      129,129,129,129,129,129,129,0,0,0,0,0,0,0,0
      128,128,128,128,128,128,128,0,0,0,0,0,0,0,0
      3,3,3,131,131,131,131,129,129,129,129,129,0,0,0
      4,4,132,132,132,132,132,132,130,128,128,128,128,0,0
      5,5,133,133,133,133,130,130,128,128,128,128,128,0,0
      134,134,141,5,5,5,5,133,133,133,130,128,128,128,0
      7,6,6,6,134,134,134,134,5,5,5,133,130,128,0
      132,132,132,130,130,130,128,128,128,128,128,128,0,0,0
      9,9,9,4,4,4,4,132,132,132,128,128,128,128,0
      135,135,135,134,134,134,134,5,5,5,133,133,128,128,0
      11,139,139,139,139,3,3,3,3,129,129,129,0,0,0
      12,12,12,140,140,140,140,131,131,131,1,129,129,129,0
      13,13,141,141,5,5,5,133,133,130,129,129,128,128,0
      143,143,134,134,4,4,4,5,132,132,133,130,128,128,0
      15,143,143,134,134,134,134,5,5,5,133,133,128,128,0
    ]]

    -- draw static elements
    cls(9)

    -- avatar position
    local scale = peek(0x5f2c) == 3 and 0.5 or 1
    local ax, ay = 24, 38
    local points = split("55,71;24,71;22,69;22,50;24,48;103,48;105,50;105,69;103,71;56,71;56,56", ";")

    -- configure resolution
    if scale == 1 then
      rectfill(56, 49, 104, 56, 10)
      print("made by", 66, 50, 9)
      printc("MADEBYKEVIN.COM", 119, 10)
    else
      ax = 17
      ay = 2
      points = split("19,44;45,44;46,45;46,51;45,52;19,52;18,51;18,45", ";")
      rectfill(19, 45, 45, 51, 10)
      print("made\^x2 \^x4by", 20, 46, 9)
    end

    -- draw border
    local pi = 2
    for pi = 2, #points do
      local px, py = unpack(split(points[pi - 1]))
      local x, y = unpack(split(points[pi]))
      line(px, py, x, y, 10)
    end

    -- draw avatar
    avatar="0007777777770000000000000000000000778888222770000000000000000000077822222222777707777770000000000782222222222227778888770000000007822222222222222822222700000000072222222222222222222227777000000772222288822222222222222277000000772228222222222222222222270000007722222222222228882222222740000778222222222222822222222227400007822222222222222222222222274000072222222222222222222222227740000772222222222222222222222227700000772222222222222222222282227700000722fffffffffff2222228222227000077ffffffffffffffff222822222740007ffffffffffffffffff2222222274007782228fffff822228fff22222277400782222fffffff222228ff2222227440072fffffffffffffff28ff2222777440077fffffffffffffffffff2222774400007fff11ffffff11ffffff22fff77400007fff11fffeff11ffffff2feeef7000007fff11ffeeff11ffffff6eeeef7400007fff11ffeeff11fffff66eefef7400007fffffffeefffffffff66fefff7400007ffffffeeefffffffff66fefff7400007ffffffeeeeffffff6666efff774000076ffffff66ffff6666666fff77440000766ffff666666666666667777444000076666666666666666666674444400000776666666666eff66666774444000000076666feeeeeff6666667440000000000776666ff66ff666666774400000000000776666666666666677440000000000004776666666666677744400000000000004777666666677744440000000000000004477666677744444000000000000000004477777744444000000000000000000000444444444000000000000000000000000444444000000000000000"
    for i=1,#avatar do
			if avatar[i] != "0" then
        pset(ax+(i-1)%32,ay+(i-1)\32,tonum(avatar[i],0x1))
			end
		end

    -- trigger fade in
    transition:fade_in()

    -- call name drawing function
    async(function()
      local weight = 1
      local points = split("67,58;63,66;59,72,1;62,69;71,63,1;62,69;68,67;69,67,0;70,68,1;73,68;74,66;73,68;77,68,0;78,67;79,66,1;80,68,0;82,68,0;83,66,1;83,68;86,67;90,66;91,68;97,68,0;100,67;102,65", ";")
      local current = split(points[1])
      local ox, oy = 0, 0

      if scale != 1 then
        ox = -51
        oy = -12
      end

      wait(30)

      -- play jingle
      sfx(63)

      for i = 2, #points do
        local point = split(points[i])
        local steps = 45
        for j = 1, steps do
          local x = lerp(current[1], point[1], j / steps)
          local y = lerp(current[2], point[2], j / steps)
          weight = current[3] or weight
          rectfill(ox + x, oy + y, ox + x + weight, oy + y + weight, 7)
          if (j % 20 == 0) yield()
        end
        current = point
      end

      wait(30)

      _ENV:load_next_scene()
    end)
  end,

  update = function(_ENV)
    if input() and not loading then
      async:reset()
      sfx(-1)
      _ENV:load_next_scene()
    end
  end,

  load_next_scene = function(_ENV)
    loading = true
    transition(function()
      transition.transition_table = transition.default_transition_palette
      scene:load(title_scene)
    end)
  end
})