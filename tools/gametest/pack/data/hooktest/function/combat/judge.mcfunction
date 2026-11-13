execute if entity @e[tag=hooktest.t] run say HOOKTEST combat.thrown_survives PASS
execute unless entity @e[tag=hooktest.t] run say HOOKTEST combat.thrown_survives FAIL thrown zombie died on hit
execute unless entity @e[tag=hooktest.z] run say HOOKTEST combat.knocked_into_spike PASS
execute if entity @e[tag=hooktest.z] run say HOOKTEST combat.knocked_into_spike FAIL struck zombie was not knocked onto the spikes
execute if entity @e[tag=hooktest.w,tag=hook.stun] run say HOOKTEST combat.wall_stuns PASS
execute unless entity @e[tag=hooktest.w,tag=hook.stun] run say HOOKTEST combat.wall_stuns FAIL zombie thrown at a wall died or is not stunned
execute if entity @e[tag=hooktest.u] if entity @e[tag=hooktest.k,tag=hook.stun,x=3106.5,y=60,z=3000,dx=20,dy=10,dz=7] run say HOOKTEST combat.struck_knocked PASS
execute unless entity @e[tag=hooktest.u] run say HOOKTEST combat.struck_knocked FAIL thrown zombie died
execute unless entity @e[tag=hooktest.k,tag=hook.stun,x=3106.5,y=60,z=3000,dx=20,dy=10,dz=7] run say HOOKTEST combat.struck_knocked FAIL struck zombie died, not stunned or not knocked 2+ blocks
execute unless entity @e[tag=hooktest.d] unless entity @e[tag=hooktest.b] run say HOOKTEST combat.bomb_explodes PASS
execute if entity @e[tag=hooktest.d] run say HOOKTEST combat.bomb_explodes FAIL zombie survived the thrown bomber
execute if entity @e[tag=hooktest.b] run say HOOKTEST combat.bomb_explodes FAIL thrown bomber did not explode
execute unless entity @e[tag=hooktest.k,tag=hook.stun,x=3106.5,y=60,z=3000,dx=20,dy=10,dz=7] if entity @e[tag=hooktest.k] run function hooktest:combat/dbg
