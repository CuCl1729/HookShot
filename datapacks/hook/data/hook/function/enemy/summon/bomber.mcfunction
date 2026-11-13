#> hook:enemy/summon/bomber
# 爆弾兵(creeper、軽い)。掴んで投げると当たった所で爆発し周りの敵を倒す(hook:enemy/explode)。近づかれると自爆する(hook:enemy/fuse。
# バニラの自爆は巻き込んだ敵を撃破に数えられないので Fuse を最大にして使わない)
summon creeper ~ ~ ~ {Tags:["hook.enemy","hook.bomb","hook.new"],Fuse:32767s,PersistenceRequired:1b,CustomName:{text:"爆弾兵",color:"red"}}
