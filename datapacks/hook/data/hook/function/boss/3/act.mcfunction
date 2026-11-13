#> hook:boss/3/act
# hook:world。怯んでいない間の毎 tick: 待機を数えて行動を選び、行動を進める。
# 行動(#act): 1 虚の波 / 2 虚の突撃(第1形態) / 3 手下を呼ぶ / 4 虚渡り(第2形態) / 5 虚の雨(第2形態)。どれも 30 tick(1.5 秒)予告してから撃つ
execute if score #act hook.b3 matches 0 run return run function hook:boss/3/idle
scoreboard players add #t hook.b3 1
# 難易度で予告を縮める(#skip = 30 − 予告。boss/3/start が #tele_pct から出す)。1 tick 目の準備は済んでいる
execute if score #t hook.b3 matches 2 run scoreboard players operation #t hook.b3 += #skip hook.b3
execute if score #act hook.b3 matches 1 run return run function hook:boss/3/a_ring
execute if score #act hook.b3 matches 2 run return run function hook:boss/3/a_dash
execute if score #act hook.b3 matches 3 run return run function hook:boss/3/a_call
execute if score #act hook.b3 matches 4 run return run function hook:boss/3/a_warp
execute if score #act hook.b3 matches 5 run return run function hook:boss/3/a_rain
function hook:boss/3/rest
