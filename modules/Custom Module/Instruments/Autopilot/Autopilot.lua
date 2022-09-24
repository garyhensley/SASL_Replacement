
local letterpic = loadImage("A.png")
local clipboard = loadImage("clipboard.png")

autopilotMenuButton = subpanel {
		name			= "Autopilot Menu",
		position 		= { 0 , 210, 40, 40};
		noBackground 	= true,  
		noResize		= true,
		noClose			= true,
		noMove			= true,
		visible			= true,
		vrAuto			= true,
		components = {  
						textureLit {
							position = { 0 , 0, 40, 40},
							image = get(clipboard),
						},
						textureLit {
							position = { 0 , 0, 40, 40},
							image = get(letterpic),
							onMouseDown = function ()
								local OpenWindow = findCommand("gkh/view/autopilot")
								commandOnce(OpenWindow)
								return true
							end,
						},
		}	
}


components = {}

if gkh.Autopilot.Name == "basic" then
	table.insert(components,ap_basic {
	})
end

function draw()
	drawAll(autopilotMenuButton)
	drawAll(components)	
end