-- linear interpolation
function lerp(a,b,t)
  return a+(b-a)*t
end

-- print centered
function printc(str,y,clr,w)
  w=w or 4
  local center = peek(0x5f2c) == 3 and 32 or 64
	local x=peek2(0x5f28) + center - (#str*w)/2
	print(str,x,peek2(0x5f2a) + y,clr)
end

-- input detection helpers
function input()
  return any_button() or click()
end

function any_button()
  return btnp() > 0
end

function click()
  return not mouse_was_down and mouse_down
end