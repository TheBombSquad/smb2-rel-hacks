% To apply:
% Get PPCInject from https://github.com/tuckergs/ppc-inject
% Run the following command, with your mkb2.main_loop.rel file in the same directory (./ may be optional if you are using Windows) in a command line:

% ./PPCInject mkb2.main_loop.rel mkb2.main_loop_removehaze.rel removehaze.asm 

% Replace your game's mkb2.main_loop.rel with the newly generated file, rename it accordingly.

#function $removal 0x74DD8
cmpwi r0, 0xFFFF