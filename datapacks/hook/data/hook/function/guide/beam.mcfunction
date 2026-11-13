#> hook:guide/beam
# @s = プレイヤー(実行位置も)。hook.ask の間(60 tick)、目から目的地へ光の筋を描き、目的地に光の柱を立てる(自分にだけ見える)
scoreboard players remove @s hook.ask 1
scoreboard players operation #m hook.temporary = @s hook.ask
scoreboard players operation #m hook.temporary %= #3 hook.constant
execute if score #m hook.temporary matches 0 run function hook:guide/beam_at with storage hook: guide
