% for main_game

#function $preloadMonkeyInject 0x148b4
bl $getCurrentMonkeyID					% pre-load correct monkey when file is loaded

#function $preloadMonkeyInject2 0x8ae4
bl $getCurrentMonkeyID					% pre-load correct monkey after stage loads

#function $getCurrentMonkeyID 0x75e20
lis r9, 0x805b
ori r9, r9, 0xd7bb
lbz r3, 0(r9)
blr

#function $changeMonkeyInject 0xb140
bl $changeMonkey

#function $changeMonkey 0x75fe0
lis r9, 0x805b
ori r9, r9, 0xd7bb
lbz r3, 0(r9)
blr
