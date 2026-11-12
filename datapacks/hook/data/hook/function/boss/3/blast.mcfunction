#> hook:boss/3/blast
# @s = 爆弾兵の爆発に巻き込まれた王。怯んで、無敵でなければ傷(第2形態の最後の1は奈落でしか削れない)
function hook:boss/3/stagger
execute if score #inv hook.b3 matches 1.. run return 0
execute if score #state hook.b3 matches 3 if score #hp hook.b3 matches ..1 run return run title @a[scores={hook.stage=4}] actionbar {text:"とどめは奈落だ! 縛って突き落とせ",color:"red"}
function hook:boss/3/damage
