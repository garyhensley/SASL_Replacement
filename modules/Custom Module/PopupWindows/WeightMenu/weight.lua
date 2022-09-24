-- Views Panel

size = { 665, 480 }

local WStation1 = globalProperty("sim/flightmodel/weight/m_stations[0]")
local WStation2 = globalProperty("sim/flightmodel/weight/m_stations[1]")
local WStation3 = globalProperty("sim/flightmodel/weight/m_stations[2]")
local WStation4 = globalProperty("sim/flightmodel/weight/m_stations[3]")
local WStation5 = globalProperty("sim/flightmodel/weight/m_stations[4]")

local WStationMax1 = globalProperty("sim/aircraft/weight/acf_m_station_max[0]")
local WStationMax2 = globalProperty("sim/aircraft/weight/acf_m_station_max[1]")
local WStationMax3 = globalProperty("sim/aircraft/weight/acf_m_station_max[2]")
local WStationMax4 = globalProperty("sim/aircraft/weight/acf_m_station_max[3]")
local WStationMax5 = globalProperty("sim/aircraft/weight/acf_m_station_max[4]")

local WeightMax = globalProperty("sim/aircraft/weight/acf_m_max")
local WeightTotal = globalProperty("sim/flightmodel/weight/m_total")

local Fuel1 = globalProperty("sim/flightmodel/weight/m_fuel[0]")
local Fuel2 = globalProperty("sim/flightmodel/weight/m_fuel[1]")
local Fuel3 = globalProperty("sim/flightmodel/weight/m_fuel[2]")

local FuelR1 = globalProperty("sim/aircraft/overflow/acf_tank_rat[0]")
local FuelR2 = globalProperty("sim/aircraft/overflow/acf_tank_rat[1]")
local FuelR3 = globalProperty("sim/aircraft/overflow/acf_tank_rat[2]")

local FuelMax = globalProperty("sim/aircraft/weight/acf_m_fuel_tot")

local cogXL_max = globalProperty("sim/aircraft/overflow/acf_cgX_lft")
local cogXR_max = globalProperty("sim/aircraft/overflow/acf_cgX_rgt")
local cogZF_max = globalProperty("sim/aircraft/overflow/acf_cgZ_fwd")
local cogZA_max = globalProperty("sim/aircraft/overflow/acf_cgZ_aft")
local cogX = globalProperty("sim/flightmodel/misc/cgx_ref_to_default")
local cogZ = globalProperty("sim/flightmodel/misc/cgz_ref_to_default")

local FuelMax1 = get(FuelMax) * get(FuelR1)
local FuelMax2 = get(FuelMax) * get(FuelR2)
local FuelMax3 = get(FuelMax) * get(FuelR3)



local clipboard = loadImage("clipboard.png")
local topview = loadImage(gkh.Aircraft..".png")
local xpic = loadImage("xpic.png") 

local roboto	= loadFont(getXPlanePath() .. "Resources/fonts/Roboto-Regular.ttf")

local black	= {0, 0, 0, 1}
local red	= {1, 0, 0, 1}
local green	= {0, 1, 0, 1}
local cyan	= {0, 1, 1, 1}
local magenta	= {1, 0, 1, 1}
local yellow	= {1, 1, 0, 1}

function calcLbs(w) 
	local r = w * 2.20462
	return math.floor(r)
end

function calcCircle(w1,w2) 
	local r = calcLbs(w1)/calcLbs(w2) * 10
	return r
end

function calcGal(w) 
	local r = w * 2.20462 / 6
	return math.floor(r)
end


function calcRect(w1,w2) 
	local r = calcGal(w1)/calcGal(w2) * 100
	return r
end

function lb2kg(w)
	local r = w / 2.20462
	return r
end
function gal2kg(w)
	local r = w / 2.20462 * 6
	return r
end


components = {

	textureLit {
		position = {0, 0, size[1], size[2]},
		image = get(clipboard),
	},

	textureLit {
		position = {60,65,550,350},
		image = get(topview),
	},



	weightCircle {	position = {280,250,40,60},        
					variable = WStation1,
					amt_max = WStationMax1,
					default = lb2kg(180),					
	},
	weightCircle {	position = {330,250,40,60},        
					variable = WStation2,
					amt_max = WStationMax2,
					default = lb2kg(180),
	},
	weightCircle {	position = {283,175,40,60},        
					variable = WStation3,
					amt_max = WStationMax3,
					default = lb2kg(120),
	},
	weightCircle {	position = {325,175,40,60},        
					variable = WStation4,
					amt_max = WStationMax4,
					default = lb2kg(120),
	},
	weightCircle {	position = {302,110,40,60},        
					variable = WStation5,
					amt_max = WStationMax5,
					default = lb2kg(50),
	},


	weightRect {	position = {200,210,50,100},        
					variable = Fuel1,
					amt_max = FuelMax1,
					default = FuelMax1,
	},
	weightRect {	position = {415,220,50,100},        
					variable = Fuel2,
					amt_max = FuelMax2,
					default = FuelMax2,
	},
}	


function draw()
	drawAll(components)
	
	drawText(roboto, 60,130, "Total Weight:", 20, false, false, TEXT_ALIGN_LEFT, black)	
	local wtc = green; if get(WeightTotal) > get(WeightMax) then wtc = red end
	drawText(roboto, 185,130, calcLbs(get(WeightTotal)), 20, false, false, TEXT_ALIGN_LEFT, wtc)	
	drawText(roboto, 60,100, "Max Weight:", 20, false, false, TEXT_ALIGN_LEFT, black)	
	drawText(roboto, 185,100, calcLbs(get(WeightMax)), 20, false, false, TEXT_ALIGN_LEFT, yellow)	

	drawText(roboto, 325,400, "COG Lat", 20, false, false, TEXT_ALIGN_CENTER, black)	
	drawRectangle(225, 375, 200, 2, magenta)
	drawRectangle(325, 355, 2, 40, magenta)
	drawRectangle(325 + ((get(cogXL_max)*200)), 360, 2, 30, red)
	drawRectangle(325 + ((get(cogXR_max)*200)), 360, 2, 30, red)
	drawRectangle(325 + ((get(cogX)*200)), 375 , 2, 20, yellow)
	
	drawText(roboto, 500,375, "COG Long", 20, false, false, TEXT_ALIGN_LEFT, black)	
	drawRectangle(540, 150, 2, 200, magenta)
	drawRectangle(520, 250, 40, 2, magenta)
	drawRectangle(525, 250 - ((get(cogZF_max)*200)), 30, 2, red)
	drawRectangle(525, 250 - ((get(cogZA_max)*200)), 30, 2, red)
	drawRectangle(530, 250 - ((get(cogZ)*200)), 20, 2, yellow)


end


