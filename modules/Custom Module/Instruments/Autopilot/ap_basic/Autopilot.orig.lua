-- Autopilot Panel

size = { 680, 500 }


defineProperty("FN", globalPropertyf("frame_number")) -- flight time

defineProperty("mode", globalPropertyi("sim/cockpit/autopilot/autopilot_mode"))
defineProperty("PitchDeg", globalPropertyf("sim/cockpit2/autopilot/sync_hold_pitch_deg"))


defineProperty("FD", globalPropertyi("sim/aircraft/view/acf_has_SC_fd"))
defineProperty("FDanim", globalPropertyi("sim/cockpit2/switches/custom_slider_on[11]"))

defineProperty("AP", loadImage("AP_background.png", 5, 5, 1024, 512)) 
defineProperty("AP_On", loadImage("AP_On.png"))
defineProperty("AP_Off", loadImage("AP_Off.png"))
defineProperty("Up", loadImage("uptrimap.png"))
defineProperty("Dn", loadImage("downtrimap.png"))


defineProperty("bit")

defineProperty("state", globalPropertyi("sim/cockpit/autopilot/autopilot_state"))
defineProperty("ApproachStatus", globalPropertyi("sim/cockpit2/autopilot/approach_status"))
defineProperty("NavStatus", globalPropertyi("sim/cockpit2/autopilot/nav_status"))
defineProperty("AltHoldStatus", globalPropertyi("sim/cockpit2/autopilot/altitude_hold_status"))
defineProperty("BC", globalPropertyi("sim/cockpit/autopilot/backcourse_on"))


defineProperty("APDn", globalPropertyf("com/dkmp/APDn"))
defineProperty("APUp", globalPropertyf("com/dkmp/APUp"))

defineProperty("APPR", globalPropertyf("com/dkmp/APPR"))

ApproachSet = findCommand("sim/autopilot/approach")
BCSet = findCommand("sim/autopilot/back_course")

noseDn = findCommand("sim/autopilot/nose_down")
noseUp = findCommand("sim/autopilot/nose_up")


defineProperty("ButtonOff", loadImage("AP_ButtonOff.png"))
defineProperty("ButtonOn", loadImage("AP_ButtonOn.png"))


-- general two-state toggable button

-- image used when button in "ON" state
defineProperty("btnOn")

-- image used when button in "OFF" state
defineProperty("btnOff")

-- function called to get button state
defineProperty("state")



noseDn = findCommand("sim/autopilot/nose_down")


function noseDnHandler(phase) 
 
 if 0  == phase then
		set(APDn, 1)
	elseif 2 == phase then
	set(APDn, 0)
	end

   end  
   
registerCommandHandler(noseDn, 0, noseDnHandler);
 
 
 
noseUp = findCommand("sim/autopilot/nose_up")

    function noseUpHandler(phase) 
 
 if 0  == phase then
		set(APUp, 1)
	elseif 2 == phase then
	set(APUp, 0)
	end

   end  
   
registerCommandHandler(noseUp, 0, noseUpHandler);


function  update()
set(FDanim, get(FD))
end
    
-- panel components
components = {


textureLit {
position = {0, 0, size[1], size[2]};
image = get(AP);
};


textureLit {
position = { 37, 115, 82, 313};
image = get(Dn),
visible = function()
        if get(APDn) == 1 then
        return true
        end
	end,
};

textureLit {
position = { 37, 112, 82, 315};
image = get(Up),
visible = function()
        if get(APUp) == 1 then
        return true
        end
	end,
};
--AP on-off switch

 switch {
        position = { 560, 198, 73, 147 };

        -- button is on if autopilot enabled
        state = function () return 2 == get(mode); end;

        -- turn autopilot on or off
        onMouseDown = function ()
            if 2 == get(mode) then
                set(mode, 0)
            else
                set(mode, 2)
            end
            return true
        end;

        btnOn = get(AP_On);
        btnOff = get(AP_Off);
    };


--HDG on-off switch
   
   -- autopilot hdg mode button
    ap_mode_btn {  
        bit = 2;
        position = { 170, 280, 100, 130 } 
    };
    


--FD on-off switch

--This switch has an animation component, which uses Custom_Slider_On[11],
--and is reflected right beneath the "function update()" in the "Logic.lua" file.

 switch {
        position = { 280, 280, 100, 130 };

        -- button is on if autopilot enabled
        state = function () return 1 == get(FD); end;

        -- turn autopilot on or off
        onMouseDown = function ()
            if 1 == get(FD) then
                set(FD, 0)
                
            else
                set(FD, 1)
                
            end
            return true
        end;

        btnOn = get(ButtonOn);
        btnOff = get(ButtonOff);
    };


--ALT on-off switch
   
    ap_mode_btn {  
        bit = 16384;
        position = { 398, 280, 100, 130 } 
    };
    
    
--[[    
 switch {
        position = { 398, 280, 100, 130 };

        -- button is on if autopilot enabled
        state = function () return 2 == get(mode); end;

        -- turn autopilot on or off
        onMouseDown = function ()
            if 2 == get(mode) then
                set(mode, 0)
            else
                set(mode, 2)
            end
            return true
        end;

        btnOn = get(ButtonOn);
        btnOff = get(ButtonOff);
    };
    ]]
    
    
 --NAV on-off switch
   
    ap_mode_btn {  
        bit = 256;
        position = { 170, 50, 100, 130 } 
    };


--[[    
 switch {
        position = { 170, 50, 100, 130 };

        -- button is on if autopilot enabled
        state = function () return 2 == get(mode); end;

        -- turn autopilot on or off
        onMouseDown = function ()
            if 2 == get(mode) then
                set(mode, 0)
            else
                set(mode, 2)
            end
            return true
        end;

        btnOn = get(ButtonOn);
        btnOff = get(ButtonOff);
    };
]]





--BC on-off switch

 switch {
        position = { 280, 50, 100, 130 };

        -- button is on if BC is enabled
        state = function () return 1 == get(BC); end;

        -- turn BackCourse on or off
        onMouseDown = function ()
            if 1 == get(BC) and get(NavStatus) == 1 then
               commandOnce(BCSet)
            else
             commandOnce(BCSet)

            end
            return true
        end;

        btnOn = get(ButtonOn);
        btnOff = get(ButtonOff);
    };  
    

--APPRoach switch 
    
   switch {
        position = { 398, 50, 100, 130 };

        -- button is on if APPR is enabled
        state = function () return 1 == get(ApproachStatus); end;

        -- turn BackCourse on or off
        onMouseDown = function ()
            if 1 == get(APPR) and get(NavStatus) == 1 then
                set(APPR, 0)
               commandOnce(ApproachSet)
            else
                set(APPR, 1)
             commandOnce(ApproachSet)

            end
            return true
        end;
        btnOn = get(ButtonOn);
        btnOff = get(ButtonOff);

    };  

    
  --NoseDn Switch  


    
     switch {
        position = { 25, 300, 100, 130 };

        -- button is on if APPR is enabled
        --state = function () return 1 == get(AltHoldStatus); end;

        -- turn BackCourse on or off
        onMouseDown = function ()
               commandBegin(noseDn)
         return true
         end;
         onMouseUp = function ()
         		commandEnd(noseDn)
            return true
            
        end;
        
        
    };
    







--[[

 
 
  ]]
  
  
  
  
--NoseUp Switch     
     
     switch {
        position = { 25, 80, 100, 130 };

        -- button is on if APPR is enabled
        --state = function () return 1 == get(AltHoldStatus); end;

        -- turn BackCourse on or off
        onMouseDown = function ()
               commandBegin(noseUp)
            return true
            end;
        onMouseUp = function ()
        	commandEnd(noseUp)
        	return true
        end;

    };     
    
    
    
    
 }