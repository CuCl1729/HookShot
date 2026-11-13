#> hook:load
# スコア・定数・forceload。ゲームルールは data/minecraft/game_rules.dat に直接書いてある(fall_damage/mob_drops/keep_inventory/immediate_respawn 等)
scoreboard objectives add hook.stage dummy
scoreboard objectives add hook.ability dummy
scoreboard objectives add hook.cp dummy
scoreboard objectives add hook.cd dummy
scoreboard objectives add hook.tut dummy
scoreboard objectives add hook.pull dummy
scoreboard objectives add hook.stun dummy
scoreboard objectives add hook.joined dummy
scoreboard objectives add hook.y dummy
scoreboard objectives add hook.px dummy
scoreboard objectives add hook.py dummy
scoreboard objectives add hook.pz dummy
scoreboard objectives add hook.death minecraft.custom:minecraft.deaths
# フックv2・戦闘(定数は hook:hook/config)
scoreboard objectives add hook.cfg dummy
scoreboard objectives add hook.held dummy
scoreboard objectives add hook.spd dummy
scoreboard objectives add hook.stuck dummy
scoreboard objectives add hook.still dummy
scoreboard objectives add hook.fuse dummy
scoreboard objectives add hook.fuel dummy
scoreboard objectives add hook.hop dummy
scoreboard objectives add hook.hx dummy
scoreboard objectives add hook.hy dummy
scoreboard objectives add hook.hz dummy
scoreboard objectives add hook.mv dummy
scoreboard objectives add hook.vh dummy
scoreboard objectives add hook.score dummy
# 開発用 inbox(hook:dev/inbox_on。tools/mcrun.mjs)
scoreboard objectives add hook.dev dummy
scoreboard players add #kills hook.score 0
scoreboard players add #time hook.score 0
scoreboard players add #combo hook.score 0
scoreboard players add #combo_t hook.score 0
scoreboard players add #combo_max hook.score 0
scoreboard players add #run hook.score 0
# 光の粒(hook:lore/pick)
scoreboard players add #lore hook.score 0
function hook:hook/config
# 共通機能: 難易度(hook:diff/*)・案内(hook:guide/*)・導入(hook:intro/*)・ルミの鈴(hook.bell)・道案内の光(hook.ask)・最初の cp を控えたステージ(hook.cps)
scoreboard objectives add hook.diff dummy
scoreboard objectives add hook.guide dummy {text:"いまの目的",color:"aqua",bold:true}
scoreboard objectives modify hook.guide displayname {text:"いまの目的",color:"aqua",bold:true}
scoreboard objectives modify hook.guide numberformat blank
scoreboard objectives add hook.intro dummy
scoreboard objectives add hook.bell dummy
scoreboard objectives add hook.ask dummy
scoreboard objectives add hook.cps dummy
# 倒れた回数(通算・ステージ内)と取り戻した欠片の数
scoreboard players add #deaths hook.score 0
scoreboard players add #sdeaths hook.score 0
scoreboard players add #shards hook.score 0
scoreboard players add #chosen hook.diff 0
execute unless score #level hook.diff matches 0..2 run scoreboard players set #level hook.diff 0
# 爆弾兵の自爆で地形を壊さない
gamerule mob_griefing false
# ボス3 用(無いと boss/3/tick の判定が全部失敗し、reset → build が毎 tick 回ってトゲの欠片が溢れる)
scoreboard objectives add hook.b3 dummy
scoreboard objectives add hook.b3d minecraft.custom:minecraft.deaths
# ステージ1・ボス1・ステージ3 の進行(偽プレイヤー)
scoreboard objectives add hook.s1 dummy
scoreboard objectives add hook.b1 dummy
scoreboard objectives add hook.s3 dummy
# hook:motion/player(test から移植)が使うもの
scoreboard objectives add hook.X0 dummy
scoreboard objectives add hook.Y0 dummy
scoreboard objectives add hook.Z0 dummy
scoreboard objectives add hook.X1 dummy
scoreboard objectives add hook.Y1 dummy
scoreboard objectives add hook.Z1 dummy
scoreboard objectives add hook.impulse.x dummy
scoreboard objectives add hook.impulse.y dummy
scoreboard objectives add hook.impulse.z dummy
scoreboard objectives add hook.constant dummy
scoreboard objectives add hook.temporary dummy
scoreboard objectives add hook.multiplier dummy

scoreboard players set #-1 hook.constant -1
scoreboard players set #-2 hook.constant -2
scoreboard players set #1 hook.constant 1
scoreboard players set #2 hook.constant 2
scoreboard players set #3 hook.constant 3
scoreboard players set #4 hook.constant 4
scoreboard players set #7 hook.constant 7
scoreboard players set #8 hook.constant 8
scoreboard players set #10 hook.constant 10
scoreboard players set #14 hook.constant 14
scoreboard players set #16 hook.constant 16
scoreboard players set #20 hook.constant 20
scoreboard players set #32 hook.constant 32
scoreboard players set #41 hook.constant 41
scoreboard players set #50 hook.constant 50
scoreboard players set #64 hook.constant 64
scoreboard players set #91 hook.constant 91
scoreboard players set #98 hook.constant 98
scoreboard players set #100 hook.constant 100
scoreboard players set #128 hook.constant 128
scoreboard players set #256 hook.constant 256
scoreboard players set #360 hook.constant 360
scoreboard players set #512 hook.constant 512
scoreboard players set #1000 hook.constant 1000
scoreboard players set #1024 hook.constant 1024
scoreboard players set #2048 hook.constant 2048
scoreboard players set #4096 hook.constant 4096
scoreboard players set #8192 hook.constant 8192
scoreboard players set #16384 hook.constant 16384
scoreboard players set #32768 hook.constant 32768
scoreboard players set #65536 hook.constant 65536

# 訓練場(x -32〜60, z ±8)。建てるのは tick から読み込み後に(hook:stage/0/build)
execute in hook:world run forceload add -32 -16 63 15
# 導入の妖精の村(x -93〜-61。hook:intro/build)
execute in hook:world run forceload add -96 -16 -49 15

# 難易度(フロート燃料は hook/config の値を基準に書き換えるので config と定数の後)
scoreboard players operation #fuel_base hook.diff = #fuel hook.cfg
function hook:diff/apply

# 開発用 inbox: reload ループ(hook:dev/inbox_tick)から来たとき、mcrun が書いたコマンドを実行する
execute if score #inbox hook.dev matches 1 run function hook:dev/inbox
