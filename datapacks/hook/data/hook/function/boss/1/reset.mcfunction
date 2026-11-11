#> hook:boss/1/reset
# ボス戦を始める前の状態へ(冪等)。巨兵を消し、バーを隠し、闘技場のトゲを置き直す(島の配置は stage/1/build_all)
kill @e[tag=hook.boss1]
function hook:core/call {f:"hook:boss/1/bar_hide"}
execute in hook:world run fill 469 64 1 497 64 14 minecraft:air replace minecraft:amethyst_cluster
execute in hook:world run fill 469 64 10 471 64 14 minecraft:amethyst_cluster
execute in hook:world run fill 477 64 1 479 64 5 minecraft:amethyst_cluster
execute in hook:world run fill 487 64 10 489 64 14 minecraft:amethyst_cluster
execute in hook:world run fill 495 64 1 497 64 5 minecraft:amethyst_cluster
