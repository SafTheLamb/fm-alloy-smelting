data:extend({
	{
		type = "bool-setting",
		name = "alloy-smelting-create-kilns",
		setting_type = "startup",
		default_value = true,
		order = "a[options]-a[create-kilns]"
	},
  
	{
		type = "bool-setting",
		name = "alloy-smelting-coke",
		setting_type = "startup",
		default_value = true,
		order = "b[smelting]-a[coke-alloys]"
	},
  
	{
		type = "string-setting",
		name = "alloy-smelting-coke-fuel-value",
		setting_type = "startup",
		default_value = "1.6MJ",
		allowed_values = { "1.0MJ", "1.6MJ", "2.0MJ", "3.2MJ", "4.0MJ", "4.8MJ" },		
		order = "b[smelting]-b[coke-fuel-value]"
	},
 
	{
		type = "bool-setting",
		name = "alloy-smelting-lds-coke",
		setting_type = "startup",
		default_value = false,
		order = "b[smelting]-c[coke-casting]"
	}, 
})

if mods["space-age"] then
	data:extend({
		{
			type = "bool-setting",
			name = "alloy-smelting-metallurgy",
			setting_type = "startup",
			default_value = true,
			order = "b[smelting]-b[metallurgy]"
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
