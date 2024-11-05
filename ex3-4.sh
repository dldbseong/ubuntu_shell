#!/bin/bash
echo "리눅스가 재미있나요? (yes/no)"
read answer

case "$answer" in
    "yes" | "Y" | "y" )
        echo "yes"
        ;;
    "no" | "N" | "n" )
        echo "no"
        ;;
    * )
        echo "yes or no로 입력해주세요."
        ;;
esac

