#> hook:boss/3/fade
# @s = 呼ばれて 40 秒たった手下(掴み・引き寄せ・投げの最中ではない)。虚へ還る(撃破には数えない)。0 体になれば王がまた呼ぶので弾は尽きない
particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.6 0.3 0.3 40 force @a
particle minecraft:large_smoke ~ ~0.8 ~ 0.3 0.5 0.3 0.02 10 force @a
playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 1 0.6
kill @s
