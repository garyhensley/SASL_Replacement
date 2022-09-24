
local letterpic = loadImage("O.png")
local clipboard = loadImage("clipboard.png")


optionsMenuButton = subpanel {
		name			= "Options Menu Button",
		position 		= { 0 , 130, 40, 40};
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
								local OpenWindow = findCommand("gkh/view/options")
								commandOnce(OpenWindow)
								return true
							end,
						},
		}	
}

optionsPopup = subpanel {
		name			= "Options Menu",
		position 		= { 40, 100, 665, 480  };
		noBackground 	= true;
		noResize		= true,
		visible			= false,
		vrAuto			= true,
		command 		= "gkh/view/options", 
		description		= "Toggle Weight Panel",
		components		= {
							options{
								position={0, 0, 665, 480}
							}
		},
}




function draw()
	drawAll(optionsMenuButton)
	drawAll(optionsPopup)
end