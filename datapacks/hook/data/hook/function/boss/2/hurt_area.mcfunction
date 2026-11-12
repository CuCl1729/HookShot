#> hook:boss/2/hurt_area
# @s = 着地した番人。実行位置 = 着地点の 3.5 手前の角。地面近く(高さ 2 まで)の 7x7 にいるプレイヤー1人に当てる(damage は対象1体のみ。1人用)。hook:core/call 経由
damage @p[scores={hook.stage=2},dx=7,dy=2,dz=7] 6 minecraft:mob_attack by @s
