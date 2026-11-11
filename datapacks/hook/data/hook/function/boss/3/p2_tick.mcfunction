#> hook:boss/3/p2_tick
# 第2形態の毎 tick: 7秒ごとに離れたプレイヤーの足元へ渡る(島を越えて来るので、トゲ・プレスの島へ呼び込める)、15秒ごとに雑魚を補充
scoreboard players add #warp hook.b3 1
scoreboard players add #spawn hook.b3 1
execute if score #warp hook.b3 matches 140.. run function hook:boss/3/warp_try
execute if score #spawn hook.b3 matches 300.. run function hook:boss/3/spawn
execute at @e[tag=hook.boss3] run particle minecraft:reverse_portal ~ ~2 ~ 0.6 1 0.6 0 3 force @a
