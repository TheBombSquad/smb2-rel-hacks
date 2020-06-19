% Inject into mkb2.main_game.rel
% Our new 32-bit death counter is stored at 0x80969C80+0x4*ballID
% These counters are stored at file offset 0x75CA0 in main_game, don't touch
% Where the ballID - the active ball ID - is stored at 0x8054DC6F

% This resets the death counter on game start
#function $smdGameFirstInitInject 0x5dc
b $clearDeathCount

#function $clearDeathCount 0x75c60
lis r3, 0x8096          % 32-bit death counter
ori r3, r3, 0x9c80
xor r4, r4, r4
addi r4, r3, 0x10       % range (4 players)
xor r5, r5, r5

.clearLoop
stw r5, 0(r3)
addi r3, r3, 0x4
cmpw r3, r4
bne .clearLoop
blr

% returns r11 - death count address, r12 - death count
#function $getDeathCount 0x75be0
lis r11, 0x8054
ori r11, r11, 0xdc6f
lbz r12, 0(r11)         % load ballID
mulli r12, r12, 0x4
lis r11, 0x8096
ori r11, r11, 0x9c80
add r11, r11, r12
lwz r12, 0(r11)         % load current death count
blr

#function $updateDeathCount 0x6508
bl $getDeathCount
lwz r12, 0(r11)
addi r12, r12, 1
stw r12, 0(r11)

#function $CONSTANTSCALE 0x75c20
0x3ECCCCCD              % not an instruction, constant float 0.4 at 0x80969c00
0x3F000000              % const float 0.5 at 0x80969c04

% intended to be called by g_update_visual_life_counter_display
% death count is stored in r12
% 0x40(r4) stores the horizontal scale of the visual life counter display
#function $specialVisualHandler 0x75cb0
cmpwi r5, 999          % scale text down when over 999 deaths
bgt .scale40
cmpwi r5, 99           % scale text down when over 99 deaths
bgt .scale50
cmpwi r5, 9            % scale text down when over 9 deaths (vanilla property)
bgt .scale60
b .scale100

.scale40
lis r11, 0x8096
ori r11, r11, 0x9c00    % const float 0.4
b .setScale

.scale50
lis r11, 0x8096
ori r11, r11, 0x9c04    % const float 0.5
b .setScale

.scale60
lis r11, 0x803e
ori r11, r11, 0x86a4    % const float 0.6
b .setScale

.scale100
lis r11, 0x803e
ori r11, r11, 0x8598    % const float 1.0
b .setScale

.setScale
0xc00b0000              % lfs f0, 0(r11)
0xd0040040              % stfs f0, 0x40(r4)
b .setColor

.setColor
lis r12, 0xffff
cmpwi r5, 0             % if 0, set (FF, FF, 00) - green
beq .setColorAsGreen
ori r12, r12, 0xFF00    % sets (FF, FF, FF) - counter is blue
.setColorAsGreen
stw r12, 0xc(r4)
blr

