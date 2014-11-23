-- ProbablyEngine Rotation Packager
-- Created on Oct 21st 2014 1:22 am
ProbablyEngine.rotation.register_custom(264, "Boxo's Resto", {
  --------------------
  -- Start Rotation --
  --------------------

  -- From Akeon's Elemental Profile[http://pe.phelps.io/forums/viewtopic.php?id=41]
  -- Rotation Utilities
  { "pause", "modifier.lshift" },
  --{ "/script TargetNearestEnemy()", { "toggle.autotarget", "!target.exists" } },
  --{ "/script TargetNearestEnemy()", { "toggle.autotarget", "target.exists", "target.dead" } },
  
  -- Interrupt
  --Wind Shear
  { "57994", "modifier.interrupt" },
 
  --Survival Abilities
  --Windwalk x2
  { "108273", { "toggle.survival", "!player.buff", "player.state.root" }, "player" }, 
  { "108273", { "toggle.survival", "!player.buff", "player.state.snare" }, "player" }, 
--  { "77130", { "toggle.survival", "!modifier.last(77130)", "player.dispellable(77130)" }, "player" }, 
 
  -- Control Toggles[Modified]
  { "Healing Rain", "modifier.lcontrol" , "mouseover.ground" },

 -- water shield
 
	{ "Water Shield", "!player.buff(Water Shield)" },
  
  -- Akeon's Mouseover Cleanse
	{ "77130", { 
		"modifier.lalt",
		"!modifier.last(77130)",
		"mouseover.exists",
		"mouseover.alive",
		"mouseover.friend",
		"mouseover.range <= 40",
--		"mouseover.dispellable(77130)"
	}, "mouseover" },

	
-- earth shield

	{ "Earth Shield", {
		"focus.health <= 100", 
		"!focus.buff(Earth Shield)", 
		"focus.range <= 40",
	}, "focus" },

--	{ "Elemental Blast", "talent(6, 3)" },
-- emergency
	{ "Ascendance", { 
		"@coreHealing.needsHealing(40,3)", 
		"!player.buff(Ascendance)", 
		"modifier.cooldowns"
	}},
	{ "Ancestral Swiftness", "lowest.health <= 40" },
	{ "Healing Wave", {
		"player.buff(Ancestral Swiftness)",
		"lowest.range <= 40"
	}, "lowest" },
	{ "Healing Surge", {
		"lowest.health <= 40",
		"lowest.range <= 40"
	}, "lowest" },

-- purge

	{ "Purge", "target.dispellable(Tranquilizing Shot)", "target" },
	
-- high raid damage

{{
	{ "Healing Stream Totem" },
	{ "Unleash Life" },
	{ "Chain Heal", { 
		"@coreHealing.needsHealing(60, 3)",
--		"lowest.area(12).players >= 2",
		"lowest.range <= 40" 
	}, "lowest" },
}, "@coreHealing.needsHealing(60, 3)", },

-- high single target
	  	  
	{ "Riptide", { 
		"focus.health <= 100", 
		"!focus.buff(Riptide)", 
		"focus.range <= 40"
	}, "focus" },
	{ "Healing Wave", {
		"talent{6, 1)",
		"player.buff(Unleash Life)",
		"lowest.range <= 40",
	}, "lowest" },
	{ "Riptide", {
		"lowest.health <= 95",
		"lowest.range <= 40",
		"!lowest.buff(Riptide)",
		"focus.buff(Riptide).duration > 6",
	}, "lowest" },
	
	{ "Cloudburst Totem", { "talent(7, 1)", "!player.totem(Healing Stream Totem)", "!player.totem(Healing Tide Totem)" } },
	{ "Healing Stream Totem", { "!player.totem(Healing Tide Totem)", "!player.totem(Cloudburst Totem)" } },
	{ "Elemental Blast", { "talent(6, 3)", "player.mana < 50" } },
	{ "Chain Heal", {
		"!player.buff(Tidal Waves)",
		"lowest.health <= 85",
		"lowest.range <= 40",
	}, "lowest" },
	{ "Healing Wave", {
		"lowest.health <= 85",
		"lowest.range <= 40",
	}, "lowest" },
	{ "Chain Heal", {
		"@coreHealing.needsHealing(75, 3)",
		"lowest.range <= 40",
--		"lowest.area(10).
	}, "lowest" },
	{ "Unleash Life", "lowest.health <= 70" },
	{ "Healing Surge", {
		"lowest.health <= 45",
		"lowest.range <= 40",
	}, "lowest" },
	{ "Healing Stream Totem" },
	{ "Elemental Blast", "talent(6, 3)" },
},
  
{
	{ "Earth Shield", {
		"focus.health <= 100", 
		"!focus.buff(Earth Shield)", 
		"focus.range <= 40",
	}, "focus" },
	{ "Water Shield", "!player.buff(Water Shield)" },
	{ "Healing Rain", "modifier.lcontrol" , "mouseover.ground" },
	{ "Riptide", { 
		"focus.health <= 100", 
		"!focus.buff(Riptide)", 
		"focus.range <= 40"
	}, "focus" },
	{ "Riptide", {
		"lowest.health <= 90",
		"lowest.range <= 40",
		"!lowest.buff(Riptide)",
		"focus.buff(Riptide).duration > 6",
	}, "lowest" },
	
}, function()
ProbablyEngine.toggle.create('md', 'Interface\\Icons\\ability_hunter_misdirection', 'Auto Misdirect', 'Automatially Misdirect when necessary')

end)