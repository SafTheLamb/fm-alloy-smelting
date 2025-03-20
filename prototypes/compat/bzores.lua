local frep = require("__fdsl__.lib.recipe")
local ftech = require("__fdsl__.lib.technology")

-------------------------------------------------------------------------- Lead
if mods["bzlead"] then
  if settings.startup["alloy-smelting-coke"].value then
    AlloySmelting.smelt_in_kiln("lead-plate", {type="item", name="coke", amount=1}, 2.5)
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
  AlloySmelting.smelt_in_kiln("solder")
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
      AlloySmelting.smelt_in_kiln("bronze-plate")
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
    AlloySmelting.smelt_in_kiln("titanium-plate")
    frep.add_ingredient("titanium-plate", {type="item", name="coke", amount=2})
  end

  if mods["space-age"] and settings.startup["alloy-smelting-metallurgy"].value then
    frep.add_ingredient("titanium-in-foundry", {type="item", name="carbon", amount=1})
  end
end
