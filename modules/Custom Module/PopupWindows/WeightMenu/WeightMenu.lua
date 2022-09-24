
local letterpic = loadImage("W.png")
local clipboard = loadImage("clipboard.png")

weightMenuButton = subpanel {
		name			= "Weight Icon",
		position 		= { 0 , 170, 40, 40};
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
								local OpenWindow = findCommand("gkh/view/weight")
								commandOnce(OpenWindow)
								return true
							end,
						},
		}	
}


weightPopup = subpanel {
		name			= "Weight Menu",
		position 		= { 40, 100, 665, 480  };
		noBackground 	= true;
		noResize		= true,
		visible			= false,
		vrAuto			= true,
		command 		= "gkh/view/weight", 
		description		= "Toggle Weight Panel",
		components		= {
							weight{
								position={0, 0, 665, 480}
							}
		},
}

