local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

if mods["aai-industry"] then
  frep.replace_ingredient("industrial-furnace", "steel-plate", "low-density-structure")
  frep.replace_ingredient("industrial-furnace", "concrete", "refined-concrete")
  frep.add_ingredient("industrial-furnace", {type="item", name="electric-kiln", amount=1})
  ftech.add_prereq("industrial-furnace", "low-density-structure")
  local industrial_furnace = data.raw["assembling-machine"]["industrial-furnace"]
  for _,category in pairs(data.raw["assembling-machine"]["electric-kiln"].crafting_categories) do
    table.insert(industrial_furnace.crafting_categories, category)
  end
end
