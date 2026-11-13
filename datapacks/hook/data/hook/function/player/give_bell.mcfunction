#> hook:player/give_bell
# @s = プレイヤー。ルミの鈴をホットバーの9番に1つだけ(右クリック検知は進捗 hook:bell。フックとは custom_data で分ける)
clear @s *[custom_data~{hook:{bell:true}}]
item replace entity @s hotbar.8 with minecraft:stick[custom_data={hook:{bell:true}},item_model="minecraft:bell",custom_name={text:"ルミの鈴",italic:false,color:"aqua"},lore=[{text:"右クリック: ルミにいまの目的と行き先を聞く",italic:false,color:"gray"}],consumable={consume_seconds:100000,animation:none}]
