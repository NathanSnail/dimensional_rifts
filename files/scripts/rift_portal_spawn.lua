dofile_once("mods/dimensional_rifts/files/scripts/pools.lua")

local me = GetUpdatedEntityID()
local x, y = EntityGetTransform(me)
local vscs = EntityGetComponent(me, "VariableStorageComponent") or {}
local tier = nil
for _, vsc in ipairs(vscs) do
	if ComponentGetValue2(vsc, "name") == "dimensional_rifts.tier" then
		tier = ComponentGetValue2(vsc, "value_int") --[[@as integer]]
	end
end
if not tier then return end

local valid_pool
for _, pool in ipairs(RIFT_POOLS) do
	if pool.tier.min <= tier and pool.tier.max >= tier then valid_pool = pool end
end
if not valid_pool then
	valid_pool = {
		tier = { min = -1, max = -1 },
		{ path = "data/entities/animals/crypt/crystal_physics.xml" },
	} --[[@as pool]]
end

SetRandomSeed(GameGetFrameNum(), x * y - 1000 * y / x)
local choice = valid_pool[Random(1, #valid_pool)]
for _ = 1, (choice.count or 1) do
	EntityLoad(choice.path, x + Random(-3, 3), y + Random(-3, 3))
end
