#> hook:enemy/summon/zombie
# 実行位置に出す。出した敵には tag hook.new が付く(この tick の終わりに core が外す)。昼に燃えないよう壊れない帽子
summon zombie ~ ~ ~ {Tags:["hook.enemy","hook.new"],PersistenceRequired:1b,equipment:{head:{id:"minecraft:leather_helmet",count:1,components:{"minecraft:unbreakable":{}}}}}
