
--- ================================================================================
--- simple DKMP calc
if gkh.PhysicsCalc.DKMP then 
local sec			= globalProperty("sim/time/total_flight_time_sec")
local L_plug_acf	= globalProperty("sim/flightmodel/forces/L_plug_acf")
local M_plug_acf	= globalProperty("sim/flightmodel/forces/M_plug_acf")
local N_plug_acf	= globalProperty("sim/flightmodel/forces/N_plug_acf")
local EGTRQ 		= globalProperty("sim/flightmodel/engine/ENGN_TRQ[0]")
local sec_old = get(sec)

function UseDKMP()
 
	if sec_old ~= get(sec) then
		set(L_plug_acf, get(L_plug_acf) + get(EGTRQ) * gkh.PhysicsCalc.DKMP_L)
		set(M_plug_acf, get(M_plug_acf)	+ get(EGTRQ) * gkh.PhysicsCalc.DKMP_M)
		set(N_plug_acf, get(N_plug_acf)	+ get(EGTRQ) * gkh.PhysicsCalc.DKMP_N)
	end
	sec_old = get(sec)
	
end
end --if gkh.PhysicsCalc.Load then



--- ================================================================================
--- advanced Nhandra calc
if gkh.PhysicsCalc.Advanced then 

local drf = {
	roll_deg 	= globalProperty("sim/flightmodel/position/phi"),
	L_plug 		= globalProperty("sim/flightmodel/forces/L_plug_acf" ),
	M_plug 		= globalProperty("sim/flightmodel/forces/M_plug_acf" ),
	N_plug 		= globalProperty("sim/flightmodel/forces/N_plug_acf" ),
}
local frame_time	= globalProperty("sim/operation/misc/frame_rate_period")

local const = {
	stab_ext_range = 6,
	stab_mid_range = 3,
	stab_int_range = 1.8,
	stab_force = 80
}

function UseAdvanced()
 
	-- long-therm artifical roll  stability around center
	local roll_deg = get(drf.roll_deg)
	local roll_multiplier = 0
	
	if roll_deg + const.stab_ext_range < 0 then roll_multiplier = 0 
	elseif roll_deg + const.stab_mid_range < 0 then roll_multiplier = ((0 - const.stab_mid_range - roll_deg) / const.stab_mid_range)
	elseif roll_deg + const.stab_int_range < 0 then roll_multiplier = 1
	elseif roll_deg < const.stab_int_range then roll_multiplier = (roll_deg / const.stab_int_range)
	elseif roll_deg < const.stab_mid_range then roll_multiplier = 1
	elseif roll_deg < const.stab_ext_range then roll_multiplier = ((const.stab_mid_range - roll_deg) / const.stab_mid_range)
	else roll_multiplier = 0
	end

	--Torque controls
	local CGShift = 0 --copilotweight * 2.6 - pilotweight * 2.6	
	local stab_moment = 0 - (roll_multiplier * const.stab_force)	

	
	if get(frame_time) ~= 0 then
		set(drf.L_plug, CGShift + stab_moment)
--40B		set(drf.N_plug, get(drf.EGTRQ) * -0.25)
	end
	
end

end --if gkh.PhysicsCalc.Advanced then 



function update()

	if gkh.PhysicsCalc.DKMP then UseDKMP() end
	if gkh.PhysicsCalc.Advanced then UseAdvanced() end

end


