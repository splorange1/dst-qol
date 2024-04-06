name = "splorange's QOL (git)"
--The name of your mod
description = "Simple QOL mod that aims to remove small annoyances"
--The description that shows when you are selecting the mod from the list
author = "splorange"
--Your name!
version = "1.2"

forumthread = ""

icon_atlas = "modicon.xml"

icon = "modicon.tex"

dst_compatible = true
forge_compatible = true
gorge_compatible = true

dont_starve_compatible = false
reign_of_giants_compatible = false
shipwrecked_compatible = false

all_clients_require_mod = false
server_only_mod = true
client_only_mod = false

api_version = 10
--This is the version of the game's API and should stay the same for the most part

-- CunningFox's Gorge Extender
local function Breaker(title_en)
	return {name = title_en , options = {{description = "", data = false}}, default = false}
end

configuration_options =
{
	Breaker("QoL Features"),
	{
		
	    name = "BELLED_BEEFALO_POOP",
	    label = "No Belled Beefalo Poop",
        options = {
	        {description = "Yes", data = true},
	        {description = "No", data = false},
	    },
	    default = true,
	    hover = "Removes belled Beefalo's ability to poop"
	},

	{
	    name = "GUANO_LOOT",
	    label = "No Batilisk Guano Loot",
        options = {
	        {description = "Yes", data = true},
	        {description = "No", data = false},
	    },
	    default = true,
	    hover = "Removes guano from the Batilisk's loot pool"
	},

	Breaker("Gameplay Tweaks"),
	{
	    name = "WILLOW_FRENZY_BUFF",
	    label = "Willow Burning Frenzy Buff",
        options = {
	        {description = "Yes", data = true},
	        {description = "No", data = false},
	    },
	    default = false,
	    hover = "Ignites enemies on-hit while burning frenzy is active"
	}
}