% Inject into mkb2.main_loop.rel

#function $visualCounterInject 0xcac28
lis r11, 0x8096
ori r11, r11, 0x9bc0
0x7d6903a6          % mtctr r11
0x4e800421          % bctrl (call getDeathCount)
mr r5, r12
lis r11, 0x8096
ori r11, r11, 0x9c90
0x7d6903a6          % mtctr r11
0x4e800421          % bctrl (call specialVisualHandler)
nop                 % nop out the game's regular scale handling code
nop
nop
nop
nop
nop
nop
nop
nop
