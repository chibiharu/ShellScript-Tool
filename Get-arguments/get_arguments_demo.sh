#!/bin/bash

### Function:help&エラー出力 ###
function usage {
  cat <<EOM
Usage: $(basename "$0") [OPTION]...
  -h/--help   -       Display help
  -s/--string VALUE   output the character string argument
  -n/--num    VALUE   output the character number argument
  
hint: Do not put a space between the option and the argument.
hint: You can specify more than one of the same option.
hint: Correct execution example.

  $(basename "$0") [OPTION] [ARGMENT]

EOM
  exit 1
}

### メイン処理 ###
# i=0:処理が実行されなかった
# i=1:処理が実行された
i=0
# 引数を取る指定は「-」のみ
while getopts snh-: opt; do
  # 処理が開始したことを確認
  export i=1
  # OPTIND 番目の引数を「optarg」へ代入
  optarg="${!OPTIND}"
  # オプションと引数の間の空白行を禁止する
  if [ -z "$optarg" ];then usage ;fi
  if [ ${optarg:0:1} = "-" ];then usage ;fi
  # ロングオプション用に整形
  [[ "$opt" = - ]] && opt="-$OPTARG"
  # 引数を取得
  case "-$opt" in
    -s|--string)
      string="STRING=$optarg"
      shift
      echo $string
      ;;
    -n|--num)
      num="NUMBER=$optarg"
      echo $num
      shift
      ;;
    -h|--help|*)
      usage
      ;;
  esac
done 2>/dev/null
# オプションをすべて削除し、引数だけ残す
shift $((OPTIND - 1))
# 正しい引数が指定されているか判定
if [ $i -ne 1 ];then usage unset i; else unset i;fi