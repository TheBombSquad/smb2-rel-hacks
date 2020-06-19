#function $chgNxtScrnInject 0x12cd0
b $changeNextScreen

#function $changeNextScreen 0x21c120

lis r9, 0x8092          
ori r9, r9, 0x1a20
li r10, 0x6             % sets the story mode button's next screen to character select
stb r10, 0(r9)

li r10, 0xc             % sets the character select's next screen to the story mode data select
stb r10, -3712(r9)

lis r9, 0x8094
ori r9, r9, 0x9ca0
lbz r10, 0(r9)
cmpwi r10, 0x6          % check if the current screen is the story mode character select screen
bne .end

lis r9, 0x8054		
ori r9, r9, 0xdf84      % get address of mode_cnt

lis r10, 0x8014         % controller 1
ori r10, r10, 0x5120    % get address of button inputs (controller 1)
lbz r10, 0(r10)         % get button inputs
andi r11, r10, 0x1      % check if A is pressed
cmpwi r11, 0x1          
beq .store
andi r11, r10, 0x2		% check if B is pressed
cmpwi r11, 0x2
beq .store 

lis r10, 0x8014
ori r10, r10, 0x515c	% controller 2
lbz r10, 0(r10)			
andi r11, r10, 0x1      % check if A is pressed
cmpwi r11, 0x1          
beq .store
andi r11, r10, 0x2		% check if B is pressed
cmpwi r11, 0x2
beq .store 

lis r10, 0x8014
ori r10, r10, 0x5198	% controller 3
lbz r10, 0(r10)			
andi r11, r10, 0x1      % check if A is pressed
cmpwi r11, 0x1          
beq .store
andi r11, r10, 0x2		% check if B is pressed
cmpwi r11, 0x2
beq .store 

lis r10, 0x8014
ori r10, r10, 0x51d4	% controller 4
lbz r10, 0(r10)			
andi r11, r10, 0x1      % check if A is pressed
cmpwi r11, 0x1          
beq .store
andi r11, r10, 0x2		% check if B is pressed
cmpwi r11, 0x2
beq .store 

b .end

                        % story mode only initalizes when mode_cnt is 1, otherwise it glitches out
.store
lis r12, 0x8094			% checks if a character has been selected
ori r12, r12, 0x9cbe
lbz r12, 0(r12)
or r10, r12, r11		% check if B is pressed and if a character has been selected
cmpwi r10, 0x3			% prevents mode_cnt from being modified during fadeout
beq .end

stb r11, 0(r9)          % set mode_cnt to 1 when A is pressed, otherwise set it to 2 when B is pressed
li r10, 0x7             % sets return screen to 7 so data select menu returns properly
stb r10, 2(r9)

.end
blr

#function $preloadMonkeyInject3 0x16aefc
bl $getCurrentMonkeyId  % pre-load correct monkey after cutscene ends

#function $getCurrentMonkeyId 0x21b3b4
lis r9, 0x805b
ori r9, r9, 0xd7bb
lbz r3, 0(r9)
blr

