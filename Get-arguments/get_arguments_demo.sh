#!/bin/bash

### helpを出力 ###
function usage {
  cat <<EOM
Usage: $(basename "$0") [OPTION]...
  -h          Display help
  -a VALUE    A explanation for arg called a
  -b VALUE    A explanation for arg called b
  -c VALUE    A explanation for arg called c
  -d VALUE    A explanation for arg called d
EOM
  exit 1
}

### メイン処理 ###
# 引数を取る指定は「-」のみ
while getopts foh-: opt; do
  # OPTIND 番目の引数を「optarg」へ代入
  optarg="${!OPTIND}"
  # オプションと引数の空白行を禁止
  if [ -z "$optarg" ]; then
    usage
  fi
  if [ ${optarg:0:1} = "-" ]; then
    usage
  fi
  # ロングオプション用に整形
  [[ "$opt" = - ]] && opt="-$OPTARG"
  # 引数を取得
  case "-$opt" in
    -f|--file)
      Massage+="$optarg"
      shift
      ;;
    -o|--output)
      Massage+="$optarg"
      shift
      ;;
    -h|--help|* )
      usage
      ;;
  esac
done
shift $((OPTIND - 1))
# 取得した引数を出力
if [ -n "$Massage" ]; then
  echo $Massage
else
  usage
fi