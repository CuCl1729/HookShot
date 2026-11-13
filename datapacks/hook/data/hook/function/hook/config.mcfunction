#> hook:hook/config
# フックv2・戦闘の定数はすべてここ(load から呼ぶ。変えたら /reload)。速度・距離は ×100(ブロック/tick・ブロック)、時間は tick。
# 単位: impulse は 0.01 ブロック/tick 刻み、各軸 ±1310 まで出せる(motion/player/impulse/pre_* の 17 ビット)。

# --- フック ---
# 射程 = 0.25 × #range(160 で 40 ブロック)
scoreboard players set #range hook.cfg 160
# 溜め: 撃ってからこの tick 数は速度を半分ずつ殺して留まる
scoreboard players set #windup hook.cfg 4
# 引き: 初速 → 毎 tick +#accel → 最大 #vmax
scoreboard players set #v0 hook.cfg 60
scoreboard players set #accel hook.cfg 40
scoreboard players set #vmax hook.cfg 240
# 終了距離: 錨(ブロック)まで #stop + 速さ×#lead/100 以内で終了。重い敵へは #stop_e
scoreboard players set #stop hook.cfg 300
scoreboard players set #stop_e hook.cfg 200
scoreboard players set #lead hook.cfg 30
# 引きの最長 tick(溜めを除く)
scoreboard players set #maxt hook.cfg 40
# 詰まり: 速さ(各軸の絶対値の和)が #stuck_v 未満の tick が #stuck 続いたら終了
scoreboard players set #stuck hook.cfg 3
scoreboard players set #stuck_v hook.cfg 15
# 位置が全く変わらない tick(クライアントの詰まりは 1〜2 tick)が #still 続いたら塞がれているとみなして終了
scoreboard players set #still hook.cfg 6
# 終了時の跳ね: 上 = #hop_vy + (錨の高さ − 足の高さ)/#hop_dy(#hop_vymax まで)、横 = 見ている水平方向 × #hop_h
scoreboard players set #hop_vy hook.cfg 100
scoreboard players set #hop_dy hook.cfg 6
scoreboard players set #hop_vymax hook.cfg 120
scoreboard players set #hop_h hook.cfg 28
# 横に、着く直前の水平の勢いの #hop_keep % を足す
scoreboard players set #hop_keep hook.cfg 5
# 跳ねの速度に寄せる tick 数(頂点のあたりまで。壁の側面に止められても上端を越えるまで前へ押し続ける)
scoreboard players set #hop_t hook.cfg 12
# フロート(空中でスニーク)の燃料 tick。着地・到着で満タン。燃料がある間は #float_vy(×100 ブロック/tick)でゆっくり上がる
scoreboard players set #float_vy hook.cfg 9
scoreboard players set #fuel hook.cfg 40

# --- 戦闘 ---
# 軽い敵の引き寄せ: 初速 → +#y_acc → 最大 #y_vmax(0.5 刻みで動かす)
scoreboard players set #y_v0 hook.cfg 50
scoreboard players set #y_acc hook.cfg 25
scoreboard players set #y_vmax hook.cfg 150
# 投げ: 1 tick に 0.5 × #throw_steps 進む × #throw_t tick
scoreboard players set #throw_steps hook.cfg 4
scoreboard players set #throw_t hook.cfg 16
# 叩きつけ: この速さ以上で壁にぶつかると怯む / 敵に触れると相手を弾く(どちらも死なない)
scoreboard players set #slam_v hook.cfg 70
# 弾く速さ(投げた敵が当たった敵・叩きつけで触れた敵。斜め上 25 度。投げた敵自身はその 1/3)。怯みは hook:hook/stun の 60 tick
scoreboard players set #knock_v hook.cfg 100
# 衝撃波(能力1)で弾く速さ。半径 4 は hook:hook/impact に直書き
scoreboard players set #shock_v hook.cfg 120
# 突き飛ばし(能力1)の水平の強さの下限(×100)。張り付かれた距離から撃っても離れるように(引きの速さ×3 がこれ未満のとき)
scoreboard players set #impact_min hook.cfg 200
# 爆弾兵の自爆までの tick(バニラのクリーパーの Fuse 30 と同じ。hook:enemy/fuse)
scoreboard players set #fuse_t hook.cfg 30
# フックで動かされた後、ギミックで死ねる tick
scoreboard players set #mv_t hook.cfg 60
# コンボが続く tick
scoreboard players set #combo_t hook.cfg 50

# 座標に使うもの(マクロで読む): hold = 掴んだ敵を目の前に置く距離。爆弾兵が自爆しないよう 3 より遠く
data modify storage hook: cfg set value {hold:"3.5"}
