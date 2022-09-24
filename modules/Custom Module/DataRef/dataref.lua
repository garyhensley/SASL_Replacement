

createGlobalPropertyfa("laminar/C172/sound/radio_volume_pilot",10,false,true,false )  --for FMOD
createGlobalPropertyi("gkh/gear/RealSteer",1,false,true,false )
createGlobalPropertyi("gkh/gear/YokeSteer",0,false,true,false )
createGlobalPropertyi("gkh/gear/Towbar",0,false,true,false )
createGlobalPropertyi("gkh/pilots/hide_pilot",0,false,true,false )
createGlobalPropertyi("gkh/pilots/hide_passenger",0,false,true,false )
createGlobalPropertyf("gkh/pilots/pilotX",0.0,false,true,false )
createGlobalPropertyf("gkh/pilots/pilotY",0.0,false,true,false )
createGlobalPropertyf("gkh/pilots/pilotZ",0.0,false,true,false )
createGlobalPropertyf("gkh/pilots/passengerX",0.0,false,true,false )
createGlobalPropertyf("gkh/pilots/passengerY",0.0,false,true,false )
createGlobalPropertyf("gkh/pilots/passengerZ",0.0,false,true,false )
createGlobalPropertyia("gkh/pilots/people_id",4,false,true,false )
createGlobalPropertyia("gkh/pilots/people_on",4,false,true,false )
createGlobalPropertyfa("gkh/pilots/peopleX",4,false,true,false )
createGlobalPropertyfa("gkh/pilots/peopleY",4,false,true,false )
createGlobalPropertyfa("gkh/pilots/peopleZ",4,false,true,false )




defineProperty("DRF")
DRF = {

	defineProperty("RealSteer",globalProperty("gkh/gear/RealSteer")),
	defineProperty("YokeSteer",globalProperty("gkh/gear/YokeSteer")),
	defineProperty("Towbar",globalProperty("gkh/gear/Towbar")),
	defineProperty("hide_pilot",globalProperty("gkh/pilots/hide_pilot")),
	defineProperty("hide_passenger",globalProperty("gkh/pilots/hide_passenger")),
	defineProperty("pilotX",globalProperty("gkh/pilots/pilotX")),
	defineProperty("pilotY",globalProperty("gkh/pilots/pilotY")),
	defineProperty("pilotZ",globalProperty("gkh/pilots/pilotZ")),
	defineProperty("passengerX",globalProperty("gkh/pilots/passengerX")),
	defineProperty("passengerY",globalProperty("gkh/pilots/passengerY")),
	defineProperty("passengerZ",globalProperty("gkh/pilots/passengerZ")),
	defineProperty("people_id",globalProperty("gkh/pilots/people_id")),
	defineProperty("people_on",globalProperty("gkh/pilots/people_on")),
	defineProperty("peopleX",globalProperty("gkh/pilots/peopleX")),
	defineProperty("peopleY",globalProperty("gkh/pilots/peopleY")),
	defineProperty("peopleZ",globalProperty("gkh/pilots/peopleZ")),

}