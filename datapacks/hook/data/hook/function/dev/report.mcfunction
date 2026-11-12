#> hook:dev/report
# @s = 記録中のプレイヤー。記録をチャットに出して終える(値は ×100。到着後の値は最後の到着から)
scoreboard players operation #r_dx hook.temporary = #x1 hook.temporary
scoreboard players operation #r_dx hook.temporary -= #rec_x0 hook.temporary
scoreboard players operation #r_dz hook.temporary = #z1 hook.temporary
scoreboard players operation #r_dz hook.temporary -= #rec_z0 hook.temporary
scoreboard players operation #r_dy hook.temporary = #y1 hook.temporary
scoreboard players operation #r_dy hook.temporary -= #rec_y0 hook.temporary
scoreboard players operation #r_pk hook.temporary = #rec_pk hook.temporary
scoreboard players operation #r_pk hook.temporary -= #rec_y0 hook.temporary
scoreboard players operation #r_hop hook.temporary = #rec_pk2 hook.temporary
scoreboard players operation #r_hop hook.temporary -= #rec_ay hook.temporary
scoreboard players operation #r_ax hook.temporary = #x1 hook.temporary
scoreboard players operation #r_ax hook.temporary -= #rec_ax hook.temporary
scoreboard players operation #r_az hook.temporary = #z1 hook.temporary
scoreboard players operation #r_az hook.temporary -= #rec_az hook.temporary
tellraw @a [{text:"[rec] ",color:"aqua"},"start ",{score:{name:"#rec_x0",objective:"hook.temporary"}}," ",{score:{name:"#rec_y0",objective:"hook.temporary"}}," ",{score:{name:"#rec_z0",objective:"hook.temporary"}}," end ",{score:{name:"#x1",objective:"hook.temporary"}}," ",{score:{name:"#y1",objective:"hook.temporary"}}," ",{score:{name:"#z1",objective:"hook.temporary"}}," d ",{score:{name:"#r_dx",objective:"hook.temporary"}}," ",{score:{name:"#r_dy",objective:"hook.temporary"}}," ",{score:{name:"#r_dz",objective:"hook.temporary"}}," peak ",{score:{name:"#r_pk",objective:"hook.temporary"}}," arrY ",{score:{name:"#rec_ay",objective:"hook.temporary"}}," hop ",{score:{name:"#r_hop",objective:"hook.temporary"}}," afterArr ",{score:{name:"#r_ax",objective:"hook.temporary"}}," ",{score:{name:"#r_az",objective:"hook.temporary"}}," t ",{score:{name:"#rec_t",objective:"hook.temporary"}}," arrivals ",{score:{name:"#rec_n",objective:"hook.temporary"}}," groundMid ",{score:{name:"#rec_g",objective:"hook.temporary"}}," float ",{score:{name:"#rec_f",objective:"hook.temporary"}}]
tag @s remove hook.rec
