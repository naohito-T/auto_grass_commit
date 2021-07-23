#!/bin/bash

#
# config
# writeOneLine : ファイルに書き込む内容
# commitMsgs : commitする際のmessage
# commitWeeks : 各曜日ごとのcommit回数
#

# 曜日と回数の連想配列 settings
declare -A commitWeeks=(
    [1]="5"
    [2]="5"
    [3]="5"
    [4]="5"
    [5]="5"
    [6]="5"
    [7]="5"
)

# 配列
writeOneLines=(
    [0]="fix code${uuid}"
    [1]="fix code${uuid}"
    [2]="fix code${uuid}"
    [3]="fix code${uuid}"
    [4]="fix code${uuid}"
    [5]="fix code${uuid}"
    [6]="fix code${uuid}"
)

# commit message settings (連想配列)
commitMsgs=(
    [0]="feature/fix_code_shell${uuid}"
    [1]="feature/fix_code_shell${uuid}"
    [2]="feature/fix_code_shell${uuid}"
    [3]="feature/fix_code_shell${uuid}"
    [4]="feature/fix_code_shell${uuid}"
    [5]="feature/fix_code_shell${uuid}"
    [6]="feature/fix_code_shell${uuid}"
)
