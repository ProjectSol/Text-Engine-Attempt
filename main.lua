require 'TextDelay/textDraw'

function love.load()
	lg = love.graphics
	messages = {}
	messages[1] = "The quick brown fox is honestly kind of a cunt and I would really just hope that he stops"
	messages[2] = "Yeah, the park should be good"
	messages[3] = "This is text for message 3"
	messages[4] = "This is text for message 4"
	messages[5] = "Ah yes, text, my favourite"
	textDraw:textRender(messages)
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

textDraw:delayedNewText('this is text', 1)

function love.draw()

  if debug then
		love.graphics.setColor(255, 255, 255)
		love.graphics.setFont(font)
		fps = tostring(love.timer.getFPS())
		love.graphics.print("Current FPS: "..fps, 9, 10)
	end
end
