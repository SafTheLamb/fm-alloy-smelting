local frep = require("__fdsl__.lib.recipe")

if mods["scrap-chemistry"] then
	if settings.startup["alloy-smelting-coke"].value and settings.startup["alloy-smelting-coke-tar"].value then
		frep.add_result("coke", {type="item", name="tar", amount=1, probability=0.1})
		frep.add_result("coke-from-crushed-coal", {type="item", name="tar", amount=1, probability=0.1})
		frep.add_result("coke-from-carbon", {type="item", name="tar", amount=1, probability=0.15})
	end
end
