---@type script_interacting
---@diagnostic disable-next-line: lowercase-global
function interacting(entity_who_interacted, entity_interacted, interactable_name)
	local x, y = EntityGetTransform(entity_interacted)
	EntityLoad("mods/dimensional_rifts/files/entities/rift_start.xml", x, y)
	EntityKill(entity_interacted)
end
