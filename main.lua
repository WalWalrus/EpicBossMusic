--- STEAMODDED HEADER
--- MOD_NAME: Epic Boss Music
--- MOD_ID: Epic_Boss_Music
--- MOD_AUTHOR: [WallyWalrus]
--- MOD_DESCRIPTION: Adds the game awards orchestral score of the Balatro theme to all boss antes.
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0812d]
--- BADGE_COLOR: fd9712
--- PREFIX: bmww
--- VERSION: 0.2.0
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas {
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32
}

epicbossmusic = SMODS.current_mod
epicbossmusic.config_tab = function()
	return {n = G.UIT.ROOT, config = {r = 0.1, align = "cm", padding = 0.1, colour = G.C.BLACK, minw = 7, minh = 2}, nodes = {
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = { align = "cl", padding = 0.05 }, nodes = {
				create_toggle{ col = true, label = "", scale = 0.85, w = 0, shadow = true, ref_table = epicbossmusic.config, ref_value = "boss_regular_enabled" },
			}},
			{n = G.UIT.C, config = { align = "c", padding = 0 }, nodes = {
				{ n = G.UIT.T, config = { text = "Regular Boss Music", scale = 0.5, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = { align = "c", padding = 0 }, nodes = {
				{ n = G.UIT.T, config = { text = "All regular boss blinds (not showdowns)", scale = 0.25, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = { align = "cl", padding = 0.05 }, nodes = {
				create_toggle{ col = true, label = "", scale = 0.85, w = 0, shadow = true, ref_table = epicbossmusic.config, ref_value = "boss_showdown_enabled" },
			}},
			{n = G.UIT.C, config = { align = "c", padding = 0 }, nodes = {
				{ n = G.UIT.T, config = { text = "Showdown Boss Music", scale = 0.5, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = { align = "c", padding = 0 }, nodes = {
				{ n = G.UIT.T, config = { text = "All showdown boss blinds (showdowns appear every 8 antes)", scale = 0.25, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = { align = "cl", padding = 0.05 }, nodes = {
				create_toggle{ col = true, label = "", scale = 0.85, w = 0, shadow = true, ref_table = epicbossmusic.config, ref_value = "shop_enabled" },
			}},
			{n = G.UIT.C, config = { align = "c", padding = 0 }, nodes = {
				{ n = G.UIT.T, config = { text = "Shop Music", scale = 0.5, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = { align = "c", padding = 0 }, nodes = {
				{ n = G.UIT.T, config = { text = "Music played during the shop but not during pack openings", scale = 0.25, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = { align = "cl", padding = 0.05 }, nodes = {
				create_toggle{ col = true, label = "", scale = 0.85, w = 0, shadow = true, ref_table = epicbossmusic.config, ref_value = "pack_enabled" },
			}},
			{n = G.UIT.C, config = { align = "c", padding = 0 }, nodes = {
				{ n = G.UIT.T, config = { text = "Pack Music", scale = 0.5, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = { align = "c", padding = 0 }, nodes = {
				{ n = G.UIT.T, config = { text = "Music played during any pack openings", scale = 0.25, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = { align = "cl", padding = 0.05 }, nodes = {
				create_toggle{ col = true, label = "", scale = 0.85, w = 0, shadow = true, ref_table = epicbossmusic.config, ref_value = "default_enabled" },
			}},
			{n = G.UIT.C, config = { align = "c", padding = 0 }, nodes = {
				{ n = G.UIT.T, config = { text = "Default Music", scale = 0.5, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = { align = "c", padding = 0 }, nodes = {
				{ n = G.UIT.T, config = { text = "All other music (such as main menu and non-boss blinds)", scale = 0.25, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
	}}
 end

SMODS.Sound({
    vol = 0.9,
    pitch = 1,
    key = "music_boss_epic",
    path = "music_boss_epic.ogg",
    select_music_track = function()
        local is_normal_location = not (G.booster_pack or G.shop or (G.GAME and G.GAME.blind and G.GAME.blind.config.blind.boss))
		if G.GAME and G.GAME.blind and G.GAME.blind.config.blind.boss then
			if epicbossmusic.config.boss_regular_enabled and not G.GAME.blind.config.blind.boss.showdown then
				return true -- Play music in non-showdown bosses
			elseif epicbossmusic.config.boss_showdown_enabled and G.GAME.blind.config.blind.boss.showdown then
				return true -- Play music in showdown bosses
			end
        elseif epicbossmusic.config.shop_enabled and G.shop and not G.booster_pack then
            return true -- Play music in the shop
        elseif epicbossmusic.config.pack_enabled and G.shop and G.booster_pack then  
            return true -- Play music for opened booster packs
		elseif epicbossmusic.config.default_enabled and is_normal_location then
            return true -- Play music in "normal" locations (anywhere default: main menu, small blind, big blind etc.)
        end
        return false
    end,
})

----------------------------------------------
------------MOD CODE END----------------------