#> hook:stage/0/guide
# @s = 訓練場に来たばかりのプレイヤー(stage/0/player、最初の1回)。導入が出した目的の後に、最初の目的(鈴を鳴らす)を出す
tag @s add hook.t0g
function hook:fairy/say {text:"迷ったら、9番の鈴を持って右クリック。わたしが道を教えるよ"}
function hook:stage/0/goal
