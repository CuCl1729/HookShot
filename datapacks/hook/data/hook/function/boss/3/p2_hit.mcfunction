#> hook:boss/3/p2_hit
# @s = トゲかプレスに触れた王(第2形態)。縛っていなければ効かない。最後の1は奈落でしか削れない
execute unless score #vuln hook.b3 matches 1.. run return run title @a[scores={hook.stage=4}] actionbar {text:"虚に守られている…フックで縛ってからだ",color:"gray"}
# 縛ったままトゲに乗るとスタンが減らない(enemy/tick がトゲで先に返る)ので、トゲは砕く
execute if block ~ ~ ~ minecraft:amethyst_cluster run fill ~-3 ~ ~-3 ~3 ~ ~3 minecraft:air replace minecraft:amethyst_cluster
execute if score #hp hook.b3 matches ..1 run return run title @a[scores={hook.stage=4}] actionbar {text:"とどめは奈落だ! 縛って突き落とせ",color:"red"}
function hook:boss/3/damage
title @a[scores={hook.stage=4}] actionbar {text:"効いた! とどめは奈落だ",color:"red"}
