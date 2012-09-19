local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	QuestLog skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	QuestLogFrame:StripTextures()
	QuestLogFrame:CreateBackdrop("Transparent")
	QuestLogFrame.backdrop:Point("TOPLEFT", 0, 0)
	QuestLogFrame.backdrop:Point("BOTTOMRIGHT", 0, 0)
	T.SkinCloseButton(QuestLogFrameCloseButton, QuestLogFrame.backdrop)

	QuestLogCount:StripTextures()
	QuestLogFrameInset:StripTextures()
	EmptyQuestLogFrame:StripTextures()
	QuestLogScrollFrame:StripTextures(true)

	QuestLogFrameShowMapButton:StripTextures()
	QuestLogFrameShowMapButton:SkinButton()
	QuestLogFrameShowMapButton.text:ClearAllPoints()
	QuestLogFrameShowMapButton.text:SetPoint("CENTER", 1, 0)
	QuestLogFrameShowMapButton:Size(QuestLogFrameShowMapButton:GetWidth() - 30, QuestLogFrameShowMapButton:GetHeight(), - 40)

	local buttons = {
		"QuestLogFrameAbandonButton",
		"QuestLogFramePushQuestButton",
		"QuestLogFrameTrackButton",
		"QuestLogFrameCancelButton",
		"QuestLogFrameCompleteButton"
	}

	QuestLogFrameCompleteButton:StripTextures()
	for _, button in pairs(buttons) do
		_G[button]:SkinButton()
	end

	for i = 1, MAX_NUM_ITEMS do
		_G["QuestInfoItem"..i]:StripTextures()
		_G["QuestInfoItem"..i]:StyleButton()
		_G["QuestInfoItem"..i]:Width(_G["QuestInfoItem"..i]:GetWidth() - 4)
		_G["QuestInfoItem"..i]:SetFrameLevel(_G["QuestInfoItem"..i]:GetFrameLevel() + 2)
		_G["QuestInfoItem"..i.."IconTexture"]:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		_G["QuestInfoItem"..i.."IconTexture"]:SetDrawLayer("OVERLAY")
		_G["QuestInfoItem"..i.."IconTexture"]:Point("TOPLEFT", 2, -2)
		_G["QuestInfoItem"..i.."IconTexture"]:Size(_G["QuestInfoItem"..i.."IconTexture"]:GetWidth() - 2, _G["QuestInfoItem"..i.."IconTexture"]:GetHeight() - 2)
		_G["QuestInfoItem"..i]:SetTemplate("Overlay")
		_G["QuestInfoItem"..i.."Name"]:SetFont(C.media.normal_font, 12)
		_G["QuestInfoItem"..i.."Name"]:SetDrawLayer("OVERLAY")
		_G["QuestInfoItem"..i.."Count"]:SetDrawLayer("OVERLAY")
	end

	QuestInfoSkillPointFrame:StripTextures()
	QuestInfoSkillPointFrame:StyleButton()
	QuestInfoSkillPointFrame:Width(QuestInfoSkillPointFrame:GetWidth() - 4)
	QuestInfoSkillPointFrame:SetFrameLevel(QuestInfoSkillPointFrame:GetFrameLevel() + 2)
	QuestInfoSkillPointFrameIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	QuestInfoSkillPointFrameIconTexture:SetDrawLayer("OVERLAY")
	QuestInfoSkillPointFrameIconTexture:Point("TOPLEFT", 2, -2)
	QuestInfoSkillPointFrameIconTexture:Size(QuestInfoSkillPointFrameIconTexture:GetWidth() - 2, QuestInfoSkillPointFrameIconTexture:GetHeight() - 2)
	QuestInfoSkillPointFrame:SetTemplate("Overlay")
	QuestInfoSkillPointFrameName:SetDrawLayer("OVERLAY")
	QuestInfoSkillPointFramePoints:SetDrawLayer("OVERLAY")
	QuestInfoSkillPointFramePoints:SetFont(C.media.normal_font, 15, "OUTLINE")
	QuestInfoSkillPointFramePoints:ClearAllPoints()
	QuestInfoSkillPointFramePoints:Point("BOTTOMRIGHT", QuestInfoSkillPointFrameIconTexture, "BOTTOMRIGHT", 0, 0)

	QuestInfoRewardSpell:StripTextures()
	QuestInfoRewardSpell:StyleButton()
	QuestInfoRewardSpell:Width(QuestInfoRewardSpell:GetWidth() - 4)
	QuestInfoRewardSpell:Height(QuestInfoRewardSpell:GetHeight() - 13)
	QuestInfoRewardSpell:SetFrameLevel(QuestInfoRewardSpell:GetFrameLevel() + 2)
	QuestInfoRewardSpellIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	QuestInfoRewardSpellIconTexture:SetDrawLayer("OVERLAY")
	QuestInfoRewardSpellIconTexture:Point("TOPLEFT", 2, -2)
	QuestInfoRewardSpell:SetTemplate("Overlay")
	QuestInfoRewardSpellName:SetFont(C.media.normal_font, 12)
	QuestInfoRewardSpellName:SetDrawLayer("OVERLAY")

	QuestInfoItemHighlight:StripTextures()
	QuestInfoItemHighlight:SetTemplate("Default")
	QuestInfoItemHighlight:SetBackdropBorderColor(1, 0.8, 0)
	QuestInfoItemHighlight:SetBackdropColor(0, 0, 0, 0)
	QuestInfoItemHighlight:Size(142, 40)

	hooksecurefunc("QuestInfoItem_OnClick", function(self)
		QuestInfoItemHighlight:ClearAllPoints()
		QuestInfoItemHighlight:SetAllPoints(self)
	end)

	-- Everything here to make the text a readable color
	local function QuestObjectiveText()
		local numObjectives = GetNumQuestLeaderBoards()
		local objective
		local numVisibleObjectives = 0
		for i = 1, numObjectives do
			local _, type, finished = GetQuestLogLeaderBoard(i)
			if type ~= "spell" then
				numVisibleObjectives = numVisibleObjectives + 1
				objective = _G["QuestInfoObjective"..numVisibleObjectives]
				if finished then
					objective:SetTextColor(1, 0.8, 0)
				else
					objective:SetTextColor(0.6, 0.6, 0.6)
				end
			end
		end
	end

	hooksecurefunc("QuestInfo_Display", function(template, parentFrame, acceptButton, material)
		local textColor = {1, 1, 1}
		local titleTextColor = {1, 0.8, 0}
		local titleTextShadow = {0, 0, 0}

		-- Headers
		QuestInfoTitleHeader:SetTextColor(unpack(titleTextColor))
		QuestInfoTitleHeader:SetShadowColor(unpack(titleTextShadow))
		QuestInfoDescriptionHeader:SetTextColor(unpack(titleTextColor))
		QuestInfoDescriptionHeader:SetShadowColor(unpack(titleTextShadow))
		QuestInfoObjectivesHeader:SetTextColor(unpack(titleTextColor))
		QuestInfoObjectivesHeader:SetShadowColor(unpack(titleTextShadow))
		QuestInfoRewardsHeader:SetTextColor(unpack(titleTextColor))
		QuestInfoRewardsHeader:SetShadowColor(unpack(titleTextShadow))
		-- Other text
		QuestInfoDescriptionText:SetTextColor(unpack(textColor))
		QuestInfoObjectivesText:SetTextColor(unpack(textColor))
		QuestInfoGroupSize:SetTextColor(unpack(textColor))
		QuestInfoRewardText:SetTextColor(unpack(textColor))
		-- Reward frame text
		QuestInfoItemChooseText:SetTextColor(unpack(textColor))
		QuestInfoItemReceiveText:SetTextColor(unpack(textColor))
		QuestInfoSpellLearnText:SetTextColor(unpack(textColor))
		QuestInfoXPFrameReceiveText:SetTextColor(unpack(textColor))

		QuestObjectiveText()
	end)

	hooksecurefunc("QuestInfo_ShowRequiredMoney", function()
		local requiredMoney = GetQuestLogRequiredMoney()
		if requiredMoney > 0 then
			if requiredMoney > GetMoney() then
				QuestInfoRequiredMoneyText:SetTextColor(0.6, 0.6, 0.6)
			else
				QuestInfoRequiredMoneyText:SetTextColor(1, 0.8, 0)
			end
		end
	end)

	QuestLogFrame:HookScript("OnShow", function()
		QuestLogFrameAbandonButton:ClearAllPoints()
		QuestLogFrameAbandonButton:Point("BOTTOMLEFT", QuestLogFrame.backdrop, "BOTTOMLEFT", 4, 4)
		QuestLogFramePushQuestButton:Point("LEFT", QuestLogFrameAbandonButton, "RIGHT", 3, 0)
		QuestLogFramePushQuestButton:Point("RIGHT", QuestLogFrameTrackButton, "LEFT", -3, 0)
		QuestLogFrameCancelButton:Point("BOTTOMRIGHT", QuestLogFrame.backdrop, "BOTTOMRIGHT", -4, 4)
		QuestLogFrameTrackButton:Point("BOTTOMRIGHT", QuestLogFrame.backdrop, "BOTTOMRIGHT", -4, 4)
	end)
end

tinsert(T.SkinFuncs["ShestakUI"], LoadSkin)