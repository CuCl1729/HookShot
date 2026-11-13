#> hook:stage/5/village
# エンディングの舞台を妖精の村(導入の部屋)へ移す。部屋が無ければ建てる(intro/build は冪等。core/reset で元どおり建て直される)
execute unless data storage hook: built{intro:1b} run function hook:intro/build
# 難易度の標的は撃てないように(core/reset → intro/build で戻る)
execute in hook:world run kill @e[type=marker,tag=hook.switch,tag=hook.intro]
execute as @a[scores={hook.stage=5}] run function hook:hook/release
execute in hook:world run tp @a[scores={hook.stage=5}] -85.5 63 0.5 90 0
execute as @a[scores={hook.stage=5}] run tag @s add hook.cp_quiet
execute as @a[scores={hook.stage=5}] run function hook:cp/set {id:51,x:-85.5,y:63,z:0.5,yaw:90}
tag @a remove hook.cp_quiet
function hook:guide/clear
execute as @a[scores={hook.stage=5}] at @s run playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 0.8
execute in hook:world run particle minecraft:end_rod -85.5 64 0.5 0.6 1 0.6 0.1 80 force @a
