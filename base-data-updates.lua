local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Coke

if settings.startup["alloy-smelting-coke"].value then
  ftech.add_unlock("kiln-smelting", "coke")
  if mods["crushing-industry"] and settings.startup["crushing-industry-coal"].value then
    ftech.add_unlock("oil-processing", "coke-from-crushed-coal")
  end

  AlloySmelting.smelt_in_kiln("steel-plate", {type="item", name="coke", amount=1})
  ftech.add_prereq("steel-processing", "kiln-smelting")

  if mods["space-age"] then
    data.raw.item["carbon"].fuel_value = "5MJ"
    if mods["crushing-industry"] and settings.startup["crushing-industry-coal"].value then
      frep.replace_ingredient("carbon", "coal", {type="item", name="coke", amount=8})
    else
      frep.replace_ingredient("carbon", "coal", {type="item", name="coke", amount=5})
    end
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
  data.raw.recipe["tungsten-carbide"].category = "kiln-smelting-or-crafting"
  frep.change_time("tungsten-carbide", {scale=6.4})
end

-------------------------------------------------------------------------- Gleba

if mods["space-age"] then
  data.raw.recipe["burnt-spoilage"].category = "organic-or-kiln-smelting"
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
end
