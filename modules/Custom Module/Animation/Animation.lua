
components = {}

if gkh.ControlSurfaces.Load then
	table.insert(components,ControlSurfaces {})
end
if gkh.Doors.Load then
	table.insert(components,Doors {})
end
if gkh.HideYokes.Load then
	table.insert(components,HideYokes {})
end
if gkh.LandingGear.Load then
	table.insert(components,LandingGear {})
end
if gkh.Pilots.Load then
	table.insert(components,Pilots {})
end
if gkh.PropDisc.Load then
	table.insert(components,PropDisc {})
end
if gkh.TowBar.Load then
	table.insert(components,TowBar {})
end
if gkh.Windows.Load then
	table.insert(components,Windows {})
end

