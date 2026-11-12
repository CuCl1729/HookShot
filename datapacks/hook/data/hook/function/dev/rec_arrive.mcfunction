#> hook:dev/rec_arrive
# @s = 記録中に到着したプレイヤー。到着点を覚え、そこからの最高点を測り直す。dev.q が残っていればすぐ次を撃つ(release の後、player/tick の rec_tick で)
scoreboard players add #rec_n hook.temporary 1
scoreboard players operation #rec_ay hook.temporary = #y1 hook.temporary
scoreboard players operation #rec_pk2 hook.temporary = #y1 hook.temporary
scoreboard players operation #rec_ax hook.temporary = #x1 hook.temporary
scoreboard players operation #rec_az hook.temporary = #z1 hook.temporary
scoreboard players set #rec_dbg hook.temporary 6
tellraw @a ["arr v ",{score:{name:"#vx",objective:"hook.temporary"}}," ",{score:{name:"#vy",objective:"hook.temporary"}}," push ",{score:{name:"#motion",objective:"hook.X0"}}," ",{score:{name:"#motion",objective:"hook.Y0"}}," ay ",{score:{name:"#ay",objective:"hook.temporary"}}]
