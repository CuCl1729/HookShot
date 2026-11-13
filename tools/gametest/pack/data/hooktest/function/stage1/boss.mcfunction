execute if entity @e[tag=hook.boss1,tag=hook.boss,tag=hook.heavy] run say HOOKTEST stage1.boss_summoned PASS
execute unless entity @e[tag=hook.boss1,tag=hook.boss,tag=hook.heavy] run say HOOKTEST stage1.boss_summoned FAIL no hook.boss1 entity
execute if score #hp hook.b1 matches 6 if score #ph hook.b1 matches 1 if score #st hook.b1 matches 1 run say HOOKTEST stage1.boss_state PASS
execute unless score #hp hook.b1 matches 6 run say HOOKTEST stage1.boss_state FAIL #hp not 6
execute if score #hp hook.b1 matches 6 unless score #st hook.b1 matches 1 run say HOOKTEST stage1.boss_state FAIL #st not 1
execute if score #hp hook.b1 matches 6 if score #st hook.b1 matches 1 unless score #ph hook.b1 matches 1 run say HOOKTEST stage1.boss_state FAIL #ph not 1
