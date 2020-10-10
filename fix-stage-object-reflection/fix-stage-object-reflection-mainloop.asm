#function $effectBitflagCheck 0x218fd0
lis r3, 0x8054                  % Checks the render flag at 0x8054
ori r3, r3, 0xdce0
lwz r3, 0(r3)
cmpwi r3, 0x4                   % A value of 0x4 means we're drawing a reflection
bne .returnDraw                 % So if we're not drawing a reflection, draw it normally 

lwz r3, 0(r29)                  % Load current model from the pointer list
lwz r0, 0(r3)                   % Loads the effect bitflag of the current model
rlwinm r0, r0, 0, 0x1d, 0x1d    % Checks if flag 0x4 (unknown 3) is set
cmplwi r0, 0
bne .returnDraw                 % If it's not, don't draw it
lis r3, 0x802c                  
ori r3, r3, 0x9540
mtlr r3
blr                             % Continue with the next model (object is not drawn)
.returnDraw
lwz r3, 0(r29)
blr                             % Continue as normal (object is drawn)

% This disables the check that prevents stage models from being reflected
#function $inject 0x5a380
li r0, 0

% This hooks into the 'draw stage model' loop so we can choose to draw properly flagged models
#function $inject2 0x59334
bl $effectBitflagCheck
