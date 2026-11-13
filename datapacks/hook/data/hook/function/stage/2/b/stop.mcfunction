#> hook:stage/2/b/stop
# @s = 炉 B の標的の marker。炉 B を止める
execute unless score #rb hook.s2 matches 0 run return 0
scoreboard players set #rb hook.s2 1
execute in hook:world run fill 758 111 -37 762 114 -34 minecraft:polished_blackstone replace minecraft:ochre_froglight
execute in hook:world run fill 788 73 -1 788 74 0 minecraft:coal_block
particle minecraft:explosion 760 113 -35 2 2 2 0 15 force @a
execute in hook:world positioned 760.5 112 -35.5 run function hook:stage/2/reactor
