#> hook:stage/2/a/off
# hook:world で実行。炉 A を止める(台車は止まり、炉とランプが消える)
scoreboard players set #ra hook.s2 1
kill @e[type=block_display,tag=hook.s2core]
fill 680 64 -32 686 72 -24 minecraft:polished_blackstone replace minecraft:ochre_froglight
fill 788 73 -6 788 74 -5 minecraft:coal_block
particle minecraft:explosion 683 68 -28 2 3 2 0 15 force @a
function hook:stage/2/reactor
