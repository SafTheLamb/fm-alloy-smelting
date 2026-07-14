local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

if mods["crushing-industry"] then
	if settings.startup["crushing-industry-glass"].value and settings.startup["alloy-smelting-glass"].value then
		ftech.remove_unlock("electronics", "glass")
		ftech.add_unlock("kiln-smelting", "glass")
		frep.replace_category("glass", "smelting", "kiln-smelting")
	end
end
