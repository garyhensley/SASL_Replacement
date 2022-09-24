
local battery_on 	= globalProperty("sim/cockpit2/electrical/battery_on[0]")
local left_gen_amp 	= globalProperty("sim/cockpit2/electrical/generator_amps[0]")
local right_gen_amp	= globalProperty("sim/cockpit2/electrical/generator_amps[1]")

if gkh.DKMP then
local Pwr 	= globalProperty("com/dkmp/Pwr")
end

function UseDKMP()
	if get(battery_on) == 1  or get(left_gen_amp) + get(right_gen_amp) > 10 then
		set(Pwr, 1)
	else
		set(Pwr, 0)
	end
end

function update()

	if gkh.DKMP then UseDKMP() end

end

