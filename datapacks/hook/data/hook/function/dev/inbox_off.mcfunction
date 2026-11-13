#> hook:dev/inbox_off
# 開発用 inbox を止める(hook:core/reset からも呼ぶ)。0 の間は reload ループも inbox も走らない
scoreboard objectives add hook.dev dummy
scoreboard players set #inbox hook.dev 0
scoreboard players set #hold hook.dev 0
schedule clear hook:dev/inbox_end
