% inject into mkb2.main_loop.rel
% music list is at 0x21b860

#function $worldBgmInject 0x35de8
lis r3, 0x8047          % gets stage ID
ori r3, r3, 0x3116
lha r0, 0(r3)

lis r4, 0x8048
ori r4, r4, 0xb960
mulli r0, r0, 0x2       % multiplies it by 2, uses stage ID as an index for the list
add r4, r4, r0
lha r0, 0(r4)           % uses the found music ID in the list
nop
