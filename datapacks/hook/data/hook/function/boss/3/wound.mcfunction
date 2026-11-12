#> hook:boss/3/wound
# @s = 怯み中にトゲ・プレスを受けた王。傷を負って玉座の島へ退く
execute if score #state hook.b3 matches 3 if score #hp hook.b3 matches ..1 run return run title @a[scores={hook.stage=4}] actionbar {text:"とどめは奈落だ! 縛って突き落とせ",color:"red"}
function hook:boss/3/damage
execute unless score #state hook.b3 matches 2 run function hook:boss/3/home
