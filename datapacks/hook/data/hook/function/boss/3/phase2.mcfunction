#> hook:boss/3/phase2
# hook:world。第2形態開始: 島を渡り(ワープ)、虚の雨・二重の波・手下で攻める。縛る(フック)か手下を当てると怯む
scoreboard players set #state hook.b3 3
scoreboard players set #inv hook.b3 0
scoreboard players set #stag hook.b3 0
scoreboard players set #grd hook.b3 150
function hook:boss/3/rest
scoreboard players set #cd hook.b3 40
function hook:core/call {f:"hook:boss/3/bar_phase2"}
title @a[scores={hook.stage=4}] actionbar {text:"フックで縛って突き飛ばせ。とどめは奈落へ!",color:"red"}
tellraw @a[scores={hook.stage=4}] {text:"床が崩れた! 浮島と宙のフック点を渡ろう。今の王は、フックで縛るだけで怯む。",color:"gray"}
tellraw @a[scores={hook.stage=4}] {text:"縛ったら突っ込んで突き飛ばす。トゲでもプレスでも爆弾兵でもいい。最後は奈落へ。",color:"gray"}
