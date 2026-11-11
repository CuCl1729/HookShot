#> hook:stage/0/player
# @s = 訓練場のプレイヤー。hook.tut = 段階(1 ブロックへ移動 / 2 軽い敵をトゲへ / 3 重い敵へ飛ぶ / 4 修了)
execute if score @s hook.tut matches 1 if entity @s[x=2,y=63,z=-9,dx=38,dy=6,dz=18] run function hook:stage/0/step2
execute if score @s hook.tut matches 2 unless entity @e[tag=hook.tut] if entity @s[tag=hook.yanked] run function hook:stage/0/step3
# フックで引かずに倒れた(自分で落ちた等)ならやり直し
execute if score @s hook.tut matches 2 unless entity @e[tag=hook.tut] run function hook:stage/0/summon_zombie
execute if score @s hook.tut matches 3 unless entity @e[tag=hook.tut] run function hook:stage/0/summon_heavy
execute if score @s hook.tut matches 3 if entity @s[tag=hook.grabbed_heavy] if entity @e[tag=hook.tut,distance=..3] run function hook:stage/0/finish
