#> hook:boss/3/fall
# @s = 奈落(y<32)へ落ちた王。第2形態で怯み中なら傷(最後の1ならとどめ。無敵時間を見ない)。どの場合も玉座の島へ戻す
execute if score #state hook.b3 matches 3 if score #stag hook.b3 matches 1.. if score #hp hook.b3 matches ..1 run return run function hook:boss/3/defeat
execute if score #state hook.b3 matches 3 if score #stag hook.b3 matches 1.. if score #inv hook.b3 matches 0 run function hook:boss/3/damage
execute if score #state hook.b3 matches 3 unless score #stag hook.b3 matches 1.. run title @a[scores={hook.stage=4}] actionbar {text:"縛らずに落としても、虚から這い戻ってくる",color:"gray"}
function hook:boss/3/home
