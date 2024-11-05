#!/bin/bash

# 파일 이름 정의
DB_FILE="DB.txt"

# 팀원 정보 추가
add_member() {
    echo "$1 $2" >> "$DB_FILE"
    echo "팀원의 정보가 추가되었습니다: $1 $2"
}

# 팀원 정보 검색
search_member() {
    grep -i "^$1 " "$DB_FILE" | while read -r line; do
        if [[ -n "$line" ]]; then
            echo "팀원 정보: $line"
        else
            echo "해당 팀원의 정보를 찾을 수 없습니다."
        fi
    done
}

# 사용법 안내
if [[ "$#" -lt 2 ]]; then
    echo "사용법: $0 add <이름> <전화번호/생일>"
    echo "또는: $0 search <이름>"
    exit 1
fi

# 첫 번째 인자에 따라 기능 결정
case "$1" in
    add)
        if [[ "$#" -ne 3 ]]; then
            echo "추가하려면 이름과 전화번호 또는 생일을 입력하세요."
            echo "예시: $0 add Park 010-XXXX-XXXX"
            exit 1
        fi
        add_member "$2" "$3"
        ;;
    search)
        if [[ "$#" -ne 2 ]]; then
            echo "검색하려면 이름을 입력하세요."
            echo "예시: $0 search Park"
            exit 1
        fi
        search_member "$2"
        ;;
    *)
        echo "잘못된 명령어입니다. add 또는 search를 사용하세요."
        exit 1
        ;;
esac
