#> hook:boss/3/reset
# ボス戦を待機に戻す(冪等)。王と雑魚とバーを消し、闘技場を第1形態の床に建て直させる(hook:stage/4/tick が build を呼ぶ)
scoreboard players set #state hook.b3 0
kill @e[tag=hook.boss3]
kill @e[tag=hook.b3m]
function hook:core/call {f:"hook:boss/3/bar_hide"}
data modify storage hook: built.s4 set value 0b
execute as @a[scores={hook.stage=4,hook.cp=41}] run function hook:cp/set {id:40,x:1502.5,y:64,z:0.5,yaw:-90}
