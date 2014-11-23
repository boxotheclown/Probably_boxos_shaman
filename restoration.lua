-- ProbablyEngine Rotation Packager
-- Created on Oct 21st 2014 1:22 am
ProbablyEngine.rotation.register_custom(264, "Boxo's Resto", {
  --------------------
  -- Start Rotation --
  --------------------

  -- Pause
  { "pause", "modifier.lshift" },

  -- Interrupt
  { "57994", "modifier.interrupt" },   --Wind Shear

 
  --Survival
  --Windwalk totem
	{ "108273", {
		"toggle.survival",
		"!player.buff",
		"player.state.root"
	}, "player" }, 
	{ "108273", {
		"toggle.survival",
		"!player.buff",
		"player.state.snare"
	}, "player" }, 

 
  -- Healing Rain
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

-- emergency
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

	{ "Purge", "target.dispellable(Purge)", "target" },
	
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

-------------------
-- Out of Combat --	
-------------------

  -- Pause
  { "pause", "modifier.lshift" },

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

-- healing rain
	{ "Healing Rain", "modifier.lcontrol" , "mouseover.ground" },	

	{ "Earth Shield", {
		"focus.health <= 100", 
		"!focus.buff(Earth Shield)", 
		"focus.range <= 40",
	}, "focus" },
	{ "Water Shield", "!player.buff(Water Shield)" },

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

	{ "Healing Wave", {
		"lowest.health <= 85",
		"lowest.range <= 40",
	}, "lowest" },
	
}, function()
ProbablyEngine.toggle.create('md', 'Interface\\Icons\\ability_hunter_misdirection', 'Auto Misdirect', 'Automatially Misdirect when necessary')

end)