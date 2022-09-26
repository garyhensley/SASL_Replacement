local min = math.min
local max = math.max
local abs = math.abs

local drf = {
	RealSteer 	= globalProperty("gkh/gear/RealSteer"),
	YokeSteer 	= globalProperty("gkh/gear/YokeSteer"),
	Towbar 		= globalProperty("gkh/gear/Towbar"),

	yoke		= globalProperty("sim/cockpit2/controls/yoke_roll_ratio"),
	rudder		= globalProperty("sim/cockpit2/controls/yoke_heading_ratio"),

	left_brake_ratio		= globalProperty("sim/cockpit2/controls/left_brake_ratio"),
	right_brake_ratio		= globalProperty("sim/cockpit2/controls/right_brake_ratio"),

	steer_override 	= globalProperty("sim/operation/override/override_wheel_steer"),
	nosewheel 		= globalProperty("sim/flightmodel/parts/tire_steer_cmd[" .. gkh.NoseWheel.Steer .. "]"),
	steerdeg1 		= globalProperty("sim/aircraft/gear/acf_nw_steerdeg1[" .. gkh.NoseWheel.Steer .. "]"),
	steerdeg2 		= globalProperty("sim/aircraft/gear/acf_nw_steerdeg2[" .. gkh.NoseWheel.Steer .. "]"),
	nosewheel_RPM 	= globalProperty("sim/flightmodel2/gear/tire_rotation_speed_rad_sec[" .. gkh.NoseWheel.Steer .. "]"),
	nosewheel_defl 	= globalProperty("sim/flightmodel2/gear/tire_vertical_deflection_mtr[" .. gkh.NoseWheel.Steer .. "]"),

	frame_time 		= globalProperty("sim/operation/misc/frame_rate_period"),
	groundspeed 	= globalProperty("sim/flightmodel/position/groundspeed"),
	
}

local nosewheel = {
	current = 0,
	defl = 0,
	turndeg = 0,
}


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
if gkh.NoseWheel.YokeSteer then
	set(drf.YokeSteer,1)
else
	set(drf.YokeSteer,0)
end

function update()
	if get(drf.Towbar) == 0 then  -- no TowBar attached
		if get(drf.YokeSteer) == 1 then
			nosewheel.turndeg = get(drf.yoke)
		else
			nosewheel.turndeg = get(drf.rudder)
		end
		nosewheel.turndeg = nosewheel.turndeg * get(drf.steerdeg2)
		if get(drf.groundspeed) < 3 and (get(drf.left_brake_ratio)>0.1 or get(drf.right_brake_ratio)>0.1) then
			nosewheel.turndeg = nosewheel.turndeg * get(drf.steerdeg1)
		end
		
		
		-- Real Steering
		if get(drf.RealSteer)==1 then
			if get(drf.steer_override) ~= 1 then set(drf.steer_override, 1) end
			nosewheel.defl = get(drf.nosewheel_defl)
			

			if nosewheel.defl > 0.0001 then
				if get(drf.nosewheel_RPM) > 0.05 then
					local spd_fact = (1 - min(0.7, (get(drf.groundspeed)/45)))  -- 1 ... 0.3
					local defl_fact = ((nosewheel.defl + 0.005) * 5) + 0.3  -- 0.3 ... 1.2
					local RPM_fact = min((get(drf.nosewheel_RPM) + 1) / 100, 1) + 0.3 --- 0.3 ... 1.3
					local frame_fact = 6 * get(drf.frame_time)
					nosewheel.current = nosewheel.current + expo(nosewheel.turndeg - nosewheel.current, 0.8) * spd_fact * RPM_fact * frame_fact / defl_fact
				end
				set(drf.nosewheel, nosewheel.current)
			else
				set(drf.nosewheel, 0)
			end
			
			
		else
		-- Normal XP steering
			if get(drf.YokeSteer) == 1 then
				if get(drf.steer_override) ~= 1 then set(drf.steer_override, 1) end
				set(drf.nosewheel, nosewheel.turndeg,gkh.NoseWheel.Steer)
			else
				if get(drf.steer_override) ~= 0 then set(drf.steer_override, 0) end
			end
		end
	end

	
end


