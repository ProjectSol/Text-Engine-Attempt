textDraw = {}
delayedText = {}
text = ''
fullText = {}
utf8 = require("utf8")
font = love.graphics.newFont()
rasterizer = love.font.newRasterizer( "assets/good times rg.ttf" )
defaultTextFont = love.graphics.newFont(rasterizer)
defaultTextFont:setFilter( 'nearest', 'nearest', 1 )
debugFont = love.graphics.newFont("assets/good times rg.ttf", 36)
smolFont = love.graphics.newFont("assets/good times rg.ttf", 8)
smolFont:setFilter( 'nearest', 'nearest', 1 )
globalTextSpeed = 30

function textDraw:delayedNewText(string, subs)
  if subs then

  else
    subs = #fullText+1
  end
  tbl = {complete = false}
  table.insert(delayedText, tbl)
  table.insert(fullText, text)
  for i = 1,string.len(string) do
    local e = string.sub(string, i, i)
    table.insert(delayedText[subs], e)
  end
  t = love.timer:getTime()
end

function textDraw:delayDraw(subs, x, y, Font, Speed, Colour)
  if Font == nil then
    Font = defaultTextFont
  end
  if Speed == nil then
    Speed = 1/globalTextSpeed
  else
    Speed = 1/Speed
  end
  if Colour == nil then
    Colour = {255,255,255}
  end
  q = love.timer:getTime()
  love.graphics.setFont(Font)
  love.graphics.setColor(Colour)
  love.graphics.print(fullText[subs], x, y)
  for i = 1,#delayedText[subs] do
    if not delayedText[subs].complete then
      if q >= t + i*Speed then
        if delayedText[subs][i] then
          fullText[subs] = fullText[subs]..delayedText[subs][i]
          delayedText[subs][i] = false
        end
      end
    end
  end
end

function textDraw:textDraw(array)

end


return textDraw
