#> hook:core/reset
# 配布用の初期化(冪等)。敵・ボス・バー・進行を消し、全プレイヤーを「初めて来た」状態に戻す。
# 次の tick で hook:player/join が走り、訓練場の最初へ送られる。地形は各ステージの start / tick が建て直す
execute in hook:world run function hook:boss/1/reset
execute in hook:world run function hook:boss/2/reset
execute in hook:world run function hook:boss/3/reset
bossbar remove hook:boss1
kill @e[tag=hook.enemy]
kill @e[tag=hook.tut]
kill @e[tag=hook.lore]
scoreboard players set #lore hook.score 0
data remove storage hook: ranks
kill @e[type=item]
kill @e[type=firework_rocket]
data remove storage hook: built
data remove storage hook: s2
execute in hook:world run forceload remove all
function hook:load
effect clear @a
tag @a remove hook.pulling
tag @a remove hook.grabbed_heavy
tag @a remove hook.yanked
tag @a remove hook.near
tag @a remove hook.attract
tag @a remove hook.owner
tag @a remove hook.floating
tag @a remove hook.arrive
tag @a remove hook.rec
tag @a remove hook.dev_float
kill @e[type=marker,tag=hook.proj]
scoreboard players reset @a hook.joined
scoreboard players reset @a hook.stage
scoreboard players reset @a hook.ability
scoreboard players reset @a hook.cp
scoreboard players reset @a hook.tut
scoreboard players reset @a hook.b3d
