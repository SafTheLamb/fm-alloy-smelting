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
end

-------------------------------------------------------------------------- Vulcanus

if mods["space-age"] then
  frep.add_category("tungsten-carbide", "kiln-smelting")
  frep.change_time("tungsten-carbide", {scale=6.4})
end

-------------------------------------------------------------------------- Gleba

if mods["space-age"] then
  frep.add_category("burnt-spoilage", "kiln-smelting")
  data.raw.recipe["burnt-spoilage"].allow_decomposition = false
end

-------------------------------------------------------------------------- Furnaces and assemblers

data.raw.item["stone-furnace"].order = "a[furnace]-a[stone]"
data.raw.item["steel-furnace"].order = "a[furnace]-b[steel]"
data.raw.item["electric-furnace"].order = "a[furnace]-c[electric]"
if mods["aai-industry"] then
  data.raw.item["industrial-furnace"].order = "a[furnace]-d[industrial]"
end

for _,machine in pairs(data.raw["assembling-machine"]) do
  for _,category in pairs(machine.crafting_categories) do
    if category == "crafting-with-fluid" then
      table.insert(machine.crafting_categories, "kiln-smelting-or-crafting")
    end
    if category == "organic" then
      table.insert(machine.crafting_categories, "organic-or-kiln-smelting")
    end
  end
end

-------------------------------------------------------------------------- Misc mods

if mods["hot-metals"] then
  table.insert(HotMetals.craftingCategories, "kiln-smelting")
  table.insert(HotMetals.craftingCategories, "kiln-smelting-or-crafting")
  table.insert(HotMetals.craftingCategories, "organic-or-kiln-smelting")
end
