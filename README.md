# README

# freemarket_sample_70c

# 概要

フリマアプリ「メルカリ」のクローンサイト。誰でも簡単に売り買いが楽しめるフリマアプリの機能を再現したページ。 ユーザー登録、商品出品、商品購入などの機能が再現されていますが、実際の取引はできません。

haml/SASS記法と、命名規則BEMを使ったマークアップ
ウィザード形式を用いたユーザー登録フォーム
SNS認証による新規登録、ログイン
ajaxを使用した非同期処理
pay.jpによる購入処理
capistranoによるAWS EC2への自動デプロイ
ActiveStorageを使用しAWS S3への画像アップロード
RSpecを使った単体テスト


# 本番環境(デプロイ先 テストアカウント＆ID)

* デプロイ先

http://18.178.147.81/

* テストアカウント

ID/Pass
ID: teamc
Pass: 1111

購入者用
test2@test2
ttttttt

購入用カード情報
番号：4242424242424242
期限：2月2023年
セキュリティコード：432

出品者用
メールアドレス名: test@test
パスワード: ttttttt


テストアカウントを使用してログインしてください。


# DEMO
* TOPページ


* ユーザー登録・ログイン機能


* 投稿一覧ページ


* 検索機能


* 新規投稿


# 工夫したポイント
ユーザーの方が、使いやすいようにviewの綺麗さをこだわりました。
また、

# 使用技術(開発環境)
Ruby・Ruby on Rails・JavaScript・jQuery・GitHub・AWS


#  DB設計


## usersテーブル

|Column|Type|Option|
|-------|-----|-------|
|nickname|string|null: false|
|email|string|null: false|(unique)
|password|string|null: false|(min7)
|first_name|string|null: false|(全角)
|last_name|string|null: false|(全角)
|first_name_kana|string|null: false|(全角)
|last_name_kana|string|null: false|(全角)
|phone|integer|null: false|
|birthday|integer|null :false|

### Association
has_one user_addresses
has_many cards
has_one user_trades
has_many items


## itemsテーブル

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false, limit: 40|
|description|text|null: false, limit: 1000|
|condition|string|null: false|
|price|integer|null: false|
|ship_charge|string|null: false|
|ship_area|string|null: false|
|ship_date|string|null: false|
|ship_method|string|null: false|
|user_id|integer|null :false,foreign_key: true|
|brand_id|integer|null :false,foreign_key: true|
|category_id|integer|null :false,foreign_key: true|
|image_id|integer|null: false,foreign_key: true|

### Association
has_one condition
belongs_to category
belongs_to brand
has_one user_trades
has_many images
belongs_to user
has_many histories


## user_addressテーブル

|Column|Type|Option|
|-------|-----|-------|
|postcode|string|null: false|
|address_prefecture|string|null: false|
|address_city|string|null: false|
|address_block|string|null: false|
|address_building|string|null: false|
|buy_tell|integer||
|user_id|integer|null: false,foreign_key: true|

### Association 
belongs_to user


## card

|Column|Type|Option|
|-------|-----|-------|
|user_id|integer|null: false,foreign_key: true|
|number|integer|null: false|
|name|string|null: false|
|type|string|null: false|
|limit_month|integer|null: false|
|limit_year|integer|null: false|
|security|integer|null: false|

### Association
belongs_to user


## trade

|Column|Type|Option|
|-------|-----|-------|
|user_id|integer|null: false,foreign_key: true|
|item_id|integer|null: false,foreign_key: true|

### Association
belongs_to item
belongs_to  user


## condition

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false|
|item_id|integer|null: false,foreign_key: true|

### Association
belongs_to item


### category

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false|
|ancestry|text|null: false|

### Association
has_many items


## brand

|Column|Type|Option|
|-------|-----|-------|
|name|string|

### Association
has_many items


## image

|Column|Type|Option|
|-------|-----|-------|
|image|text|null: false|
|item_id|integer|null :false,foreign_key: true|

### Association
belongs_to item


## history

|Column|Type|Option|
|-------|-----|-------|
|item_id|integer|null :false,foreign_key: true|

### association
belings_to item