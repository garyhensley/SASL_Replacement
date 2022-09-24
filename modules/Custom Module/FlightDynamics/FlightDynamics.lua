
components = {}

if gkh.EngineCalc.Load then
	table.insert(components,EngineCalc {})
end
if gkh.NoseWheel.Load then
	table.insert(components,NoseWheel {})
end
if gkh.PhysicsCalc.Load then
	table.insert(components,PhysicsCalc {})
end


