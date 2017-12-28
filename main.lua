require 'text/textDraw'
require 'text/textEngine'

function love.load()
	lg = love.graphics
	messages = {}
	table.insert(messages,"The quick brown fox")
	table.insert(messages,"Yeah, the park should be good")
	table.insert(messages,"This is text for message 3")
	table.insert(messages,"This is text for message 4")
	table.insert(messages,"Ah yes, text, my favourite")
	table.insert(messages,"Words Words Words Words Words Words Words Words Words Words Words Words Words Words Words Words Words Words Words Words Words Words Words Words Words ")
	a = nil
	debugText = textEngine:newTextBox(250,300,0,lg:getHeight()-300,messages)
	--debugText:setText(messages)
	textEngine:insertNewText(debugText)
	--[[for i = 1,#messages do
		textDraw:delayedNewText(messages[i])
	end]]
end

function checkCollision(x1,y1,w1,h1, x2,y2,w2,h2)
	return x1 + w1 > x2 and
		y1 + h1 > y2 and
		x1 < x2 + w2 and
		y1 < y2 + h2
end

function love.update(dt)
	worldX, worldY = love.mouse.getPosition()
end
--[[l = 0
function love.mousepressed(x, y, button, isTouch)
	l = l+1
	textDraw:delayedNewText(tostring(l))
end]]

function love.draw()
	--textEngine:textRenderBasic()
	debugText:tBoxTest(debugText)
	debugText:drawText(debugText)
  if debug then
		love.graphics.setColor(255, 255, 255)
		love.graphics.setFont(font)
		fps = tostring(love.timer.getFPS())
		love.graphics.print("Current FPS: "..fps, 9, 10)
	end
end
