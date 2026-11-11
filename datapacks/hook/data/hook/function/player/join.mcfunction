#> hook:player/join
# @s = 初めて来たプレイヤー(判定は tick の hook.joined 未設定。別アカウントでは level.dat のタグ・所持品・効果が残っていることがあるので消す)
tag @s remove hook.pulling
tag @s remove hook.grabbed_heavy
tag @s remove hook.yanked
tag @s remove hook.near
tag @s remove hook.attract
tag @s remove hook.hit
tag @s remove hook.impacted
tag @s remove hook.stun
effect clear @s
clear @s
scoreboard players set @s hook.joined 1
scoreboard players set @s hook.stage 0
scoreboard players set @s hook.ability 0
scoreboard players set @s hook.cd 0
scoreboard players set @s hook.death 0
function hook:core/call {f:"hook:guess/adventure"}
attribute @s minecraft:entity_interaction_range base set 0
function hook:player/give_hook
function hook:stage/0/start
