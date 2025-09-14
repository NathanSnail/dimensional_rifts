local me = GetUpdatedEntityID()
local x, y = EntityGetTransform(me)
for angle = 0, 360, 20 do
	local theta = angle * math.pi / 180
	local length = 100
	local dx, dy = math.cos(theta) * length, math.sin(theta) * length
	local nx, ny = x + dx, y + dy
	EntityLoad("mods/dimensional_rifts/files/entities/rift_portal.xml", nx, ny)
end
