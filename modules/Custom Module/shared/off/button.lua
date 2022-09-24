-- button.lua
defineProperty("action", function() logInfo "Default action" end)

function draw()
        sasl.gl.drawFrame(0, 0, size[1], size[2])
end