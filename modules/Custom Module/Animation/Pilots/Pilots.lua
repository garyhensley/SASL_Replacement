
local drf = {
	Towbar = globalProperty("gkh/gear/Towbar"),
	hide_pilot = globalProperty("gkh/pilots/hide_pilot"),
	hide_passenger = globalProperty("gkh/pilots/hide_passenger"),	
	pilotX = globalProperty("gkh/pilots/pilotX"),
	pilotY = globalProperty("gkh/pilots/pilotY"),
	pilotZ = globalProperty("gkh/pilots/pilotZ"),
	passengerX = globalProperty("gkh/pilots/passengerX"),
	passengerY = globalProperty("gkh/pilots/passengerY"),
	passengerZ = globalProperty("gkh/pilots/passengerZ"),
	people_id = globalProperty("gkh/pilots/people_id"),
	people_on = globalProperty("gkh/pilots/people_on"),
	peopleX = globalPropertyfa("gkh/pilots/peopleX"),
	peopleY = globalPropertyfa("gkh/pilots/peopleY"),
	peopleZ = globalPropertyfa("gkh/pilots/peopleZ"),
}

set(drf.pilotX,gkh.Pilots.PilotX)
set(drf.pilotY,gkh.Pilots.PilotY)
set(drf.pilotZ,gkh.Pilots.PilotZ)
set(drf.passengerX,gkh.Pilots.PassengerX)
set(drf.passengerY,gkh.Pilots.PassengerY)
set(drf.passengerZ,gkh.Pilots.PassengerZ)

for i = 1,4 do
	if gkh.Pilots.people[i].Load then
		set(drf.people_on,1,i)
	else
		set(drf.people_on,0,i)
	end
	set(drf.people_id,gkh.Pilots.people[i].id,i)
	set(drf.peopleX,gkh.Pilots.people[i].x,i)
	set(drf.peopleY,gkh.Pilots.people[i].y,i)
	set(drf.peopleZ,gkh.Pilots.people[i].z,i)
end

function update()

	local hide = 0
	if get(drf.Towbar) == 1 then
		hide = 1
	end
	set(drf.hide_pilot,hide)
	set(drf.hide_passenger,hide)
end



