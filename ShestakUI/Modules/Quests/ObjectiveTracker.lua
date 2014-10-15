local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	Move ObjectiveTrackerFrame
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame", "WatchFrameAnchor", UIParent)
frame:SetPoint(unpack(C.position.quest))
frame:SetHeight(150)
frame:SetWidth(224)

ObjectiveTrackerFrame:ClearAllPoints()
ObjectiveTrackerFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, 0)
ObjectiveTrackerFrame:SetHeight(T.getscreenheight / 1.6)

hooksecurefunc(ObjectiveTrackerFrame, "SetPoint", function(_, _, parent)
	if parent ~= frame then
		ObjectiveTrackerFrame:ClearAllPoints()
		ObjectiveTrackerFrame:SetPoint("TOPLEFT", frame, "TOPLEFT", 20, 0)
	end
end)

----------------------------------------------------------------------------------------
--	Skin ObjectiveTrackerFrame item buttons
----------------------------------------------------------------------------------------
hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", function(_, block)
	local item = block.itemButton

	if item and not item.skinned then
		item:SetSize(C.actionbar.button_size, C.actionbar.button_size)
		item:SetTemplate("Default")
		item:StyleButton()

		item:SetNormalTexture(nil)

		item.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		item.icon:SetPoint("TOPLEFT", item, 2, -2)
		item.icon:SetPoint("BOTTOMRIGHT", item, -2, 2)

		item.HotKey:ClearAllPoints()
		item.HotKey:SetPoint("BOTTOMRIGHT", 0, 2)
		item.HotKey:SetFont(C.font.action_bars_font, C.font.action_bars_font_size, C.font.action_bars_font_style)
		item.HotKey:SetShadowOffset(C.font.action_bars_font_shadow and 1 or 0, C.font.action_bars_font_shadow and -1 or 0)

		item.Count:ClearAllPoints()
		item.Count:SetPoint("TOPLEFT", 1, -1)
		item.Count:SetFont(C.font.action_bars_font, C.font.action_bars_font_size, C.font.action_bars_font_style)
		item.Count:SetShadowOffset(C.font.action_bars_font_shadow and 1 or 0, C.font.action_bars_font_shadow and -1 or 0)

		item.skinned = true
	end
end)

----------------------------------------------------------------------------------------
--	Difficulty color for ObjectiveTrackerFrame lines
----------------------------------------------------------------------------------------
--WoD hooksecurefunc("ObjectiveTracker_Update", function()
	-- local numQuestWatches = GetNumQuestWatches()

	-- for i = 1, numQuestWatches do
		-- local questIndex = GetQuestIndexForWatch(i)
		-- if questIndex then
			-- local title, level = GetQuestLogTitle(questIndex)
			-- local col = GetQuestDifficultyColor(level)

			-- for j = 1, #WATCHFRAME_QUESTLINES do
				-- if WATCHFRAME_QUESTLINES[j].text:GetText() == title then
					-- WATCHFRAME_QUESTLINES[j].text:SetTextColor(col.r, col.g, col.b)
					-- WATCHFRAME_QUESTLINES[j].col = col
				-- end
			-- end
			-- for k = 1, #WATCHFRAME_ACHIEVEMENTLINES do
				-- WATCHFRAME_ACHIEVEMENTLINES[k].col = nil
			-- end
		-- end
	-- end
-- end)

--WoD hooksecurefunc("WatchFrameLinkButtonTemplate_Highlight", function(self, onEnter)
	-- i = self.startLine
	-- if not (self.lines[i] and self.lines[i].col) then return end
	-- if onEnter then
		-- self.lines[i].text:SetTextColor(1, 0.8, 0)
	-- else
		-- self.lines[i].text:SetTextColor(self.lines[i].col.r, self.lines[i].col.g, self.lines[i].col.b)
	-- end
-- end)

for _, headerName in pairs({"QuestHeader", "AchievementHeader", "ScenarioHeader"}) do
	local header = ObjectiveTrackerFrame.BlocksFrame[headerName].Background:Hide()
end

----------------------------------------------------------------------------------------
--	Skin ObjectiveTrackerFrame.HeaderMenu.MinimizeButton
----------------------------------------------------------------------------------------
if C.skins.blizzard_frames == true then
	T.SkinCloseButton(ObjectiveTrackerFrame.HeaderMenu.MinimizeButton, nil, "-", true)

	hooksecurefunc("ObjectiveTracker_Collapse", function()
		ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.text:SetText("+")
	end)

	hooksecurefunc("ObjectiveTracker_Expand", function()
		ObjectiveTrackerFrame.HeaderMenu.MinimizeButton.text:SetText("-")
	end)
end