local T, C, L, _ = unpack(select(2, ...))
if C.minimap.enable ~= true or C.skins.minimap_buttons ~= true then return end

----------------------------------------------------------------------------------------
--	Collect minimap buttons in one line
----------------------------------------------------------------------------------------
local BlackList = {
	["QueueStatusMinimapButton"] = true,
	["MiniMapTracking"] = true,
	["MiniMapMailFrame"] = true,
	["HelpOpenTicketButton"] = true,
	["GameTimeFrame"] = true,
}

local buttons = {}
local button = CreateFrame("Frame", "ButtonCollectFrame", UIParent)
local line = math.ceil(C.minimap.size / 20)

local function PositionAndStyle()
	button:SetSize(20, 20)
	button:SetPoint(unpack(C.position.minimap_buttons))
	for i = 1, #buttons do
		buttons[i]:ClearAllPoints()
		if i == 1 then
			buttons[i]:SetPoint("TOP", button, "TOP", 0, 0)
		else
			buttons[i]:SetPoint("TOP", buttons[i-1], "BOTTOM", 0, -1)
		end
		buttons[i]:SetBackdropBorderColor(unpack(C.media.border_color))
		buttons[i].ClearAllPoints = T.dummy
		buttons[i].SetPoint = T.dummy
		if C.skins.minimap_buttons_mouseover == true then
			buttons[i]:SetAlpha(0)
			buttons[i]:HookScript("OnEnter", function()
				if InCombatLockdown() then return end
				buttons[i]:FadeIn()
			end)
			buttons[i]:HookScript("OnLeave", function()
				buttons[i]:FadeOut()
			end)
		end
	end
end

local collect = CreateFrame("Frame")
collect:RegisterEvent("PLAYER_ENTERING_WORLD")
collect:SetScript("OnEvent", function(self)
	for i, child in ipairs({Minimap:GetChildren()}) do
		local Handy = child:GetName() and (string.find(child:GetName(), "HandyNotesPin"))
		if not BlackList[child:GetName()] and not Handy then
			if child:GetObjectType() == "Button" and child:GetNumRegions() >= 3 and child:IsShown() then
				child:SetParent(button)
				tinsert(buttons, child)
			end
		end
	end
	if #buttons == 0 then
		button:Hide()
	end
	PositionAndStyle()
end)