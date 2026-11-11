#> hook:stage/0/step3
# @s = ゾンビを倒したプレイヤー。浮島に重装兵を出す
scoreboard players set @s hook.tut 3
function hook:cp/set {id:2,x:38.5,y:64,z:0.5,yaw:-90}
function hook:stage/0/summon_heavy
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 1
tellraw @s [{text:"[師範] ",color:"yellow"},{text:"よし。最後だ。浮島に重装兵がいる。重い敵にフックを当てると、お前の方が引き寄せられる。台の端から飛び移れ。",color:"white"}]
