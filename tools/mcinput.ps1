# Minecraft (26.x は SDL3) へ Win32 PostMessage でキーを送る。カーソルは使わない。
# 実測: 効くのは Minecraft が前面のときのキー操作(チャット送信、メニューの Tab/矢印/Enter/Esc)だけ。
# 背後のウィンドウへのキーは捨てられ、右クリックとスニーク(Shift 押しっぱなし)は前面でも効かない。
# ゲーム内の操作は tools/mcrun.mjs(ファイル経由。入力もフォーカスも不要)を使い、これは最初の /reload と
# /function hook:dev/inbox_on の入力やメニュー操作にだけ使う。
# 使い方:
#   mcinput.ps1 key <名前>          名前: a-z 0-9 tab enter esc space back f1-f12 up down left right
#   mcinput.ps1 chat "<文字列>"     T でチャットを開き WM_CHAR で打って Enter (ASCII)
#   mcinput.ps1 log [行数]          latest.log の [CHAT] 行を UTF-8 で表示
param([Parameter(Mandatory)][string]$cmd, [string]$a)
$ErrorActionPreference = 'Stop'

Add-Type @'
using System; using System.Runtime.InteropServices;
public static class McIn {
  [DllImport("user32.dll")] public static extern bool PostMessageW(IntPtr h, uint m, IntPtr w, IntPtr l);
  [DllImport("user32.dll")] public static extern uint MapVirtualKeyW(uint c, uint t);
}
'@

$hwnd = (Get-Process javaw -ErrorAction SilentlyContinue | Where-Object MainWindowTitle -like 'Minecraft*' | Select-Object -First 1).MainWindowHandle
if (-not $hwnd) { throw 'Minecraft のウィンドウが見つからない' }

$vk = @{ tab=9; enter=13; esc=27; space=32; back=8; left=37; up=38; right=39; down=40 }
function VK([string]$n) {
  $n = $n.ToLower()
  if ($vk.ContainsKey($n)) { return $vk[$n] }
  if ($n -match '^f(\d{1,2})$') { return 0x6F + [int]$Matches[1] }
  if ($n -match '^[a-z0-9]$') { return [int][char]$n.ToUpper() }
  throw "未知のキー: $n"
}
function Post($m, $w, $l) { [void][McIn]::PostMessageW($hwnd, $m, [IntPtr]$w, [IntPtr]$l) }
function Key([string]$n, [bool]$down) {
  $v = VK $n
  $sc = [McIn]::MapVirtualKeyW($v, 0) # SDL はキーを lParam のスキャンコードで識別する
  $l = 1 -bor ($sc -shl 16)
  if ($v -in 37..40) { $l = $l -bor (1 -shl 24) }  # 矢印は拡張キー
  if ($down) { Post 0x100 $v $l } else { Post 0x101 $v ($l -bor 0xC0000000) }
}

switch ($cmd) {
  'key'    { Key $a $true; Start-Sleep -Milliseconds 60; Key $a $false }
  'chat' {
    Key t $true; Start-Sleep -Milliseconds 60; Key t $false
    Start-Sleep -Milliseconds 250  # チャット画面が開くのを待つ
    foreach ($c in $a.ToCharArray()) { Post 0x102 ([int]$c) 1 }
    Start-Sleep -Milliseconds 100
    Key enter $true; Start-Sleep -Milliseconds 40; Key enter $false
  }
  'log' {
    $p = Join-Path $PSScriptRoot '..\..\..\logs\latest.log'
    Get-Content $p -Encoding UTF8 | Select-String '\[CHAT\]' | Select-Object -Last $(if ($a) { [int]$a } else { 10 }) | ForEach-Object { $_.Line }
  }
  default { throw "未知のコマンド: $cmd" }
}

