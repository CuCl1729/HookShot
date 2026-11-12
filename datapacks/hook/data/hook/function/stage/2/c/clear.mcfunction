#> hook:stage/2/c/clear
# hook:world で実行。全部の波を片付けた: 入口と炉心の覆いを開ける
fill 674 64 14 678 68 14 minecraft:air
fill 675 66 36 678 69 39 minecraft:air replace minecraft:iron_bars
playsound minecraft:block.iron_door.open block @a 676 67 37 2 0.6
tellraw @a[scores={hook.stage=2}] {text:"覆いが外れた。奥の炉の標的を撃とう。",color:"gray"}
