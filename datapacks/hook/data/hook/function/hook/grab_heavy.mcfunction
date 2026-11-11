#> hook:hook/grab_heavy
# @s = プレイヤー。重い敵そのものを引っ張り先にする(動いても追う)。tag hook.grabbed_heavy は訓練場などが読む
tag @n[tag=hook.hit] add hook.anchor
tag @s add hook.grabbed_heavy
function hook:hook/start_pull
