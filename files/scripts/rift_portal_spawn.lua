dofile_once("mods/dimensional_rifts/files/scripts/pools.lua")

local me = GetUpdatedEntityID()
local x, y = EntityGetTransform(me)
local vscs = EntityGetComponent(me, "VariableStorageComponent") or {}
local tier = nil
local id = nil
for _, vsc in ipairs(vscs) do
	if ComponentGetValue2(vsc, "name") == "dimensional_rifts.tier" then
		tier = ComponentGetValue2(vsc, "value_int") --[[@as integer]]
		id = ComponentGetValue2(vsc, "value_float") ---[[@as integer]]
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
	local summon = EntityLoad(choice.path, x + Random(-3, 3), y + Random(-3, 3))
	EntityAddComponent2(summon, "LuaComponent", {
		script_death = "mods/dimensional_rifts/files/scripts/summon_defeated.lua",
		execute_every_n_frame = -1,
	})
	EntityAddComponent2(
		summon,
		"VariableStorageComponent",
		{ name = "dimensional_rifts.id", value_int = id }
	)
	local particle_emitter = EntityAddComponent2(summon, "ParticleEmitterComponent", {
		emitted_material_name = "spark_purple",
		lifetime_min = 2,
		lifetime_max = 2,
		x_vel_min = 0,
		x_vel_max = 0,
		y_vel_min = 0,
		y_vel_max = 0,
		count_min = 1,
		count_max = 1,
		render_on_grid = true,
		fade_based_on_lifetime = true,
		cosmetic_force_create = true,
		collide_with_grid = false,
		airflow_force = 0.051,
		airflow_time = 1.01,
		airflow_scale = 0.03,
		emission_interval_min_frames = 1,
		emission_interval_max_frames = 1,
		emit_cosmetic_particles = true,
		velocity_always_away_from_center = 0,
		render_back = true,
		is_emitting = true,
	})
	ComponentSetValue2(particle_emitter, "area_circle_radius", 0, 15)
end
