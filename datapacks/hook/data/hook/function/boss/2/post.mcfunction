#> hook:boss/2/post
# 撃破後(#state 2)の毎 tick。4 秒後にステージ評価(storage hook: ranks.s2 に残す)、10 秒後にステージ3へ
scoreboard players add #t hook.b2 1
# 点 = 撃破×10 + 最大コンボ×20 − 秒。15〜25 分のステージなので下限は負(S は約 14 分で撃破 25 前後)。閾値は ranks.s2 と揃える
execute if score #t hook.b2 matches 80 run function hook:score/show {s:-500,a:-850,b:-1200}
execute if score #t hook.b2 matches 80 run data modify storage hook: ranks.s2 set value {r:"C",c:"gray",g:0}
execute if score #t hook.b2 matches 80 if score #pts hook.score matches -1200.. run data modify storage hook: ranks.s2 set value {r:"B",c:"aqua",g:1}
execute if score #t hook.b2 matches 80 if score #pts hook.score matches -850.. run data modify storage hook: ranks.s2 set value {r:"A",c:"red",g:2}
execute if score #t hook.b2 matches 80 if score #pts hook.score matches -500.. run data modify storage hook: ranks.s2 set value {r:"S",c:"gold",g:3}
execute if score #t hook.b2 matches 80 store result storage hook: ranks.s2.pts int 1 run scoreboard players get #pts hook.score
execute if score #t hook.b2 matches 200 as @a[scores={hook.stage=2}] run function hook:boss/2/next
