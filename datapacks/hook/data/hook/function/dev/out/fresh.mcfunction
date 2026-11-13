#> hook:dev/out/fresh
# 試験用(schedule から)。core/reset のあと新規と同じ状態か: 進行・難易度・欠片・評価・光の粒・倒れた回数・inbox を出す
execute as @a run tellraw @a ["MCO fresh stage=",{score:{name:"@s",objective:"hook.stage"}}," joined=",{score:{name:"@s",objective:"hook.joined"}}," pos=",{nbt:"Pos",entity:"@s"}," inv=",{nbt:"Inventory",entity:"@s"}]
tellraw @a ["MCO fresh chosen=",{score:{name:"#chosen",objective:"hook.diff"}}," level=",{score:{name:"#level",objective:"hook.diff"}}," shards=",{score:{name:"#shards",objective:"hook.score"}}," lore=",{score:{name:"#lore",objective:"hook.score"}}," deaths=",{score:{name:"#deaths",objective:"hook.score"}}," inbox=",{score:{name:"#inbox",objective:"hook.dev"}}]
tellraw @a ["MCO fresh ranks=",{nbt:"ranks",storage:"hook:"}," intro_t=",{score:{name:"#t",objective:"hook.intro"}}]
