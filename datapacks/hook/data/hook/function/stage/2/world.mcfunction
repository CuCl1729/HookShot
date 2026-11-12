#> hook:stage/2/world
# hook:world で毎 tick(hook:stage/2/tick から)。仕掛けを動かす
execute if score #ra hook.s2 matches 0 run function hook:stage/2/a/tick
# A の遅延プレスの導火線(炉 A を止めた後もプレスとして使える)
execute as @e[type=marker,tag=hook.press,scores={hook.s2=1..}] at @s run function hook:stage/2/a/fuse
scoreboard players add #kt hook.s2 1
execute if score #kt hook.s2 matches 8.. run function hook:stage/2/b/crane
# B3 の見張り(重装兵)は突き落とせば撃破(y 104 未満 = 台から落ちた)
execute as @e[tag=hook.s2b] at @s if entity @s[y=40,dy=63] run function hook:enemy/kill
function hook:stage/2/c/tick
execute if score #door hook.s2 matches 0 if score #ra hook.s2 matches 1 if score #rb hook.s2 matches 1 if score #rc hook.s2 matches 1 run function hook:stage/2/door
# 光の粒(隠し要素)
execute as @e[type=item_display,tag=hook.s2lore] at @s if entity @a[scores={hook.stage=2},distance=..2.5] run function hook:stage/2/grain
