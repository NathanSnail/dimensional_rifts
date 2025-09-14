local _spawn_heart = spawn_heart
spawn_heart = function(x, y, ...)
	SetRandomSeed(x, y)
	local r = Random()
	-- 1% of spawns are rifts
	if r < tonumber(ModSettingGet("dimensional_rifts.spawn_chance")) / 100 then
		EntityLoad("mods/dimensional_rifts/files/entities/rift.xml", x, y)
		return
	end
	return _spawn_heart(x, y, ...)
end
