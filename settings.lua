data:extend({
  {
    type = "bool-setting",
    name = "alloy-smelting-coke",
    setting_type = "startup",
    default_value = true,
    order = "a[smelting]-a[coke-alloys]"
  },
})

if mods["space-age"] then
  data:extend({
    {
      type = "bool-setting",
      name = "alloy-smelting-metallurgy",
      setting_type = "startup",
      default_value = true,
      order = "a[smelting]-b[metallurgy]"
    }
  })
end

if mods["bztin"] then
  if (mods["crushing-industry"] and settings.startup["crushing-industry-glass"].value) or mods["aai-industry"] then
    data:extend({
      {
        type = "bool-setting",
        name = "alloy-smelting-tin-glass",
        setting_type = "startup",
        default_value = true,
        order = "m[misc]-a[tin-glass]"
      }
    })
  end
end
