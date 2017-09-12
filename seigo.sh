<<coment
◯×問題解を解答し、表示するプログラム
coment
#!/bin/bash
ad=`pwd`;cd;cd Desktop
#問題番号の変数count
count=1


read -p "作成するファイルの名前 :" file

echo "回答" > "mondai"$file
echo "問題を開始"
echo "[ ○)1, ×)2, 分からない)3, 終了)q ]"

while :
do
    read -p $count" :" res
    until [ $res = "1" -o $res = "2" -o $res = "3" -o $res = "q" ]; do
        read -p $count" :" res
    done
    
    case $res in
    1) echo $count":○" >> "mondai"$file;count=`expr $count + 1`;;
    2) echo $count":×" >> "mondai"$file;count=`expr $count + 1`;;
    3) echo $count":-">> "mondai"$file;count=`expr $count + 1`;;
    q) echo 終了;count=1;break;;
    esac
done


read -p "解答ファイルはありますか? [y or n]" hantei
until [ $hantei = "y" -o $hantei = "n" ];do
    read -p "解答ファイルはありますか? [y or n]" hantei
done

if [ $hantei = "y" -o $hantei = "y" ]; then
    read -p "解答ファイルを貼り付け" res
    paste "mondai"$file $res > $file;rm "mondai"$file
else
    echo "解答ファイルを作成します"
    echo "解答を入力"
    echo "解答" > "seikai"$file
    echo "[ ○)1, ×)2, 終了)q ]"
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
    paste "mondai"$file "seikai"$file > $file;rm "mondai"$file
fi


open $file
cd;cd $ad