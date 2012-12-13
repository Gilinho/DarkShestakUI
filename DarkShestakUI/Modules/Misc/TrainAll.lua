﻿local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
-- Learn all available skills(TrainAll by SDPhantom)
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addon)
	if addon == "Blizzard_TrainerUI" then
		local button = CreateFrame("Button", "ClassTrainerTrainAllButton", ClassTrainerFrame, "UIPanelButtonTemplate")
		button:SetText(QUICKBUTTON_NAME_EVERYTHING)
		if C.skins.blizzard_frames == true then
			button:SkinButton()
			button:SetPoint("TOPRIGHT", ClassTrainerTrainButton, "TOPLEFT", -3, 0)
		else
			button:SetPoint("TOPRIGHT", ClassTrainerTrainButton, "TOPLEFT", 0, 0)
		end
		button:SetWidth(min(50, button:GetTextWidth() + 15))
		button:SetScript("OnClick", function()
			for i = 1, GetNumTrainerServices() do
				if select(3, GetTrainerServiceInfo(i)) == "available" then
					BuyTrainerService(i)
				end
			end
		end)
		hooksecurefunc("ClassTrainerFrame_Update", function()
			for i = 1, GetNumTrainerServices() do
				if select(3, GetTrainerServiceInfo(i)) == "available" then
					button:Enable()
					--button:Show()
					return
				end
			end
			button:Disable()
			--button:Hide()
		end)
	end
end)