#◯×問題解の解答を作成するプログラム
#!/bin/bash
ad=`pwd`;cd;cd Desktop

echo "解答ファイルを作成します"
read -p "ファイル名を入力:" file
echo "解答を入力"
list2[0]="解答"
count=1
echo "[ ○)1, ×)2, 戻る)b, 終了)q ]"
while :
do
    read -p $count" :" res
    until [ $res = "1" -o $res = "2" -o $res = "q" -o $res = "b" ]; do
        read -p $count" :" res
    done
    case $res in
        1) list2[$count]="○";count=`expr $count + 1`;;
        2) list2[$count]="×";count=`expr $count + 1`;;
        b) count=`expr $count - 1`;;
        q) echo 終了;lnum=$count;break;;
    esac
done
echo ${list2[0]} > "seikai"$file
for i in `seq $lnum` ;do
    echo ${list2[i]} >> "seikai"$file
done
cd;cd $ad