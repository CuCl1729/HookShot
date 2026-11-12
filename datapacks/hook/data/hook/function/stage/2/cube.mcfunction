#> hook:stage/2/cube
# 実行位置 = 最小の角(align 済み)。@macro f: 撃たれたときの関数。2x2x2 の標的(どこから撃っても・投げ当てても作動する大きい標的)
fill ~ ~ ~ ~1 ~1 ~1 minecraft:target
$summon marker ~0.5 ~0.5 ~0.5 {Tags:["hook.switch"],data:{f:"$(f)"}}
$summon marker ~1.5 ~0.5 ~0.5 {Tags:["hook.switch"],data:{f:"$(f)"}}
$summon marker ~0.5 ~1.5 ~0.5 {Tags:["hook.switch"],data:{f:"$(f)"}}
$summon marker ~1.5 ~1.5 ~0.5 {Tags:["hook.switch"],data:{f:"$(f)"}}
$summon marker ~0.5 ~0.5 ~1.5 {Tags:["hook.switch"],data:{f:"$(f)"}}
$summon marker ~1.5 ~0.5 ~1.5 {Tags:["hook.switch"],data:{f:"$(f)"}}
$summon marker ~0.5 ~1.5 ~1.5 {Tags:["hook.switch"],data:{f:"$(f)"}}
$summon marker ~1.5 ~1.5 ~1.5 {Tags:["hook.switch"],data:{f:"$(f)"}}
