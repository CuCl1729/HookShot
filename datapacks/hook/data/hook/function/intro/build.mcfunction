#> hook:intro/build
# 妖精の村の一角(hook:world, x -93〜-61, z -8〜8, 床 y 62)。冪等: 範囲を消してから建てる。core の tick が built.intro の無い間呼ぶ
execute in hook:world run forceload add -96 -16 -49 15
execute in hook:world unless loaded -90 64 -8 run return 0
execute in hook:world unless loaded -90 64 8 run return 0
execute in hook:world unless loaded -70 64 -8 run return 0
execute in hook:world unless loaded -70 64 8 run return 0
execute in hook:world unless loaded -60 64 -8 run return 0
execute in hook:world unless loaded -60 64 8 run return 0
kill @e[tag=hook.intro]
execute in hook:world run fill -94 61 -9 -60 75 9 minecraft:air
# 出口の小部屋(先に建て、本体の壁 x -67 を共有する)
execute in hook:world run fill -67 62 -3 -61 68 3 minecraft:dark_oak_log hollow
execute in hook:world run fill -66 62 -2 -62 62 2 minecraft:moss_block
execute in hook:world run setblock -62 63 0 minecraft:sea_lantern
# 本体: 大樹の洞の中のような部屋。壁は暗い丸太、天井は葉(persistent でないと消える)、床は苔
execute in hook:world run fill -93 62 -8 -67 74 8 minecraft:dark_oak_log hollow
execute in hook:world run fill -92 74 -7 -68 74 7 minecraft:dark_oak_leaves[persistent=true]
execute in hook:world run fill -92 62 -7 -68 62 7 minecraft:moss_block
execute in hook:world run setblock -88 74 0 minecraft:shroomlight
execute in hook:world run setblock -76 74 -4 minecraft:shroomlight
execute in hook:world run setblock -76 74 4 minecraft:shroomlight
# 空の祭壇(太陽石を戻す所)
execute in hook:world run setblock -91 63 0 minecraft:chiseled_stone_bricks
execute in hook:world run setblock -91 64 0 minecraft:candle[candles=4,lit=true]
execute in hook:world run setblock -91 63 -1 minecraft:stone_brick_stairs[facing=south]
execute in hook:world run setblock -91 63 1 minecraft:stone_brick_stairs[facing=north]
# 扉(難易度を選ぶと開く)
execute in hook:world run fill -67 63 -1 -67 65 1 minecraft:iron_bars
# 難易度の標的(北の壁)。標的の中心に hook.switch の marker
execute in hook:world run setblock -85 66 -8 minecraft:target
execute in hook:world run setblock -80 66 -8 minecraft:target
execute in hook:world run setblock -75 66 -8 minecraft:target
execute in hook:world run summon marker -84.5 66.5 -7.5 {Tags:["hook.switch","hook.intro"],data:{f:"hook:intro/pick0"}}
execute in hook:world run summon marker -79.5 66.5 -7.5 {Tags:["hook.switch","hook.intro"],data:{f:"hook:intro/pick1"}}
execute in hook:world run summon marker -74.5 66.5 -7.5 {Tags:["hook.switch","hook.intro"],data:{f:"hook:intro/pick2"}}
execute in hook:world run summon text_display -84.5 67.8 -6.8 {Tags:["hook.intro","hook.intro_l0"],billboard:"center",brightness:{sky:15,block:15},text:{text:""}}
execute in hook:world run summon text_display -79.5 67.8 -6.8 {Tags:["hook.intro","hook.intro_l1"],billboard:"center",brightness:{sky:15,block:15},text:{text:""}}
execute in hook:world run summon text_display -74.5 67.8 -6.8 {Tags:["hook.intro","hook.intro_l2"],billboard:"center",brightness:{sky:15,block:15},text:{text:""}}
function hook:intro/labels
# 長老(マネキン。話すのは intro/tick)
execute in hook:world run summon mannequin -83.5 63 3.5 {profile:{name:"Steve"},immovable:1b,hide_description:1b,Invulnerable:1b,Silent:1b,CustomName:{text:"長老",color:"yellow"},CustomNameVisible:1b,Tags:["hook.intro"],Rotation:[120f,0f]}
data modify storage hook: built.intro set value 1b
