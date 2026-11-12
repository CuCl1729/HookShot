#> hook:stage/0/player
# @s = 訓練場のプレイヤー(実行位置も @s)。hook.tut = 段階
# 1 移動・跳ね / 2 連続フック / 3 フロート / 4 掴んで標的へ / 5 敵を敵へ / 6 爆弾兵 / 7 重装兵へ飛ぶ / 8 トゲ / 9 修了(門をくぐる)
# #t hook.tut = 出し直しの待ち tick、#n = 数、#fl = フロートを使った
execute if score @s hook.tut matches 1 if entity @s[x=-6,y=69.5,z=-5,dx=4,dy=4,dz=10] run function hook:stage/0/s2
execute if score @s hook.tut matches 2 if entity @s[x=49,y=81.5,z=-5,dx=8,dy=4,dz=10] run function hook:stage/0/s3
execute if score @s hook.tut matches 3 if entity @s[tag=hook.floating] run scoreboard players set #fl hook.tut 1
execute if score @s hook.tut matches 3 if entity @s[x=74,y=63,z=-5,dx=20,dy=6,dz=18] run function hook:stage/0/s4
# 4: 的のゾンビが居なければ出し直す(標的に当てたら stage/0/t1 が次へ)
execute if score @s hook.tut matches 4 unless entity @e[tag=hook.tut4] run function hook:stage/0/sp4
# 5: 2体とも倒れたら次へ。1体だけ残ったら3秒後にもう1体
execute if score @s hook.tut matches 5 store result score #n hook.tut if entity @e[tag=hook.tut5]
execute if score @s hook.tut matches 5 if score #n hook.tut matches 0 run return run function hook:stage/0/s6
execute if score @s hook.tut matches 5 if score #n hook.tut matches 1 unless entity @e[tag=hook.tut5,tag=!hook.p5a] run function hook:stage/0/wait {f:"hook:stage/0/sp5b"}
execute if score @s hook.tut matches 5 if score #n hook.tut matches 1 unless entity @e[tag=hook.tut5,tag=!hook.p5b] run function hook:stage/0/wait {f:"hook:stage/0/sp5a"}
# 6: 台のゾンビ3体が倒れたら次へ。爆弾兵が居なくなってゾンビが残ったら3秒後に爆弾兵を出し直す
execute if score @s hook.tut matches 6 unless entity @e[tag=hook.tut6z] run return run function hook:stage/0/s7
execute if score @s hook.tut matches 6 unless entity @e[tag=hook.p6b] run function hook:stage/0/wait {f:"hook:stage/0/sp6b"}
# 7: 重装兵へ飛び移ったら次へ
execute if score @s hook.tut matches 7 unless entity @e[tag=hook.p7] run function hook:stage/0/sp7
execute if score @s hook.tut matches 7 if entity @s[tag=hook.grabbed_heavy] if entity @e[tag=hook.p7,distance=..3.5] run return run function hook:stage/0/s8
# 8: トゲの向こうのゾンビ2体が倒れたら修了
execute if score @s hook.tut matches 8 unless entity @e[tag=hook.tut8] run return run function hook:stage/0/finish
# 9: 西の門をくぐったら水晶坑道へ
execute if score @s hook.tut matches 9 if entity @s[x=-29,y=63,z=26,dx=4,dy=6,dz=6] run function hook:stage/1/start
