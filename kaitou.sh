#◯×問題解の解答を作成するプログラム
#!/bin/bash
ad=`pwd`;cd;cd Desktop
count=1
read -p "作成するファイル名" file
echo "解答ファイルを作成します"
echo "解答を入力"
echo "解答" > "seikai"$file
echo "[ ○)1, ×)2 ]終わったらqを入力"
while :
do
    read -p $count" :" res
    until [ $res = "1" -o $res = "2" -o $res = "q" ]; do
        read -p $count" :" res
    done
    case $res in
    1) count=`expr $count + 1`;echo ○ >> "seikai"$file;;
    2) echo × >> "seikai"$file;count=`expr $count + 1`;;
    q) echo 終了;count=1;break;;
    esac
done
cd;cd $ad