---@class (exact) entry
---@field path string
---@field count integer? 1

---Double inclusive
---@class (exact) range
---@field min integer
---@field max integer

---@class (exact) pool
---@field tier range
---@field [integer] entry

-- these enemies are meant to be fair to face when surrounded and representative of their biomes

-- other mods can append to this
---@type pool[]
RIFT_POOLS = {
	-- mines
	{
		tier = { min = 0, max = 0 },
		{
			path = "data/entities/animals/miner_fire.xml",
		},
		{
			path = "data/entities/animals/frog.xml",
			count = 3,
		},
		{
			path = "data/entities/animals/miner_weak.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/miner_weak.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/shotgunner.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/longleg.xml",
			count = 5,
		},
	},

	-- coal pits
	{
		tier = { min = 1, max = 2 },
		{
			path = "data/entities/animals/miner_fire.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/drone_physics.xml",
		},
		{
			path = "data/entities/animals/goblin_bomb.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/miner.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/firebug.xml",
			count = 2,
		},
	},

	-- snowy depths

	{
		tier = { min = 3, max = 4 },
		{
			path = "data/entities/animals/sniper.xml",
		},
		{
			path = "data/entities/animals/iceskull.xml",
		},
		{
			path = "data/entities/animals/tank.xml",
		},
		{
			path = "data/entities/animals/scavenger_glue.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/statue_physics.xml",
		},
	},

	-- hiisi base
	{
		tier = { min = 5, max = 5 },
		{
			path = "data/entities/animals/sniper.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/tank.xml",
		},
		{
			path = "data/entities/animals/scavenger_glue.xml",
			count = 3,
		},
		{
			path = "data/entities/animals/drone_lasership.xml",
		},
		{
			path = "data/entities/animals/scavenger_leader.xml",
		},
	},

	-- jungle
	{
		tier = { min = 6, max = 7 },
		{
			path = "data/entities/animals/rainforest/bloom.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/rainforest/shooterflower.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/lukki/lukki_longleg.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/lukki/lukki_creepy_long.xml",
		},
		{
			path = "data/entities/animals/lukki/lukki_dark.xml",
		},
		{
			path = "data/entities/animals/rainforest/scavenger_poison.xml",
		},
		{
			path = "data/entities/animals/rainforest/scavenger_clusterbomb.xml",
		},
	},

	-- vault
	{
		tier = { min = 8, max = 9 },
		{
			path = "data/entities/animals/spearbot.xml",
		},
		{
			path = "data/entities/animals/vault/roboguard.xml",
		},
		{
			path = "data/entities/animals/drone_lasership.xml",
			count = 2,
		},
		{
			path = "data/entities/animals/vault/scavenger_mine.xml",
		},
		{
			path = "data/entities/animals/monk.xml",
		},
		{
			path = "data/entities/animals/vault/bigzombie.xml",
		},
		{
			path = "data/entities/animals/vault/healerdrone_physics.xml",
		},
	},

	-- tota
	{
		tier = { min = 10, max = math.huge },
		{
			path = "data/entities/animals/crypt/skullfly.xml",
		},
		{
			path = "data/entities/animals/crypt/phantom_a.xml",
		},
		{
			path = "data/entities/animals/crypt/phantom_b.xml",
		},
		{
			path = "data/entities/animals/crypt/enlightened_alchemist.xml",
		},
		{
			path = "data/entities/animals/crypt/necromancer.xml",
		},
		{
			path = "data/entities/animals/wraith_glowing.xml",
		},
		{
			path = "data/entities/animals/crypt/crystal_physics.xml",
		},
	},
}
