#> hook:fx/credits
# クレジットを全員のチャットに出す(エンディング担当が呼ぶ。STORY.md「クレジット」)。難易度・倒れた回数・光の粒も添える
execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 0.8
tellraw @a {text:"―― クレジット ――",color:"gold",bold:true}
tellraw @a [{text:"制作  ",color:"gray"},{text:"HookShot",color:"white"}]
tellraw @a [{text:"参考にした作品  ",color:"gray"},{text:"ちゅずめ（Chuzume）さんの動画",color:"white"}]
tellraw @a {text:"「【マインクラフト】今一度、あの空へと。Re:フックショットで空を舞え【データパック】」",color:"white"}
tellraw @a {text:"https://youtu.be/J3pFSZmta2U",color:"aqua",underlined:true,click_event:{action:"open_url",url:"https://youtu.be/J3pFSZmta2U"}}
function hook:fx/credits_run with storage hook: diff
tellraw @a {text:"ただの村人だったきみに、感謝を。 Thanks for playing!",color:"aqua"}
