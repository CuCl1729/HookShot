#> hook:stage/2/c/clear
# hook:world で実行。全部の波を片付けた: 入口と炉心の覆いを開ける
fill 674 64 14 678 68 14 minecraft:air
fill 675 66 36 678 69 39 minecraft:air replace minecraft:iron_bars
playsound minecraft:block.iron_door.open block @a 676 67 37 2 0.6
playsound minecraft:ui.toast.challenge_complete master @a[scores={hook.stage=2}] 676 66 27 2 1
particle minecraft:explosion_emitter 676.5 68 37.5 0 0 0 0 1 force @a
particle minecraft:electric_spark 676.5 68 37.5 1.5 1.5 1 0.2 80 force @a
title @a[scores={hook.stage=2}] times 5 40 10
title @a[scores={hook.stage=2}] title {text:"組立場 制圧",color:"gold",bold:true}
title @a[scores={hook.stage=2}] subtitle {text:"覆いが外れた",color:"yellow"}
function hook:fairy/say {text:"やった！ 覆いが外れたよ。奥の炉の標的を撃とう"}
function hook:guide/set {text:"覆いの外れた炉の標的を撃つ",x:677,y:68,z:38}
