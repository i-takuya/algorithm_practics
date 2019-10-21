## 概要

https://techdevguide.withgoogle.com/paths/foundational/find-longest-word-in-dictionary-that-subsequence-of-given-string/#!
これの計算量がO(N + L * logN)の場合のコード(のつもり)
Nは与えられた文字列Sの文字数でLは辞書内のワードの合計文字数。
最初のNでMAP化、後は辞書内の文字ごとにbinary searchでindexを渡したとき、直前の文字Xのindexより大きい最小のindexを探している。
