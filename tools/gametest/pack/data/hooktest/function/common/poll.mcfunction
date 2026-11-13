execute if score #rdyi hook.temporary matches 1 run return 0
scoreboard players add #wi hook.temporary 1
execute unless data storage hook: built{intro:1b} run function hook:intro/build
execute if data storage hook: built{intro:1b} run function hooktest:common/intro
execute if score #wi hook.temporary matches 1500.. if score #rdyi hook.temporary matches 0 run say HOOKTEST common.intro_built FAIL intro/build never finished (chunks not loaded)
execute if score #wi hook.temporary matches ..1499 if score #rdyi hook.temporary matches 0 run schedule function hooktest:common/poll 1t
