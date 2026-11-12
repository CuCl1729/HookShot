#> hook:boss/1/leave
# ステージ2へ。坑道の雑魚・鍵・光の粒・巨兵を消し(forceload も外す)、闘技場を待機に戻す
kill @e[type=!player,tag=hook.s1]
function hook:boss/1/reset
execute as @a[scores={hook.stage=1}] run function hook:stage/2/start
execute in hook:world run forceload remove 192 -64 511 63
