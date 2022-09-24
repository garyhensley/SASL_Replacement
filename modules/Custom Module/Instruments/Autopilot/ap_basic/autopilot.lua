
size = { 573, 286 }

createGlobalPropertyi("com/dkmp/APDn",0,false,true,false )
createGlobalPropertyi("com/dkmp/APUp",0,false,true,false )


defineProperty("mode", globalPropertyi("sim/cockpit/autopilot/autopilot_mode"))
defineProperty("ap_hdg_mode", globalPropertyi("sim/cockpit2/autopilot/heading_mode"))

defineProperty("APDn", globalPropertyf("com/dkmp/APDn"))
defineProperty("APUp", globalPropertyf("com/dkmp/APUp"))


defineProperty("AP", loadImage("AP_background.png"))
defineProperty("AP_On", loadImage("AP_On.png"))
defineProperty("AP_Off", loadImage("AP_Off.png"))
defineProperty("Up", loadImage("uptrimap.png"))
defineProperty("Dn", loadImage("downtrimap.png"))
defineProperty("ButtonOff", loadImage("AP_ButtonOff.png"))
defineProperty("ButtonOn", loadImage("AP_ButtonOn.png"))


components = {
	textureLit {
		position = {0, 0, size[1], size[2]};
		image = get(AP);
	},

	--AP on-off switch
	switch {
        position = { 470, 110, 70, 85 },
        -- button is on if autopilot enabled
        state = function () return 2 == get(mode); end,
        -- turn autopilot on or off
        onMouseDown = function ()
            if 2 == get(mode) then
                set(mode, 0)
            else
                set(mode, 2)
            end
            return true
        end,
        btnOn = get(AP_On),
        btnOff = get(AP_Off),
    },

	-- up/dn rocker
	textureLit {
		position = { 35, 55, 70, 180},
		image = get(Dn),
		visible = function()
				if get(APDn) == 1 then
				return true
				end
			end,
	},

	textureLit {
	position = { 35, 55, 70, 180},
	image = get(Up),
	visible = function()
			if get(APUp) == 1 then
			return true
			end
		end,
	},

	--HDG on-off switch
    ap_mode_btn {  
        bit = 2;
        position = { 150, 160, 80, 70 },
    },
	
}

function draw()
	-- HDG
	--drawTexture(AP_ButtonOn,150,160,80,70)
	--drawTexture(AP_ButtonOff,150,160,80,70)
	
	-- FD
	--drawTexture(AP_ButtonOn,245,160,80,70)
	--drawTexture(AP_ButtonOff,245,160,80,70)
	
	-- ALT
	--drawTexture(AP_ButtonOn,340,160,80,70)
	--drawTexture(AP_ButtonOff,340,160,80,70)
	
	-- NAV
	--drawTexture(AP_ButtonOn,150,28,80,70)
	--drawTexture(AP_ButtonOff,150,28,80,70)
	
	-- BC
	--drawTexture(AP_ButtonOn,245,28,80,70)
	--drawTexture(AP_ButtonOff,245,28,80,70)
	
	-- APPR
	--drawTexture(AP_ButtonOn,340,28,80,70)
	--drawTexture(AP_ButtonOff,340,28,80,70)
	
	
	drawAll(components)
end