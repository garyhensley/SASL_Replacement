-- Views Panel

size = { 665, 480 }

local PilotDoor 	= globalProperty("sim/cockpit2/switches/custom_slider_on[0]")
local CopilotDoor 	= globalProperty("sim/cockpit2/switches/custom_slider_on[1]")
local BaggageDoor 	= globalProperty("sim/cockpit2/switches/custom_slider_on[23]")
local Static 		= globalProperty("com/dkmp/staticelements")
local Fairings 		= globalPropertyi("com/dkmp/Fairings")
local Towbar 		= globalProperty("gkh/gear/Towbar")
local RealSteer		= globalProperty("gkh/gear/RealSteer")
local WindowRefl 	= globalProperty("com/dkmp/windowrefl")

local clipboard 	= loadImage("clipboard.png")
local checkbox		= loadImage("checkbox.png")
local xpic			= loadImage("xpic.png")
local empty			= loadImage("empty.png")

local totOptions = 0
for i = 1,8 do
	if gkh.OptionsMenu.opts[i].drf == "" then
		totOptions = i
	end
end
option_drf = {}
for i = 1,8 do
	if gkh.OptionsMenu.opts[i].drf ~= "" then
		option_drf[i] = globalProperty(gkh.OptionsMenu.opts[i].drf)
	end
end		


components = {

	textureLit {
		position = {0, 0, size[1], size[2]},
		image = get(clipboard),
	},
}


for i = 1,8 do
	table.insert(components,	
		textureLit {
			position = {gkh.OptionsMenu.opts[i].x,gkh.OptionsMenu.opts[i].y,40,40},
			image = get(checkbox),
		}
	)
	table.insert(components,	
		switch {
			position = { gkh.OptionsMenu.opts[i].x, gkh.OptionsMenu.opts[i].y, 40, 40 },
			state = function () return 1 == get(option_drf[i]); end,
			onMouseDown = function ()
				set(option_drf[i], 1-get(option_drf[i]))
				return true
			end,
			btnOn = get(xpic),
			btnOff = get(empty),
		}
	)
end


local optionfont	= loadFont("Pocket Money.ttf")
local black	= {0, 0, 0, 1}
function draw()
	drawAll(components)
	for i = 1,8 do
		drawText(optionfont, 50+gkh.OptionsMenu.opts[i].x, 10+gkh.OptionsMenu.opts[i].y, gkh.OptionsMenu.opts[i].desc, 35, false, false, TEXT_ALIGN_LEFT, black)	
	end
end
