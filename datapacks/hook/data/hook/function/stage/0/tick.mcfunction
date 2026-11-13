#> hook:stage/0/tick
# 誰かが訓練場(hook.stage=0)にいる間、毎 tick(core の tick から)
# 建つまで(チャンク読み込み待ち)はチェックポイントに留める。でないと足場が無く落下→復帰を繰り返す
execute unless data storage hook: built{s0:1b} as @a[scores={hook.stage=0}] run return run function hook:cp/return
execute as @e[tag=hook.npc] at @s if entity @a[distance=..6] run rotate @s facing entity @p[distance=..6] eyes
# 長老の3マス以内に入るたびに、今の段階のこつを話す(hook.near = 今そばにいる)
execute as @e[tag=hook.npc] at @s as @a[distance=..3,tag=!hook.near] run function hook:stage/0/talk
execute as @e[tag=hook.npc] at @s run tag @a[distance=..3] add hook.near
execute as @e[tag=hook.npc] at @s run tag @a[distance=4..] remove hook.near
# 的の敵は足を止め(stage/0/dummy)、フックで動かされていない間は台へ戻す(落とされても戻る)
execute in hook:world as @e[tag=hook.p4,tag=!hook.yanking,tag=!hook.grabbed,tag=!hook.thrown] unless score @s hook.mv matches 1.. run tp @s 88.5 64 36.5
execute in hook:world as @e[tag=hook.p5a,tag=!hook.yanking,tag=!hook.grabbed,tag=!hook.thrown] unless score @s hook.mv matches 1.. run tp @s 57.5 64 29.5
execute in hook:world as @e[tag=hook.p5b,tag=!hook.yanking,tag=!hook.grabbed,tag=!hook.thrown] unless score @s hook.mv matches 1.. run tp @s 60.5 64 29.5
execute in hook:world as @e[tag=hook.p6b,tag=!hook.yanking,tag=!hook.grabbed,tag=!hook.thrown] unless score @s hook.mv matches 1.. run tp @s 46.5 64 40.5
execute in hook:world as @e[tag=hook.p6z1,tag=!hook.yanking,tag=!hook.grabbed,tag=!hook.thrown] unless score @s hook.mv matches 1.. run tp @s 37.5 64 19.5
execute in hook:world as @e[tag=hook.p6z2,tag=!hook.yanking,tag=!hook.grabbed,tag=!hook.thrown] unless score @s hook.mv matches 1.. run tp @s 38.5 64 20.5
execute in hook:world as @e[tag=hook.p6z3,tag=!hook.yanking,tag=!hook.grabbed,tag=!hook.thrown] unless score @s hook.mv matches 1.. run tp @s 37.5 64 21.5
execute in hook:world as @e[tag=hook.p7] run tp @s 5.5 64 29.5
execute in hook:world as @e[tag=hook.p8a,tag=!hook.yanking,tag=!hook.grabbed,tag=!hook.thrown] unless score @s hook.mv matches 1.. run tp @s -21.5 64 22.5
execute in hook:world as @e[tag=hook.p8b,tag=!hook.yanking,tag=!hook.grabbed,tag=!hook.thrown] unless score @s hook.mv matches 1.. run tp @s -21.5 64 36.5
# 段階5: 掴んだことのある的に印(掴まれていない方が弾かれて怯んだら「敵を敵へ」が出来た)
tag @e[tag=hook.tut5,tag=hook.grabbed] add hook.t5g
execute as @e[tag=hook.tut5,tag=hook.t5g,tag=!hook.grabbed,tag=!hook.thrown,tag=!hook.yanking,tag=!hook.stun] unless score @s hook.mv matches 1.. run tag @s remove hook.t5g
execute as @a[scores={hook.stage=0}] at @s run function hook:stage/0/player
