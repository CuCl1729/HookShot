#> hook:stage/5/fireworks
# 花火ひと組。パーティクルと音は確実に出し、本物の花火は別ファイル(壊れていても止まらない)
execute in hook:world run particle minecraft:firework -80 84 0 8 2 5 0.05 120 force @a
execute in hook:world run particle minecraft:end_rod -80 84 0 8 2 5 0.02 40 force @a
execute in hook:world run playsound minecraft:entity.firework_rocket.large_blast ambient @a -80 80 0 4 1
execute in hook:world run playsound minecraft:entity.firework_rocket.twinkle ambient @a -80 80 0 4 1
function hook:core/call {f:"hook:stage/5/rockets"}
