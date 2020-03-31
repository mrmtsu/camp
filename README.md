# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# TITLE
CANP

# OVERVIEW
- 新規登録、ログイン
- 画像投稿
- コメント
- 検索（投稿画像）
- いいね機能
- フォロー、フォローワー機能
- お気に入り機能
- 位置情報（google map)

# ER図
  ![image](https://user-images.githubusercontent.com/60598010/77984940-006ce000-734e-11ea-8f77-07ac585916be.png)

# ID
- http://3.115.248.162/

# PRODUCTION BACKGROUND
- キャンプをしてみたい・始めてみたいけどどうしたらいいかわからない。
- キャンプの情報を発信している人を見つける・発見するのが手間。
- 雑誌だと約１ヶ月ごとにしか情報を得られない。（バックグランドもあまり書店に置いていない）
- キャンプに関するサイトが実際にあるが、サイトを開くとおすすめ商品がいきなり出て来るため、見るきにならない。
  <br>
  ↑↑
  <br>
- キャンプをしている人が実際にどんな感じで行なっているか写真を投稿するアプリ
- キャンプに関する情報を一つに集約
- ユーザーが自由に投稿、閲覧でき、どのようにキャンプをしているのか参考になる。
- 古い投稿もいつでも見ることができる
- ユーザー投稿が主体のアプリとなるため、企業の押し付け感がなく情報の信用性が上がる。

# DEMO
- トップページ
  ![image](https://user-images.githubusercontent.com/60598010/77853499-5bec8000-721f-11ea-82a5-c9e49523fe62.png)
  <br>
  <br>
- 投稿詳細画面
  ![image](https://user-images.githubusercontent.com/60598010/77854360-d66bce80-7224-11ea-8614-3d2ff1d65a05.png)
  <br>
  <br>
- コメント画面
  ![image](https://user-images.githubusercontent.com/60598010/77854421-4bd79f00-7225-11ea-9499-cf2e87da11cb.png)
  <br>
  <br>
- 位置情報画面
  ![image](https://user-images.githubusercontent.com/60598010/77854527-e0420180-7225-11ea-896e-24f631be031b.png)

# INGENUITY
- 条件分岐を用いたこと。ログインしているユーザー、フォローをすることでそれぞれブラウザに上がってくる情報を変更した点。
- viewの統一感

# 今後実装したい機能
- 投稿画像に紐づいた商品情報
- 商品購入機能
- 特集記事（キャンプグルメやキャンプ場など）
- 地名でも検索できるようにすること
- 動画投稿

* Ruby version
2.5.1
* System dependencies
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
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
- has_many :favorites
- has_many :bookmarks


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text||
|address|string||
|latitude|float||
|longitude|float||
|user|references|foreign_key: true|
### Association
- belongs_to :user
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user|references|foreign_key: true|
|post|references|foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user

## hashtags_postsテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|integer||
|hashtag_id|integer||
### Association
- belongs_to :post
- belongs_to :hashtag

## hashtagsテーブル
|Column|Type|Options|
|------|----|-------|
|hashname|string||
### Association
- belongs_to :hashtags_post

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|post|references|null: false|
### Association
- belongs_to :post
- belongs_to :user

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association

## bookmarksテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|post|references|foreign_key: true|
### Association
- belongs_to :post
- belongs_to :user