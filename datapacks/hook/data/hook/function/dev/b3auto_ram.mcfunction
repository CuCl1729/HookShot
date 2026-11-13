#> hook:dev/b3auto_ram
# 試験用(dev/b3auto から、王が怯んでいる間)。近いトゲの島の反対側 12 マスへ回り込み(tp = 歩く代わり)、2 tick 後に王へ撃つ(着くと能力1で突き飛ばす)
scoreboard players set #cool hook.dev 40
tellraw @a "b3auto ram"
execute in hook:world at @e[tag=hook.boss3,x=1500,y=0,z=-30,dx=50,dy=128,dz=60] facing 1528.5 64 -9.5 positioned ^ ^ ^-12 run tp @a[limit=1] ~ 64 ~
execute in hook:world at @e[tag=hook.boss3,x=1550,y=0,z=-30,dx=50,dy=128,dz=60] facing 1572.5 64 10.5 positioned ^ ^ ^-12 run tp @a[limit=1] ~ 64 ~
schedule function hook:dev/throw_s 2t
