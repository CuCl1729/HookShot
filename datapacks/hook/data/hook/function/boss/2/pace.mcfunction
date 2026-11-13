#> hook:boss/2/pace
# 予告(#tel 突進・#ltel 跳躍)に難易度の倍率 #tele_pct(100/80/65 %)を掛ける。値を設定し直すたびに呼ぶ。倍率が無ければ(テスト等)そのまま
execute unless score #tele_pct hook.diff matches 1.. run return 0
scoreboard players operation #tel hook.b2 *= #tele_pct hook.diff
scoreboard players operation #tel hook.b2 /= #100 hook.constant
scoreboard players operation #ltel hook.b2 *= #tele_pct hook.diff
scoreboard players operation #ltel hook.b2 /= #100 hook.constant
