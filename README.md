# project start

シェルスクリプト作成備忘録

関数
(参考 URL)[https://shellscript.sunone.me/function.html]
シェルスクリプトの関数にはいわゆる戻り値というものが存在しない。
return コマンドに指定した値は、関数の終了ステータスとなるだけで一般的な戻り値としては機能しない。
これがシェルスクリプト初心者には最も理解しづらい点に思える。
シェルスクリプトの関数は戻り値ではなく標準出力で結果を返す。まずはこの点を理解する。
