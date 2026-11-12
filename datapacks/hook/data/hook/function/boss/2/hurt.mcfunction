#> hook:boss/2/hurt
# @s = 番人(実行位置も)。damage は構文の実例が無いので hook:core/call 経由で呼ぶ(壊れていても呼び出し側は動く)
damage @p[scores={hook.stage=2},distance=..2.6] 6 minecraft:mob_attack by @s
