#> hook:combat/yank_spike
# @s = 引き寄せ中にトゲ(amethyst_cluster)へ引きずり込まれた敵。実行位置 = トゲの中。トゲに載せて放し、ギミックで倒す
# (トゲは #hook:pass でないので、無いと yank_blocked でトゲの手前に止まって刺さらなかった)
tp @s ~ ~ ~
function hook:combat/drop
function hook:enemy/gimmick
