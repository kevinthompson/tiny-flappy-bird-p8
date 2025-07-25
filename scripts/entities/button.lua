button = game_object:extend({
  -- draw a button based on initialized values
  draw = function(_ENV)
    local width = width or (#text * 4) + 10
    local x = x or 32 - width / 2

    rect(x,y,x + width,y+11,2)
    rect(x+1,y+1,x+width-1,y+10,7)
    rectfill(x+2,y+2,x+width-2,y+9,8)
    print(text,x+4,y+4,4)
    print(text,x+4,y+3,7)
  end
})
