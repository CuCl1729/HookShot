#> hook:stage/3/lesson_stun
# @s = プレイヤー。稽古のゾンビが初めてスタンした
scoreboard players set #lesson hook.s3 1
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s {text:"スタンチェイン成功。フックを当てた敵は、3秒は動けず殴れもしない。",color:"gray"}
tellraw @s {text:"掴んだまま、もう一度右クリックで島の外へ投げ捨てよう。スニークで放しても、痺れている間は無害。",color:"gray"}
