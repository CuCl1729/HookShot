#> hook:lore/pick
# @s = 拾われる光の粒(表示エンティティ、tag hook.lore。実行位置も @s)。各ステージの tick が近接を見て呼ぶ。数えて「光の粒 n/9」を出し、自分を消す
scoreboard players add #lore hook.score 1
particle minecraft:end_rod ~ ~0.3 ~ 0.3 0.3 0.3 0.05 20 force @a
playsound minecraft:block.amethyst_block.chime master @a ~ ~ ~ 1 1.6
playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 0.8 1.4
tellraw @a [{text:"光の粒 ",color:"yellow"},{score:{name:"#lore",objective:"hook.score"},color:"white"},{text:"/9",color:"white"}]
kill @s
