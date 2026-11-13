function hook:gimmick/press/tick
scoreboard players add #t hook.temporary 1
execute if score #t hook.temporary matches ..25 run schedule function hooktest:gimmick/loop 1t
execute if score #t hook.temporary matches 26.. run function hooktest:gimmick/judge
