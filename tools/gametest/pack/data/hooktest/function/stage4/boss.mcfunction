execute if entity @e[tag=hook.boss3,tag=hook.boss] run say HOOKTEST stage4.boss_summoned PASS
execute unless entity @e[tag=hook.boss3,tag=hook.boss] run say HOOKTEST stage4.boss_summoned FAIL no hook.boss3 entity
execute if score #hp hook.b3 matches 6 if score #state hook.b3 matches 1 run say HOOKTEST stage4.boss_state PASS
execute unless score #hp hook.b3 matches 6 run say HOOKTEST stage4.boss_state FAIL #hp not 6
execute if score #hp hook.b3 matches 6 unless score #state hook.b3 matches 1 run say HOOKTEST stage4.boss_state FAIL #state not 1
