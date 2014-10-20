-- ProbablyEngine Rotation Packager
-- Custom Enhancement Shaman Rotation
-- Created on Oct 15th 2014
-- V 0.3
ProbablyEngine.rotation.register_custom(263, "boxo's shaman", {

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
		"focus.interruptAt(30)"
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

-- Maelstrom Weapon heal

	{ "8004", { 					-- chain heal
	  "player.buff(53817).count = 5",
	  "modifier.lcontrol",
--	  "mouseover"
	}},

-- cc chaining

	{ "51514", {					-- Hex
	  "focus.debuff(51514).duration < 10",
	  "!player.moving" }, "focus" },

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
	{ "120668", { 				-- stormlash
	  "!player.buff(120676)"
	}},
-- elemental mastery a bunch of different ways
	{ "16166", { 					-- elemental mastery
	  "player.spell(16166).exists"
	}},
	{ "114049", { 				-- ascendance
	  "!player.buff(114051)"
	}},
	{ "2894" }, 					-- fire elemental totem
	{ "2062" }, 					-- earth elemental totem
	{ "51533" }, 					-- feral spirit
	{ "16188", "player.spell(16188).exists" },	-- ancestral swiftness
} , "modifier.cooldowns" },

-- Totems (separate toggle from multitarget)

	{ "3599", { 					-- searing totem single target
	  "!player.totem(2894)",
	  "!player.totem(3599)",
	  "target.range <= 12",
	  "!modifier.multitarget"
	}},
	
	{ "8190", { 					-- magma totem
	  "!player.totem(2894)",
	  "!player.totem(8190)",
	  "target.range <= 6",
	  "modifier.multitarget",
	  (function() return UnitsAroundUnit('target', 10) >= 2 end) 
	}},

{ "3599", { 					-- searing totem smart
	  "!player.totem(2894)",
	  "!player.totem(3599)",
	  "target.range <= 12",
	  "modifier.multitarget",
	  (function() return UnitsAroundUnit('target', 10) < 2 end) 
	}},

-- Rotations


-- Multitarget (nested)

-- 2 units

{{

{{
	{ "73680" }, 					-- unleash elements
	{ "1535", "target.debuff(8050)" },	-- fire nova if flame shock on target
	{ "117014", {					-- elemental blast
	  "player.buff(53817).count >= 1",
	  "player.spell(117014).exists"
	  }}, 
	{ "403", { 					-- lb instant with maelstrom weapon
	  "player.buff(53817).count = 5",
	  "!modifier.lcontrol" 
	}},
	{ "403", "player.buff(16188)" }, 	-- lb instant with as
	{ "17364", "target.range <= 6"  }, 	-- stormstrike
	{ "115356" },	-- Windstrike
	{ "60103", "target.range <= 6" }, 	-- lava lash
	{ "8050", {					-- flame shock with when no flame shock on target
	  "!target.debuff(8050)",
	  "player.buff(73683)"
	}},
	{ "8050", {					-- flame shock with when 9 seconds left on flame shock
	  "target.debuff(8050).duration <= 9",
	  "player.buff(73683)"
	}}, 	
	{ "8056" }, 	-- Frost Shock
	{ "403", { 					-- lb if everything else is on cooldown
	  "player.buff(53817).count >= 1",
	  "!modifier.lcontrol",
	  "player.spell(73680).cooldown >= 1.5",
	  "player.spell(17364).cooldown >= 1.5",
	  "player.spell(8050).cooldown >= 1.5",
	  "player.spell(60103).cooldown >= 1.5",
	  "!modifier.last(403)"
	}},
	{ "8190", { 					-- refresh magma totem if nothing else to do
	  "!player.totem(2894)",
	  "player.totem(8190).duration <= 20"	  
	}}
} , { (function() return UnitsAroundUnit('target', 10) == 2 end) } ,
--   (function() return UnitsAroundUnit('target', 10) == 2 end)
--	"!toggle.chain" 
} ,      
-- 3+ units

{{
	{ "73680" }, 					-- unleash elements
	{ "1535", "target.debuff(8050)" },	-- fire nova if flame shock on target
	{ "117014", {					-- elemental blast
	  "player.buff(53817).count >= 1",
	  "player.spell(117014).exists"
	  }}, 
	{ "421", { 					-- cl instant with maelstrom weapon
	  "player.buff(53817).count = 5",
	  "!modifier.lcontrol" 
	}},
	{ "421", "player.buff(16188)" }, 	-- cl instant with as
	{ "17364", "target.range <= 6"  }, 	-- stormstrike
	{ "115356" },	-- Windstrike
	{ "60103", "target.range <= 6" }, 	-- lava lash
	{ "8050", {					-- flame shock with when no flame shock on target
	  "!target.debuff(8050)",
	  "player.buff(73683)"
	}},
	{ "8050", {					-- flame shock with when 9 seconds left on flame shock
	  "target.debuff(8050).duration <= 9",
	  "player.buff(73683)"
	}}, 	
	{ "421", { 					-- cl if everything else is on cooldown
	  "player.buff(53817).count >= 1",
	  "!modifier.lcontrol",
	  "player.spell(73680).cooldown >= 1.5",
	  "player.spell(17364).cooldown >= 1.5",
	  "player.spell(8050).cooldown >= 1.5",
	  "player.spell(60103).cooldown >= 1.5",
	  "!modifier.last(421)"
	}},
	{ "8190", { 					-- refresh magma totem if nothing else to do
	  "!player.totem(2894)",
	  "player.totem(8190).duration <= 20"	  
	}}
}, { (function() return UnitsAroundUnit('target', 10) >= 3 end) },
--    (function() return UnitsAroundUnit('target', 10) >= 3 end)
--	 "toggle.chain"      
} ,

-- single target smart aoe

{{
	{ "73680" }, 					-- unleash elements
	{ "117014", {					-- elemental blast
	  "player.buff(53817).count >= 1",
	  "player.spell(117014).exists"
	  }}, 
	{ "403", { 					-- lb instant with maelstrom weapon
	  "player.buff(53817).count = 5",
	  "!modifier.lcontrol" 
	}},
	{ "403", "player.buff(16188)" }, 	-- lb instant with as
	{ "17364", "target.range <= 6"  }, 	-- stormstrike
	{ "115356" }, -- Windstrike
	{ "60103", "target.range <= 6" }, 	-- lava lash
	{ "8050", {					-- flame shock with when no flame shock on target
	  "!target.debuff(8050)",
	  "player.buff(73683)"
	}},
	{ "8050", {					-- flame shock with when 9 seconds left on flame shock
	  "target.debuff(8050).duration <= 9",
	  "player.buff(73683)"
	}}, 	
	{ "8056" }, 	-- Frost Shock
	{ "403", { 					-- lb if everything else is on cooldown
	  "player.buff(53817).count >= 1",
	  "!modifier.lcontrol",
	  "player.spell(73680).cooldown >= 1.5",
	  "player.spell(17364).cooldown >= 1.5",
	  "player.spell(8050).cooldown >= 1.5",
	  "player.spell(60103).cooldown >= 1.5",
	  "!modifier.last(403)"
	}},
	{ "3599", { 					-- refresh searing totem if nothing else to do
	  "!player.totem(2894)",
	  "player.totem(3599).duration <= 20"	  
	}}
} , (function() return UnitsAroundUnit('target', 10) < 2 end) },

} , { "modifier.multitarget" },
} ,
-- Single Target (nested)
{{
	{ "73680" }, 					-- unleash elements
	{ "117014", {					-- elemental blast
	  "player.buff(53817).count >= 1",
	  "player.spell(117014).exists"
	  }}, 
	{ "403", { 					-- lb instant with maelstrom weapon
	  "player.buff(53817).count = 5",
	  "!modifier.lcontrol" 
	}},
	{ "403", "player.buff(16188)" }, 	-- lb instant with as
	{ "17364", "target.range <= 6"  }, 	-- stormstrike
	{ "115356" }, -- Windstrike
	{ "60103", "target.range <= 6" }, 	-- lava lash
	{ "8050", {					-- flame shock with when no flame shock on target
	  "!target.debuff(8050)",
	  "player.buff(73683)"
	}},
	{ "8050", {					-- flame shock with when 9 seconds left on flame shock
	  "target.debuff(8050).duration <= 9",
	  "player.buff(73683)"
	}}, 	
	{ "8056" }, 	-- Frost Shock
	{ "403", { 					-- lb if everything else is on cooldown
	  "player.buff(53817).count >= 1",
	  "!modifier.lcontrol",
	  "player.spell(73680).cooldown >= 1.5",
	  "player.spell(17364).cooldown >= 1.5",
	  "player.spell(8050).cooldown >= 1.5",
	  "player.spell(60103).cooldown >= 1.5",
	  "!modifier.last(403)"
	}},
	{ "3599", { 					-- refresh searing totem if nothing else to do
	  "!player.totem(2894)",
	  "player.totem(3599).duration <= 20"	  
	}}
} , "!modifier.multitarget" },
  
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



