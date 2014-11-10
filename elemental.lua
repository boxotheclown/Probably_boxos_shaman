-- ProbablyEngine Rotation Packager
-- Custom Enhancement Shaman Rotation
-- Created on Oct 15th 2014
-- V 0.3
ProbablyEngine.rotation.register_custom(262, "boxo's shaman", {

  --------------------
  -- Start Rotation --
  --------------------
-- Pause Rotation
	{ "pause", "modifier.lshift" },

-- interrupt with wind shear
	{ "57994", {
		"modifier.interrupts",
		"target.interruptAt(30)"
	}},
	{ "57994", {
		"modifier.interrupts",
		"focus.interruptAt(30)",
		"focus.enemy"
	}, "focus" },

-- Defensives
	{ "30823", { 					-- sham rage
	  "modifier.lalt",
	}},

	{ "108271", { 				-- astral shift
	  "player.spell(108271).exists",
	  "modifier.lalt",
	  "!player.buff(30823)"
	}},

	{ "108270", { 				-- stone bulwark totem
	  "player.spell(108270).exists",
	  "modifier.lalt",
	  "!player.buff(30823)"
	}},
	{ "#5512", "player.health <= 45" },  	-- use healthstone

-- cc chaining

--	{ "51514", {					-- Hex
--	  "focus.debuff(51514).duration < 10",
--	  "!player.moving" }, "focus" },

-- Buffs
	{ "324", "!player.buff(324)" }, 		-- lightning shield
	{ "5394", "player.health < 80" }, 	-- HST

--Cooldowns (used nested conditions from guide)
	{{

-- potion on lust (and other effects)
--	{ "#76089", "player.buff(2825)" },	-- bloodlust
--	{ "#76089", "player.buff(32182)" },	-- heroism
--	{ "#76089", "player.buff(80353)" },	-- timewarp
--	{ "#76089", "player.buff(90355)" },	-- Ancient Hysteria

	{ "26297", {					-- Berserking
	  "player.spell(26297).exists"
	}},
	{ "33697", {					-- Blood Fury
	  "player.spell(33697).exists"
	}},
	
-- elemental mastery a bunch of different ways
	{ "16166", { 					-- elemental mastery
	  "player.spell(16166).exists"
	}},
	{ "114049", { 				-- ascendance
	  "!player.buff(114051)",
	  "target.debuff(Flame Shock).duration > 15"
	}},
	{ "Spiritwalker's Grace", { "player.moving", "player.buff(Ascendance)" } },
	{ "2894" }, 					-- fire elemental totem
	{ "2062" }, 					-- earth elemental totem
	{ "16188", "player.spell(16188).exists" },	-- ancestral swiftness
} , "modifier.cooldowns" },

-- Rotations


-- Multitarget (nested)

{{
	{ "Flame Shock", "!target.debuff(Flame Shock)" },
	{ "Flame Shock", "target.debuff(Flame Shock).duration <= 9" },	
	{ "Earthquake", "target.ground" },
	{ "Lava Beam", "player.buff(Ascendance)" },
	{ "Earth Shock", "player.buff(Lightning Shield).count >= 15" },
	{ "Thunderstorm", "target.area(10).enemies > 10", "target.ground" },
	{ "Searing Totem", { "!player.totem(Fire Elemental Totem)", "!player.totem(Searing Totem" }},
	{ "Chain Lighting" },
}, "modifier.multitarget" },

-- Single Target

	{ "Flame Shock", "!target.debuff(Flame Shock)" },
	{ "Flame Shock", "target.debuff(Flame Shock).duration <= 9" },
	{ "Earth Shock", "player.buff(Lightning Shield).count >= 12" },
	{ "Lava Burst" },
	{ "Searing Totem" },
	{ "Lightning Bolt" },

  ------------------
  -- End Rotation --
  ------------------
  
}, {

  ---------------
  -- OOC Begin --
  ---------------
  
  -- Buffs

{ "324", "!player.buff(324)" }, -- lightning shield  

  -------------
  -- OOC End --
  -------------

}, function()
  ProbablyEngine.toggle.create('chain', 'Interface\\ICONS\\spell_nature_chainlightning', 'chain', 'Toggle AOE for Chain Lightning Use.')
end)



