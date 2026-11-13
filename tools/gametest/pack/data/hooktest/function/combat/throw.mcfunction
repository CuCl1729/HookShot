# 実行位置に敵を出し、掴まれていることにして +x へ投げる
$function hook:enemy/summon/$(kind)
$tag @e[tag=hook.new] add $(tag)
tag @e[tag=hook.new] add hook.grabbed
tag @e[tag=hook.new] remove hook.new
execute rotated -90 0 run function hook:combat/throw
