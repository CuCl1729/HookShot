#> hook:cp/set
# @s = プレイヤー。@macro id/x/y/z/yaw: チェックポイント(hook:world 内)。リスポーン地点も合わせる
$data modify storage hook: cp set value {x:$(x),y:$(y),z:$(z),yaw:$(yaw)}
$scoreboard players set @s hook.cp $(id)
$execute in hook:world positioned $(x) $(y) $(z) run function hook:core/call {f:"hook:guess/spawnpoint"}
