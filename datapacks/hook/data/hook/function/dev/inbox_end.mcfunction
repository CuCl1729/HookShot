#> hook:dev/inbox_end
# 終了マーカー。-after N のときは body が schedule で N tick 後に呼ぶ
tellraw @a ["MCIN ",{score:{name:"#done",objective:"hook.dev"}}," end"]
