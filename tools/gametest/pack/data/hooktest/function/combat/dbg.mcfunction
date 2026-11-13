# struck_knocked が落ちたときの診断(K の位置と怯み残り)。結果行ではない
execute store result storage hooktest:t x int 1 run data get entity @n[tag=hooktest.k] Pos[0]
execute store result storage hooktest:t st int 1 run scoreboard players get @n[tag=hooktest.k] hook.stun
function hooktest:combat/dbg2 with storage hooktest:t
