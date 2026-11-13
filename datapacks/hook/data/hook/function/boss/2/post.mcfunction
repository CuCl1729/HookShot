#> hook:boss/2/post
# 撃破後(#state 2)の毎 tick。#t = 撃破からの tick(81 で欠片を撃つまで待つ。撃つと hook:boss/2/shard)
#  40 語り / 80 欠片が宙に現れる / (撃つ → 2/3)/ 185 能力2 / 260 ルミ / 300 評価(ranks.s2)/ 480 ステージ3へ
execute unless score #t hook.b2 matches 81 run scoreboard players add #t hook.b2 1
execute if score #t hook.b2 matches 81 if score #got hook.b2 matches 1 run scoreboard players add #t hook.b2 1
execute if score #t hook.b2 matches 40 run tellraw @a[scores={hook.stage=2}] {text:"番人の歯車が止まり、胸の奥から光がこぼれ出た。",color:"gray",italic:true}
execute if score #t hook.b2 matches 80 in hook:world run function hook:boss/2/shard_show
# 撃つまで: 光の柱と、20 秒ごとのヒント
execute if score #t hook.b2 matches 81 in hook:world run particle minecraft:end_rod 841.5 72 0.5 0.3 4 0.3 0.01 3 force @a
execute if score #t hook.b2 matches 81 run scoreboard players add #w hook.b2 1
execute if score #t hook.b2 matches 81 if score #w hook.b2 matches 400 run function hook:fairy/say {text:"上を見て！ 光ってる欠片を鉤で撃って"}
execute if score #w hook.b2 matches 400.. run scoreboard players set #w hook.b2 0
execute if score #t hook.b2 matches 185 as @a[scores={hook.stage=2}] run function hook:boss/2/reward
execute if score #t hook.b2 matches 185 run function hook:fx/ability_get {name:"スタンチェイン",sub:"鉤を当てた敵を3秒止める"}
execute if score #t hook.b2 matches 200 run tellraw @a[scores={hook.stage=2}] {text:"敵を鉤で縛って足止めし、突き飛ばしてギミックへ送れ。",color:"gray"}
execute if score #t hook.b2 matches 260 run function hook:fairy/say {text:"あとひとつ。……空の上。王が持ってる"}
# 点 = 撃破×10 + 最大コンボ×20 − 秒。15〜25 分のステージなので下限は負(S は約 14 分で撃破 25 前後)。閾値は ranks.s2 と揃える
execute if score #t hook.b2 matches 300 run function hook:score/show {s:-500,a:-850,b:-1200}
execute if score #t hook.b2 matches 300 run data modify storage hook: ranks.s2 set value {r:"C",c:"gray",g:0}
execute if score #t hook.b2 matches 300 if score #pts hook.score matches -1200.. run data modify storage hook: ranks.s2 set value {r:"B",c:"aqua",g:1}
execute if score #t hook.b2 matches 300 if score #pts hook.score matches -850.. run data modify storage hook: ranks.s2 set value {r:"A",c:"red",g:2}
execute if score #t hook.b2 matches 300 if score #pts hook.score matches -500.. run data modify storage hook: ranks.s2 set value {r:"S",c:"gold",g:3}
execute if score #t hook.b2 matches 300 store result storage hook: ranks.s2.pts int 1 run scoreboard players get #pts hook.score
execute if score #t hook.b2 matches 480 as @a[scores={hook.stage=2}] run function hook:boss/2/next
