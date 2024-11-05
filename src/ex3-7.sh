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

# 5개 이상의 파일을 해당 폴더에 생성
echo "$folder_name 폴더에 새로운 파일 5개를 생성합니다."
for i in {1..5}; do
    file_path="$folder_name/file$i.txt"
    touch "$file_path"
    echo "file$i.txt 생성 완료."
    
    # 파일 이름과 동일한 하위 폴더 생성
    subfolder="$folder_name/file$i"
    mkdir "$subfolder"
    echo "$subfolder 폴더 생성 완료."

    # 하위 폴더에 해당 파일의 심볼릭 링크 생성
    ln -s "../file$i.txt" "$subfolder/file$i.txt"
    echo "$subfolder 폴더에 file$i.txt에 대한 링크 생성 완료."
done

echo "모든 작업이 완료되었습니다."
