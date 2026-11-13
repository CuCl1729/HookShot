# トゲ(x 3040)とプレス機(x 3080)。@e は「実体を処理するチャンク」の実体しか選べないので、目印を置いて見えるようになるまで待つ
forceload add 3030 2990 3100 3015
scoreboard players set #wg hook.temporary 0
scoreboard players set #rdyg hook.temporary 0
scoreboard players set #sg hook.temporary 0
function hooktest:gimmick/poll
