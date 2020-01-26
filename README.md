# smb2-rel-hacks
This is a collection of various modifications to the mkb2.main\_loop.rel file in Super Monkey Ball 2.

## Purpose
These modifications fix or modify the game in ways that may be beneficial to those who wish to create custom level packs. Here is a description of what each patch does:

| Patch | Purpose |
| ----- | ------- |
| perfect-bonus-completion | When the number of bananas remaining on a stage that is marked as a bonus stage hits zero, the stage is completed with a 'Perfect' pop-up and voice line, identical to SMB1. |
| remove-desert-haze | Removes the heat haze on levels in theme ID 7 (sand). Indirectly fixes the widescreen issue with heat haze.
| story-mode-music-fix | Prevents the world music from being interrupted by the stage select music in Story Mode. |
| no-hurry-up-music | Stops the 'hurry up' music from playing. |

## Requirements
In order to apply these modifications to a pack, you'll need TwixNinja's ppcinject and FixOverwrites programs:

* [ppcinject](https://github.com/tuckergs/ppc-inject)

* [smb2-relmod (contains FixOverwrites)](https://github.com/tuckergs/smb2-relmod)

Additionally, if you want to use cmmod, or other REL-modifying tools, it is recommended that these are applied *before* applying any of the patches here. Otherwise, it is possible that the changes may be overwritten.

## Usage
To apply these patches, execute the following commands for each patch. `./` may need to be replaced with `.\` in Windows Powershell, or omitted in the Windows command prompt. It also may be replaced with a path to the specified executables. The name of the .rel file may also be replaced with a path to the target .rel file.

You'll need a source mkb2.main_loop.rel as an input. Replace your game's .rel with the final .rel created by running the commands. You should be able to apply multiple patches without conflicts. Please note that `no-hurry-up-music` modifies *mkb2.main_game.rel*, NOT main_loop.

Any files created with _temp in the name may be removed after executing the specific commands.

| Patch | Commands |
| ----- | -------- |
| perfect-bonus-completion | `./FixOverwrites mkb2.main_loop.rel 0x80296fc4 0x80296fc8 mkb2.main_loop_temp.rel`> <br> `./PPCInject mkb2.main_loop_temp.rel mkb2.main_loop_perfect.rel perfect.asm` |
| remove-desert-haze | `./PPCInject mkb2.main_loop.rel mkb2.main_loop_removehaze.rel removehaze.asm` |
| story-mode-music-fix | `./PPCInject mkb2.main_loop.rel mkb2.main_loop_musicfix.rel storymodemusic.asm` |
| no-hurry-up-music | `./PPCInject mkb2.main_game.rel mkb2.main_game_hurryupfix.rel nohurryup.asm` |

## Gecko Codes
These patches can also be applied using Gecko codes. This will result in the same functionality as these patches, albeit only when the code is active. These may also cause issues with party games, as they are not tied to the location of the currently loaded REL.

#### perfect-bonus-completion
```
C2296FC4 00000006
3C608055 38833970
80040024 2C000000
4082001C 38633970
80030000 2C000040
4082000C 60000228
90030000 00000000
```

#### remove-desert haze
```
C22E4ED8 00000001
2C00FFFF 00000000
```

#### story-mode-music-fix
```
C22A5C34 00000009
3C62003A 6063DC34
80630000 2C030030
41800030 2C03005B
4182000C 2C03003B
41810020 3C620010
60635E94 7C6803A6
38600064 4E800021
38600001 48000008
38600000 00000000
C2273AA0 00000001
60000000 00000000
C22A32A8 00000001
60000000 00000000
```

#### no-hurry-up-music
*WARNING*: This causes the left audio channel blare corrupted sounds on game launch, due to the Gecko code overwriting certain portions of memory. The REL patch should be used instead.
```
C28F6CF4 00000005
3C62003A 6063DC40
80630000 2C030078
4082000C 38600001
48000008 38600000
60000000 00000000
C28F509C 00000001
60000000 00000000
C28F50A4 00000001
60000000 00000000
```
