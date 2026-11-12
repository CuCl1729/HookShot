#> hook:stage/5/tick
# エンディング(#end hook.b3 = 経過 tick、640 で止まる)。最後の欠片が光る(20)→ 60 で待つ(プレイヤーが鉤で撃つまで。撃つと hook:stage/5/shot)
# → 三つ揃う → 夜明け(80〜)→ 師範の一言 → 戦績・光の粒の数 → タイトル・花火・クレジット
execute if score #end hook.b3 matches ..59 run scoreboard players add #end hook.b3 1
execute if score #end hook.b3 matches 60 if score #shot hook.b3 matches 1 run scoreboard players add #end hook.b3 1
execute if score #end hook.b3 matches 61..640 run scoreboard players add #end hook.b3 1
execute if score #end hook.b3 matches 20 run title @a[scores={hook.stage=5}] times 10 60 20
execute if score #end hook.b3 matches 20 run title @a[scores={hook.stage=5}] title {text:"最後の欠片",color:"gold"}
execute if score #end hook.b3 matches 20 run title @a[scores={hook.stage=5}] subtitle {text:"玉座の上空で、光っている",color:"yellow"}
execute if score #end hook.b3 matches 20 in hook:world run playsound minecraft:ui.toast.challenge_complete master @a 1550 64 0 4 1
execute if score #end hook.b3 matches 20 run function hook:stage/5/stump
# 撃つまで待つ間: 欠片に光の柱を立て、20 秒ごとにヒントを出す
execute if score #end hook.b3 matches 25..60 unless score #shot hook.b3 matches 1 in hook:world run particle minecraft:end_rod 1556.5 92 0.5 0.3 4 0.3 0.01 4 force @a
execute if score #end hook.b3 matches 60 unless score #shot hook.b3 matches 1 run scoreboard players add #w hook.b3 1
execute if score #w hook.b3 matches 1 unless score #shot hook.b3 matches 1 run tellraw @a[scores={hook.stage=5}] {text:"空で光る欠片を、フックで撃とう。",color:"gray"}
execute if score #w hook.b3 matches 400 run tellraw @a[scores={hook.stage=5}] {text:"上を向いて、光る欠片へ右クリック。",color:"gray"}
execute if score #w hook.b3 matches 400.. run scoreboard players set #w hook.b3 1
# 夜明け(shot で #end 61 から)
execute if score #end hook.b3 matches 125 run function hook:stage/5/dawn
execute if score #end hook.b3 matches 160 run tellraw @a[scores={hook.stage=5}] {text:"§e師範§f「よう取り戻した。……鉤は武器じゃない、と言うたじゃろ」"}
execute if score #end hook.b3 matches 230 run function hook:stage/5/results
execute if score #end hook.b3 matches 330 run tellraw @a[scores={hook.stage=5}] [{text:"集めた光の粒  ",color:"gray"},{score:{name:"#lore",objective:"hook.score"},color:"yellow",bold:true},{text:" / 9",color:"gray"}]
execute if score #end hook.b3 matches 360 if score #lore hook.score matches 9.. run tellraw @a[scores={hook.stage=5}] {text:"§e師範§f「粒まで全部拾うてきたか。几帳面じゃの」"}
execute if score #end hook.b3 matches 430 run title @a[scores={hook.stage=5}] times 10 80 20
execute if score #end hook.b3 matches 430 run title @a[scores={hook.stage=5}] title {text:"HookShot",color:"gold",bold:true}
execute if score #end hook.b3 matches 430 run title @a[scores={hook.stage=5}] subtitle {text:"Thanks for playing!",color:"aqua"}
execute if score #end hook.b3 matches 450 run tellraw @a[scores={hook.stage=5}] {text:"―― クレジット ――",color:"gold",bold:true}
execute if score #end hook.b3 matches 470 run tellraw @a[scores={hook.stage=5}] [{text:"ゲームデザイン・ステージ・プログラム  ",color:"gray"},{text:"HookShot 制作陣",color:"white"}]
execute if score #end hook.b3 matches 490 run tellraw @a[scores={hook.stage=5}] [{text:"フックの手触りの参考  ",color:"gray"},{text:"ちゅずめ氏「Re:フックショット」",color:"white"}]
execute if score #end hook.b3 matches 510 run tellraw @a[scores={hook.stage=5}] [{text:"動作環境  ",color:"gray"},{text:"Minecraft 26.3 データパック",color:"white"}]
execute if score #end hook.b3 matches 540 run tellraw @a[scores={hook.stage=5}] [{text:"そして、鉤ひとつで太陽石を取り戻した ",color:"gray"},{text:"あなた",color:"gold",bold:true}]
execute if score #end hook.b3 matches 560 run tellraw @a[scores={hook.stage=5}] {text:"フックショットだけで戦い抜いたあなたに、感謝を。 Thanks for playing!",color:"aqua"}
# 410〜610 の間、20 tick ごとに花火
scoreboard players operation #m hook.b3 = #end hook.b3
scoreboard players operation #m hook.b3 %= #20 hook.constant
execute if score #end hook.b3 matches 410..610 if score #m hook.b3 matches 0 run function hook:stage/5/fireworks
execute if score #end hook.b3 matches 630 run tellraw @a[scores={hook.stage=5}] {text:"―― おしまい ――",color:"gray",italic:true}
