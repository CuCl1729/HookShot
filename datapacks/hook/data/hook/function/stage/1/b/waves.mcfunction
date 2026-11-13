#> hook:stage/1/b/waves
# 広間の波(#bw 1〜3。in hook:world)。全滅から 2 秒で次の波。誰も広間にいなければ最初に戻す(格子の外から入り直せるように)
execute unless entity @a[scores={hook.stage=1},x=212,y=70,z=29,dx=36,dy=22,dz=32] run return run function hook:stage/1/b/reset
# 第3波で重装兵だけが残ったら、爆弾兵を 5 秒ごとに1体だけ足す(重装兵は爆発かトゲでしか倒れない。詰み防止・溜まらない)
# 出す所は奥(入口 = 復帰地点 z 31.5 のそばだと、戻った直後に自爆されて倒れた。実機)
execute if score #bw hook.s1 matches 3 if score #tick hook.temporary matches 0 if entity @e[tag=hook.s1b,tag=hook.heavy] unless entity @e[tag=hook.s1b,tag=!hook.heavy] run function hook:stage/1/spawn {k:"bomber",x:230.5,y:71,z:58.5,t:"hook.s1b"}
execute if entity @e[tag=hook.s1b] run return run scoreboard players set #bt hook.s1 0
scoreboard players add #bt hook.s1 1
execute if score #bt hook.s1 matches ..39 run return 0
scoreboard players set #bt hook.s1 0
scoreboard players add #bw hook.s1 1
execute if score #bw hook.s1 matches 2 run return run function hook:stage/1/b/w2
execute if score #bw hook.s1 matches 3 run return run function hook:stage/1/b/w3
function hook:stage/1/b/clear
