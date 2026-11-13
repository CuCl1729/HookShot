#> hook:dev/mv_aim
# 試験用。@s = プレイヤー。@macro p = 位相の名前(#p1 / #p2)、x = 撃つ面の x。ステージ3 の動く錨のいまの上の段の側面(z -23.5)へ撃つ
$scoreboard players operation #o hook.s3 = $(p) hook.s3
function hook:stage/3/mv/y
$execute in hook:world run summon marker $(x) 0 -23.5 {Tags:["dev.mv"]}
execute store result entity @e[type=marker,tag=dev.mv,limit=1] Pos[1] double 1 run data get storage hook: s3m.yh
function hook:dev/aim_ent {tag:"dev.mv",dy:0.6}
kill @e[type=marker,tag=dev.mv]
