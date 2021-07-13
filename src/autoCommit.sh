#!/bin/bash

# git rule
# 別ブランチを作成し、pushしただけでは草は生えない
# 別ブランチを作成したのであればデフォルトブランチにmergeまでしないと生えない。

# 定数
PATH=${pwd}

# 作成ディレクトリ名
dirName='commits'

# 作成ファイル名 日付かuuidか？
fireName=${date '+%Y%m%d'}

# uuid 生成
which uuidgen # /usr/bin/uuidgen
if [ "$0" eq 0]:
    # uuid実行バイナリがあることを確認し生成する。
    uuid = uuidgen
fi

# commit message
commitMsg = `コード修正${uuid}`

# 現在の曜日
## dateコマンドは引数に+%uwつけると月曜日-日曜日を1~7の数値として取得できる
currentDay=${date '+%u'}

# 曜日と回数の連想配列
declare -A commitWeeks = (
    [1]="5"
    [2]="5"
    [3]="5"
    [4]="5"
    [5]="5"
    [6]="5"
    [7]="5"
)

# とりあえずjs風に書いてあとでリライトする

for (i = 1; i < commitWeeks.length; i++) {
    if ()
}

# commit 回数によって24時間を分ける。

# ディレクトリがなかったら作成
if []:
    mkdir `${PATH}${dirName}`
fi
# ファイルがなかったら作成
if []:
    toucch `${PATH}${dirName}`
fi
# 曜日ごとの処理

for ()

git add -u
git commit -m ""

