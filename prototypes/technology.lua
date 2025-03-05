data:extend({
  {
    type = "technology",
    name = "kiln-smelting",
    icon = "__alloy-smelting__/graphics/technology/kiln-smelting.png",
    icon_size = 256,
    effects = {
      {type="unlock-recipe", recipe="brick-kiln"}
    },
    unit = mods["aai-industry"] and {
      count = 10,
      ingredients = {{"automation-science-pack", 1}},
      time = 10
    } or nil,
    research_trigger = not mods["aai-industry"] and {
      type = "craft-item",
      item = "stone-brick",
      count = 10
    } or nil,
  },
  {
    type = "technology",
    name = "kiln-smelting-2",
    icon = "__alloy-smelting__/graphics/technology/kiln-smelting-2.png",
    icon_size = 256,
    prerequisites = {"processing-unit", "low-density-structure"},
    effects = {
      {type="unlock-recipe", recipe="electric-kiln"}
    },
    unit = {
      count = 250,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    }
  },
})
