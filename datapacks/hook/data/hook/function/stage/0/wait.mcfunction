#> hook:stage/0/wait
# @macro f: 3秒(#t hook.tut が 60)待ってから呼ぶ関数。毎 tick 呼ばれる間だけ数える(段階が変わると s* が 0 に戻す)
scoreboard players add #t hook.tut 1
execute if score #t hook.tut matches ..59 run return 0
scoreboard players set #t hook.tut 0
$function $(f)
