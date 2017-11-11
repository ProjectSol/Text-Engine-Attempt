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

function textDraw:delayedNewText(string, subs)
  if fullText[subs] then
    fullText[subs] = ''
  end
  tbl = {}
  table.insert(delayedText, tbl)
  table.insert(fullText, text)
  --table.insert(done, tbl)
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
    Speed = globalTextSpeed
  end
  q = love.timer:getTime()
  love.graphics.setFont(Font)
  love.graphics.setColor(Colour or 255, 255, 255, 255)
  love.graphics.print(fullText[subs], x, y)
  for i = 1,#delayedText[subs] do
    if q >= t + i*speed then
      if delayedText[subs][i] then
        fullText[subs] = fullText[subs]..delayedText[subs][i]
        delayedText[subs][i] = false
      end
    end
  end
end

function textDraw:textDraw(array)

end


return textDraw
