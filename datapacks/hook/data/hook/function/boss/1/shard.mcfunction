#> hook:boss/1/shard
# 太陽石の欠片(光る塊)を闘技場の中央の宙に出す(床から約 8 上、闘技場のどこからでも射程 40 の内)。
# 下の標的(335,78,0)を撃つと hook:boss/1/shot(標的へのフックは引っ張りを起こさず、スイッチだけ作動する。写し元: stage/5/stump)
kill @e[type=marker,tag=hook.b1shard]
execute in hook:world run fill 334 79 -1 336 81 1 minecraft:glowstone
execute in hook:world run setblock 335 78 0 minecraft:target
execute in hook:world run summon marker 335.5 78.5 0.5 {Tags:["hook.switch","hook.s1","hook.b1shard"],data:{f:"hook:boss/1/shot"}}
execute in hook:world run particle minecraft:end_rod 335.5 80 0.5 1.5 2 1.5 0.1 120 force @a
execute in hook:world run particle minecraft:totem_of_undying 335.5 80 0.5 1.5 1.5 1.5 0.3 60 force @a
execute in hook:world run playsound minecraft:block.beacon.activate master @a 335 75 0 4 1.5
title @a[scores={hook.stage=1}] times 10 50 20
title @a[scores={hook.stage=1}] title {text:""}
title @a[scores={hook.stage=1}] subtitle {text:"欠片が宙に浮かんでいる",color:"yellow"}
function hook:fairy/say {text:"欠片だ！ 鉤で撃って、引き寄せよう"}
function hook:guide/set {text:"宙の欠片を鉤で撃つ",x:335,y:78,z:0}
