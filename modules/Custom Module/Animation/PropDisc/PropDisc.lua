
local propDiscOverride_0	= globalProperty("sim/flightmodel2/engines/prop_disc/override[0]")
local propDiscOverride_1	= globalProperty("sim/flightmodel2/engines/prop_disc/override[1]")
local side_length_ratio_0	= globalProperty("sim/flightmodel2/engines/prop_disc/side_length_ratio[0]")
local side_length_ratio_1	= globalProperty("sim/flightmodel2/engines/prop_disc/side_length_ratio[1]")
local disc_s_dim_0			= globalProperty("sim/flightmodel2/engines/prop_disc/disc_s_dim[0]")
local disc_s_dim_1			= globalProperty("sim/flightmodel2/engines/prop_disc/disc_s_dim[1]")
local disc_t_dim_0			= globalProperty("sim/flightmodel2/engines/prop_disc/disc_t_dim[0]")
local disc_t_dim_1			= globalProperty("sim/flightmodel2/engines/prop_disc/disc_t_dim[1]")
local disc_width_0			= globalProperty("sim/flightmodel2/engines/prop_disc/disc_width[0]")
local disc_width_1			= globalProperty("sim/flightmodel2/engines/prop_disc/disc_width[1]")
local side_number_of_blades_0	= globalProperty("sim/flightmodel2/engines/prop_disc/side_number_of_blades[0]")
local side_number_of_blades_1	= globalProperty("sim/flightmodel2/engines/prop_disc/side_number_of_blades[1]")
local side_s_dim_0			= globalProperty("sim/flightmodel2/engines/prop_disc/side_s_dim[0]")
local side_s_dim_1			= globalProperty("sim/flightmodel2/engines/prop_disc/side_s_dim[1]")
local side_t_dim_0			= globalProperty("sim/flightmodel2/engines/prop_disc/side_t_dim[0]")
local side_t_dim_1			= globalProperty("sim/flightmodel2/engines/prop_disc/side_t_dim[1]")
local side_alpha_front_0	= globalProperty("sim/flightmodel2/engines/prop_disc/side_alpha_front[0]")
local side_alpha_front_1	= globalProperty("sim/flightmodel2/engines/prop_disc/side_alpha_front[1]")
local side_alpha_side_0		= globalProperty("sim/flightmodel2/engines/prop_disc/side_alpha_side[0]")
local side_alpha_side_1		= globalProperty("sim/flightmodel2/engines/prop_disc/side_alpha_side[1]")
local side_alpha_inside_0	= globalProperty("sim/flightmodel2/engines/prop_disc/side_alpha_inside[0]")
local side_alpha_inside_1	= globalProperty("sim/flightmodel2/engines/prop_disc/side_alpha_inside[1]")
local side_is_billboard_0	= globalProperty("sim/flightmodel2/engines/prop_disc/side_is_billboard[0]")
local side_is_billboard_1	= globalProperty("sim/flightmodel2/engines/prop_disc/side_is_billboard[1]")
local disc_alpha_front_0	= globalProperty("sim/flightmodel2/engines/prop_disc/disc_alpha_front[0]")
local disc_alpha_front_1	= globalProperty("sim/flightmodel2/engines/prop_disc/disc_alpha_front[1]")
local disc_alpha_side_0		= globalProperty("sim/flightmodel2/engines/prop_disc/disc_alpha_side[0]")
local disc_alpha_side_1		= globalProperty("sim/flightmodel2/engines/prop_disc/disc_alpha_side[1]")
local disc_alpha_inside_0	= globalProperty("sim/flightmodel2/engines/prop_disc/disc_alpha_inside[0]")
local disc_alpha_inside_1	= globalProperty("sim/flightmodel2/engines/prop_disc/disc_alpha_inside[1]")
local disc_alpha_inside_0	= globalProperty("sim/flightmodel2/engines/prop_disc/disc_alpha_inside[0]")
local disc_alpha_inside_1	= globalProperty("sim/flightmodel2/engines/prop_disc/disc_alpha_inside[1]")
local side_alpha_to_camera_0	= globalProperty("sim/flightmodel2/engines/prop_disc/side_alpha_to_camera[0]")
local side_alpha_to_camera_1	= globalProperty("sim/flightmodel2/engines/prop_disc/side_alpha_to_camera[1]")

local prop_rotation_speed_rad_sec_0	= globalProperty("sim/flightmodel2/engines/prop_rotation_speed_rad_sec[0]")
local prop_rotation_speed_rad_sec_1	= globalProperty("sim/flightmodel2/engines/prop_rotation_speed_rad_sec[1]")
local prop_rotation_angle_deg_0	= globalProperty("sim/flightmodel2/engines/prop_rotation_angle_deg[0]")
local prop_rotation_angle_deg_1	= globalProperty("sim/flightmodel2/engines/prop_rotation_angle_deg[1]")
local engine_rotation_angle_deg_0	= globalProperty("sim/flightmodel2/engines/engine_rotation_angle_deg[0]")
local engine_rotation_angle_deg_1	= globalProperty("sim/flightmodel2/engines/engine_rotation_angle_deg[1]")
local prop_pitch_deg_0	= globalProperty("sim/flightmodel2/engines/prop_pitch_deg[0]")
local prop_pitch_deg_1	= globalProperty("sim/flightmodel2/engines/prop_pitch_deg[1]")
local prop_is_disc_0	= globalProperty("sim/flightmodel2/engines/prop_is_disc[0]")
local prop_is_disc_1	= globalProperty("sim/flightmodel2/engines/prop_is_disc[1]")
local side_angle_0	= globalProperty("sim/flightmodel2/engines/prop_disc/side_angle[0]")
local side_angle_1	= globalProperty("sim/flightmodel2/engines/prop_disc/side_angle[1]")
local side_width_0	= globalProperty("sim/flightmodel2/engines/prop_disc/side_width[0]")
local side_width_1	= globalProperty("sim/flightmodel2/engines/prop_disc/side_width[1]")
local disc_s_0	= globalProperty("sim/flightmodel2/engines/prop_disc/disc_s[0]")
local disc_s_1	= globalProperty("sim/flightmodel2/engines/prop_disc/disc_s[1]")
local side_s_0	= globalProperty("sim/flightmodel2/engines/prop_disc/side_s[0]")
local side_s_1	= globalProperty("sim/flightmodel2/engines/prop_disc/side_s[1]")


local light_level_r			= globalProperty("sim/graphics/misc/cockpit_light_level_r")


	set(propDiscOverride_0,1) 
	set(propDiscOverride_1,1)
	set(side_length_ratio_0, 1)
	set(side_length_ratio_1, 1)

	--Prop Disc Dimensions
	set(disc_s_dim_0,4)
	set(disc_s_dim_1,4)
	set(disc_t_dim_0,2)
	set(disc_t_dim_1,2)

	-- Alpha settings for the prop disc.

		--Side is a 2-blade prop 15 cm wide.  We have 32x2 slots for side discs.
	set(disc_width_0, 0.0)
	set(disc_width_1, 0.0)
	set(side_number_of_blades_0, 456)
	set(side_number_of_blades_1, 456)
	set(side_s_dim_0, 32)
	set(side_s_dim_1, 32)
	set(side_t_dim_0,2)
	set(side_t_dim_1,2)

		--Alpha setting for side disc is separate
	set(side_alpha_front_0, 0.0)
	set(side_alpha_front_1, 0.0)

	--set(side_alpha_side_0, 1)
	--set(side_alpha_side_1, 1)

	set(side_alpha_inside_0, 0.5)
	set(side_alpha_inside_1, 0.5)

	--set(side_alpha_to_camera_0, -0.1)
	--set(side_alpha_to_camera_1, -0.1)

	set(side_is_billboard_0, 0)
	set(side_is_billboard_1, 0)



function update()

	set(disc_alpha_front_0, 3.0 * get(light_level_r) - 1)
	set(disc_alpha_front_1, 3.0 * get(light_level_r) - 1)

	set(disc_alpha_side_0, 0.0)
	set(disc_alpha_side_1, 0.0)

	set(disc_alpha_inside_0,0.7)
	set(disc_alpha_inside_1,0.7)


	set(side_alpha_side_0, 0.1 - get(prop_rotation_speed_rad_sec_0)*0.00025)  --prop_rotation_speed_rad_sec_0
	set(side_alpha_side_1, 0.1 - get(prop_rotation_speed_rad_sec_1)*0.00025)  --prop_rotation_speed_rad_sec_1

	set(side_alpha_to_camera_0, 1.1)
	set(side_alpha_to_camera_1, 1.1)


	-- Set prop rotation angle
	set(prop_rotation_angle_deg_0, get(engine_rotation_angle_deg_0))
	set(prop_rotation_angle_deg_1, get(engine_rotation_angle_deg_1))

	set(side_angle_0, get(engine_rotation_angle_deg_0))
	set(side_angle_1, get(engine_rotation_angle_deg_1))

	
	--Individual blades or a disc?  We switch at greater than 18 rad/s spinning.
	
	--Left Engine
	if get(prop_rotation_speed_rad_sec_0) > 18.0 then
		set(prop_is_disc_0, 1)
	else
		set(prop_is_disc_0, 0)
	end
	
	--Right Engine
	if get(prop_rotation_speed_rad_sec_1) > 18.0 then
		set(prop_is_disc_1, 1)
	else
		set(prop_is_disc_1, 0)
	end
		
	set(side_width_0, 0.07)
	set(side_width_1, (get(prop_pitch_deg_1)*0.0009)+0.1)

	
	-- We pick our texture slots by interpolating the prop speed.
	-- So as the prop speeds up, we pick different slots.
	--Left Engine - Front
	if get(prop_rotation_speed_rad_sec_0) < 144.0 then
	set(disc_s_0, 0)
	
	elseif  get(prop_rotation_speed_rad_sec_0) < 280.0 then
	set(disc_s_0, get(prop_rotation_speed_rad_sec_0) * 0.0142 - 2)
	
	else 
	set(disc_s_0, 2)
	end
	
	--Right Engine - Front
	if get(prop_rotation_speed_rad_sec_1) < 144.0 then
	set(disc_s_1, 0)
	
	elseif  get(prop_rotation_speed_rad_sec_1) < 280.0 then
	set(disc_s_1, get(prop_rotation_speed_rad_sec_1) * 0.0142 - 2)
	
	else 
	set(disc_s_1, 2)
	end
	
	
	set(side_s_0, 24)
	set(side_s_1, 24)	

end



