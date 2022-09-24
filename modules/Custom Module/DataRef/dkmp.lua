

createGlobalPropertyi("com/dkmp/Pwr",0,false,true,false )
createGlobalPropertyf("com/dkmp/ShocksFront",0.0,false,true,false )
createGlobalPropertyf("com/dkmp/StartLman",0.0,false,true,false )

createGlobalPropertyf("com/dkmp/mastervolknob",0.0,false,true,false )
createGlobalPropertyf("com/dkmp/NavCom3Au",0.0,false,true,false )
createGlobalPropertyf("com/dkmp/NavCom2Au",0.0,false,true,false )
createGlobalPropertyf("com/dkmp/NavCom1Au",0.0,false,true,false )


createGlobalPropertyi("com/dkmp/windowrefl",1,false,true,false )
createGlobalPropertyfa("com/dkmp/CabinIllumination",2,false,true,false )
createGlobalPropertyi("com/dkmp/BeaconReflection",0,false,true,false )

createGlobalPropertyi("com/dkmp/staticelements",0,false,true,false ) 
createGlobalPropertyi("com/dkmp/Fairings",0,false,true,false )
createGlobalPropertyi("com/dkmp/Float",0,false,true,false )
createGlobalPropertyi("com/dkmp/Ski",0,false,true,false )


DKMP = {
	defineProperty("Pwr",globalProperty("com/dkmp/Pwr")),
	defineProperty("ShocksFront",globalProperty("com/dkmp/ShocksFront")),
	defineProperty("StartLman",globalProperty("com/dkmp/StartLman")),
	
	defineProperty("mastervolknob",globalProperty("com/dkmp/mastervolknob")),
	defineProperty("NavCom3Au",globalProperty("com/dkmp/NavCom3Au")),
	defineProperty("NavCom2Au",globalProperty("com/dkmp/NavCom2Au")),
	defineProperty("NavCom1Au",globalProperty("com/dkmp/NavCom1Au")),
	
	defineProperty("windowrefl",globalProperty("com/dkmp/windowrefl")),
	defineProperty("CabinIllumination",globalProperty("com/dkmp/CabinIllumination")),
	defineProperty("BeaconReflection",globalProperty("com/dkmp/BeaconReflection")),
	
	defineProperty("staticelements",globalProperty("com/dkmp/staticelements")),
	defineProperty("Fairings",globalProperty("com/dkmp/Fairings")),
	defineProperty("Float",globalProperty("com/dkmp/Float")),
	defineProperty("Ski",globalProperty("com/dkmp/Ski")),
	
}
