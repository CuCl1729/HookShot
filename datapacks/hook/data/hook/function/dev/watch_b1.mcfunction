#> hook:dev/watch_b1
# 試験用(schedule から毎 tick、#trap hook.dev tick まで)。ボス1 の状態(#st)と HP が変わった tick をチャットに出す(ログの時刻と見比べて実時間を測る)
scoreboard players remove #trap hook.dev 1
execute if score #trap hook.dev matches ..0 run return run tellraw @a "watch end"
schedule function hook:dev/watch_b1 1t
execute store result score #gt hook.dev run time query gametime
execute unless score #wst hook.dev = #st hook.b1 run tellraw @a ["MCO b1 st ",{score:{name:"#st",objective:"hook.b1"}}," hp ",{score:{name:"#hp",objective:"hook.b1"}}," gt ",{score:{name:"#gt",objective:"hook.dev"}}]
execute unless score #whp hook.dev = #hp hook.b1 run tellraw @a ["MCO b1 HP ",{score:{name:"#hp",objective:"hook.b1"}}," gt ",{score:{name:"#gt",objective:"hook.dev"}}]
scoreboard players operation #wst hook.dev = #st hook.b1
scoreboard players operation #whp hook.dev = #hp hook.b1
