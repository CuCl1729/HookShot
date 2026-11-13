#> hook:stage/0/player
# @s = 訓練場のプレイヤー(実行位置も @s)。hook.tut = 段階
# 1 鈴を鳴らす・壁の上へ / 2 連続フック / 3 フロート / 4 掴んで標的へ / 5 敵を敵へ(弾く)/ 6 爆弾兵 / 7 重装兵へ飛ぶ / 8 トゲ / 9 修了(門をくぐる)
# #t hook.tut = 出し直しの待ち tick、#fl = フロートを使った。段階を飛ばして先の地点に着いても進めるよう、到着の判定は「..N」で見る
execute if score @s hook.tut matches 1 unless entity @s[tag=hook.t0g] run function hook:stage/0/guide
# 鈴: 一度鳴らすまで先の段階へ進めない(鳴らせば目的が「壁の上へ」に変わる)
execute if score @s hook.tut matches 1 unless entity @s[tag=hook.t0bell] if score @s hook.ask matches 1.. run function hook:stage/0/bell
execute if score @s hook.tut matches ..3 unless entity @s[tag=hook.t0bell] if entity @s[x=-6,y=63,z=-8,dx=100,dy=37,dz=22] run return run title @s actionbar {text:"まず 9 番のルミの鈴を持って右クリック",color:"aqua"}
execute if score @s hook.tut matches 1 if entity @s[x=-6,y=69.5,z=-5,dx=4,dy=4,dz=10] run function hook:stage/0/s2
execute if score @s hook.tut matches ..2 if entity @s[x=49,y=81.5,z=-5,dx=8,dy=4,dz=10] run function hook:stage/0/s3
execute if score @s hook.tut matches 3 if entity @s[tag=hook.floating] run scoreboard players set #fl hook.tut 1
execute if score @s hook.tut matches ..3 if entity @s[x=74,y=63,z=-5,dx=20,dy=6,dz=18] run function hook:stage/0/s4
# 仕切りの壁(厚さ1)は跳ね+フロートで越えられる。今の段階より先の区画に入ったらチェックポイントへ戻す
execute if score @s hook.tut matches ..4 if entity @s[x=51,y=50,z=14,dx=18,dy=60,dz=30] run return run function hook:stage/0/back
execute if score @s hook.tut matches ..5 if entity @s[x=32,y=50,z=14,dx=17,dy=60,dz=30] run return run function hook:stage/0/back
execute if score @s hook.tut matches ..6 if entity @s[x=-31,y=50,z=14,dx=61,dy=60,dz=30] run return run function hook:stage/0/back
# 4: 的のゾンビが居なければ出し直す(標的に当てたら stage/0/t1 が次へ)
execute if score @s hook.tut matches 4 unless entity @e[tag=hook.tut4] run function hook:stage/0/sp4
# 5: 掴んでいない方が、投げた敵に当たって弾かれ怯んだら次へ(stage/0/tick が掴んだ方に hook.t5g を付ける)
execute if score @s hook.tut matches 5 if entity @e[tag=hook.tut5,tag=!hook.t5g,tag=hook.stun] run return run function hook:stage/0/s6
execute if score @s hook.tut matches 5 unless entity @e[tag=hook.tut5,tag=hook.p5a] run function hook:stage/0/wait {f:"hook:stage/0/sp5a"}
execute if score @s hook.tut matches 5 unless entity @e[tag=hook.tut5,tag=hook.p5b] run function hook:stage/0/wait {f:"hook:stage/0/sp5b"}
# 6: 台のゾンビ3体が倒れたら次へ(爆弾兵の爆発でだけ倒れる)。爆弾兵が居なくなってゾンビが残ったら3秒後に爆弾兵を出し直す
execute if score @s hook.tut matches 6 unless entity @e[tag=hook.tut6z] run return run function hook:stage/0/s7
execute if score @s hook.tut matches 6 unless entity @e[tag=hook.p6b] run function hook:stage/0/wait {f:"hook:stage/0/sp6b"}
# 7: 重装兵へ飛び移ったら次へ
execute if score @s hook.tut matches 7 unless entity @e[tag=hook.p7] run function hook:stage/0/sp7
execute if score @s hook.tut matches 7 if entity @s[tag=hook.grabbed_heavy] if entity @e[tag=hook.p7,distance=..3.5] run return run function hook:stage/0/s8
# 8: トゲの向こうのゾンビ2体が倒れたら修了(トゲでだけ倒れる)
execute if score @s hook.tut matches 8 unless entity @e[tag=hook.tut8] run return run function hook:stage/0/finish
# 9: 西の門をくぐったら水晶坑道へ
execute if score @s hook.tut matches 9 if entity @s[x=-29,y=63,z=26,dx=4,dy=6,dz=6] run function hook:stage/1/start
