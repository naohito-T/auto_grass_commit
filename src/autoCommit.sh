#!/bin/bash

# 一日に一回でcron起動にする(自分のPCでかなり動作させたくため)
# 夜 22時 startで良い

# $変数名を囲むのはダブルクォートでグロブやワードスプリットを防ぐため

# 定数
WORK_PATH=$(pwd)
# commit用ディレクトリ名
COMMIT_DIR='/commits'
# 作成ファイル名 日付かuuidか？ パーミッション変更処理も必要かも
COMMIT_FILE='/auto_commits.txt'
# ログ用作成ディレクトリ
LOGS_DIR='/logs'
# 作成ファイル名(log)
LOG_FILE="/log.$(date '+%Y%m%d').txt"
# ディレクトリ作成
if [ ! -d "$WORK_PATH""$COMMIT_DIR" ]; then
    mkdir -p "$WORK_PATH""$COMMIT_DIR"
fi
# ログディレクトリ作成
if [ ! -d "$WORK_PATH""$LOGS_DIR"  ]; then
    mkdir -p "$WORK_PATH""$LOGS_DIR"
fi

# commitファイルがなければ作成
if [ ! -f "$WORK_PATH""$COMMIT_DIR""$COMMIT_FILE" ]; then
    touch "$WORK_PATH""$COMMIT_DIR""$COMMIT_FILE"
    chmod 777 "$WORK_PATH""$COMMIT_DIR""$COMMIT_FILE"
fi

if [ ! -f "$WORK_PATH""$LOGS_DIR""$LOG_FILE" ]; then
    touch "$WORK_PATH""$LOGS_DIR""$LOG_FILE"
fi

exec >> "$WORK_PATH""$LOGS_DIR""$LOG_FILE" 2>&1

## ここまで完成

# 現在の曜日
## dateコマンドは引数に+%uwつけると月曜日-日曜日を1~7の数値として取得できる
currentDay=$(date '+%u')

# 行数取得 一つのファイルは500行で終わりにする。
FILE_LINE=cat "$WORK_PATH""$COMMIT_DIR""$COMMIT_FILE" | wc -l

function getUuid () {
    # uuid実行バイナリがあることを確認し生成
    which uuidgen # /usr/bin/uuidgen
    if [ "$?" -eq 0 ]; then
        echo uuidgen
    fi
}
uuid=$(getUuid)

# 要はやりたいこと
# for文で連想配列を回す。
# その曜日と合っているものであればcommit をする。

for [ $i = 1; i > commitWeeks.length; i++ ] {
    if [ "$currentDay" -eq $commitWeeks[$i]]: # 日付を確認し同じであればコミット
        for ($j = 0; i > $commitWeeks[$i]; i++) { # さらに日付が同じでその指定されたコミット数をコミットするは
            # add . + commit する
            if [ $fileLine lt 100 ]: # 書き込みのファイルが1000行だったら
                # ファイル作成

                # ファイル書き込み
                echo '~~~'  >> newFile
                if [ "$0" eq 0 ]
                # ファイル作成書き込みが成功したら元のファイルは削除
                fi
                # autocommit
                gitAutoCommit 1
            then                     # 書き込みのファイルが1000行を超えていないのであれば
                gitAutoCommit 1
            fi

        }
        if [ "$0" -eq 0]:
            # ここでインフォに文字列を渡す。
        then
            # errorに文字列を渡す
        fi

    fi
}

# シェルスクリプトでの関数はfunction省略可能
# 引数は$0 $1とアクセスできる
gitAutoCommit () {
    cd .. # 一つ上の改装にいき
    git add .
    git commit -m ""
    git push -u origin $gitBranchs[1] # ここの数字はいくつか分けれるようにする。
    sleep 15 # push後 15秒待つ
    # flagがあればgit branchを新規に作る
    if [ "$1" -eq 1 ]
        git ch -b feature/fix_code
    fi
}

# 条件式で<,>,<=,>=は使えない。代わりに-lt(<),-gt(>),-le(<=),-ge(>=)というのが使える。
# それぞれ-lt(less than),-gt(greater than),-le(less than or equal),-ge(greater than or equal)と覚える。
