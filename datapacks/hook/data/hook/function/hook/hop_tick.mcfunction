#> hook:hook/hop_tick
# @s = 到着後の跳ね中のプレイヤー(hook.hop = 残り tick)。望む速度 hook.hx/hy/hz に合わせて押し直す
# (押した速度がその tick に効いたかは位置の差でしか分からず1回では合わないので、数 tick かけて寄せる)。望む速度は重力・空気抵抗で減らしていく
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
