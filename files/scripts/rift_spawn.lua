local me = GetUpdatedEntityID()
local x, y = EntityGetTransform(me)

local id = tonumber(GlobalsGetValue("dimensional_rifts.id", "0"))
id = id + 1
GlobalsSetValue("dimensional_rifts.id", tostring(id))

for angle = 0, 360, 36 do
	local theta = angle * math.pi / 180
	local length = 160
	local dx, dy = math.cos(theta) * length, math.sin(theta) * length
	local nx, ny = x + dx, y + dy
	-- TODO: this function doesn't work too good, maybe do some raycasts
	local fx, fy = FindFreePositionForBody(nx, ny, 0, 0, 15)
	local portal = EntityLoad("mods/dimensional_rifts/files/entities/rift_portal.xml", fx, fy)
	local tier = math.max(0, math.floor(y / 1024))
	EntityAddComponent2(
		portal,
		"VariableStorageComponent",
		{ name = "dimensional_rifts.tier", value_int = tier, value_float = id }
	)
end
