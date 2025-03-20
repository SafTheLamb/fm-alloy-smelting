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

  if settings.startup["crushing-industry-ore"].value then
    if mods["bzlead"] and settings.startup["alloy-smelting-coke"].value then
      frep.scale_ingredient("crushed-lead-smelting", "crushed-lead-ore", {amount=5})
      frep.scale_result("crushed-lead-smelting", "lead-plate", {amount=5})
      frep.add_ingredient("crushed-lead-smelting", {type="item", name="coke", amount=1})
      frep.change_time("crushed-lead-smelting", {scale=2.5})
    end

    if mods["bztitanium"] and settings.startup["alloy-smelting-coke"].value then
      if data.raw.recipe["crushed-titanium-smelting"] then
        frep.add_ingredient("crushed-titanium-smelting", {type="item", name="coke", amount=2})
      end
    end
  end

  -- if mods["bztin"] and settings.startup["crushing-industry-glass"].value then
    -- Soon
  -- end
end
