#> hook:stage/1/arrive/hub
# @s = 大空洞に初めて入ったプレイヤー。床にゾンビ2(床にトゲ3か所)、柱の上にスケルトン1
scoreboard players set #hub hook.s1 1
function hook:cp/set {id:11,x:213.5,y:51,z:0.5,yaw:-90}
function hook:stage/1/spawn {k:"zombie",x:220.5,y:51,z:0.5,t:"hook.s1h"}
function hook:stage/1/spawn {k:"zombie",x:240.5,y:51,z:-0.5,t:"hook.s1h"}
function hook:stage/1/spawn {k:"skeleton",x:230.5,y:81,z:0.5,t:"hook.s1h"}
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"大空洞: 北の竪坑・南の広間・東の選鉱場に水晶鍵がひとつずつ。好きな順でよい。南と東の口は中段にあり、中央の柱から届く。",color:"gray"}]
tellraw @a[scores={hook.stage=1}] [{text:"▶ ",color:"aqua"},{text:"3つ揃うと東の上段の門が開く。敵は投げても倒れない。掴んで床のトゲの上で放せば倒れる。",color:"gray"}]
function hook:fairy/say {text:"鍵の光が三つ、感じる。どこからでもいいよ"}
function hook:stage/1/goal
