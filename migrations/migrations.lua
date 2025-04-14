for _,force in pairs(game.forces) do
  local technologies = force.technologies
  local recipes = force.recipes
  local mods = script.active_mods

  if technologies["advanced-material-processing-2"].researched then
    recipes["electric-kiln"].enabled = true
  end
end
