-- mouseWheel.lua

defineProperty("variable",0)
defineProperty("amt_max",1)
defineProperty("amt_min",0)
defineProperty("increment",0)
defineProperty("default",0)

local amtmax = get(amt_max)
local amtmin = get(amt_min)
local incr = get(increment)

function onMouseDown()
	if get(variable) > 0 then
		set(variable,0)	
	else
		set(variable,get(default))
	end
end

function onMouseWheel(comp,x,y,btn,x,y,val)
	local v = get(variable)
	v = get(variable) + val * incr
	if v > amtmax then v = amtmax end
	if v < amtmin then v = amtmin end
	set(variable,v)	
end

function draw()
	sasl.gl.drawRectangle(0, 0, size[1], size[2], {0, 0, 0, 1})
end