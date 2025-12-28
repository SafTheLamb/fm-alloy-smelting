local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

if mods["crushing-industry"] then
	if not mods["aai-industry"] then
		ftech.add_unlock("kiln-smelting", "burner-crusher")
		ftech.add_unlock("kiln-smelting", "sand")

		if settings.startup["crushing-industry-glass"].value then
			ftech.add_prereq("automation-science-pack", "kiln-smelting")
		end
	end

	if settings.startup["crushing-industry-glass"].value and settings.startup["alloy-smelting-glass"].value then
		if data.raw.recipe["glass"] then
			data.raw.recipe["glass"].category = "kiln-smelting"
		else
			frep.add_category("glass", "kiln-smelting")
		end
	end

	if settings.startup["crushing-industry-ore"].value then
		if mods["space-age"] then
			frep.add_category("crushed-tungsten-carbide", "kiln-smelting")
		end
	end
end
