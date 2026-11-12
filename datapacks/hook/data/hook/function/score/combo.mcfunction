#> hook:score/combo
# コンボ 2 以上: 画面中央下に「N COMBO!」と、数が増えるほど高い音
title @a times 0 20 6
title @a subtitle [{score:{name:"#combo",objective:"hook.score"},color:"gold",bold:true},{text:" COMBO!",color:"yellow",bold:true}]
title @a title {text:""}
scoreboard players operation #p hook.temporary = #combo hook.score
scoreboard players add #p hook.temporary 6
execute if score #p hook.temporary matches 21.. run scoreboard players set #p hook.temporary 20
execute store result storage hook: tmp.p float 0.1 run scoreboard players get #p hook.temporary
function hook:score/ding with storage hook: tmp
