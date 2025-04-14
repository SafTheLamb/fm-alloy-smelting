data:extend({
  {
    type = "technology",
    name = "kiln-smelting",
    icon = "__alloy-smelting__/graphics/technology/kiln-smelting.png",
    icon_size = 256,
    effects = {
      {type="unlock-recipe", recipe="brick-kiln"}
    },
    research_trigger = {
      type = "craft-item",
      item = "stone-brick",
      count = 10
    },
  }
})
