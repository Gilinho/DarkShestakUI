﻿local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	DarkShestakUI personal configuration file
--	BACKUP THIS FILE BEFORE UPDATING!
--	ATTENTION: When saving changes to a file encoded file should be in UTF8
----------------------------------------------------------------------------------------
--	Configuration example:
----------------------------------------------------------------------------------------
-- if T.name == "MegaChar" then
--		C["chat"].width = 100500
--		C["tooltip"].cursor = false
--		C["unitframe_class_bar"].totem = false
--		C["position"].tooltip = {"BOTTOMRIGHT", Minimap, "TOPRIGHT", 2, 5}
--		C["position"].bottom_bars = {"BOTTOM", UIParent, "BOTTOM", 2, 8}
--		C["position"].unitframes.tank = {"BOTTOMLEFT", UIParent, "BOTTOM", 176, 68}
-- end
----------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	Per Class Config (overwrite general)
--	Class need to be UPPERCASE
----------------------------------------------------------------------------------------
if T.class == "DRUID" then

end

----------------------------------------------------------------------------------------
--	Per Character Name Config (overwrite general and class)
--	Name need to be case sensitive
----------------------------------------------------------------------------------------
if T.name == "CharacterName" then

end

----------------------------------------------------------------------------------------
--	Per Max Character Level Config (overwrite general, class and name)
----------------------------------------------------------------------------------------
if T.level ~= MAX_PLAYER_LEVEL then

end

----------------------------------------------------------------------------------------
--	Oz@Pozzo dell'Eternità Config
----------------------------------------------------------------------------------------
if T.name == "Oz" and T.realm == "Pozzo dell'Eternità" then
	C["position"].bank = {"RIGHT", ChatFrame1, "BOTTOM", 349, 371}
	C["position"].bn_popup = {"BOTTOMRIGHT", Minimap, "TOPRIGHT", 2, 5}
	C["position"].vehicle = {"BOTTOMLEFT", "ActionBarAnchor", "BOTTOMRIGHT", 109, 100}
	C["position"].ghost = {"TOPLEFT", "oUF_Player", "TOPLEFT", -2, 65}
	C["position"].quest = {"TOPRIGHT", UIParent, "TOPRIGHT", -238, -111}
	C["position"].loot = {"TOPLEFT", UIParent, "TOPLEFT", 21, -532}
	C["position"].group_loot = {"TOPLEFT", UIParent, "TOPLEFT", 241, -211}
	C["position"].threat_meter = {"BOTTOM", "oUF_Target", "BOTTOM", -283, 77}
	C["position"].raid_cooldown = {"TOPRIGHT", UIParent, "TOPRIGHT", -21, -115}
	C["position"].enemy_cooldown = {"BOTTOMLEFT", "oUF_Target", "BOTTOMRIGHT", 9, -62}
	C["position"].raid_buffs = {"BOTTOMLEFT", Minimap, "TOPLEFT", -2, 5}
	C["position"].raid_utility = {"TOPLEFT", UIParent, "TOPLEFT", 241, -21}
	C["position"].extra_button = {"RIGHT", "oUF_Player", "BOTTOM", -53, -126}
	C["position"].stance_bar = {"RIGHT", "oUF_Player", "BOTTOM", 82, -85}
	C["position"].unitframes.player = {"TOPLEFT", "ActionBarAnchor", "BOTTOMRIGHT", -558, 373}
	C["position"].unitframes.target = {"TOPRIGHT", "ActionBarAnchor", "BOTTOMLEFT", 558, 373}
	C["position"].unitframes.tank = {"BOTTOMLEFT", "ActionBarAnchor", "BOTTOMRIGHT", 5, 18}
	C["position"].unitframes.player_castbar = {"CENTER", UIParent, "CENTER", 0, 136}
	C["position"].unitframes.target_castbar = {"BOTTOM", "oUF_Target", "BOTTOM", -272, -4}
	C["position"].unitframes.raid_heal = {"TOPLEFT", "ActionBarAnchor", "BOTTOMRIGHT", -331, 335}
	C["media"].border_color = {0.1, 0.1, 0.1, 1}
	C["media"].overlay_color = {0, 0, 0, 0.5}
	C["general"].welcome_message = false
	C["misc"].invite_keyword = "inv"
	C["misc"].profession_database = true
	C["misc"].item_level = true
	C["misc"].gem_counter = true
	C["misc"].already_known = true
	C["misc"].move_blizzard = true
	C["announcements"].flask_food = true
	C["announcements"].pull_countdown = false
	C["automation"].resurrection = false
	C["automation"].screenshot = true
	C["automation"].decline_duel = false
	C["automation"].logging_combat = true
	C["automation"].solve_artifact = false
	C["skins"].blizzard_frames = true
	C["skins"].dbm = true
	C["skins"].npcscan = true
	C["skins"].my_role_play = true
	C["combattext"].icons = false
	C["combattext"].scrollable = true
	C["combattext"].killingblow = true
	C["reminder"].raid_buffs_size = 19
	C["enemycooldown"].show_inpvp = true
	C["threat"].width = 125
	C["threat"].bar_rows = 2
	C["tooltip"].item_icon = true
	C["tooltip"].talents = true
	C["tooltip"].achievements = false
	C["tooltip"].title = true
	C["tooltip"].spell_id = true
	C["tooltip"].average_lvl = true
	C["tooltip"].raid_icon = true
	C["tooltip"].who_targetting = true
	C["tooltip"].symbiosis = true
	C["tooltip"].item_transmogrify = true
	C["chat"].background = true
	C["chat"].background_alpha = 0.5
	C["chat"].filter = false
	C["chat"].chat_bar = true
	C["chat"].chat_bar_mouseover = true
	C["chat"].tabs_mouseover = true
	C["chat"].damage_meter_spam = true
	C["minimap"].size = 129
	C["minimap"].toggle_menu = false
	C["map"].map_boss_count = true
	C["loot"].auto_greed = false
	C["nameplate"].show_castbar_name = true
	C["nameplate"].class_icons = true
	C["nameplate"].track_auras = true
	C["nameplate"].healer_icon = true
	C["actionbar"].hotkey = false
	C["actionbar"].bottombars = 1
	C["aura"].focus_debuffs = true
	C["aura"].fot_debuffs = true
	C["aura"].pet_debuffs = true
	C["aura"].tot_debuffs = true
	C["aura"].cast_by = true
	C["unitframe"].own_color = true
	C["unitframe"].uf_color = {0.15, 0.15, 0.15}
	C["unitframe"].enemy_health_color = false
	C["unitframe"].color_value = true
	C["unitframe"].bar_color_value = true
	C["unitframe"].castbar_icon = true
	C["unitframe"].icons_pvp = true
	C["unitframe"].plugins_gcd = true
	C["unitframe"].plugins_necro_strike = true
	C["unitframe"].plugins_reputation_bar = true
	C["unitframe"].plugins_experience_bar = true
	C["unitframe"].plugins_friendship_bar = true
	C["unitframe"].plugins_smooth_bar = true
	C["unitframe"].plugins_talents = true
	C["unitframe"].plugins_diminishing = true
	C["raidframe"].raid_tanks_tt = true
	C["raidframe"].raid_groups = 8
	C["raidframe"].icons_role = true
	C["raidframe"].plugins_aura_watch_timer = true
	C["raidframe"].plugins_auto_resurrection = true
	C["toppanel"].enable = false
	C["stats"].battleground = true
end

----------------------------------------------------------------------------------------
--	m2jest1c Config
----------------------------------------------------------------------------------------
if (T.name == "Занштек" or T.name == "Гранн" or T.name == "Тёми" or T.name == "Палтасар" or T.name == "Ллевалалуз"
or T.name == "Сиамад" or T.name == "Квилинир" or T.name == "Нариэтта" or T.name == "Белонри")
and T.realm == "Ясеневый лес" then 
	C["position"].pulse_cooldown = {"CENTER", UIParent, "CENTER", 0, 200}
	C["position"].auto_button = {"BOTTOMLEFT", "oUF_Player", "TOPRIGHT", 33, 83}
	C["position"].extra_button = {"CENTER", UIParent, "CENTER", -74, -12}
	C["general"].welcome_message = false
	C["misc"].shift_marking = false
	C["misc"].invite_keyword = "инв"
	C["misc"].quest_auto_button = true
	C["misc"].item_level = true
	C["misc"].gem_counter = true
	C["misc"].already_known = true
	C["misc"].disenchanting = true
	C["misc"].enchantment_scroll = true
	C["announcements"].drinking = true
	C["announcements"].interrupts = true
	C["announcements"].spells = true
	C["announcements"].toys = true
	C["announcements"].portals = true
	C["announcements"].bad_gear = true
	C["automation"].screenshot = true
	C["automation"].accept_invite = true
	C["automation"].accept_quest = true
	C["automation"].auto_role = true
	C["automation"].cancel_bad_buffs = true
	C["skins"].dbm = true
	C["skins"].nug_running = true
	C["skins"].clique = true
	C["skins"].atlasloot = true
	C["skins"].npcscan = true
	C["skins"].gnosis = true
	C["combattext"].killingblow = true
	C["combattext"].merge_aoe_spam = false
	C["pulsecooldown"].enable = true
	C["tooltip"].item_icon = true
	C["tooltip"].rank = false
	C["tooltip"].spell_id = true
	C["tooltip"].average_lvl = true
	C["tooltip"].raid_icon = true
	C["tooltip"].item_count = true
	C["tooltip"].reforge = true
	C["tooltip"].instance_lock = true
	C["tooltip"].item_transmogrify = true
	C["chat"].damage_meter_spam = true
	C["map"].explore_map = true
	C["nameplate"].track_auras = true
	C["aura"].focus_debuffs = true
	C["aura"].boss_buffs = false
	C["aura"].cast_by = true
	C["unitframe"].castbar_ticks = true
	C["unitframe"].plugins_smooth_bar = true
	C["unitframe"].plugins_diminishing = true
	C["unitframe_class_bar"].vengeance = false
	C["raidframe"].icons_role = true
	C["toppanel"].enable = false
	if T.name == "Тёми" then
		C["automation"].accept_quest = false
	end
	if T.name == "Занштек" then
		C["announcements"].lightwell = true
		C["automation"].skip_cinematic = true
		C["unitframe_class_bar"].range = true
		C["raidframe"].deficit_health = true
	end
	if T.class == "WARRIOR" or T.class == "PALADIN" then
		C["actionbar"].stancebar_mouseover = false
	end
end