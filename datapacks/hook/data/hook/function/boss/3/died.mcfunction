#> hook:boss/3/died
# @s = 戦闘中に死んだプレイヤー(もうチェックポイントへ戻っている)。第1形態は前室へ戻るので tick がやり直す
scoreboard players set @s hook.b3d 0
execute if score #state hook.b3 matches 3 run function hook:boss/3/retry
