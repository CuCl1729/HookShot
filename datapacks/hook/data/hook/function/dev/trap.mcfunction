#> hook:dev/trap
# 試験用(schedule から毎 tick)。storage hook: dev.trap {x,z,tx,ty,tz}: tag dev.z の敵がプレス(中心 x,z、範囲 5x5)の下に来たら、
# プレイヤーがその敵へ撃ち(縛る)、2 tick 後に離し(dev/let_go)、4 tick 後に dev.q の標的を撃つ。来るまで #trap hook.dev tick 待つ
scoreboard players remove #trap hook.dev 1
execute if score #trap hook.dev matches ..0 run return run tellraw @a "trap timeout"
execute in hook:world store success score #in hook.dev run function hook:dev/trap_in with storage hook: dev.trap
execute if score #in hook.dev matches 0 run return run schedule function hook:dev/trap 1t
tellraw @a "trap fire"
execute as @a[limit=1] at @s run function hook:dev/aim_at {tag:"dev.z"}
schedule function hook:dev/let_go 2t
schedule function hook:dev/seq_s 5t
