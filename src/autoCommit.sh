#!/bin/bash

# git rule
# 別ブランチを作成し、pushしただけでは草は生えない
# 別ブランチを作成したのであればデフォルトブランチにmergeまでしないと生えない。

# 一日に一回でcron起動にする(自分のPCでかなり動作させたくため)
# 夜 22時 startで良い

# $変数名を囲むのはダブルクォートでグロブやワードスプリットを防ぐため

# # infoとerrorには発生した時間なども追記された内容を渡してあげる
# function infoMsg () {
#     echo -e "info: ${1}" >> "$WORK_PATH""$LOGS_DIR""$LOG_FILE"
# }

# function errorMsg () {
#     echo -e "error: ${1}" >> "$WORK_PATH""$LOGS_DIR""$LOG_FILE"
# }

# 定数
WORK_PATH=$(pwd)
# commit用ディレクトリ名
COMMIT_DIR='/commits'
# 作成ファイル名 日付かuuidか？ パーミッション変更処理も必要かも
COMMIT_FILE='auto_commits'
# ログ用作成ディレクトリ
LOGS_DIR='/logs'
# 作成ファイル名(log)
LOG_FILE="log.$(date '+%Y%m%d')"
# ディレクトリ作成
if [ ! -d "$WORK_PATH""$COMMIT_DIR" ]; then
    mkdir -p "$WORK_PATH""$COMMIT_DIR"
fi
# ログディレクトリ作成
if [ ! -d "$WORK_PATH""$LOGS_DIR"  ]; then
    mkdir -p "$WORK_PATH""$LOGS_DIR"
fi

#  * @param 1 dirName
#  * @param 2 fileCreateDir
#  * @param 3 fileName
#  * @return newFile
function touchFile () {
    touch "$1" "$2" "$3"
}

# commitファイルがなければ作成
if [ ! -f "$WORK_PATH""$COMMIT_DIR""$COMMIT_FILE" ]; then
    touchFile "$WORK_PATH" "$COMMIT_DIR" "$COMMIT_FILE"
    
fi

if [ ! -f "$WORK_PATH""$LOGS_DIR""$LOG_FILE" ]; then
    touchFile "$WORK_PATH" "$LOGS_DIR" "$LOG_FILE"
fi

exec 1&2 >> "$LOG_FILE"

# 行数取得 一つのファイルは500行で終わりにする。
FILE_LINE=cat "$WORK_PATH""$COMMIT_DIR""$COMMIT_FILE" | wc -l

# 実行権限がなければ追加する
if [ ! -x "$COMMIT_DIR""$COMMIT_FILE" ]; then
    chmod 755 "$COMMIT_DIR""$COMMIT_FILE"
fi

function getUuid () {
    # uuid実行バイナリがあることを確認し生成
    which uuidgen # /usr/bin/uuidgen
    if [ "$?" -eq 0 ]; then
        echo uuidgen
    fi
}
uuid=$(getUuid)




# ファイル書き込み内容
declare -A writeOneLines = (
    [1]="fix code${uuid}"
    [2]="fix code${uuid}"
    [3]="fix code${uuid}"
    [4]="fix code${uuid}"
    [5]="fix code${uuid}"
    [6]="fix code${uuid}"
    [7]="fix code${uuid}"
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

declare -A gitBranchs = (
    [1]="feature/fix_code${uuid}"
    [2]='feature/fix_code'
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

# とりあえずjs風に書いてあとでリライトする
# 要はやりたいこと
# for文で連想配列を回す。
# その曜日と合っているものであればcommit をする。

for ($i = 1; i > commitWeeks.length; i++) {
    if [ "$currentDay" eq $commitWeeks[$i]]: # 日付を確認し同じであればコミット
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
# $? 直前のコマンドが正常処理したかを調べる。
# testコマンドの-a(AND条件）、-o(OR条件）で書けるが、&&(AND条件）、||(OR条件）の方が個人的には分かりやすい。
# ただし、-a、-oは１つのtestコマンドで条件判定するのに対し、&&、||は終了ステータスコードを判断して以降の処理を実行するもの
# なので書き方が少し違う点に注意。