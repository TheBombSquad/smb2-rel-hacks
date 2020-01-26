% To apply:
% Get FixOverwrites from https://github.com/tuckergs/smb2-relmod
% Get PPCInject from https://github.com/tuckergs/ppc-inject
% Run the following commands, with your mkb2.main_loop.rel file in the same directory (./ may be optional if you are using Windows) in a command line:

% ./FixOverwrites mkb2.main_loop.rel 0x80296fc4 0x80296fc8 mkb2.main_loop_temp.rel
% ./PPCInject mkb2.main_loop_temp.rel mkb2.main_loop_perfect.rel perfect.asm 

% Replace your game's mkb2.main_loop.rel with the newly generated file, rename it accordingly.
% Remove mkb2.main_loop_temp.rel.

#function $injection 0x26EC4
bl $perfectCheck

#function $perfectCheck 0x207F50
.loc1
lis r3, 0x8055
addi r4, r3, 14704
lwz r0, 0x0024(r4)
cmpwi r0, 0x0		% compares number of bananas currently on stage to 0
bne .loc2
addi r3, r3, 14704
lwz r0, 0(r3)
cmpwi r0, 0x40		% checks if current stage is a bonus stage
bne .loc2
ori r0, r0, 0x228	% sets the 'ball mode' in a way that leads the game to complete the stage as a 'perfect'
stw r0, 0(r3)

.loc2
blr