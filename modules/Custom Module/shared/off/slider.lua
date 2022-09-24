-- slider.lua

defineProperty("value", 1)
defineProperty("greyed")
defineProperty("min")
defineProperty("max")
defineProperty("rnd")
local mi	= eval(min) or 0
local ma	= eval(max) or 1
local dt	= ma - mi
local rd	= eval(rnd)

local f	= acf.fnt

local w	= helpers.colors.WHITE
local b	= helpers.colors.RGB(22, 120, 181)
local g	= helpers.colors.RGB(95, 100, 106)

local r	= helpers.images.load("rounded8.png", 4, 4)
local d	= helpers.images.load("disc22.png", 11, 11)

local o	= false
local h = false
local v = ((size[1] - 24) * get(value) - mi) / dt

onMouseMove = function(_, x, y, b)
	if eval(greyed) then return true end
	o = y > 2 and y < 28
	if h then
		v = math.clamp(0, x - 12 , size[1] - 24)
		set(value, mi +  dt * v / (size[1] - 24))
	end
	return true
end

onMouseLeave = function() o = false end

onMouseDown = function(_, x, y, b)
	if eval(greyed) then return true end
	if b == 1 then
		h = true
		return true
	end
	return false
end

onMouseUp = function(_, x, y, b)
	if eval(greyed) then return true end
	if b == 1 then
		h = false
	end
	if rd then set(value, math.round(eval(value))) end
	return true
end

function draw()
	if eval(greyed) then
		f:SetColor(g)
		f:TextL(0, 30, eval(caption))
		f:SetColor(w)
		r:Draw(12, 12, g)
		r:Draw(size[1]-12, 12, g)
		drawWideLine(12, 12, size[1] - 12, 12, 8, g)
		if rd then
			for i = 0, dt do
				drawLine(12 + i * (size[1] - 24) / dt, 1, 12 + i * (size[1] - 24) / dt, 22, g)
			end
		end
		d:Draw(v + 12, 12, g)
	else
		f:TextL(0, 30, eval(caption))
		local c = o and b or g
		r:Draw(12, 12, c)
		r:Draw(size[1]-12, 12, c)
		drawWideLine(12, 12, size[1] - 12, 12, 8, c)
		if rd then
			for i = 0, dt do
				drawLine(12 + i * (size[1] - 24) / dt, 1, 12 + i * (size[1] - 24) / dt, 22, c )
			end
		end
		local c = h and g or w
		d:Draw(v + 12, 12, c)
	end
end

function update()
	if not h then v = (eval(value)- mi) * (size[1] - 24) / dt end
end