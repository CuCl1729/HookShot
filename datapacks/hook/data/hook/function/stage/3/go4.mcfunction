#> hook:stage/3/go4
scoreboard players set #end hook.s3 0
execute as @a[scores={hook.stage=3}] run function hook:stage/4/start
execute in hook:world run forceload remove 1000 -48 1300 47
