#> hook:boss/1/tele
# 予告の残り #t と向きの固定 #lk に難易度の倍率 #tele_pct(100/80/65 %)を掛ける。未設定ならそのまま(ノーマルと同じ)
execute unless score #tele_pct hook.diff matches 1.. run return 0
scoreboard players operation #t hook.b1 *= #tele_pct hook.diff
scoreboard players operation #t hook.b1 /= #100 hook.constant
scoreboard players operation #lk hook.b1 *= #tele_pct hook.diff
scoreboard players operation #lk hook.b1 /= #100 hook.constant
