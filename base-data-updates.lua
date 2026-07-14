local frep = require("__fdsl__.lib.recipe")

-------------------------------------------------------------------------- Coke

if settings.startup["alloy-smelting-coke"].value then
	AlloySmelting.smelt_in_kiln("steel-plate", {type="item", name="coke", amount=1})

	if mods["space-age"] then
		data.raw.item["carbon"].fuel_value = "5MJ"
	end
end

-------------------------------------------------------------------------- Metallurgy

if mods["space-age"] then
	if settings.startup["alloy-smelting-metallurgy"].value then
		AlloySmelting.add_catalyst("casting-steel", {type="item", name="carbon", amount=1}, 5)
	end
	if settings.startup["alloy-smelting-more-metallurgy"].value then
		frep.add_ingredient("molten-iron", {type="item", name="coke", amount=2})
		frep.add_ingredient("molten-copper", {type="item", name="coke", amount=2})
		frep.add_ingredient("molten-iron-from-lava", {type="item", name="coke", amount=5})
		frep.add_ingredient("molten-copper-from-lava", {type="item", name="coke", amount=5})

		local can_add_coke = true
		if (mods['IridescentIndustry']) then
			can_add_coke = mods["Arcanyx"] and not settings.startup["s6x-prismite-on-nauvis"].value
		end
		if (can_add_coke) then
			table.insert(data.raw.recipe["casting-low-density-structure"].ingredients, {type = "item", name = "coke", amount = 2})
		end
	end
end

-------------------------------------------------------------------------- Vulcanus

if mods["space-age"] then
	frep.add_category("tungsten-carbide", "kiln-smelting-with-fluid")
	frep.scale_time("tungsten-carbide", 6.4)
end

-------------------------------------------------------------------------- Gleba

if mods["space-age"] then
	frep.add_category("burnt-spoilage", "kiln-smelting")
	data.raw.recipe["burnt-spoilage"].allow_decomposition = false
end

-------------------------------------------------------------------------- Furnaces and assemblers

if settings.startup["alloy-smelting-create-kilns"].value then
	data.raw.item["stone-furnace"].order = "a[furnace]-a[stone]"
	data.raw.item["steel-furnace"].order = "a[furnace]-b[steel]"
	data.raw.item["electric-furnace"].order = "a[furnace]-c[electric]"
	if mods["aai-industry"] then
		data.raw.item["industrial-furnace"].order = "a[furnace]-d[industrial]"
	end
end

-------------------------------------------------------------------------- Misc mods

if mods["hot-metals"] then
	table.insert(HotMetals.craftingCategories, "kiln-smelting")
	table.insert(HotMetals.craftingCategories, "kiln-smelting-with-fluid")
end
