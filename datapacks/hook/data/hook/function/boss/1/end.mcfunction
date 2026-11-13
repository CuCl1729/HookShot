#> hook:boss/1/end
# 撃破の余韻(毎 tick、#dt)。0 fx/boss_clear(defeat)/ 30 物語 / 60 巨兵が崩れる / 80 欠片が宙に現れる(boss/1/shard)
# → 90 で待つ(プレイヤーが鉤で欠片の標的を撃つまで。撃つと boss/1/shot が欠片 1/3)→ 191 能力1 / 310 評価 / 390 ルミ / 470 ステージ2へ
execute if score #dt hook.b1 matches ..89 run scoreboard players add #dt hook.b1 1
execute if score #dt hook.b1 matches 90 if score #shot hook.b1 matches 1 run scoreboard players add #dt hook.b1 1
execute if score #dt hook.b1 matches 91.. run scoreboard players add #dt hook.b1 1
execute if score #dt hook.b1 matches 30 run tellraw @a[scores={hook.stage=1}] {text:"巨兵は膝をつき、胸の水晶から太陽石の欠片がこぼれ落ちた。",color:"yellow"}
execute if score #dt hook.b1 matches 60 as @e[tag=hook.boss1] at @s run function hook:boss/1/crumble
execute if score #dt hook.b1 matches 80 run function hook:boss/1/shard
# 撃つまで: 欠片に光の柱、20 秒ごとにヒント
execute if score #dt hook.b1 matches 80..90 unless score #shot hook.b1 matches 1 in hook:world run particle minecraft:end_rod 335.5 75 0.5 0.3 3 0.3 0.01 4 force @a
execute if score #dt hook.b1 matches 90 unless score #shot hook.b1 matches 1 run scoreboard players add #w hook.b1 1
execute if score #w hook.b1 matches 200 unless score #shot hook.b1 matches 1 run tellraw @a[scores={hook.stage=1}] {text:"上を向いて、宙に光る欠片の下の的へ右クリック。",color:"gray"}
execute if score #w hook.b1 matches 400.. run scoreboard players set #w hook.b1 1
execute if score #dt hook.b1 matches 191 run function hook:boss/1/ability
execute if score #dt hook.b1 matches 310 run function hook:boss/1/results
execute if score #dt hook.b1 matches 390 run function hook:fairy/say {text:"鉤がきらきらしてる……！ ひと休みしたら、次の欠片へ行こう"}
execute if score #dt hook.b1 matches 470.. run function hook:boss/1/leave
