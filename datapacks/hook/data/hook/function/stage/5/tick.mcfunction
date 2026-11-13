#> hook:stage/5/tick
# エンディング(#end hook.b3 = 経過 tick、880 で止まる)。0〜70 は boss/3/defeat の fx/boss_clear が流れる
# 40 床が光で繋がる → 90 最後の欠片が玉座の上空に(撃つまで待つ。撃つと hook:stage/5/shot で 91 から)→ 91〜 欠片が鉤に引かれて手元へ
# → 116 欠片 3/3 → 200 光に包まれて 220 妖精の村へ → 240 祭壇に太陽石 → 280 夜明け(天井が開く)→ 350 長老 → 420 ルミ
# → 540 タイトル・花火 → 620 戦績 → 720 クレジット(難易度・倒れた回数・光の粒)→ 860 おしまい
execute if score #end hook.b3 matches ..89 run scoreboard players add #end hook.b3 1
execute if score #end hook.b3 matches 90 if score #shot hook.b3 matches 1 run scoreboard players add #end hook.b3 1
execute if score #end hook.b3 matches 91..879 run scoreboard players add #end hook.b3 1
# 床を戻す(崩落した床が光で繋がる。埋まったプレイヤーは C へ)
execute if score #end hook.b3 matches 40 in hook:world run function hook:stage/4/build
execute if score #end hook.b3 matches 40 in hook:world run particle minecraft:end_rod 1550 64 0 17 0.3 15 0.02 400 force @a
execute if score #end hook.b3 matches 40 in hook:world run playsound minecraft:block.amethyst_block.resonate master @a 1550 64 0 4 0.8
execute if score #end hook.b3 matches 40 in hook:world as @a[scores={hook.stage=5}] at @s unless block ~ ~ ~ #hook:pass run function hook:cp/return
execute if score #end hook.b3 matches 40 in hook:world as @a[scores={hook.stage=5}] at @s unless block ~ ~1 ~ #hook:pass run function hook:cp/return
# 最後の欠片
execute if score #end hook.b3 matches 90 if score #stump hook.b3 matches 0 run function hook:stage/5/stump
execute if score #end hook.b3 matches 90 if score #w hook.b3 matches 0 run title @a[scores={hook.stage=5}] times 10 60 20
execute if score #end hook.b3 matches 90 if score #w hook.b3 matches 0 run title @a[scores={hook.stage=5}] subtitle {text:"玉座の上空で、光っている",color:"yellow"}
execute if score #end hook.b3 matches 90 if score #w hook.b3 matches 0 run title @a[scores={hook.stage=5}] title {text:"最後の欠片",color:"gold"}
execute if score #end hook.b3 matches 90 if score #w hook.b3 matches 0 in hook:world run playsound minecraft:ui.toast.challenge_complete master @a 1550 64 0 4 1
execute if score #end hook.b3 matches 90 if score #w hook.b3 matches 0 run function hook:fairy/say {text:"見て、上！ 鉤で撃って、引き寄せて！"}
execute if score #end hook.b3 matches 90 if score #w hook.b3 matches 0 run function hook:guide/set {text:"最後の欠片を鉤で撃て",x:1556.5,y:96.5,z:0.5}
# 撃つまで待つ間: 欠片に光の柱、20 秒ごとにヒント
execute if score #end hook.b3 matches 90 unless score #shot hook.b3 matches 1 in hook:world run particle minecraft:end_rod 1556.5 92 0.5 0.3 4 0.3 0.01 4 force @a
execute if score #end hook.b3 matches 90 unless score #shot hook.b3 matches 1 run scoreboard players add #w hook.b3 1
execute if score #w hook.b3 matches 400 unless score #shot hook.b3 matches 1 run tellraw @a[scores={hook.stage=5}] {text:"上を向いて、光る欠片へ右クリック(玉座の島から届く)。",color:"gray"}
execute if score #w hook.b3 matches 400.. run scoreboard players set #w hook.b3 1
# 欠片が鉤に引かれて手元へ飛んでくる
execute if score #end hook.b3 matches 91..115 in hook:world as @e[type=item_display,tag=hook.s5f] at @s run function hook:stage/5/pull
execute if score #end hook.b3 matches 116 in hook:world run kill @e[type=item_display,tag=hook.s5f]
execute if score #end hook.b3 matches 116 as @a[scores={hook.stage=5}] at @s run particle minecraft:totem_of_undying ~ ~1.2 ~ 0.5 0.8 0.5 0.6 120 force @a
execute if score #end hook.b3 matches 116 run function hook:fx/shard_get {n:3}
# 光に包まれて妖精の村へ
execute if score #end hook.b3 matches 200 run effect give @a[scores={hook.stage=5}] minecraft:blindness 3 0 true
execute if score #end hook.b3 matches 200 run title @a[scores={hook.stage=5}] times 20 40 20
execute if score #end hook.b3 matches 200 run title @a[scores={hook.stage=5}] subtitle {text:"三つの欠片が、きみを妖精の村へ運ぶ",color:"yellow"}
execute if score #end hook.b3 matches 200 run title @a[scores={hook.stage=5}] title {text:"",color:"white"}
execute if score #end hook.b3 matches 200 as @a[scores={hook.stage=5}] at @s run particle minecraft:end_rod ~ ~1 ~ 0.6 1 0.6 0.2 120 force @a
execute if score #end hook.b3 matches 200 as @a[scores={hook.stage=5}] at @s run playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 1 0.8
execute if score #end hook.b3 matches 200 in hook:world run forceload add -96 -16 -49 15
execute if score #end hook.b3 matches 220 run function hook:stage/5/village
# 祭壇に太陽石
execute if score #end hook.b3 matches 240 run function hook:stage/5/altar
# 夜明け
execute if score #end hook.b3 matches 280 run function hook:stage/5/dawn
execute if score #end hook.b3 matches 280..400 in hook:world run particle minecraft:end_rod -80 80 0 12 4 7 0.02 6 force @a
execute if score #end hook.b3 matches 350 run tellraw @a[scores={hook.stage=5}] {text:"§e長老§f「予言は当たった。……いや、おぬしが当てたのじゃ」"}
execute if score #end hook.b3 matches 350 in hook:world run particle minecraft:happy_villager -83.5 64.5 3.5 0.4 0.8 0.4 0 12 force @a
execute if score #end hook.b3 matches 420 run function hook:fairy/say {text:"ただの村人、だったのにね。……また遊びに来てよ"}
execute if score #end hook.b3 matches 470 if score #lore hook.score matches 9.. run function hook:fairy/say {text:"粒まで全部！ ……几帳面だね"}
# タイトル・戦績・クレジット
execute if score #end hook.b3 matches 540 run title @a[scores={hook.stage=5}] times 20 80 20
execute if score #end hook.b3 matches 540 run title @a[scores={hook.stage=5}] subtitle {text:"Thanks for playing!",color:"aqua"}
execute if score #end hook.b3 matches 540 run title @a[scores={hook.stage=5}] title {text:"HookShot",color:"gold",bold:true}
execute if score #end hook.b3 matches 540 as @a[scores={hook.stage=5}] at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
execute if score #end hook.b3 matches 620 run function hook:stage/5/results
execute if score #end hook.b3 matches 720 run function hook:fx/credits
# 540〜800 の間、20 tick ごとに村の上で花火
scoreboard players operation #m hook.b3 = #end hook.b3
scoreboard players operation #m hook.b3 %= #20 hook.constant
execute if score #end hook.b3 matches 540..800 if score #m hook.b3 matches 0 run function hook:stage/5/fireworks
execute if score #end hook.b3 matches 860 run tellraw @a[scores={hook.stage=5}] {text:"―― おしまい ――",color:"gray",italic:true}
