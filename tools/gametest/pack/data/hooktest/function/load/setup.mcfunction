# hook:load を再実行し、主要 objective が存在することを確かめる(無いと scoreboard players set が失敗する)
function hook:load
scoreboard players set #probe hook.stage 7
execute if score #probe hook.stage matches 7 run say HOOKTEST load.objective_stage PASS
execute unless score #probe hook.stage matches 7 run say HOOKTEST load.objective_stage FAIL missing objective hook.stage
scoreboard players set #probe hook.ability 7
execute if score #probe hook.ability matches 7 run say HOOKTEST load.objective_ability PASS
execute unless score #probe hook.ability matches 7 run say HOOKTEST load.objective_ability FAIL missing objective hook.ability
scoreboard players set #probe hook.cp 7
execute if score #probe hook.cp matches 7 run say HOOKTEST load.objective_cp PASS
execute unless score #probe hook.cp matches 7 run say HOOKTEST load.objective_cp FAIL missing objective hook.cp
scoreboard players set #probe hook.mv 7
execute if score #probe hook.mv matches 7 run say HOOKTEST load.objective_mv PASS
execute unless score #probe hook.mv matches 7 run say HOOKTEST load.objective_mv FAIL missing objective hook.mv
scoreboard players set #probe hook.score 7
execute if score #probe hook.score matches 7 run say HOOKTEST load.objective_score PASS
execute unless score #probe hook.score matches 7 run say HOOKTEST load.objective_score FAIL missing objective hook.score
scoreboard players set #probe hook.cfg 7
execute if score #probe hook.cfg matches 7 run say HOOKTEST load.objective_cfg PASS
execute unless score #probe hook.cfg matches 7 run say HOOKTEST load.objective_cfg FAIL missing objective hook.cfg
scoreboard players set #probe hook.held 7
execute if score #probe hook.held matches 7 run say HOOKTEST load.objective_held PASS
execute unless score #probe hook.held matches 7 run say HOOKTEST load.objective_held FAIL missing objective hook.held
scoreboard players set #probe hook.b1 7
execute if score #probe hook.b1 matches 7 run say HOOKTEST load.objective_b1 PASS
execute unless score #probe hook.b1 matches 7 run say HOOKTEST load.objective_b1 FAIL missing objective hook.b1
scoreboard players set #probe hook.b3 7
execute if score #probe hook.b3 matches 7 run say HOOKTEST load.objective_b3 PASS
execute unless score #probe hook.b3 matches 7 run say HOOKTEST load.objective_b3 FAIL missing objective hook.b3
scoreboard players set #probe hook.b3d 7
execute if score #probe hook.b3d matches 7 run say HOOKTEST load.objective_b3d PASS
execute unless score #probe hook.b3d matches 7 run say HOOKTEST load.objective_b3d FAIL missing objective hook.b3d
scoreboard players set #probe hook.s1 7
execute if score #probe hook.s1 matches 7 run say HOOKTEST load.objective_s1 PASS
execute unless score #probe hook.s1 matches 7 run say HOOKTEST load.objective_s1 FAIL missing objective hook.s1
scoreboard players set #probe hook.s3 7
execute if score #probe hook.s3 matches 7 run say HOOKTEST load.objective_s3 PASS
execute unless score #probe hook.s3 matches 7 run say HOOKTEST load.objective_s3 FAIL missing objective hook.s3
scoreboard players set #probe hook.constant 7
execute if score #probe hook.constant matches 7 run say HOOKTEST load.objective_constant PASS
execute unless score #probe hook.constant matches 7 run say HOOKTEST load.objective_constant FAIL missing objective hook.constant
scoreboard players set #probe hook.temporary 7
execute if score #probe hook.temporary matches 7 run say HOOKTEST load.objective_temporary PASS
execute unless score #probe hook.temporary matches 7 run say HOOKTEST load.objective_temporary FAIL missing objective hook.temporary
scoreboard players set #probe hook.X0 7
execute if score #probe hook.X0 matches 7 run say HOOKTEST load.objective_X0 PASS
execute unless score #probe hook.X0 matches 7 run say HOOKTEST load.objective_X0 FAIL missing objective hook.X0
scoreboard players set #probe hook.impulse.x 7
execute if score #probe hook.impulse.x matches 7 run say HOOKTEST load.objective_impulse_x PASS
execute unless score #probe hook.impulse.x matches 7 run say HOOKTEST load.objective_impulse_x FAIL missing objective hook.impulse.x
scoreboard players set #probe hook.multiplier 7
execute if score #probe hook.multiplier matches 7 run say HOOKTEST load.objective_multiplier PASS
execute unless score #probe hook.multiplier matches 7 run say HOOKTEST load.objective_multiplier FAIL missing objective hook.multiplier
scoreboard players set #probe hook.dev 7
execute if score #probe hook.dev matches 7 run say HOOKTEST load.objective_dev PASS
execute unless score #probe hook.dev matches 7 run say HOOKTEST load.objective_dev FAIL missing objective hook.dev
execute if score #2 hook.constant matches 2 if score #65536 hook.constant matches 65536 run say HOOKTEST load.constants PASS
execute unless score #2 hook.constant matches 2 run say HOOKTEST load.constants FAIL constants not set
# hook:tick(minecraft:tick タグ)が回っていれば #tick が増える。0 以外になるまで遅らせて確認
schedule function hooktest:load/tick_check 5t
