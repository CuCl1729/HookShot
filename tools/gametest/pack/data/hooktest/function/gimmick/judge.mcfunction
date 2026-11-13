execute unless entity @e[tag=hooktest.spike_mv] run say HOOKTEST gimmick.spike_kills_moved PASS
execute if entity @e[tag=hooktest.spike_mv] run say HOOKTEST gimmick.spike_kills_moved FAIL moved enemy on spike survived
execute if entity @e[tag=hooktest.spike_idle] run say HOOKTEST gimmick.spike_spares_idle PASS
execute unless entity @e[tag=hooktest.spike_idle] run say HOOKTEST gimmick.spike_spares_idle FAIL idle enemy on spike died
execute unless entity @e[tag=hooktest.press_mv] run say HOOKTEST gimmick.press_kills_moved PASS
execute if entity @e[tag=hooktest.press_mv] run say HOOKTEST gimmick.press_kills_moved FAIL moved enemy under press survived
execute if entity @e[tag=hooktest.press_idle] run say HOOKTEST gimmick.press_spares_idle PASS
execute unless entity @e[tag=hooktest.press_idle] run say HOOKTEST gimmick.press_spares_idle FAIL idle enemy under press died
