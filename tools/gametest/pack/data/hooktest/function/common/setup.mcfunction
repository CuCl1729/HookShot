# 共通機能(難易度・案内・導入)。難易度の表と案内の表示用データは地形が要らないので先に、導入の build はチャンクが読み込まれるまで毎 tick 呼ぶ
scoreboard players set #wi hook.temporary 0
scoreboard players set #rdyi hook.temporary 0
function hooktest:common/guide
function hooktest:common/diff
data remove storage hook: built.intro
function hooktest:common/poll
