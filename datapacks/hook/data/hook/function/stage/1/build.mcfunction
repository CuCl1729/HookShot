#> hook:stage/1/build
# 水晶坑道(hook:world, x 199〜501, z 0〜15 = チャンク1列, 床の上面 y=63)。冪等。全チャンクが読み込まれるまで何もしない(stage/1/tick が毎 tick 呼ぶ)
execute in hook:world unless loaded 192 63 7 run return 0
execute in hook:world unless loaded 208 63 7 run return 0
execute in hook:world unless loaded 224 63 7 run return 0
execute in hook:world unless loaded 240 63 7 run return 0
execute in hook:world unless loaded 256 63 7 run return 0
execute in hook:world unless loaded 272 63 7 run return 0
execute in hook:world unless loaded 288 63 7 run return 0
execute in hook:world unless loaded 304 63 7 run return 0
execute in hook:world unless loaded 320 63 7 run return 0
execute in hook:world unless loaded 336 63 7 run return 0
execute in hook:world unless loaded 352 63 7 run return 0
execute in hook:world unless loaded 368 63 7 run return 0
execute in hook:world unless loaded 384 63 7 run return 0
execute in hook:world unless loaded 400 63 7 run return 0
execute in hook:world unless loaded 416 63 7 run return 0
execute in hook:world unless loaded 432 63 7 run return 0
execute in hook:world unless loaded 448 63 7 run return 0
execute in hook:world unless loaded 464 63 7 run return 0
execute in hook:world unless loaded 480 63 7 run return 0
execute in hook:world unless loaded 496 63 7 run return 0
execute in hook:world run function hook:stage/1/build_all
data modify storage hook: built.s1 set value 1b
