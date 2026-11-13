#> hook:boss/3/died
# @s = 戦闘中に死んだプレイヤー(もう E の島へ戻っている)。第1形態は最初から(reset → 箱の中にいるので次の tick に再開)、第2形態は第2形態の頭から(ナイトメアは最初から)
scoreboard players set @s hook.b3d 0
execute if score #state hook.b3 matches 1 run return run function hook:boss/3/reset
# ナイトメア: 前室(ステージ最初の cp 40)へ戻されているので、第2形態でも第1形態からやり直し
execute if score #level hook.diff matches 2 run tellraw @a[scores={hook.stage=4}] {text:"虚の王は力を取り戻した……(ナイトメア: 第一形態から)",color:"gray",italic:true}
execute if score #level hook.diff matches 2 run return run function hook:boss/3/reset
execute if score #state hook.b3 matches 3 run function hook:boss/3/retry
