#> hook:dev/push
# @s = プレイヤー。@macro x/y/z = 足す速度(×100)。impulse の効き方を測る
$scoreboard players set #motion hook.X0 $(x)
$scoreboard players set #motion hook.Y0 $(y)
$scoreboard players set #motion hook.Z0 $(z)
function hook:dev/rec_start
scoreboard players set #rec_dbg hook.temporary 5
function hook:motion/player/push
