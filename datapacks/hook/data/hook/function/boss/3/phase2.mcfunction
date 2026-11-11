#> hook:boss/3/phase2
# hook:world で実行。第2形態開始: 速くなり、雑魚を呼び、虚空を渡ってくる。スタン中(と直後)しか傷が通らない
scoreboard players set #state hook.b3 3
scoreboard players set #inv hook.b3 0
scoreboard players set #warp hook.b3 0
scoreboard players set #spawn hook.b3 200
execute as @e[tag=hook.boss3] run attribute @s minecraft:movement_speed base set 0.3
function hook:core/call {f:"hook:boss/3/bar_phase2"}
title @a[scores={hook.stage=4}] actionbar {text:"スタンチェインで縛り、突き飛ばせ。とどめは奈落へ!",color:"red"}
tellraw @a[scores={hook.stage=4}] [{text:"[師範の声] ",color:"yellow"},{text:"床が砕けた! 今の奴は虚に守られている。フックで縛った間だけ傷が通る。",color:"white"}]
tellraw @a[scores={hook.stage=4}] [{text:"[師範の声] ",color:"yellow"},{text:"縛ったまま突き飛ばせ。トゲでもプレスでもいい。最後は奈落へ叩き落とせ!",color:"white"}]
