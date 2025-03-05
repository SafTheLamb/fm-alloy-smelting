local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

local function smelt_in_kiln(recipe_name)
  data.raw.recipe[recipe_name].category = "kiln-smelting"
  data.raw.recipe[recipe_name].auto_recycle = false
end

-------------------------------------------------------------------------- Coke

if settings.startup["alloy-smelting-coke"].value then
  ftech.add_unlock("kiln-smelting", "coke")
  if mods["crushing-industry"] and settings.startup["crushing-industry-coal"].value then
    ftech.add_unlock("oil-processing", "coke-from-crushed-coal")
  end

  smelt_in_kiln("steel-plate")
  frep.add_ingredient("steel-plate", {type="item", name="coke", amount=1})
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
    frep.add_ingredient("casting-steel", {type="item", name="carbon", amount=1})
    frep.scale_ingredient("casting-steel", "molten-iron", {amount=5})
    frep.scale_result("casting-steel", "steel-plate", {amount=5})
    frep.change_time("casting-steel", {scale=5})
  end
end

-------------------------------------------------------------------------- Vulcanus

if mods["space-age"] then
  ftech.add_prereq("planet-discovery-vulcanus", "kiln-smelting-2")
  smelt_in_kiln("tungsten-carbide")
  frep.change_time("tungsten-carbide", {scale=6.4})
end

-------------------------------------------------------------------------- Gleba

if mods["space-age"] then
  data.raw.recipe["burnt-spoilage"].category = "organic-or-kiln-smelting"
  data.raw.recipe["burnt-spoilage"].allow_decomposition = false
end

-------------------------------------------------------------------------- BZ Mods

-- Lead
if mods["bzlead"] then
  if settings.startup["alloy-smelting-coke"].value then
    smelt_in_kiln("lead-plate")
    frep.add_ingredient("lead-plate", {type="item", name="coke", amount=1})
    frep.scale_ingredient("lead-plate", "lead-ore", {amount=2.5})
    frep.scale_result("lead-plate", "lead-plate", {amount=2.5})
    frep.scale_result("lead-plate", "copper-ore", {probability=2.5})
    frep.change_time("lead-plate", {scale=2.5})
  end

  if data.raw.item["lead-expansion-bolt"] then
    frep.add_ingredient("electric-kiln", {type="item", name="lead-expansion-bolt", amount=4})
  end

  if mods["space-age"] and settings.startup["alloy-smelting-metallurgy"].value then
    frep.add_ingredient("molten-lead-from-lava", {type="item", name="carbon", amount=1})
    frep.add_ingredient("molten-lead", {type="item", name="carbon", amount=1})
  end

  ftech.add_unlock("kiln-smelting", "lead-plate")
  ftech.add_unlock("kiln-smelting", "lead-chest")
  ftech.add_unlock("kiln-smelting", "lead-expansion-bolt")
end

-- Tin
if mods["bztin"] then
  smelt_in_kiln("solder")
  frep.change_time("solder", {scale=6.4})
  ftech.add_unlock("kiln-smelting", "solder")

  if mods["aai-industry"] then
    ftech.add_prereq("electricity", "kiln-smelting")
    if not mods["apm_power_ldinc"] then
      ftech.add_prereq("glass-processing", "kiln-smelting")
    end
    ftech.add_prereq("basic-fluid-handling", "kiln-smelting")
  end

  if settings.startup["bztin-more-intermediates"].value == "bronze" then
    if settings.startup["alloy-smelting-coke"].value then
      smelt_in_kiln("bronze-plate")
      frep.add_ingredient("bronze-plate", {type="item", name="coke", amount=4})
    end

    if mods["space-age"] and settings.startup["alloy-smelting-metallurgy"].value then
      frep.add_ingredient("casting-bronze", {type="item", name="carbon", amount=1})
      frep.scale_ingredient("casting-bronze", "molten-copper", {amount=5})
      frep.scale_ingredient("casting-bronze", "molten-tin", {amount=5})
      frep.scale_result("casting-bronze", "bronze-plate", {amount=5})
    end
  end
end

-- Titanium
if mods["bztitanium"] then
  if settings.startup["alloy-smelting-coke"].value then
    smelt_in_kiln("titanium-plate")
    frep.add_ingredient("titanium-plate", {type="item", name="coke", amount=2})
  end

  if mods["space-age"] and settings.startup["alloy-smelting-metallurgy"].value then
    frep.add_ingredient("titanium-in-foundry", {type="item", name="carbon", amount=1})
  end
end

-------------------------------------------------------------------------- Furnaces

data.raw.item["stone-furnace"].order = "a[furnace]-a[stone]"
data.raw.item["steel-furnace"].order = "a[furnace]-b[steel]"
data.raw.item["electric-furnace"].order = "a[furnace]-c[electric]"
if mods["aai-industry"] then
  data.raw.item["industrial-furnace"].order = "a[furnace]-d[industrial]"
end

-------------------------------------------------------------------------- Crushing

if mods["crushing-industry"] then
  if not mods["aai-industry"] then
    ftech.add_unlock("kiln-smelting", "burner-crusher")
    ftech.add_unlock("kiln-smelting", "sand")

    if settings.startup["crushing-industry-glass"].value then
      ftech.add_prereq("automation-science-pack", "kiln-smelting")
    end
  end
end


-------------------------------------------------------------------------- Misc mods

if mods["hot-metals"] then
  table.insert(HotMetals.craftingCategories, "kiln-smelting")
end
