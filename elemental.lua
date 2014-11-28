-- ProbablyEngine Rotation Packager
-- Custom Elemental Shaman Rotation
-- Created on Oct 15th 2014
-- V 0.3
ProbablyEngine.rotation.register_custom(262, "boxo's elemental shaman", {

-- Pause Rotation
	{ "pause", "modifier.lshift" },

-- interrupt with wind shear
	{ "57994", {
		"modifier.interrupts",
		"target.interruptAt(30)",
		"player.spell(Wind Shear).cooldown < 1",
	}},
	{ "57994", {
		"modifier.interrupts",
		"focus.interruptAt(30)",
		"focus.enemy",
		"player.spell(Wind Shear).cooldown < 1",
	}, "focus" },

-- 3rd tier talents on control

	{ "108284", { -- totemic projection
		"talent(3, 3)",
		"modifier.lcontrol"
	}},
	
	{ "108284", { -- call of the elements
		"talent(3, 1)",
		"modifier.lcontrol"
	}},
	
-- banners for exp (leveling)

--	{ "#64402" },
--	{ "#64401", "!player.buff(Guild Battle Standard)" },
--	{ "#64400", "!player.buff(Guild Battle Standard)" },
	
-- Defensives
	{ "30823", { 					-- sham rage
	  "modifier.lalt",
	}},

	{ "108271", { 				-- astral shift
	  "talent(1, 3)"
	  "modifier.lalt",
	  "!player.buff(30823)"
	}},

	{ "108270", { 				-- stone bulwark totem
	  "talent(1, 2)"
	  "modifier.lalt",
	  "!player.buff(30823)"
	}},
	
	{ "2062", { -- earth elemental for reinforce
		"modifier.lalt",
		"!player.buff(30823)",
		"!player.totem(2894)",
		"talent(6, 2)",
	}},

	{ "118347", { "player.totem(2062)", "!player.buff(Reinforce)" } }, -- reinforce
	{ "Healing Surge", "player.health < 40 ", "player" },	
	{ "#5512", "player.health <= 45" },  	-- use healthstone
	{ "108273", {	-- windwalk totem
		"!player.buff(Windwalk Totem)",
		"player.state.root",
		"!player.totem(Windwalk Totem)",
	}},
	{ "108273", {	-- windwalk totem
		"!player.buff(Windwalk Totem)",
		"player.state.snare",
		"!player.totem(Windwalk Totem)",
	}},
	{ "8143", { -- Tremor Totem
		"!player.buff(Tremor Totem)",
		"player.state.fear",
		"!player.totem(Tremor Totem)",
	}},

-- cc chaining

	{ "51514", {					-- Hex
	  "focus.debuff(51514).duration < 10",
	  "!player.moving",
	  "focus.enemy",
	  "focus.alive",
	  "focus.distance < 30",
	  "toggle.hex",
	}, "focus" },

-- Buffs
	{ "324", "!player.buff(324)" }, 		-- lightning shield
	{ "5394", "player.health < 80" }, 	-- HST
	{ "2645", { "!player.buff(2645)", "target.distance > 40", "toggle.wolf" } }, -- ghost wolf 

--Cooldowns
	{{
	--	{ "#76089", "player.hashero" }, -- potion on lust (and other effects)
		{ "26297", {					-- Berserking
		  "player.spell(26297).exists"
		}},
		{ "33697", {					-- Blood Fury
		  "player.spell(33697).exists"
		}},
		{ "16166", "talent(4, 1)" },	-- elemental mastery
		{ "114049", { 				-- ascendance
			"!player.buff(114050)",
			"target.debuff(Flame Shock).duration > 15"
		}},
		{ "Storm Elemental Totem", "talent(7, 2)" },	-- storm elemental totem
		{ "2894" }, 					-- fire elemental totem
--		{ "2062" }, 					-- earth elemental totem
		{ "16188", "talent(4, 2)" },	-- ancestral swiftness
	} , "modifier.cooldowns" },

-- Rotations

-- dat pull

--	{{

--	}, "player.time <= 10" },

-- universal

	{ "Liquid Magma", "player.totem(3599).duration > 10" },
	{ "Liquid Magma", "player.totem(2894).duration > 10" },

-- moving
	{{
		{ "79206", { "player.buff(114050)" } }, -- spiritwalker's grace
		{ "8042", { "player.buff(324)", "player.buff(324).count = 20" } }, -- earth shock
		{ "165462", { "talent(6, 1)", "!player.buff(114050)" } }, -- unleash flame
		{ "51505", { "player.buff(77762)" } }, -- lava burst with lava surge
		{ "8050", { "player.buff(Unleash Flame)", "target.debuff(Flame Shock).duration < 19" } }, -- flame shock
		{ "8050", "target.debuff(Flame Shock).duration < 9" }, -- flame shock
		{ "8042", { "player.buff(324)", "player.buff(324).count > 15" } }, -- earth shock
		{ "3599", { "!player.totem(2894)", "!player.totem(3599)" } }, -- searing totem
		
		{ "421", {	-- chain lightning with ancestral swiftness
			"modifier.multitarget",
			"target.area(8).enemies > 1",
			"!player.buff(114050)",
			"player.buff(Ancestral Swiftness)"
		}},
		{ "51505", { "player.buff(Ancestral Swiftness)" } }, -- lava burst with ancestral swiftness
		{ "117014", { "player.buff(Ancestral Swiftness)" } }, -- elemental blast with ancestral swiftness
		{ "403", { "player.buff(Ancestral Swiftness)" } }, -- lightning bolt
	}, { "player.moving", "!player.buff(Spiritwalker's Grace)" } },

-- multitarget
	{{
		{ "421", {
			"!player.buff(Improved Chain Lightning)",
			"player.spell(Earthquake).cooldown < 1",
		} },
		{ "61882", {	-- earthquake
			"player.buff(Improved Chain Lightning).count >= 1",
			"target.ttd >= 10",
			"target.exists",
			"target.alive",
			"toggle.chain",
		}, "target.ground" },
		{ "114074", "player.buff(114050)" }, -- lava beam with ascendance
		{ "8042", { "player.buff(324)", "player.buff(324).count > 17" } }, -- earth shock
		{ "51490", "player.area(10).enemies >= 10" }, -- thunderstorm
		{ "421", "target.area(10).enemies > 4" }, -- chain lightning
	}, { "modifier.multitarget", "target.area(10).enemies > 1" } },	

	{ "165462", "!target.debuff(Flame Shock)" }, -- unleash flame for flame shock
	{ "8050", "!target.debuff(Flame Shock)" }, -- flame shock if not present
	{ "165462", "talent(6, 1)" }, -- unleash flame
	{ "8042", { "player.buff(324)", "player.buff(324).count = 20" } }, -- earth shock
	{ "51505", "target.debuff(Flame Shock).duration > 2" }, -- lava burst
	{ "Elemental Blast", "talent(6, 3)" }, -- elemental blast
	{ "8042", { "player.buff(324)", "player.buff(324).count > 15" } }, -- earth shock
	{ "8050", "target.debuff(Flame Shock).duration < 9" }, -- flame shock
--	{ "61882", { 
--		"player.ilevel >= 560",
--		"target.ttd >= 10",
--		"target.exists",
--		"target.alive",
--	}, "target.ground" }, -- earthquake
	{ "3599", { "!player.totem(2894)", "!player.totem(3599)" }}, -- searing totem
	{ "51505" }, -- lava burst on cooldown
	{ "421", { "modifier.multitarget", "target.area(10).enemies > 2" } },
	{ "403" }, -- lightning bolt
	
}, {

   -- Buffs

	{ "324", "!player.buff(324)" }, -- lightning shield 
	
	{ "2645", { "!player.buff(2645)", "toggle.wolf" } }, -- ghost wolf 

-- cc chaining

	{ "51514", {					-- Hex
	  "focus.debuff(51514).duration < 10",
	  "!player.moving",
	  "focus.enemy",
	  "focus.alive",
	  "focus.distance < 30",
	  "toggle.hex",
	}, "focus" },


}, function()
	ProbablyEngine.toggle.create('wolf', 'Interface\\ICONS\\spell_nature_spiritwolf', 'wolf', 'Spirit Wolf all day.')
	ProbablyEngine.toggle.create('hex', 'Interface\\ICONS\\spell_nature_spiritwolf', 'hex', 'toggles cc.')
	ProbablyEngine.toggle.create('chain', 'Interface\\ICONS\\spell_nature_chainlightning', 'chain', 'Toggle AOE for Chain Lightning Use.')
	ProbablyEngine.toggle.create('mouseover', 'Interface\\Icons\\spell_fire_flameshock', 'Enable Mouseover', 'Enable flameshock on mousover targets.')
end)



