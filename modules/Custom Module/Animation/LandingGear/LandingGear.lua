

local sim_tire_vrt_def 	= globalProperty("sim/flightmodel2/gear/tire_vertical_deflection_mtr[0]")

if gkh.DKMP then
local ShocksFront 	= globalProperty("com/dkmp/ShocksFront")
end

function UseDKMP()
	set(ShocksFront, get(sim_tire_vrt_def))
end


function update()
	if gkh.DKMP then UseDKMP() end
end


