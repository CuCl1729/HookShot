#> hook:intro/tick
# 導入の進行(core の tick が hook.stage -1 のプレイヤーがいる間呼ぶ)。#t hook.intro = 経過 tick(400 で止まる)
# 建つまでは部屋の位置に留める
execute unless data storage hook: built{intro:1b} run return run execute as @a[scores={hook.stage=-1}] run function hook:cp/return
execute if score #t hook.intro matches ..399 run scoreboard players add #t hook.intro 1
# スニークで語りを飛ばす(渡す物は 399 でまとめて渡す)
execute if score #t hook.intro matches 25..398 if entity @a[scores={hook.stage=-1},tag=hook.sneak_new] run scoreboard players set #t hook.intro 399
execute if score #t hook.intro matches 10 run title @a[scores={hook.stage=-1}] times 30 80 30
execute if score #t hook.intro matches 10 run title @a[scores={hook.stage=-1}] subtitle {text:"闇に沈んだ世界の、妖精の村",color:"gray"}
execute if score #t hook.intro matches 10 run title @a[scores={hook.stage=-1}] title {text:"HookShot",color:"gold",bold:true}
execute if score #t hook.intro matches 10 as @a[scores={hook.stage=-1}] at @s run playsound minecraft:block.amethyst_block.resonate master @s ~ ~ ~ 1 0.5
execute if score #t hook.intro matches 25 run tellraw @a[scores={hook.stage=-1}] {text:"(スニークで語りを飛ばせる)",color:"dark_gray",italic:true}
execute if score #t hook.intro matches 40 run tellraw @a[scores={hook.stage=-1}] {text:"太陽石が奪われ、世界は闇に包まれた。",color:"gray",italic:true}
execute if score #t hook.intro matches 100 run tellraw @a[scores={hook.stage=-1}] {text:"石を守ってきた妖精たちは、闇の中では遠くへ飛べない。",color:"gray",italic:true}
execute if score #t hook.intro matches 160 run tellraw @a[scores={hook.stage=-1}] {text:"長老の予言が、ひとりの村人を選んだ。——きみだ。",color:"gray",italic:true}
execute if score #t hook.intro matches 230 run tellraw @a[scores={hook.stage=-1}] {text:"§e長老§f「よう来た、人の子。おぬしはただの村人じゃ。剣も振れまい。……じゃから、これを授ける」"}
execute if score #t hook.intro matches 260 as @a[scores={hook.stage=-1}] run function hook:intro/grant_hook
execute if score #t hook.intro matches 310 as @a[scores={hook.stage=-1},tag=!hook.lumi] run function hook:fairy/on
execute if score #t hook.intro matches 312 run function hook:fairy/say {text:"わたしはルミ！ 欠片の場所なら分かるよ。一緒に行こう"}
execute if score #t hook.intro matches 360 as @a[scores={hook.stage=-1}] run function hook:player/give_bell
execute if score #t hook.intro matches 360 run function hook:fairy/say {text:"これはわたしの鈴。迷ったら鳴らして(9番を持って右クリック)。行き先を教えるよ"}
# 399: 飛ばしたときも含め、渡す物をそろえる(何度でも同じになる)
execute if score #t hook.intro matches 399 as @a[scores={hook.stage=-1}] unless entity @s[tag=hook.lumi] run function hook:intro/grant_hook
execute if score #t hook.intro matches 399 as @a[scores={hook.stage=-1},tag=!hook.lumi] run function hook:fairy/on
execute if score #t hook.intro matches 399 as @a[scores={hook.stage=-1}] run function hook:player/give_bell
execute if score #t hook.intro matches 399 run tellraw @a[scores={hook.stage=-1}] {text:"§e長老§f「旅の重さを選ぶがよい」"}
execute if score #t hook.intro matches 399 run tellraw @a[scores={hook.stage=-1}] {text:"壁の三つの標的のどれかを、鉤で撃とう(1番を持って右クリック)。選び直してもよい",color:"gray"}
execute if score #t hook.intro matches 399 run function hook:guide/set {text:"標的を撃って難易度を選ぶ",x:-79.5,y:66.5,z:-7.5}
# 選んだあと: 扉をくぐると訓練場へ
execute if score #chosen hook.diff matches 1 in hook:world as @a[scores={hook.stage=-1},x=-67,y=60,z=-3,dx=6,dy=8,dz=6] run function hook:intro/finish
