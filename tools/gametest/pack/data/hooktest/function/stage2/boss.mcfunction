execute if entity @e[tag=hook.boss2,tag=hook.boss] run say HOOKTEST stage2.boss_summoned PASS
execute unless entity @e[tag=hook.boss2,tag=hook.boss] run say HOOKTEST stage2.boss_summoned FAIL no hook.boss2 entity
execute if score #hp hook.b2 matches 3 if score #state hook.b2 matches 1 run say HOOKTEST stage2.boss_state PASS
execute unless score #hp hook.b2 matches 3 run say HOOKTEST stage2.boss_state FAIL #hp not 3
execute if score #hp hook.b2 matches 3 unless score #state hook.b2 matches 1 run say HOOKTEST stage2.boss_state FAIL #state not 1
