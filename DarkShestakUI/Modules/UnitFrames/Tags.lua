local T, C, L, _ = unpack(select(2, ...))
if C.unitframe.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Tags
----------------------------------------------------------------------------------------
local _, ns = ...
local oUF = ns.oUF

oUF.Tags["Threat"] = function(unit)
	local tanking, status, percent = UnitDetailedThreatSituation("player", "target")
	if percent and percent > 0 then
		return ("%s%d%%|r"):format(Hex(GetThreatStatusColor(status)), percent)
	end
end
oUF.TagEvents["Threat"] = "UNIT_THREAT_LIST_UPDATE"

oUF.Tags["DiffColor"] = function(unit)
	local r, g, b
	local level = UnitLevel(unit)
	if level < 1 then
		r, g, b = 0.69, 0.31, 0.31
	else
		local DiffColor = UnitLevel("target") - UnitLevel("player")
		if DiffColor >= 5 then
			r, g, b = 0.69, 0.31, 0.31
		elseif DiffColor >= 3 then
			r, g, b = 0.71, 0.43, 0.27
		elseif DiffColor >= -2 then
			r, g, b = 0.84, 0.75, 0.65
		elseif -DiffColor <= GetQuestGreenRange() then
			r, g, b = 0.33, 0.59, 0.33
		else
			r, g, b = 0.55, 0.57, 0.61
		end
	end
	return string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
end
oUF.TagEvents["DiffColor"] = "UNIT_LEVEL"

oUF.Tags["PetNameColor"] = function(unit)
	return string.format("|cff%02x%02x%02x", T.color.r * 255, T.color.g * 255, T.color.b * 255)
end
oUF.TagEvents["PetNameColor"] = "UNIT_POWER"

oUF.Tags["GetNameColor"] = function(unit)
	local reaction = UnitReaction(unit, "player")
	local tapped = UnitIsTapped(unit)
	local tappedbyplayer = UnitIsTappedByPlayer(unit)
	if UnitIsPlayer(unit) then
		return _TAGS["raidcolor"](unit)
	elseif tapped and not tappedbyplayer then
		local c = T.oUF_colors.tapped
		return string.format("|cff%02x%02x%02x", c[1] * 255, c[2] * 255, c[3] * 255)
	elseif reaction then
		local c = T.oUF_colors.reaction[reaction]
		return string.format("|cff%02x%02x%02x", c[1] * 255, c[2] * 255, c[3] * 255)
	else
		r, g, b = 0.84, 0.75, 0.65
		return string.format("|cff%02x%02x%02x", r * 255, g * 255, b * 255)
	end
end
oUF.TagEvents["GetNameColor"] = "UNIT_HEALTH"

oUF.Tags["NameArena"] = function(unit)
	local name = UnitName(unit)
	return T.UTF(name, 4, false)
end
oUF.TagEvents["NameArena"] = "UNIT_NAME_UPDATE"

oUF.Tags["NameShort"] = function(unit)
	local name = UnitName(unit)
	return T.UTF(name, 8, false)
end
oUF.TagEvents["NameShort"] = "UNIT_NAME_UPDATE"

oUF.Tags["NameMedium"] = function(unit)
	local name = UnitName(unit)
	return T.UTF(name, 11, true)
end
oUF.TagEvents["NameMedium"] = "UNIT_NAME_UPDATE"

oUF.Tags["NameLong"] = function(unit)
	local name = UnitName(unit)
	return T.UTF(name, 18, true)
end
oUF.TagEvents["NameLong"] = "UNIT_NAME_UPDATE"

oUF.Tags["LFD"] = function(unit)
	local role = UnitGroupRolesAssigned(unit)
	if role == "HEALER" then
		return "|cff8AFF30[H]|r"
	elseif role == "TANK" then
		return "|cffFFF130[T]|r"
	elseif role == "DAMAGER" then
		return "|cffFF6161[D]|r"
	end
end
oUF.TagEvents["LFD"] = "PLAYER_ROLES_ASSIGNED GROUP_ROSTER_UPDATE"

oUF.Tags["AltPower"] = function(unit)
	local min = UnitPower(unit, ALTERNATE_POWER_INDEX)
	local max = UnitPowerMax(unit, ALTERNATE_POWER_INDEX)
	if max > 0 and not UnitIsDeadOrGhost(unit) then
		return ("%s%%"):format(math.floor(min / max * 100 + 0.5))
	end
end
oUF.TagEvents["AltPower"] = "UNIT_POWER"

oUF.Tags["IncHeal"] = function(unit)
	local incheal = UnitGetIncomingHeals(unit) or 0
	local player = UnitGetIncomingHeals(unit, "player") or 0
	incheal = incheal - player
	if incheal > 0 then
		return "|cff00FF00+"..T.ShortValue(incheal).."|r"
	end
end
oUF.TagEvents["IncHeal"] = "UNIT_HEAL_PREDICTION"

if T.class == "DRUID" then
	for i = 1, 3 do
		oUF.Tags["WM"..i] = function(unit)
			_, _, _, dur = GetTotemInfo(i)
			if dur > 0 then
				return "|cffFF2222_|r"
			end
		end
		oUF.TagEvents["WM"..i] = "PLAYER_TOTEM_UPDATE"
		oUF.UnitlessTagEvents.PLAYER_TOTEM_UPDATE = true
	end
end

if T.class == "WARLOCK" then
	oUF.Tags["DemonicFury"] = function(unit)
		local min = UnitPower("player", SPELL_POWER_DEMONIC_FURY)
		local max = UnitPowerMax("player", SPELL_POWER_DEMONIC_FURY)
		if max > 0 then
			return ("%s%%"):format(math.floor(min / max * 100 + 0.5))
		end
	end
	oUF.TagEvents["DemonicFury"] = "UNIT_POWER PLAYER_TALENT_UPDATE"
end
