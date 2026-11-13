#> hook:hook/hop_tick
# @s = 到着後の跳ね中のプレイヤー(hook.hop = 残り tick)。望む速度 hook.hx/hy/hz に合わせて押し直す
# (押した速度がその tick に効いたかは位置の差でしか分からず1回では合わないので、数 tick かけて寄せる)。望む速度は重力・空気抵抗で減らしていく
# クライアントが止まっている tick は押さない(pull_tick と同じ。最初の1回 = arrive からは必ず押す)
execute if score @s hook.hop < #hop_t hook.cfg if score #vx hook.temporary matches 0 if score #vy hook.temporary matches 0 if score #vz hook.temporary matches 0 run return run scoreboard players remove @s hook.hop 1
scoreboard players remove @s hook.hop 1
scoreboard players operation #motion hook.X0 = @s hook.hx
scoreboard players operation #motion hook.Y0 = @s hook.hy
scoreboard players operation #motion hook.Z0 = @s hook.hz
scoreboard players operation #motion hook.X0 -= #cx hook.temporary
scoreboard players operation #motion hook.Y0 -= #cy hook.temporary
scoreboard players operation #motion hook.Z0 -= #cz hook.temporary
function hook:motion/player/push
scoreboard players operation @s hook.hx *= #91 hook.constant
scoreboard players operation @s hook.hz *= #91 hook.constant
scoreboard players operation @s hook.hx /= #100 hook.constant
scoreboard players operation @s hook.hz /= #100 hook.constant
scoreboard players remove @s hook.hy 8
scoreboard players operation @s hook.hy *= #98 hook.constant
scoreboard players operation @s hook.hy /= #100 hook.constant