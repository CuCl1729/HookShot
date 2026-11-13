#> hook:npc/summon
# 実行位置 = 長老の立つ所。マネキン。entity_interaction_range 0 で右クリックできないので、話しかけは近づくと自動(hook:stage/0/tick)
summon mannequin ~ ~ ~ {profile:{name:"Steve"},immovable:1b,hide_description:1b,Invulnerable:1b,Silent:1b,CustomName:{text:"長老",color:"yellow"},CustomNameVisible:1b,Tags:["hook.npc"],Rotation:[-90f,0f]}
