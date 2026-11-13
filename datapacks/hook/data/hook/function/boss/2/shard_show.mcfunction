#> hook:boss/2/shard_show
# hook:world で実行(撃破から 80 tick)。部屋の中央の宙(床の 12 上、プレスの筐体より上)に欠片の光る塊と、その下の標的を出す。
# 標的を鉤で撃つと hook:boss/2/shard(標的ブロックへのフックは引っ張りを起こさず、スイッチだけ作動する)
kill @e[tag=hook.b2s]
fill 840 77 -1 842 79 1 minecraft:glowstone
setblock 841 76 0 minecraft:target
summon marker 841.5 76.5 0.5 {Tags:["hook.switch","hook.b2s"],data:{f:"hook:boss/2/shard"}}
particle minecraft:end_rod 841.5 78 0.5 1.5 2 1.5 0.05 100 force @a
particle minecraft:totem_of_undying 841.5 78 0.5 1 1 1 0.3 60 force @a
playsound minecraft:block.beacon.activate master @a 841 70 0 4 1.5
playsound minecraft:block.bell.use master @a 841 70 0 3 1.2
title @a[scores={hook.stage=2}] times 10 50 15
title @a[scores={hook.stage=2}] title {text:"",color:"gold"}
title @a[scores={hook.stage=2}] subtitle {text:"宙に浮かぶ欠片を、鉤で撃て",color:"yellow"}
function hook:fairy/say {text:"欠片が浮いてる！ 鉤で撃って引き寄せて"}
function hook:guide/set {text:"宙の欠片を鉤で撃つ",x:841.5,y:76.5,z:0.5}
