-- Views Panel

size = { 30, 39 }

local letterpic = loadImage("A.png")
local clipboard = loadImage("clipboard.png")


function onMouseDown()
	local OpenWindow = findCommand("gkh/view/autopilot")
    commandOnce(OpenWindow)
end

function draw()
	drawTexture (clipboard,0, 0, size[1], size[2] )
	drawTexture (letterpic,0, 0, size[1], size[2] )
end