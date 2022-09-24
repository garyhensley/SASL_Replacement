
sasl.options.setAircraftPanelRendering ( true )
sasl.options.set3DRendering ( false )
sasl.options.setInteractivity ( true )
loadedAircraft = sasl.getAircraft()
size = {2048, 2048}
panelWidth3d = 2048
panelHeight3d = 2048


Custommodule_path = sasl.getProjectPath().."/custom module"
XpPath = sasl.getXPlanePath() 
aircraftPath = sasl.getAircraftPath()
addSearchPath(Custommodule_path.."/shared")
addSearchPath(Custommodule_path.."/shared/fonts")
addSearchPath(XpPath.."/Resources/fonts")

json = require "lunajson"
local file = io.open(Custommodule_path.."/settings.json", "r")
io.input(file)
local content = io.read("*a")
io.close(file)
gkh = json.decode(content)

include ("DataRef/dataref.lua")

if gkh.DKMP then include ("DataRef/dkmp.lua") end
if gkh.Tbient then include ("DataRef/Tbient.lua") end

addSearchPath(moduleDirectory.."/shared/")

components = { 

		Animation { },
		ElectricalSystem {},
		FlightDynamics{},
		Instruments{},
		PopupWindows {},
		SoundSystem {},

}

function draw()
	drawAll(components)
end