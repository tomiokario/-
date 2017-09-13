<<coment
◯×問題解を解答し、表示するプログラム
coment
#!/bin/bash
ad=`pwd`;cd;cd Desktop
#問題番号の変数count
count=1


read -p "作成するファイルの名前 :" file

list[0]="回答"
echo "問題を開始"
echo "[ ○)1, ×)2, 分からない)3, 戻る)b, 終了)q ]"

while :
do
    read -p $count" :" res
    until [ $res = "1" -o $res = "2" -o $res = "3" -o $res = "q" -o $res = "b" ]; do
        read -p $count" :" res
    done
    
    case $res in
    1) list[$count]="○";count=`expr $count + 1`;;
    2) list[$count]="×";count=`expr $count + 1`;;
    3) list[$count]="-";count=`expr $count + 1`;;
    b) count=`expr $count - 1`;;
    q) echo ;lnum=$count;count=1;break;;
    esac
done



#解答ファイルが読み込めない
echo "現在解答ファイルは使えません"
echo
read -p "解答ファイルはありますか? [y or n]" hantei
#              y -> n
until [ $hantei = "n" -o $hantei = "n" ];do
    read -p "解答ファイルはありますか? [y or n]" hantei
done



if [ $hantei = "y" ]; then
    read -p "解答ファイルを貼り付け" res
    i=0
    while read line; do
        line2[$i]=`echo $line`
        i=`expr $i + 1`
    done < $res
    i=0
    for i in `seq $lnum`;do
        echo ${line2[`expr $i - 1`]}
    done
else
    echo "解答ファイルを作成します"
    echo "解答を入力"
    list2[0]="解答"
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
fi

echo > $file
echo ${list[0]}" 　　　"${list2[0]} >> $file
for ((i=1;i<$lnum;i++));do
    if [ ${list[$i]} != ${list2[$i]} ];then
        echo "不正解"$i":"${list[$i]}" "${list2[$i]} >> $file
        echo $i
    else
        echo $i":"${list[$i]}" 　　　"${list2[$i]} >> $file
    fi
done


open $file
cd;cd $ad