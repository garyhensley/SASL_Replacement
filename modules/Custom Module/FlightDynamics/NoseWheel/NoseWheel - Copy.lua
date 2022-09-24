
local drf = {
	frame_time = globalProperty("sim/operation/misc/frame_rate_period"),
	groundspeed = globalProperty("sim/flightmodel/position/groundspeed"),
	nosewheel = globalProperty("sim/flightmodel/parts/tire_steer_cmd[0]"),
	nosewheel_RPM = globalProperty("sim/flightmodel2/gear/tire_rotation_speed_rad_sec[" .. gkh.NoseWheel.Steer .. "]"),
	nosewheel_defl = globalProperty("sim/flightmodel2/gear/tire_vertical_deflection_mtr[" .. gkh.NoseWheel.Steer .. "]"),
	steer_override = globalProperty("sim/operation/override/override_wheel_steer"),
	rudder = globalProperty("sim/flightmodel2/wing/rudder1_deg[0]"),
	RealSteer = globalProperty("gkh/gear/RealSteer"),
	Towbar = globalProperty("gkh/gear/Towbar"),
}

local nosewheel = {
	current = 0,
	defl = 0,
	Towbar = 0
}

local min = math.min
local max = math.max
local abs = math.abs

--Exponential calculations
function expo(var, Exp)
	local base = get(var) / 23
	if base > 0 then return(base^Exp)
	else return(-(abs(base)^Exp))
	end
end

if gkh.NoseWheel.RealNose then
	set(drf.RealSteer,1)
else
	set(drf.RealSteer,0)
end

function update()
	--Nose wheel steering override
	if get(drf.steer_override) ~= 1 then set(drf.steer_override, 1) end
	nosewheel.defl = get(drf.nosewheel_defl)

	if get(drf.Towbar) == 0 then
		if nosewheel.defl > 0.0001 then
			if drf.RealSteer then
				if get(drf.nosewheel_RPM) > 0.05 then
					local spd_fact = (1 - min(0.7, (get(drf.groundspeed)/45)))  -- 1 ... 0.3
					local defl_fact = ((nosewheel.defl + 0.005) * 5) + 0.3  -- 0.3 ... 1.2
					local RPM_fact = min((get(drf.nosewheel_RPM) + 1) / 100, 1) + 0.3 --- 0.3 ... 1.3
					local frame_fact = 6 * get(drf.frame_time)
					nosewheel.current = nosewheel.current + expo((get(drf.rudder) * 1.0) - nosewheel.current, 0.8) * spd_fact * RPM_fact * frame_fact / defl_fact
				end
				set(drf.nosewheel, nosewheel.current)
			else
				set(drf.nosewheel, get(drf.rudder) * 1.2 * (1 - min(0.7, (get(drf.groundspeed)/40))))
			end
		else
			set(drf.nosewheel, 0)
		end
	end
end


