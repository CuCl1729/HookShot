#> hook:diff/enemy
# @s = 出たばかりの雑魚(tag hook.new、ボス以外。core の tick が #spd 1.. のとき呼ぶ)。base でなく modifier なので、base 0 で止めた敵は止まったまま
function hook:diff/spd with storage hook: diff
