#> hook:guide/clear
# 目的を消してサイドバーを隠す(core/reset・導入の最初。エンディングでも呼んでよい)
data remove storage hook: guide
scoreboard players reset * hook.guide
scoreboard objectives setdisplay sidebar
