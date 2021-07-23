#!/bin/bash

# 現在のディレクトリ
WORK_PATH=$(pwd)
# commit用ディレクトリ名
COMMIT_DIR='/commits'
# 作成ファイル名 日付かuuidか？ パーミッション変更処理も必要かも
COMMIT_FILE='/auto_commits.txt'
# ログ用作成ディレクトリ
LOGS_DIR='/logs'
# 作成ファイル名(log)
LOG_FILE="/log.$(date '+%Y%m%d').txt"
# configディレクトリ
CONFIG_DIR='/config'
# configファイル
CONFIG_FILE='/config.sh'
# configファイルから設定を読み込む
source "$WORK_PATH""$CONFIG_DIR""$CONFIG_FILE"
# ディレクトリ作成
if [ ! -d "$WORK_PATH""$COMMIT_DIR" ]; then
    mkdir -p "$WORK_PATH""$COMMIT_DIR"
fi
# ログディレクトリ作成
if [ ! -d "$WORK_PATH""$LOGS_DIR" ]; then
    mkdir -p "$WORK_PATH""$LOGS_DIR"
fi
# commitファイルがなければ作成
if [ ! -f "$WORK_PATH""$COMMIT_DIR""$COMMIT_FILE" ]; then
    touch "$WORK_PATH""$COMMIT_DIR""$COMMIT_FILE"
fi
# logファイルがなければ作成
if [ ! -f "$WORK_PATH""$LOGS_DIR""$LOG_FILE" ]; then
    touch "$WORK_PATH""$LOGS_DIR""$LOG_FILE"
fi
# log出力(標準出力とエラー出力同時に出す)
exec >>"$WORK_PATH""$LOGS_DIR""$LOG_FILE" 2>&1

# 現在の曜日 dateコマンドは引数に+%uwつけると月曜日-日曜日を1~7の数値として取得できる
CURRENT_DAY=$(date '+%u')

# 行数取得 一つのファイルは500行で終わりにする。
FILE_LINE=$(cat $WORK_PATH$COMMIT_DIR$COMMIT_FILE) | wc -l
echo "${FILE_LINE}"

# function省略は動作しない環境があるとのことで、functionは付与
function gitAutoCommit {
    echo "${writeOneLines[$1]}" >>"$WORK_PATH""$COMMIT_DIR""$COMMIT_FILE" # commitファイルに追記
    cd "$WORK_PATH" || exit 1
    git add .
    sleep 2
    git commit -m "fix"
    git push
}

for commitWeek in "${!commitWeeks[@]}"; do                      # 連想配列展開
    if [ "$commitWeek" -eq "$CURRENT_DAY" ]; then               # 曜日が一緒であれば
        for ((i = 0; i < ${commitWeeks[$commitWeek]}; i++)); do # さらにその回数文回す
            gitAutoCommit "$i"
        done
    fi
done
