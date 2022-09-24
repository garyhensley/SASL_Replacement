-- mouseWheel.lua

defineProperty("variable",0)
defineProperty("amt_max",1)
defineProperty("default",0)

local amtmax 	= get(amt_max)
local amtmin 	= 0
local incr 		= 0.25

local roboto	= loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

local green	= {0, 1, 0, 1}
local yellow	= {1, 1, 0, 1}

function calcLbs(w) 
	local r = w * 2.20462
	return math.floor(r)
end


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
	drawText(roboto,size[1]/2, 0, calcLbs(get(variable)), 20, false, false, TEXT_ALIGN_CENTER, yellow)	
	drawCircle(size[1]/2, 40, get(variable)/200 * 30,true, green)
end

components = {
    clickable {
        cursor = {
            x = -12,
            y = -12,
            width = 24,
            height = 24,
            shape = loadImage("cursorWheel.png"),
			hideOSCursor = true
        },
    },
}