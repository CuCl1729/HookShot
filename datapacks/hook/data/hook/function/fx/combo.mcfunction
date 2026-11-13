#> hook:fx/combo
# コンボ 2 以上(score/combo から自動)。数が増えるほど派手に。プレイヤーの周り
execute as @a at @s run particle minecraft:wax_on ~ ~1 ~ 0.6 0.8 0.6 0.5 15 force @s
execute if score #combo hook.score matches 3.. as @a at @s run particle minecraft:firework ~ ~1.5 ~ 0.5 0.5 0.5 0.15 30 force @s
execute if score #combo hook.score matches 5.. as @a at @s run particle minecraft:totem_of_undying ~ ~1 ~ 0.5 1 0.5 0.6 60 force @s
execute if score #combo hook.score matches 5.. as @a at @s run playsound minecraft:entity.firework_rocket.blast master @s ~ ~ ~ 0.8 1.2
