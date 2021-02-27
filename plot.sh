#!/bin/bash
# ヒアドキュメント(<<- EOFから始まってEOFで終わるコード)を使ってgnuplot用のスクリプトを直接gnuplotに実行してもらう
gnuplot <<EOF
#Y軸のグリッド線を入れる
#set grid y

#凡例の位置(center, left, right, outside, top, bottom等)
set key outside

#xy軸のラベル設定
set xlabel "hoge"
set ylabel "fuga"
#図のタイトル
set title "title hogefuga"

#xy軸のグラフ範囲の設定
set xr[-1:1]    #-1<=x<=1
set yr[-1:1]    #-1<=y<=1

#軸メモリ設定
set xtics 0.2    #0.2ごとに主目盛りを入れる
set mxtics 5    #主目盛り間を5等分するように副目盛りを入れる
set ytics 0.2    #0.2ごとに主目盛りを入れる
set mytics 5    #主目盛り間を5等分するように副目盛りを入れる
set tics font "Arial, 10"    #目盛りの数字のフォントをArial、サイズを24

#グラフのアスペクト比の設定
set size square

#png画像を作る場合
set terminal png
#出力先のファイル指定(相対パス)
set output "./sample.png"

# プロットデータからグラフ生成
# 基本:plot "filename" with 描画スタイル オプション
# withの後に続く描画スタイルの指定(必須)でグラフの種類が決まる
# with lp(linespoints)
# title:凡例名
# plot sin(x) with lp title "foobar"
# plot sin(x)
# plot "./test.txt"
# ps 数値でマーカポイントサイズの設定

plot "./test.txt" ps 0.5,"./test2.txt" ps 0.5
EOF
#EOFのあとにはLF必要のよう