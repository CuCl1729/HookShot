#> hook:stage/5/tick
# エンディング(#end hook.b3 = 経過 tick、600 で止まる)。台詞 → クレジット「HookShot」→ 花火
execute if score #end hook.b3 matches ..600 run scoreboard players add #end hook.b3 1
execute if score #end hook.b3 matches 20 run title @a[scores={hook.stage=5}] title {text:"虚の王 撃破",color:"gold"}
execute if score #end hook.b3 matches 20 run title @a[scores={hook.stage=5}] subtitle {text:"玉座に光が戻る",color:"yellow"}
execute if score #end hook.b3 matches 20 in hook:world run playsound minecraft:ui.toast.challenge_complete master @a 1550 64 0 4 1
execute if score #end hook.b3 matches 80 run tellraw @a[scores={hook.stage=5}] [{text:"[師範の声] ",color:"yellow"},{text:"やったな。虚の王は奈落の底へ還った。",color:"white"}]
execute if score #end hook.b3 matches 140 run tellraw @a[scores={hook.stage=5}] [{text:"[師範の声] ",color:"yellow"},{text:"あれは王などではない。玉座を奪い、空の道を砕いた虚ろな影にすぎなかった。",color:"white"}]
execute if score #end hook.b3 matches 200 run tellraw @a[scores={hook.stage=5}] [{text:"[師範の声] ",color:"yellow"},{text:"砕けた道は、いつかまた繋がる。お前のフックが、島と島を繋いだように。",color:"white"}]
execute if score #end hook.b3 matches 260 run tellraw @a[scores={hook.stage=5}] [{text:"[師範の声] ",color:"yellow"},{text:"……もう教えることは何もない。よくぞ、鉤ひとつで戦い抜いた。",color:"white"}]
execute if score #end hook.b3 matches 320 run title @a[scores={hook.stage=5}] title {text:"HookShot",color:"gold",bold:true}
execute if score #end hook.b3 matches 320 run title @a[scores={hook.stage=5}] subtitle {text:"Thanks for playing!",color:"aqua"}
execute if score #end hook.b3 matches 320 run tellraw @a[scores={hook.stage=5}] [{text:"― HookShot ―",color:"gold",bold:true}]
execute if score #end hook.b3 matches 320 run tellraw @a[scores={hook.stage=5}] {text:"フックショットだけで戦い抜いたあなたに、感謝を。",color:"white"}
execute if score #end hook.b3 matches 320 run tellraw @a[scores={hook.stage=5}] {text:"Thanks for playing!",color:"aqua"}
# 300〜540 の間、20 tick ごとに花火
scoreboard players operation #m hook.b3 = #end hook.b3
scoreboard players operation #m hook.b3 %= #20 hook.constant
execute if score #end hook.b3 matches 300..540 if score #m hook.b3 matches 0 run function hook:stage/5/fireworks
execute if score #end hook.b3 matches 580 run tellraw @a[scores={hook.stage=5}] {text:"―― おしまい ――",color:"gray",italic:true}
