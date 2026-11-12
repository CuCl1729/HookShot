#> hook:stage/2/build
# 歯車工場(hook:world, x 600〜900)。冪等: 範囲の entity(プレイヤー以外)と地形を消してから建てる。読み込まれるまでは何もしない
# 入口 x 600〜611 / 大工場 x 612〜788 z ±40 床の上面 y 64(壁 y 104 まで、屋根なし)
#   ハブ(西): 練習プレス 632,0 / 北 A 圧延ライン(遅延プレス3基と台車の炉心)/ 南 C 組立場(ウェーブ・プレス4基)/ 東の高所 B クレーン(炉は y 103)
#   東の壁 x 789 の中央に扉(3基停止で開く)と炉のランプ
# 前室 x 790〜818 / ボス部屋 x 820〜862 z ±13(壁 x 819, 863, z ±14、入口 z -1〜1)
execute in hook:world unless loaded 600 63 -64 run return 0
execute in hook:world unless loaded 900 63 63 run return 0
execute in hook:world unless loaded 600 63 63 run return 0
execute in hook:world unless loaded 900 63 -64 run return 0
execute in hook:world unless loaded 750 63 0 run return 0
execute in hook:world run kill @e[type=!minecraft:player,x=600,y=40,z=-64,dx=300,dy=80,dz=127]
execute in hook:world run function hook:stage/2/clear
execute in hook:world run function hook:stage/2/build_blocks
data modify storage hook: built.s2 set value 1b
