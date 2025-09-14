---@param entity entity_id
---@return integer?
local function get_id(entity)
	local vscs = EntityGetComponent(entity, "VariableStorageComponent") or {}
	local id = nil
	for _, vsc in ipairs(vscs) do
		if ComponentGetValue2(vsc, "name") == "dimensional_rifts.id" then
			id = ComponentGetValue2(vsc, "value_int") --[[@as integer]]
		end
	end
	return id
end

---@type script_death
function death()
	local me = GetUpdatedEntityID()
	local id = get_id(me)
	if not id then return end

	local mortals = EntityGetWithTag("mortal")
	for _, mortal in ipairs(mortals) do
		if mortal == me then goto continue end
		local mortal_id = get_id(mortal)
		if mortal_id == id then
			-- there are others with our reward still alive (unloading too hard to get right, so dupes are ok - cbc kinda fixes maybe)
			return
		end
		::continue::
	end

	local x, y = EntityGetTransform(me)
	EntityLoad("data/entities/items/pickup/heart.xml", x, y)
end
