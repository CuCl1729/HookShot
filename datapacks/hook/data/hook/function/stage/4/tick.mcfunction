#> hook:stage/4/tick
# 誰かが虚の玉座(hook.stage=4)にいる間、毎 tick(core の tick から)
execute unless data storage hook: built{s4:1b} in hook:world run function hook:stage/4/build
# チャンクが読み込まれて建つまでは前室に留める(落下ループ防止)
execute unless data storage hook: built{s4:1b} as @a[scores={hook.stage=4}] run return run function hook:cp/return
function hook:gimmick/press/tick
function hook:boss/3/tick
