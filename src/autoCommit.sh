#!/bin/bash

# git rule
# 別ブランチを作成し、pushしただけでは草は生えない
# 別ブランチを作成したのであればデフォルトブランチにmergeまでしないと生えない。

# 一日に一回でcron起動にする(自分のPCでかなり動作させたくため)

# 定数
$PATH=${pwd}
# commit用ディレクトリ名
$dirName='commits'
# 作成ファイル名 日付かuuidか？ パーミッション変更処理も必要かも
$fireName=`commit.$(date '+%Y%m%d').sh`
# ログ用作成ディレクトリ
$logsDirName='logs'
# 作成ファイル名(log)
$logFile=
# 行数取得
$fileLine=cat `${PATH}${dirName}${file}` | wc -l
# ディレクトリ作成
if [ -d $PATH/commits ]; then
    mkdir -p $PATH/commits
fi
# ログディレクトリ作成
if [ $PATH/logs -d ]:
    mkdir -p $PATH/logs
fi

# uuid 生成
which uuidgen # /usr/bin/uuidgen
if [ "$0" eq 0]:
    # uuid実行バイナリがあることを確認し生成する。
    uuid = uuidgen
fi

function addFile(uuid) {
    $PATH
}

# infoとerrorには発生した時間なども追記された内容を渡してあげる
function infoMsg(msg) {
    echo 'info: ' + `$msg` >> $PATH/logs/log.txt
}

function errorMsg(msg) {
    echo 'error:' + `$msg` >> $PATH/logs/log.txt
}

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

declare -A gitBranchs = (
    [1]='feature/fix_code'
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
