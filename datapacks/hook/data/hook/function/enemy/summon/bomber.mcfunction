#> hook:enemy/summon/bomber
# 爆弾兵(creeper、軽い)。掴んで投げると当たった所で爆発し周りの敵を倒す(hook:enemy/explode)。近づかれると普通に自爆する
summon creeper ~ ~ ~ {Tags:["hook.enemy","hook.bomb","hook.new"],PersistenceRequired:1b,CustomName:{text:"爆弾兵",color:"red"}}
