# 難易度 0/1/2 の値(#fuel の基準 40 に 100/75/50%)と、storage hook: diff・hud(guide/set の後なので hud.d が追従する)
function hook:diff/set {level:0}
execute if score #tele_pct hook.diff matches 100 if score #boss_hp_add hook.diff matches 0 if score #spd hook.diff matches 0 if score #fuel_pct hook.diff matches 100 if score #hp hook.diff matches 20 if score #chosen hook.diff matches 1 run say HOOKTEST common.diff0 PASS
execute unless score #tele_pct hook.diff matches 100 run say HOOKTEST common.diff0 FAIL tele_pct not 100
execute unless score #boss_hp_add hook.diff matches 0 run say HOOKTEST common.diff0 FAIL boss_hp_add not 0
execute unless score #spd hook.diff matches 0 run say HOOKTEST common.diff0 FAIL spd not 0
execute unless score #fuel_pct hook.diff matches 100 run say HOOKTEST common.diff0 FAIL fuel_pct not 100
execute unless score #hp hook.diff matches 20 run say HOOKTEST common.diff0 FAIL hp not 20
execute unless score #chosen hook.diff matches 1 run say HOOKTEST common.diff0 FAIL chosen not 1
execute if score #fuel hook.cfg matches 40 run say HOOKTEST common.fuel0 PASS
execute unless score #fuel hook.cfg matches 40 run say HOOKTEST common.fuel0 FAIL fuel not 40
execute if data storage hook: diff{name:"ノーマル"} run say HOOKTEST common.diffname0 PASS
execute unless data storage hook: diff{name:"ノーマル"} run say HOOKTEST common.diffname0 FAIL diff name not ノーマル
execute if data storage hook: hud{d:"ノーマル"} run say HOOKTEST common.hud0 PASS
execute unless data storage hook: hud{d:"ノーマル"} run say HOOKTEST common.hud0 FAIL hud.d not ノーマル
function hook:diff/set {level:1}
execute if score #tele_pct hook.diff matches 80 if score #boss_hp_add hook.diff matches 1 if score #spd hook.diff matches 20 if score #fuel_pct hook.diff matches 75 if score #hp hook.diff matches 12 if score #chosen hook.diff matches 1 run say HOOKTEST common.diff1 PASS
execute unless score #tele_pct hook.diff matches 80 run say HOOKTEST common.diff1 FAIL tele_pct not 80
execute unless score #boss_hp_add hook.diff matches 1 run say HOOKTEST common.diff1 FAIL boss_hp_add not 1
execute unless score #spd hook.diff matches 20 run say HOOKTEST common.diff1 FAIL spd not 20
execute unless score #fuel_pct hook.diff matches 75 run say HOOKTEST common.diff1 FAIL fuel_pct not 75
execute unless score #hp hook.diff matches 12 run say HOOKTEST common.diff1 FAIL hp not 12
execute unless score #chosen hook.diff matches 1 run say HOOKTEST common.diff1 FAIL chosen not 1
execute if score #fuel hook.cfg matches 30 run say HOOKTEST common.fuel1 PASS
execute unless score #fuel hook.cfg matches 30 run say HOOKTEST common.fuel1 FAIL fuel not 30
execute if data storage hook: diff{name:"ハード"} run say HOOKTEST common.diffname1 PASS
execute unless data storage hook: diff{name:"ハード"} run say HOOKTEST common.diffname1 FAIL diff name not ハード
execute if data storage hook: hud{d:"ハード"} run say HOOKTEST common.hud1 PASS
execute unless data storage hook: hud{d:"ハード"} run say HOOKTEST common.hud1 FAIL hud.d not ハード
function hook:diff/set {level:2}
execute if score #tele_pct hook.diff matches 65 if score #boss_hp_add hook.diff matches 2 if score #spd hook.diff matches 40 if score #fuel_pct hook.diff matches 50 if score #hp hook.diff matches 6 if score #chosen hook.diff matches 1 run say HOOKTEST common.diff2 PASS
execute unless score #tele_pct hook.diff matches 65 run say HOOKTEST common.diff2 FAIL tele_pct not 65
execute unless score #boss_hp_add hook.diff matches 2 run say HOOKTEST common.diff2 FAIL boss_hp_add not 2
execute unless score #spd hook.diff matches 40 run say HOOKTEST common.diff2 FAIL spd not 40
execute unless score #fuel_pct hook.diff matches 50 run say HOOKTEST common.diff2 FAIL fuel_pct not 50
execute unless score #hp hook.diff matches 6 run say HOOKTEST common.diff2 FAIL hp not 6
execute unless score #chosen hook.diff matches 1 run say HOOKTEST common.diff2 FAIL chosen not 1
execute if score #fuel hook.cfg matches 20 run say HOOKTEST common.fuel2 PASS
execute unless score #fuel hook.cfg matches 20 run say HOOKTEST common.fuel2 FAIL fuel not 20
execute if data storage hook: diff{name:"ナイトメア"} run say HOOKTEST common.diffname2 PASS
execute unless data storage hook: diff{name:"ナイトメア"} run say HOOKTEST common.diffname2 FAIL diff name not ナイトメア
execute if data storage hook: hud{d:"ナイトメア"} run say HOOKTEST common.hud2 PASS
execute unless data storage hook: hud{d:"ナイトメア"} run say HOOKTEST common.hud2 FAIL hud.d not ナイトメア
function hook:diff/set {level:0}
scoreboard players set #chosen hook.diff 0
