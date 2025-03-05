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
