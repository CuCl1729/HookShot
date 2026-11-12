#> hook:stage/5/results
# 戦績。ステージ4(ボス戦)の集計を hook:score/show で出してランクを storage hook: ranks.s4 に残し、
# 全ステージの ranks.s1〜s4({r:"S",c:"gold",g:3,pts:N}。g = S3/A2/B1/C0)を並べ、平均から総合評価を出す。無いステージは「―」
tellraw @a[scores={hook.stage=5}] {text:"―― 戦績 ――",color:"gold",bold:true}
tellraw @a[scores={hook.stage=5}] {text:"虚の玉座(ボス戦):",color:"gray"}
# shortcut: ボス戦の閾値は推定(撃破 10・コンボ 3・4〜5 分で A 程度)。通しプレイの実測で直す
function hook:score/show {s:-60,a:-180,b:-300}
data modify storage hook: ranks.s4 set value {r:"C",c:"gray",g:0}
execute if score #pts hook.score matches -300.. run data modify storage hook: ranks.s4 set value {r:"B",c:"aqua",g:1}
execute if score #pts hook.score matches -180.. run data modify storage hook: ranks.s4 set value {r:"A",c:"red",g:2}
execute if score #pts hook.score matches -60.. run data modify storage hook: ranks.s4 set value {r:"S",c:"gold",g:3}
execute store result storage hook: ranks.s4.pts int 1 run scoreboard players get #pts hook.score
function hook:stage/5/rank_line {s:"s1",n:"水晶坑道"}
function hook:stage/5/rank_line {s:"s2",n:"歯車工場"}
function hook:stage/5/rank_line {s:"s3",n:"天空回廊"}
function hook:stage/5/rank_line {s:"s4",n:"虚の玉座"}
# 総合 = g の平均(×10)。S 25 / A 17 / B 9 以上
scoreboard players set #g hook.b3 0
scoreboard players set #c hook.b3 0
execute store result score #a hook.b3 run data get storage hook: ranks.s1.g
scoreboard players operation #g hook.b3 += #a hook.b3
execute store result score #a hook.b3 run data get storage hook: ranks.s2.g
scoreboard players operation #g hook.b3 += #a hook.b3
execute store result score #a hook.b3 run data get storage hook: ranks.s3.g
scoreboard players operation #g hook.b3 += #a hook.b3
execute store result score #a hook.b3 run data get storage hook: ranks.s4.g
scoreboard players operation #g hook.b3 += #a hook.b3
execute if data storage hook: ranks.s1.g run scoreboard players add #c hook.b3 1
execute if data storage hook: ranks.s2.g run scoreboard players add #c hook.b3 1
execute if data storage hook: ranks.s3.g run scoreboard players add #c hook.b3 1
execute if data storage hook: ranks.s4.g run scoreboard players add #c hook.b3 1
scoreboard players operation #g hook.b3 *= #10 hook.constant
scoreboard players operation #g hook.b3 /= #c hook.b3
data modify storage hook: tmp.total set value {r:"C",c:"gray"}
execute if score #g hook.b3 matches 9.. run data modify storage hook: tmp.total set value {r:"B",c:"aqua"}
execute if score #g hook.b3 matches 17.. run data modify storage hook: tmp.total set value {r:"A",c:"red"}
execute if score #g hook.b3 matches 25.. run data modify storage hook: tmp.total set value {r:"S",c:"gold"}
function hook:stage/5/total with storage hook: tmp.total
