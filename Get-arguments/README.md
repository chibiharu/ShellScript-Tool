## ScriptTitle：Get-arguments
getoptsでコマンドの引数を取得するsh(ショートオプションとロングオプション対応)

## リソース説明
- README.md
本書
- get_arguments_demo.sh
メインスクリプト

## 機能
- ショートオプションとロングオプションの両方に対応

## sh実行例
スクリプトの実行例を下記に記載する。

### 実行例

```bash:実行例
$ ./get_arguments_demo.sh -s HelloWorld
STRING=HelloWorld

$ ./get_arguments_demo.sh -s HelloWorld -n 100                                
STRING=HelloWorld
NUMBER=100

$ ./get_arguments_demo.sh --string HelloWorld
STRING=HelloWorld

$ ./get_arguments_demo.sh --string HelloWorld --num 100
STRING=HelloWorld
NUMBER=100

$ ./get_arguments_demo.sh -s HelloWorld --num 100                              
STRING=HelloWorld
NUMBER=100
```
## エラー出力
基本的にはエラー時は用意したhelp処理を出力させます。
※shの組み込みエラーは、2>/dev/nullに飛ばします

```bash:エラーパターン
# 未知のオプション、及び引数を指定した場合
$ ./get_arguments_demo.sh -a HelloWorld
$ ./get_arguments_demo.sh --stringg HelloWorld
$ ./get_arguments_demo.sh -
$ ./get_arguments_demo.sh abc
# オプションと引数の間を詰めた場合
$ ./get_arguments_demo.sh -sHelloWorld
$ ./get_arguments_demo.sh --num100
# オプション、及び引数を指定しない場合
$ ./get_arguments_demo.sh
# -h/--helpオプションを指定した場合
$ ./get_arguments_demo.sh -h
$ ./get_arguments_demo.sh --help
```

↓ 上記コマンドを実行した場合、下記エラーを出力

```bash:エラー出力
Usage: get_arguments_demo.sh [OPTION]...
  -h/--help   -       Display help
  -s/--string VALUE   output the character string argument
  -n/--num    VALUE   output the character number argument
  
hint: Do not put a space between the option and the argument.
hint: You can specify more than one of the same option.
hint: Correct execution example.

  get_arguments_demo.sh [OPTION] [ARGMENT]

```

***
## 参照
- [【bash】getoptsでコマンドの引数を取得するsh(ショートオプションとロングオプション対応)](https://qiita.com/chibiharu/items/6272501af6b3a04a3b84#31-%E5%AE%9F%E8%A1%8C%E4%BE%8B)
