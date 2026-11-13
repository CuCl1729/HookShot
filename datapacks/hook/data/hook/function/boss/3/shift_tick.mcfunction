#> hook:boss/3/shift_tick
# hook:world。移行演出(#t: 40 で床が崩れ、70 で第2形態)
scoreboard players add #t hook.b3 1
execute if score #t hook.b3 matches ..40 run particle minecraft:portal 1550 64 0 16 1 14 0.5 40 force @a
execute if score #t hook.b3 matches 20 run playsound minecraft:entity.ender_dragon.growl hostile @a 1550 70 0 4 0.5
# 崩れる前ぶれ: 床が軋んで砕ける(20〜39)
execute if score #t hook.b3 matches 20..39 run particle minecraft:block{block_state:"minecraft:polished_blackstone"} 1550 64 0 16 0.2 14 0 60 force @a
execute if score #t hook.b3 matches 25 run playsound minecraft:block.deepslate.break hostile @a 1550 64 0 4 0.5
execute if score #t hook.b3 matches 32 run playsound minecraft:block.deepslate.break hostile @a 1550 64 0 4 0.4
execute if score #t hook.b3 matches 40 run function hook:boss/3/collapse
execute if score #t hook.b3 matches 55 run function hook:fairy/say {text:"床が……！ 島から島へ、鉤で渡ろう！"}
execute if score #t hook.b3 matches 70.. run function hook:boss/3/phase2
