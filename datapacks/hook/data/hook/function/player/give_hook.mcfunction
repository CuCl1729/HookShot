#> hook:player/give_hook
# @s = プレイヤー。フックショットを1本だけ持たせる(右クリック検知は進捗 hook:right_click)
clear @s *[custom_data~{hook:{hookshot:true}}]
give @s minecraft:stick[custom_data={hook:{hookshot:true}},custom_name={text:"フックショット",italic:false,color:"gold"},consumable={consume_seconds:100000,animation:none}]
