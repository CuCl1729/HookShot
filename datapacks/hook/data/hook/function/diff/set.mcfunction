#> hook:diff/set
# @macro level: 0 ノーマル / 1 ハード / 2 ナイトメア。誰が呼んでもよい(導入の標的は marker として呼ぶ)。選び直し可
$scoreboard players set #level hook.diff $(level)
scoreboard players set #chosen hook.diff 1
function hook:diff/apply
# 下げたときに体力を戻す(上げたときは max_health が下がって自動で切り詰められる)
execute as @a run effect give @s minecraft:instant_health 1 4 true
function hook:diff/announce with storage hook: diff
