# Overwrite Regions
This is a list of overwrite regions for each REL hack, for organizational
purposes, as well as to prevent conflicts.

### mkb2.main_loop.rel
Region | Size | Patch | Function/Variable | FixOverwrites Needed
----- | ----- | ----- | ----- | -----
`0x39a0 - 0x39a4` | `0x4` | `story-mode-music-fix` | `afterGoalInject` | `false`
`0xbab0 - 0xbab4` | `0x4` | `disable-how-to-play-screen` | `disableModeCounterDecrement` | `false`
`0x12cd0 - 0x12cd4` | `0x4` | `story-mode-char-select` | `chgNxtScrnInject` | `false`
`0x157d4 - 0x157d8` | `0x4` | `fix-labyrinth-camera` | `injection1` | `false`
`0x173bc - 0x173c0` | `0x4` | `fix-labyrinth-camera` | `injection2` | `false`
`0x1741c - 0x17420` | `0x4` | `fix-labyrinth-camera` | `injection3` | `false`
`0x17fec - 0x17ff0` | `0x4` | `fix-labyrinth-camera` | `injection4` | `false`
`0x180d4 - 0x180d8` | `0x4` | `fix-labyrinth-camera` | `injection5` | `false`
`0x182b4 - 0x182b8` | `0x4` | `fix-labyrinth-camera` | `injection6` | `false`
`0x185b8 - 0x185bc` | `0x4` | `fix-labyrinth-camera` | `injection7` | `false`
`0x1be44 - 0x1be48` | `0x4` | `fix-labyrinth-camera` | `injection8` | `false`
`0x1c0cc - 0x1c0d0` | `0x4` | `fix-labyrinth-camera` | `injection9` | `false`
`0x1c550 - 0x1c554` | `0x4` | `fix-labyrinth-camera` | `injection10` | `false`
`0x1c984 - 0x1c988` | `0x4` | `fix-labyrinth-camera` | `injection11` | `false`
`0x21238 - 0x2123c` | `0x4` | `fix-labyrinth-camera` | `injection12` | `false`
`0x21320 - 0x21324` | `0x4` | `fix-labyrinth-camera` | `injection13` | `false`
`0x21564 - 0x21568` | `0x4` | `fix-labyrinth-camera` | `injection14` | `false`
`0x21804 - 0x21808` | `0x4` | `fix-labyrinth-camera` | `injection15` | `false`
`0x21830 - 0x21834` | `0x4` | `fix-labyrinth-camera` | `injection16` | `false`
`0x21860 - 0x21864` | `0x4` | `fix-labyrinth-camera` | `injection17` | `false`
`0x2188c - 0x21890` | `0x4` | `fix-labyrinth-camera` | `injection18` | `false`
`0x219ec - 0x219f0` | `0x4` | `fix-labyrinth-camera` | `injection19` | `false`
`0x26ec4 - 0x26ec8` | `0x4` | `perfect-bonus-completion` | `injection` | `true`
`0x331a8 - 0x331ac` | `0x4` | `story-mode-music-fix` | `pauseMenuVolInject` | `false`
`0x35b34 - 0x35b38` | `0x4` | `story-mode-music-fix` | `afterGoalInject` | `false`
`0x35de8 - 0x35e0c` | `0x24` | `music-id-per-stage` | `worldBgmInject` | `true`
`0x58be4 - 0x58be8` | `0x4` | `fix-wormhole-surfaces` | `injection1` | `false`
`0x59334 - 0x59338` | `0x4` | `fix-stage-object-reflection` | `inject2` | `false`
`0x5a380 - 0x5a384` | `0x4` | `fix-stage-object-reflection` | `inject` | `false`
`0x5a8fc - 0x5a900` | `0x4` | `fix-revolution-slot` | `injection` | `false`
`0x74dd8 - 0x74ddc` | `0x4` | `remove-desert-haze` | `removal` | `false`
`0xcac28 - 0xcac70` | `0x48` | `challenge-mode-death-count` | `visualCounterInject` | `true`
`0x16aefc - 0x16af00` | `0x4` | `story-mode-char-select` | `preloadMonkeyInject3` | `false`
`0x218b50 - 0x218b80` | `0x30` | `perfect-bonus-completion` | `perfectCheck` | `false`
`0x218fd0 - 0x219010` | `0x40` | `fix-stage-object-reflection` | `effectBitflagCheck` | `false`
`0x21ad88 - 0x21add8` | `0x50` | `story-mode-music-fix` | `setLoopingParam` | `false`
`0x21b3b4 - 0x21b3c4` | `0x10` | `story-mode-char-select` | `getCurrentMonkeyId` | `false`
`0x21b860 - 0x21bba0` | `0x350` | `music-id-per-stage` | Music List | `false`
`0x21c120 - 0x21c210` | `0xf0` | `story-mode-char-select` | `changeNextScreen` | `false`


### mkb2.main_game.rel
Region | Size | Patch | Function/Variable | FixOverwrites Needed
----- | ----- | ----- | ----- | -----
`0x5dc - 0x5e0` | `0x4` | `challenge-mode-death-count` | `smdGameFirstInitInject` | `false`
`0x10b8 - 0x10bc` | `0x4` | `no-hurry-up-music` | `removeHurryUp` | `false`
`0x2d18 - 0x2d1c` | `0x4` | `no-hurry-up-music` | `timeOverInjection` | `false`
`0x6508 - 0x6518` | `0x10` | `challenge-mode-death-count` | `updateDeathCount` | `false`
`0x8ae4 - 0x8ae8` | `0x4` | `story-mode-char-select` | `preloadMonkeyInject2` | `false`
`0xb140 - 0xb144` | `0x4` | `story-mode-char-select` | `changeMonkeyInject` | `false`
`0x1ff54 - 0x1ff58` | `0x4` | `fix-stage-object-reflection` | `inject3` | `false`
`0x148b4 - 0x148b8` | `0x4` | `story-mode-char-select` | `preloadMonkeyInject` | `false`
`0x34090 - 0x340b8` | `0x28` | `no-hurry-up-music` | `fixTimeOver` | `false`
`0x75be0 - 0x75bf4` | `0x24` | `challenge-mode-death-count` | `getDeathCount` | `false`
`0x75c20 - 0x75c28` | `0x8` | `challenge-mode-death-count` | `CONSTANTSCALE` | `false`
`0x75c60 - 0x75c88` | `0x28` | `challenge-mode-death-count` | `clearDeathCount` | `false`
`0x75ca0 - 0x75cb0` | `0x10` | `challenge-mode-death-count` | `deathCounterVariable` | `false`
`0x75cb0 - 0x75ccc` | `0x1c` | `challenge-mode-death-count` | `specialVisualHandler` | `false`
`0x75e20 - 0x75e30` | `0x10` | `story-mode-char-select` | `getCurrentMonkeyID` | `false`
`0x75fe0 - 0x75ff0` | `0x10` | `story-mode-char-select` | `changeMonkey` | `false`
`0x76000 - 0x76040` | `0x40` | `fix-stage-object-reflection` | `effectBitflagCheckVs` | `false`

