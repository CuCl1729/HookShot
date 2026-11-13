#> hook:guide/set
# @macro text/x/y/z: いまの目的(右のサイドバーに常時表示)と目的地(ルミの鈴で方角・距離・光の筋を出す。hook:world の座標)
# 進行の節目でステージ側が呼ぶ。text は短く(15 字程度)、「"」と「\」は使えない。誰が呼んでもよい
$data modify storage hook: guide set value {text:"$(text)",x:$(x),y:$(y),z:$(z)}
function hook:guide/refresh
$tellraw @a [{text:"[目的] ",color:"aqua",bold:true},{text:"$(text)",color:"white"}]
execute as @a at @s run playsound minecraft:block.note_block.bell master @s ~ ~ ~ 0.7 1.8
