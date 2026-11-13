#> hook:stage/3/arrive/n
# @s = 北の島 N に着いたプレイヤー(疾風の環を渡り切った)
scoreboard players set #nisl hook.s3 1
function hook:stage/3/cp {id:32,x:1024.5,y:109,z:-40.5,yaw:90}
scoreboard players set #ta hook.s3 0
execute in hook:world run function hook:stage/3/ta/clear
function hook:guide/set {text:"鐘の上の標的を撃つ",x:1019.5,y:109,z:-41.5}
title @s actionbar {text:"渡り切った!",color:"aqua"}
tellraw @s {text:"鐘の上の標的を撃つと、風の鐘が鳴る。標的は鐘の南側から見える。",color:"gray"}
