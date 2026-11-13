#> hook:player/join
# @s = 初めて来たプレイヤー。導入(妖精の村、hook:intro/start)へ送る(判定は tick の hook.joined 未設定。別アカウントでは level.dat のタグ・所持品・効果が残っていることがあるので消す)
tag @s remove hook.pulling
tag @s remove hook.grabbed_heavy
tag @s remove hook.yanked
tag @s remove hook.near
tag @s remove hook.attract
tag @s remove hook.hit
tag @s remove hook.impacted
tag @s remove hook.stun
tag @s remove hook.owner
tag @s remove hook.floating
tag @s remove hook.arrive
tag @s remove hook.rec
tag @s remove hook.dev_float
effect clear @s
clear @s
scoreboard players set @s hook.joined 1
scoreboard players set @s hook.stage 0
scoreboard players set @s hook.ability 0
scoreboard players set @s hook.cd 0
scoreboard players set @s hook.death 0
function hook:core/call {f:"hook:guess/adventure"}
attribute @s minecraft:entity_interaction_range base set 0
tag @s remove hook.lumi
tag @s remove hook.cp_quiet
scoreboard players reset @s hook.cps
scoreboard players set @s hook.ask 0
function hook:diff/player
# 鉤・鈴は導入で長老とルミから渡す(hook:intro/tick)
function hook:intro/start
