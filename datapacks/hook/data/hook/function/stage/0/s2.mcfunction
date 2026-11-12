#> hook:stage/0/s2
# @s = B の壁の上に乗ったプレイヤー。次は連続フック
scoreboard players set @s hook.tut 2
scoreboard players set #t hook.tut 0
function hook:cp/set {id:1,x:-3.5,y:70,z:0.5,yaw:-90}
execute in hook:world run tp @e[tag=hook.npc] -4.5 70 3.5
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"▶ ",color:"aqua"},{text:"連続フック: 着いた瞬間に次を撃てる。金ブロックを着地せずに渡り、向こうの塔の上へ。",color:"gray"}]
