#> hook:boss/3/died
# @s = 戦闘中に死んだプレイヤー(もう E の島へ戻っている)。第1形態は最初から(reset → 箱の中にいるので次の tick に再開)、第2形態は第2形態の頭から
scoreboard players set @s hook.b3d 0
execute if score #state hook.b3 matches 1 run return run function hook:boss/3/reset
execute if score #state hook.b3 matches 3 run function hook:boss/3/retry
