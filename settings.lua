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
  local glass_exists = mods["crushing-industry"] or mods["aai-industry"]
  data:extend({
    {
      type = "bool-setting",
      name = "alloy-smelting-tin-glass",
      setting_type = "startup",
      default_value = true,
      hidden = not glass_exists,
      order = "m[misc]-a[tin-glass]"
    }
  })
end
