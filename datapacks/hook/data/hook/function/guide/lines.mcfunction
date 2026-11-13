#> hook:guide/lines
# @macro text/n/d(storage hook: hud)。サイドバーの行(偽プレイヤー hook.g1〜g4。# で始まる名前はサイドバーに出ないので使わない)
scoreboard players set hook.g1 hook.guide 4
scoreboard players set hook.g2 hook.guide 3
scoreboard players set hook.g3 hook.guide 2
scoreboard players set hook.g4 hook.guide 1
$scoreboard players display name hook.g1 hook.guide {text:"▶ $(text)",color:"white"}
$scoreboard players display name hook.g2 hook.guide {text:"太陽石の欠片 $(n)/3",color:"gold"}
$scoreboard players display name hook.g3 hook.guide {text:"難易度 $(d)",color:"gray"}
scoreboard players display name hook.g4 hook.guide {text:"ルミの鈴(右クリック)で道案内",color:"aqua"}
