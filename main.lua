require 'text/textDraw'
require 'text/textEngine'

function love.load()
	lg = love.graphics
	messages = {}
	messages[1] = "The quick brown fox is honestly kind of a cunt and I would really just hope that he stops"
	for i = 1,400 do
		messages[i] = 'gskdfhgljdsnl'
	end
	textEngine:textRender(messages)
	for i = 1,#messages do
		textDraw:delayedNewText(messages[i])
	end
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
l=0
function love.mousepressed(x, y, button, isTouch)
	l = l+1
	textDraw:delayedNewText(tostring(l))
end

function love.draw()
	for i = 1,#delayedText do
		textDraw:delayDraw(i, 10, 30*i)
	end
  if debug then
		love.graphics.setColor(255, 255, 255)
		love.graphics.setFont(font)
		fps = tostring(love.timer.getFPS())
		love.graphics.print("Current FPS: "..fps, 9, 10)
	end
end
