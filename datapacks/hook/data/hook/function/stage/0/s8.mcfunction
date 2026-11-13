#> hook:stage/0/s8
# @s = 重装兵へ飛び移ったプレイヤー。重装兵を下げ、最後はトゲ
scoreboard players set @s hook.tut 8
scoreboard players set #t hook.tut 0
tag @s remove hook.grabbed_heavy
execute as @e[tag=hook.p7] at @s run particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force @a
kill @e[tag=hook.p7]
function hook:cp/set {id:7,x:8.5,y:64,z:36.5,yaw:90}
execute in hook:world run tp @e[tag=hook.npc] 9.5 64 20.5
function hook:stage/0/sp8a
function hook:stage/0/sp8b
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"▶ ",color:"aqua"},{text:"トゲ: 紫のトゲは敵だけを貫く。お前が踏んでも何ともない。だが敵は自分からは踏まない。鉤で動かした直後の敵だけが刺さる。",color:"gray"}]
tellraw @s [{text:"▶ ",color:"aqua"},{text:"トゲの向こうのゾンビを引いて掴み、トゲの上でスニークして落とすか、トゲへ投げつけろ。2体とも倒せば修了だ。",color:"gray"}]
function hook:fairy/say {text:"紫のトゲ！ 敵を倒せるのは、こういう仕掛けだけなんだね"}
function hook:stage/0/goal
