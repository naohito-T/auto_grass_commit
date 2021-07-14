#!/bin/bash

# git rule
# 別ブランチを作成し、pushしただけでは草は生えない
# 別ブランチを作成したのであればデフォルトブランチにmergeまでしないと生えない。

# 定数
PATH=${pwd}

# 作成ディレクトリ名
dirName='commits'

# ログ用作成ディレクトリ
logsDirName='log'

# 作成ファイル名 日付かuuidか？ パーミッション変更処理も必要かも
fireName=${date '+%Y%m%d'}

# uuid 生成
which uuidgen # /usr/bin/uuidgen
if [ "$0" eq 0]:
    # uuid実行バイナリがあることを確認し生成する。
    uuid = uuidgen
fi

# ファイル書き込み内容
declare -A commitMsgs = (
    [1]=`${uuid}`
    [2]=`${uuid}`
    [3]=`コード修正${uuid}`
    [4]=`コード修正${uuid}`
    [5]=`コード修正${uuid}`
    [6]=`コード修正${uuid}`
    [7]=`コード修正${uuid}`
)

# commit message 関数化にした方がよいかも
declare -A commitMsgs = (
    [1]=`feature/fix_code_shell${uuid}`
    [2]=`feature/fix_code_shell${uuid}`
    [3]=`feature/fix_code_shell${uuid}`
    [4]=`feature/fix_code_shell${uuid}`
    [5]=`feature/fix_code_shell${uuid}`
    [6]=`feature/fix_code_shell${uuid}`
    [7]=`feature/fix_code_shell${uuid}`
)

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

# commit前に書き込みも必要 100行までを確認する。



# とりあえずjs風に書いてあとでリライトする
# 要はやりたいこと
# for文で連想配列を回す。
# その曜日と合っているものであればcommit をする。

for (i = 1; i < commitWeeks.length; i++) {
    if [ "$currentDay" eq commitWeeks[$i]]:
        # add . + commit する
        git add .
        git commit -m ""
        
    fi
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

