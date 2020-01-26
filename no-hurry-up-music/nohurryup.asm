#function $timeOverInjection 0x2d18	
bl $fixTimeOver

#function $removeHurryUp 0x10b8		
b @afterHurryUp

#offset @afterHurryUp 0x10c8			% wacky fix to avoid fixing overwrites

#function $fixTimeOver 0x34090
addis r3, r2, 0x3a						% get the top half of frame counter address
ori r3, r3, 0xdc40						% get the bottom half of frame counter address
lwz r3, 0(r3)							% get the value of the frame counter
cmpwi r3, 0x78							% compare to 0x78 (start of 'time over' animation)
bne .skip								% skip the following if it isn't the first frame
li r3, 1								% return '1' for following function to play the 'time over' bgm
b .end
.skip
li r3, 0								% return '0' for the following function to not re-play 'time over' bgm
.end
cmpwi r3, 0
blr

