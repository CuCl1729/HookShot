#> hook:stage/1/c/t3
# @s = 的3の目印(スイッチ)。投げた敵(tag hook.thrown)で当てたときだけ作動
execute unless entity @e[tag=hook.thrown,distance=..3] run return run title @a[scores={hook.stage=1}] actionbar {text:"フックでは動かない。敵を投げ当てろ",color:"gray"}
execute if score #c3 hook.s1 matches 1 run return 0
scoreboard players set #c3 hook.s1 1
execute in hook:world run fill 298 72 18 298 74 20 minecraft:amethyst_block
kill @e[type=marker,tag=hook.s1t3]
function hook:stage/1/c/done
