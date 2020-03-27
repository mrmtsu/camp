# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# TITLE
* CANP

# OVERVIEW
- 新規登録、ログイン
<br>
- 画像投稿
<br>
- コメント
<br>
- 検索（投稿）
<br>
- いいね
<br>
- フォロー
<br>
- お気に入り
<br>
- 位置情報（google map)

# ID
- http://3.115.248.162/

# PRODUCTION BACKGROUND
- キャンプをしてみたい・始めてみたいけどどうしたらいいかわからない。
- キャンプの情報を発信している人を見つける・発見するのが手間。
- 雑誌だと約１ヶ月ごとにしか情報を得られない。（バックグランドもあまり書店に置いていない）
- キャンプに関するサイトが実際にあるが、サイトを開くとおすすめ商品がいきなり出て来るため、見るきにならない。
  <%br>
  ↑↑
  <%br>
- キャンプをしている人が実際にどんな感じで行なっているか写真で投稿するアプリ
- キャンプに関する情報を一つに集約
- ユーザーが自由に投稿でき、自由に閲覧することができ、どのようにキャンプをしているのか参考になる。（古い記事をいつでも見ることができる）
- ユーザー投稿がメインのため、企業の押し付け感がなく信用性が上がる。

# DEMO
- 

# INGENUITY
- 条件分岐を用いたこと。ログインしているユーザー、フォローをすることでそれぞれブラウザに上がってくる情報を変更しました。
- viewの統一感


* Ruby version
- 2.5.1
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|avatar|string||
### Association
- has_many :posts
- has_many :comments

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user
