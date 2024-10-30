#!/bin/bash
weight=$1
height=$2
height2=$(echo "scale=2; $height / 100" | bc)
bmi=$(echo "scale=2; $weight/ ($height2 * $height2)" | bc)
echo "당신의 BMI는 $bmi"

if (( $(echo "$bmi >= 18.5" | bc -1) )) && (( $(echo "$bmi < 23" | bc -1) )); then
    echo "정상체중입니다."
else
    echo "정상체중이아닙니다."


fi





