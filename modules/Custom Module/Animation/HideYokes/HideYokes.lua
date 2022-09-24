
--if gkh.DKMP then


--end

local fasten_seat_belts = globalProperty("sim/cockpit2/switches/fasten_seat_belts")
local no_smoking 		= globalProperty("sim/cockpit2/switches/no_smoking")
local sim_hide_yoke 	= globalProperty("sim/graphics/view/hide_yoke")


function UseDKMP()

--	set(fasten_seat_belts,get(sim_hide_yoke))
--	set(no_smoking,get(sim_hide_yoke))
	
end

function update()

	if gkh.DKMP then UseDKMP() end

end

