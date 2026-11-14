function hook:gimmick/press/tick
execute as @e[type=marker,tag=hook.press,scores={hook.s2=1..}] at @s run function hook:stage/2/a/fuse
scoreboard players add #t hook.temporary 1
execute if score #t hook.temporary matches 35 if score @n[tag=hooktest.press_fuse] hook.mv matches 1.. run say HOOKTEST gimmick.press_fuse_pre FAIL mv still set before the fuse ran out
execute if score #t hook.temporary matches 35 unless score @n[tag=hooktest.press_fuse] hook.mv matches 1.. if entity @e[type=marker,tag=hook.press,x=3050,y=60,z=2990,dx=1,dy=20,dz=20,scores={hook.press=0,hook.s2=1..}] run say HOOKTEST gimmick.press_fuse_pre PASS
execute if score #t hook.temporary matches 35 unless score @n[tag=hooktest.press_fuse] hook.mv matches 1.. unless entity @e[type=marker,tag=hook.press,x=3050,y=60,z=2990,dx=1,dy=20,dz=20,scores={hook.press=0,hook.s2=1..}] run say HOOKTEST gimmick.press_fuse_pre FAIL fuse not burning or press already dropped
execute if score #t hook.temporary matches 65 if score @n[tag=hooktest.press_stale] hook.mv matches 1.. run say HOOKTEST gimmick.press_stale_pre FAIL mv still set 65 ticks after being moved
execute if score #t hook.temporary matches 65 unless score @n[tag=hooktest.press_stale] hook.mv matches 1.. run say HOOKTEST gimmick.press_stale_pre PASS
execute if score #t hook.temporary matches 65 positioned 3062.5 71.5 2997.5 as @e[type=marker,tag=hook.switch,distance=..0.5] at @s run function hook:gimmick/press/drop
execute if score #t hook.temporary matches ..99 run schedule function hooktest:gimmick/loop 1t
execute if score #t hook.temporary matches 100.. run function hooktest:gimmick/judge
