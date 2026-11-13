#> hook:stage/2/c/stop
# @s = 炉 C の標的の marker。覆いが外れていれば(全部の波を片付けた)炉 C を止める
execute unless score #cw hook.s2 matches 4.. run return 0
execute unless score #rc hook.s2 matches 0 run return 0
scoreboard players set #rc hook.s2 1
execute in hook:world run fill 670 64 39 682 76 40 minecraft:polished_blackstone replace minecraft:ochre_froglight
execute in hook:world run fill 788 73 4 788 74 5 minecraft:coal_block
particle minecraft:explosion 676 70 38 2 3 1 0 15 force @a
execute in hook:world positioned 676.5 69 38.5 run function hook:stage/2/reactor
