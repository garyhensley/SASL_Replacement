-- general autopilot two-state indicator and button

-- image used when button in "ON" state
defineProperty("On", loadImage("AP_ButtonOn.png"))

-- image used when button in "OFF" state
defineProperty("Off", loadImage("AP_ButtonOff.png"))

-- function called to get button state
defineProperty("bit")

-- autopilot state
defineProperty("state", globalPropertyi("sim/cockpit/autopilot/autopilot_state"))

function bitand(a, b)
    local result = 0
    local bitval = 1
    while a > 0 and b > 0 do
      if a % 2 == 1 and b % 2 == 1 then -- test the rightmost bits
          result = result + bitval      -- set the current bit
      end
      bitval = bitval * 2 -- shift left
      a = math.floor(a/2) -- shift right
      b = math.floor(b/2)
    end
    return result
end

components = {

    -- "on" state texture
    textureLit {
        image = On,
        visible = function() return 0 ~= bitand(get(state), get(bit)); end,
    };
    
    -- "off" state texture
    textureLit {
        image = Off,
        visible = function() return 0 == bitand(get(state), get(bit)); end,
    };

    -- toggle state button	
    button {
        onMouseDown = function ()
            set(state, get(bit))
            return true
        end
    }

}


