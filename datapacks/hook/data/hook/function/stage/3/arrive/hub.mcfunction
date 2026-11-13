#> hook:stage/3/arrive/hub
# @s = 初めて風の広場に降りたプレイヤー
scoreboard players set #hub hook.s3 1
function hook:stage/3/cp {id:31,x:1068.5,y:70,z:0.5,yaw:-90}
execute in hook:world positioned 1088.5 70 -6.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.s3
execute in hook:world positioned 1088.5 70 6.5 run function hook:enemy/summon/bomber
tag @e[tag=hook.new] add hook.s3
title @s times 10 50 15
title @s title {text:"風の広場",color:"aqua"}
title @s subtitle {text:"三つの風の鐘を、好きな順に",color:"gray"}
tellraw @s {text:"三つの風の鐘を鳴らすと、東の門の島へ虹の橋が架かる。",color:"gray"}
tellraw @s {text:"北西は標的で出る疾風の環、北東は金の錨の塔、南東は崩れる白い雲。",color:"gray"}
function hook:stage/3/bell/guide
function hook:fairy/say {text:"鐘は三つ。どれから行くかは好きにしていいよ。迷ったら鈴を鳴らしてね"}
tellraw @s {text:"まずは足元の二体。掴んで奈落へ。爆弾兵は近づかせない。",color:"gray"}
