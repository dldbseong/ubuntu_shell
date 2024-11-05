#!/bin/bash

# 사용자에게 폴더 이름을 입력받음
echo "폴더 이름을 입력하세요:"
read folder_name

# 폴더가 있는지 확인하고 없으면 생성
if [ ! -d "$folder_name" ]; then
    echo "$folder_name 폴더가 존재하지 않아 새로 생성합니다."
    mkdir "$folder_name"
else
    echo "$folder_name 폴더가 이미 존재합니다."
fi

# 새로운 파일 5개를 생성
echo "$folder_name 폴더에 새로운 파일 5개를 생성합니다."
for i in {1..5}; do
    touch "$folder_name/file$i.txt"
    echo "file$i.txt 생성 완료."
done

# 파일을 압축
echo "파일을 압축합니다."
tar -czf "$folder_name.tar.gz" "$folder_name"

# 압축을 풀 폴더 생성
extract_folder="${folder_name}_extracted"
mkdir "$extract_folder"

# 압축 해제
echo "압축을 $extract_folder 폴더에 해제합니다."
tar -xzf "$folder_name.tar.gz" -C "$extract_folder"

echo "모든 작업이 완료되었습니다."
