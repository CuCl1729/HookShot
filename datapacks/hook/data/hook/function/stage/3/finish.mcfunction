#> hook:stage/3/finish
# @s = 開いた門をくぐったプレイヤー。評価を出し、虚の王への導入のあと(ending)ステージ4へ
scoreboard players set #wave hook.s3 5
scoreboard players set #end hook.s3 1
kill @e[tag=hook.s3]
function hook:score/stop
# 点 = キル×10 + 最大コンボ×20 − 秒。投げでは倒せないのでほぼ −秒。15〜25分の章なので S 15分・A 20分・B 25分
function hook:score/show {s:-900,a:-1200,b:-1500}
# エンディングの戦績用(stage/5/results が ranks.s1〜s4 を並べる)。閾値は上の show と揃える
data modify storage hook: ranks.s3 set value {r:"C",c:"gray",g:0}
execute if score #pts hook.score matches -1500.. run data modify storage hook: ranks.s3 set value {r:"B",c:"aqua",g:1}
execute if score #pts hook.score matches -1200.. run data modify storage hook: ranks.s3 set value {r:"A",c:"red",g:2}
execute if score #pts hook.score matches -900.. run data modify storage hook: ranks.s3 set value {r:"S",c:"gold",g:3}
execute store result storage hook: ranks.s3.pts int 1 run scoreboard players get #pts hook.score
tellraw @s {text:"天空回廊 踏破",color:"aqua",bold:true}
