# guide/set の表示用データ(storage hook: guide・hud とサイドバーの行)と guide/clear。common/diff が hud.d を見るので先に呼ぶ
function hook:guide/set {text:"テスト",x:1,y:2,z:3}
execute if data storage hook: guide{text:"テスト",x:1,y:2,z:3} run say HOOKTEST common.guide_set PASS
execute unless data storage hook: guide{text:"テスト",x:1,y:2,z:3} run say HOOKTEST common.guide_set FAIL storage hook: guide is not {text,x,y,z}
execute if data storage hook: hud{text:"テスト",n:0} run say HOOKTEST common.guide_hud PASS
execute unless data storage hook: hud{text:"テスト",n:0} run say HOOKTEST common.guide_hud FAIL storage hook: hud is not {text,n:0}
execute if score hook.g1 hook.guide matches 4 if score hook.g4 hook.guide matches 1 run say HOOKTEST common.guide_lines PASS
execute unless score hook.g1 hook.guide matches 4 run say HOOKTEST common.guide_lines FAIL sidebar lines were not written
