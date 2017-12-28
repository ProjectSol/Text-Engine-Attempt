textEngine = {}
tBox = {}

function textEngine:newTextBox(w,h,x,y,txtTbl)
  tBox = {}
  tBox.__index = tBox

  function tBox.new(w, h, x, y,txtTbl )
    local doot = {
      w = w or 500,
      h = h or 300,
      x = x or 0,
      y = y or lg:getHeight()-300,
      txtTbl = txtTbl or {}
      }
    return setmetatable(doot,tBox)
  end

  function tBox.setText(tbl)
    for i = 2,#tbl.txtTbl+1 do
      local wraps = math.floor(Font:getWidth(tbl.txtTbl[i-1])/tbl.w)
    end
    rawset(tBox, txtTbl, setText)
  end

  function tBox.drawText(tbl)
    for i = 1,#tbl.txtTbl do
      love.graphics.printf(tbl.txtTbl[i], tbl.x+2, tbl.y+40*(i-1), tbl.w, left)
    end
  end

  function tBox.tBoxTest(tbl)
    lg.rectangle('line', tbl.x+1, tbl.y-1, tbl.w, tbl.h)
    --love.graphics.printf(tostring(love.timer.getTime()).." "..tbl[i], x+tBox.x, y+tBox.y, tBox.w, left)
  end

  local tbl = tBox.new(w, h, x, y, txtTbl)
  tbl.setText()
  return tbl
end

function textEngine:insertNewText(box, string)

end


function textEngine:textRenderBasic(tbl)
  for i = 1,#delayedText do
		textDraw:undelayDraw(i, 10, 11*i)
	end
end

function textEngine:textRenderDelayBasic(tbl)
  for i = 1,#delayedText do
		textDraw:delayDraw(i, 10, 11*i)
	end
end

return textEngine
