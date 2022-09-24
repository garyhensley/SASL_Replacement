
local drf = {
	Towbar = globalProperty("gkh/gear/Towbar"),
	groundspeed = globalProperty("sim/flightmodel/position/groundspeed"),
	Ax_Force = globalProperty("sim/flightmodel/forces/faxil_plug_acf"),
	yokeroll = globalProperty("sim/cockpit2/controls/yoke_roll_ratio"),
	yokepitch = globalProperty("sim/cockpit2/controls/yoke_pitch_ratio"),
	steering = globalProperty("sim/flightmodel/parts/tire_steer_cmd[" .. gkh.TowBar.Steer .. "]"),
	override_wheel_steer = globalProperty("sim/operation/override/override_wheel_steer"),
}


function update()
	if get(drf.Towbar) == 1 then
		set(drf.override_wheel_steer,1)
		set(drf.steering,get(drf.yokeroll) * -45)
		if get(drf.groundspeed) < 1.5 then
			set(drf.Ax_Force, get(drf.yokepitch) * -1000)
		end
	end
end



