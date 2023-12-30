name = "splorange's QOL (git)"
--The name of your mod
description = "Simple QOL mod that aims to remove small annoyances"
--The description that shows when you are selecting the mod from the list
author = "splorange"
--Your name!
version = "1.1"

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

configuration_options =
{
	{
	    name = "BELLED_BEEFALO_POOP",
	    label = "No Belled Beefalo Poop",
        options = {
	        {description = "Yes", data = true},
	        {description = "No", data = false},
	    },
	    default = true,
	    hover = "Removes Belled Beefalo's Ability to Poop"
	},

	{
	    name = "GUANO_LOOT",
	    label = "No Batilisk Guano Loot",
        options = {
	        {description = "Yes", data = true},
	        {description = "No", data = false},
	    },
	    default = true,
	    hover = "Removes Guano from the Batilisk's Loot Pool"
	}
}