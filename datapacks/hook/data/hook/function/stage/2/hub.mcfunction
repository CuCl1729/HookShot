#> hook:stage/2/hub
# @s = プレイヤー。大工場に入った: 全体の案内と、練習プレスの前にゾンビ2体(倒すのは任意。プレスの練習用)
scoreboard players set #hub hook.s2 1
execute in hook:world positioned 641.5 64 3.5 run function hook:enemy/summon/zombie
execute in hook:world positioned 641.5 64 -2.5 run function hook:enemy/summon/zombie
tag @e[tag=hook.new] add hook.s2
function hook:fairy/say {text:"大きなプレス！ 敵を下へ運んで、四隅の標的を撃とう"}
tellraw @s {text:"動力炉は3基: 北の圧延ライン、南の組立場、東の高所。どれからでもよい。東の扉の上のランプが消えた数だけ止まっている。",color:"gray"}
tellraw @s {text:"プレス: 筐体の四隅の標的を撃つと落ちる。潰れるのはフックで動かして3秒以内の敵だけ。引き寄せて真下で放し、すぐ標的を撃て。",color:"gray"}
function hook:stage/2/goal
