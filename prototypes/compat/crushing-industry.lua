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

  ------------------------------------------------------------------------ Crushed BZ Ores

  if settings.startup["crushing-industry-ore"].value then
    if mods["bzlead"] and settings.startup["alloy-smelting-coke"].value then
      AlloySmelting.smelt_in_kiln("crushed-lead-smelting", {type="item", name="coke", amount=1}, 5)
    end

    if mods["bztitanium"] and settings.startup["alloy-smelting-coke"].value then
      if data.raw.recipe["crushed-titanium-smelting"] then
        AlloySmelting.smelt_in_kiln("crushed-titanium-smelting", {type="item", name="coke", amount=2})
      end
    end
  end

  -- if mods["bztin"] and settings.startup["crushing-industry-glass"].value then
    -- Soon
  -- end
end
