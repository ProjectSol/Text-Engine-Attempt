textEngine = {}
Box = {}

function textEngine:newTextBox()
  Box = {}
  Box.__index = Box

  function Box.new(w, h, x, y )
    return setmetatable({
      w = w or 500,
      h = h or 300,
      x = x or 0,
      y = y or lg:getHeight()-300}, Box)
  end

  a = Box(500, 300)
end

function textEngine:boxTest(tbl)
  lg.rectangle('line', tbl.x+1, tbl.y-1, tbl.w, tbl.h)
end

function textEngine:textRenderBasic(tbl)
  for i = 1,#delayedText do
		textDraw:delayDraw(i, 10, 11*i)
	end
end

setmetatable(Box, { __call = function(_, ...) return Box.new(...) end })

return textEngine
