#> hook:boss/3/fall
# @s = 奈落(y<32)へ落ちた王。第2形態で縛られていれば傷(最後の1ならとどめ)。どの場合も玉座の島へ戻す(とどめは無敵時間を見ない)
execute if score #state hook.b3 matches 3 if score #vuln hook.b3 matches 1.. if score #hp hook.b3 matches ..1 run return run function hook:boss/3/defeat
execute if score #state hook.b3 matches 3 if score #vuln hook.b3 matches 1.. if score #inv hook.b3 matches 0 run function hook:boss/3/damage
execute if score #state hook.b3 matches 3 unless score #vuln hook.b3 matches 1.. run title @a[scores={hook.stage=4}] actionbar {text:"縛らずに落としても、虚から這い戻ってくる",color:"gray"}
tp @s 1550.5 64 0.5
data modify entity @s Motion set value [0.0d,0.0d,0.0d]
scoreboard players set #vuln hook.b3 0
execute at @s run particle minecraft:reverse_portal ~ ~1 ~ 0.6 1 0.6 0.5 60 force @a
execute at @s run playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 2 0.5
