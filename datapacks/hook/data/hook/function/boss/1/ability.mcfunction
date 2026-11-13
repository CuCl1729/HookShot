#> hook:boss/1/ability
# 能力1「ヘビーインパクト」(鉤が輝く)
scoreboard players set @a[scores={hook.stage=1}] hook.ability 1
function hook:fx/ability_get {name:"ヘビーインパクト",sub:"重い敵へ飛びつくと、突き飛ばす"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"能力1「ヘビーインパクト」: 重い敵へ飛んで着くと、その敵を進む向きへ突き飛ばす。突き飛ばした先にトゲや奈落があれば倒れ、壁に当たれば怯む。着いた周りの軽い敵も弾き飛ばす。",color:"gray"}]
