--- STEAMODDED HEADER
--- MOD_NAME: Epic Boss Music
--- MOD_ID: Epic_Boss_Music
--- MOD_AUTHOR: [WallyWalrus]
--- MOD_DESCRIPTION: Adds the game awards orchestral score of the Balatro theme to all boss antes.
--- PREFIX: bmww
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Sound({
    vol = 0.9,
    pitch = 1,
    key = "music_boss_epic",
    path = "music_boss_epic.ogg",
    select_music_track = function()
        return (G.GAME and G.GAME.blind and (G.GAME.blind.config.blind.boss and not G.GAME.blind.config.blind.boss.showdown)) and 1 or false
    end,
})

----------------------------------------------
------------MOD CODE END----------------------