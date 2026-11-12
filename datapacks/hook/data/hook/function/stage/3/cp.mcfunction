#> hook:stage/3/cp
# @s = プレイヤー。@macro id/x/y/z/yaw: hook:cp/set と同じだがテレポートしない(着地の勢いを殺さないため)
$data modify storage hook: cp set value {x:$(x),y:$(y),z:$(z),yaw:$(yaw)}
$scoreboard players set @s hook.cp $(id)
$execute in hook:world positioned $(x) $(y) $(z) run function hook:core/call {f:"hook:guess/spawnpoint"}
