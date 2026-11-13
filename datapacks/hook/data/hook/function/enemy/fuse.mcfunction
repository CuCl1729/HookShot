#> hook:enemy/fuse
# @s = 爆弾兵(掴まれていない・投げられていない、実行位置も @s)。バニラのクリーパーと同じく、プレイヤーが 3 以内に来たら導火線に火が付き、
# 7 以内にいる間は燃え続け、#fuse_t tick で自爆する(hook:enemy/kill = 半径 4 の敵を倒し撃破に数える)。7 より離れると消える。hook.fuse = 燃えた tick
execute unless entity @a[distance=..7,gamemode=!spectator] run return run scoreboard players set @s hook.fuse 0
execute unless score @s hook.fuse matches 1.. unless entity @a[distance=..3,gamemode=!spectator] run return 0
scoreboard players add @s hook.fuse 1
execute if score @s hook.fuse matches 1 run playsound minecraft:entity.creeper.primed hostile @a ~ ~ ~ 1 1
particle minecraft:smoke ~ ~1.6 ~ 0.15 0.2 0.15 0.01 2 force @a
execute if score @s hook.fuse < #fuse_t hook.cfg run return 0
# 自爆: 近くのプレイヤーには傷(地形は壊さない)、敵は enemy/kill の爆発で倒れる
execute as @a[distance=..3,gamemode=!spectator] run damage @s 8 minecraft:explosion
tag @s add hook.selfboom
function hook:enemy/kill
