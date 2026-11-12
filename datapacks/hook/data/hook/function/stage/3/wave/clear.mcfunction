#> hook:stage/3/wave/clear
# in hook:world。今の波が全滅した
scoreboard players set #ws hook.s3 0
scoreboard players add #wave hook.s3 1
scoreboard players set #wt hook.s3 60
execute if score #wave hook.s3 matches 4 run function hook:stage/3/wave/open
