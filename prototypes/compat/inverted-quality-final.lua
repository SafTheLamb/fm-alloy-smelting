if mods["Inverted-Quality"] then
	if not InvertedQuality then
		for _,name in pairs({
			"brick-kiln",
			"electric-kiln"
		}) do
			local kiln = data.raw["assembling-machine"][name]
			if kiln and kiln.effect_receiver and kiln.effect_receiver.base_effect then
				kiln.effect_receiver.base_effect.quality = nil
			end
		end
	end
end
