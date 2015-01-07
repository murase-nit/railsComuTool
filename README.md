# railsComuTool
~~railsで作成する掲示板プログラム~~

railsでコミュニケーションツール

# 作成予定プログラム
## ver1.0.0
必要最小限のプログラム
* 部屋名一覧の表示
* 部屋作成フォーム
* 部屋名をクリックしてその中での会話を表示する
* 発言フォーム

### データベースの設計
* 部屋テーブル(rooms)

|col_name|type|description|
|:----|:-----|:------|
|id|int|部屋ID|
|name|string|部屋名|

* 部屋内のコメントなどのテーブル(roomComments)

|col_name|type|description|
|:----|:--|:---|
|id|int|コメントID|
|rooms_id|int|部屋テーブルのID(FK)|
|offset|int|投稿されたコメントの順番|
|comment|string|投稿されたコメント|


# メモ欄
## ほしい機能
* 指定のユーザが投稿したデータを抽出
* ユーザ一覧とそのユーザがアクティブかどうか
* ユーザ名なし（名無し）可能であるが，それぞれの名無しの識別ができる
* IPアドレスでユーザ名の識別
* クッキーでユーザ情報を判定
* セッションでアクティブかどうかの判定
* リアルタイムにコメントの反映
* ユーザ権限と管理者権限

## 画面設計
* index画面
  * 部屋一覧画面(左)
  * indexページ(右)
* 部屋名クリック後の画面
  * 部屋一覧(左側の画面)
  * 各部屋内部画面(右側の画面)
    * 各部屋内のコメント

## データベースの設計
* 部屋テーブル(rooms)

|col_name|type|description|
|:--------|:-----|:----------|
|id|int|部屋ID|
|name|string|部屋名|
|inpulse|double|勢い(過去一定時間内にコメントの数)|

* 部屋内のコメントなどのテーブル(roomComments)

|col_name|type|description|
|:--------|:-----|:----------|
|id|int|コメントID|
|rooms_id|int|部屋テーブルのID(FK)|
|user_id|int|ユーザのID(FK)|
|offset|int|投稿されたコメントの順番|
|comment|string|投稿されたコメント|


* ユーザテーブル

|col_name|type|description|
|:--------|:-----|:----------|
|id|int|ユーザID|
|user_name|string|ユーザ名(名無しユーザは”名無し+(識別子)”見たいな感じ)|
|active|boolean|そのユーザがアクティブかどうか|
|availableSpan||ユーザの有効期限(名無しユーザの数を減らすため)|
|その他ユーザ情報|||

アクティブユーザリストテーブル(名無しも識別)

|col_name|type|description|
|:--------|:-----|:----------|
|id|int|id|
|rooms_id|||
|user_id|||
|timeSpan||アクティブである有効期限|

# 開発環境
* Ruby 2.0.0p353 (2013-11-22)
* Rails 4.1.8
* DBMS 未定(SQLite or PostgrSQL or MySQL)
* web server 未定(webrick or Apache or nginx)

## その他開発環境、ツール
* windows 7
* sublime text3
* ConEmu, nyaos
* Git, GitHub, SourceTree, Git Flow
* Google Chrome

