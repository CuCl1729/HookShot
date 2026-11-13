#> hook:cp/back
# @s = 前提の状態(鍵・稽古・鐘など)を満たさずに先の区画へ来たプレイヤー(離しで飛び越えた等)。チェックポイントへ戻す。@macro t: 理由
function hook:cp/return
$tellraw @s {text:"$(t)",color:"gray",italic:true}
execute at @s run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 0.6
