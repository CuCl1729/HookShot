#> hook:boss/1/rain_mark
# @s = プレイヤー(実行位置・水平の向きも)。落ちる所に目印 hook.b1rain(床の高さ)
summon marker ~ 71 ~ {Tags:["hook.b1rain","hook.s1"]}
execute positioned ^ ^ ^5 run summon marker ~ 71 ~ {Tags:["hook.b1rain","hook.s1"]}
execute positioned ^5 ^ ^ run summon marker ~ 71 ~ {Tags:["hook.b1rain","hook.s1"]}
execute if score #ph hook.b1 matches 2 positioned ^-5 ^ ^ run summon marker ~ 71 ~ {Tags:["hook.b1rain","hook.s1"]}
execute if score #ph hook.b1 matches 2 positioned ^ ^ ^-5 run summon marker ~ 71 ~ {Tags:["hook.b1rain","hook.s1"]}
