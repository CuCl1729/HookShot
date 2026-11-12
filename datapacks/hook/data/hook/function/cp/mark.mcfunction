#> hook:cp/mark
# @s = プレイヤー。@macro id/x/y/z/yaw: チェックポイントを置くだけ(テレポートしない)。cp/set も tp しないので同じもの
$function hook:cp/set {id:$(id),x:$(x),y:$(y),z:$(z),yaw:$(yaw)}
