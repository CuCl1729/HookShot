#> hook:cp/set
# @s = プレイヤー。@macro id/x/y/z/yaw: チェックポイント(hook:world 内)。リスポーン地点も合わせる
# ステージが変わって最初の cp は storage hook: cp0 に控える(ナイトメアで死ぬとここへ戻る。hook.cps = 控えたときの hook.stage)
# 2つ目以降で番号が変わったら小演出(hook:fx/cp。tag hook.cp_quiet の間は出さない)
$execute unless score @s hook.cps = @s hook.stage run data modify storage hook: cp0 set value {id:$(id),x:$(x),y:$(y),z:$(z),yaw:$(yaw)}
$execute if score @s hook.cps = @s hook.stage unless entity @s[tag=hook.cp_quiet] unless score @s hook.cp matches $(id) run function hook:fx/cp
scoreboard players operation @s hook.cps = @s hook.stage
$data modify storage hook: cp set value {x:$(x),y:$(y),z:$(z),yaw:$(yaw)}
$scoreboard players set @s hook.cp $(id)
$execute in hook:world positioned $(x) $(y) $(z) run function hook:core/call {f:"hook:guess/spawnpoint"}
