#> hook:stage/4/tick
# 誰かが虚の玉座(hook.stage=4)にいる間、毎 tick(core の tick から)
execute unless data storage hook: built{s4:1b} run function hook:stage/4/build
function hook:gimmick/press/tick
function hook:boss/3/tick
