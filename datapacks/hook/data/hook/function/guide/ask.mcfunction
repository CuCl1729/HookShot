#> hook:guide/ask
# @s = プレイヤー(実行位置も)。ルミが目的・向き(自分から見て前/右…)・距離・高さを言い、目的地へ光の筋を 3 秒描く
execute unless data storage hook: guide.text run return run function hook:fairy/say {text:"いまは急がなくていいよ。好きに見て回ろう"}
# 目的地の向き(yaw)を marker に向けて測り、自分の向きとの差 #ty(0〜359、時計回り = 右)にする
summon marker ~ ~ ~ {Tags:["hook.askm"]}
function hook:guide/aim with storage hook: guide
execute store result score #ty hook.temporary run data get entity @e[type=marker,tag=hook.askm,limit=1] Rotation[0]
kill @e[type=marker,tag=hook.askm]
execute store result score #py hook.temporary run data get entity @s Rotation[0]
scoreboard players operation #ty hook.temporary -= #py hook.temporary
scoreboard players add #ty hook.temporary 36360
scoreboard players operation #ty hook.temporary %= #360 hook.constant
# 水平距離 ≒ 長いほう + 短いほう × 0.41、高さの差
execute store result score #gx hook.temporary run data get storage hook: guide.x
execute store result score #gy hook.temporary run data get storage hook: guide.y
execute store result score #gz hook.temporary run data get storage hook: guide.z
execute store result score #ax hook.temporary run data get entity @s Pos[0]
execute store result score #ay hook.temporary run data get entity @s Pos[1]
execute store result score #az hook.temporary run data get entity @s Pos[2]
scoreboard players operation #gx hook.temporary -= #ax hook.temporary
scoreboard players operation #gy hook.temporary -= #ay hook.temporary
scoreboard players operation #gz hook.temporary -= #az hook.temporary
execute if score #gx hook.temporary matches ..-1 run scoreboard players operation #gx hook.temporary *= #-1 hook.constant
execute if score #gz hook.temporary matches ..-1 run scoreboard players operation #gz hook.temporary *= #-1 hook.constant
scoreboard players operation #d hook.temporary = #gx hook.temporary
scoreboard players operation #d hook.temporary > #gz hook.temporary
scoreboard players operation #mn hook.temporary = #gx hook.temporary
scoreboard players operation #mn hook.temporary < #gz hook.temporary
scoreboard players operation #mn hook.temporary *= #41 hook.constant
scoreboard players operation #mn hook.temporary /= #100 hook.constant
scoreboard players operation #d hook.temporary += #mn hook.temporary
# 文を組む(storage hook: ask {text,dir,d,h})
data modify storage hook: ask set value {dir:"前",h:""}
data modify storage hook: ask.text set from storage hook: guide.text
execute if score #ty hook.temporary matches 23..67 run data modify storage hook: ask.dir set value "右前"
execute if score #ty hook.temporary matches 68..112 run data modify storage hook: ask.dir set value "右"
execute if score #ty hook.temporary matches 113..157 run data modify storage hook: ask.dir set value "右うしろ"
execute if score #ty hook.temporary matches 158..202 run data modify storage hook: ask.dir set value "うしろ"
execute if score #ty hook.temporary matches 203..247 run data modify storage hook: ask.dir set value "左うしろ"
execute if score #ty hook.temporary matches 248..292 run data modify storage hook: ask.dir set value "左"
execute if score #ty hook.temporary matches 293..337 run data modify storage hook: ask.dir set value "左前"
execute if score #gy hook.temporary matches 6.. run data modify storage hook: ask.h set value "、ずっと上"
execute if score #gy hook.temporary matches ..-6 run data modify storage hook: ask.h set value "、ずっと下"
execute store result storage hook: ask.d int 1 run scoreboard players get #d hook.temporary
execute if score #d hook.temporary matches ..4 run function hook:guide/say_near with storage hook: ask
execute if score #d hook.temporary matches 5.. run function hook:guide/say with storage hook: ask
scoreboard players set @s hook.ask 60
playsound minecraft:block.bell.use master @s ~ ~ ~ 0.6 2
