# README

# freemarket_sample_70c

# 概要

フリマアプリ「メルカリ」のクローンサイト。誰でも簡単に売り買いが楽しめるフリマアプリの機能を再現したページ。 ユーザー登録、商品出品、商品購入などの機能が再現されていますが、実際の取引はできません。

* haml/SASS記法と、命名規則BEMを使ったマークアップ
* ウィザード形式を用いたユーザー登録フォーム
* SNS認証による新規登録、ログイン
* ajaxを使用した非同期処理
* pay.jpによる購入処理
* capistranoによるAWS EC2への自動デプロイ
* ActiveStorageを使用しAWS S3への画像アップロード
* RSpecを使った単体テスト


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
[![Image from Gyazo](https://i.gyazo.com/1e560dc2ac8672fcdc50cca82c66cf2d.jpg)](https://gyazo.com/1e560dc2ac8672fcdc50cca82c66cf2d)


* ユーザー登録・ログイン機能
[![Image from Gyazo](https://i.gyazo.com/0d9bae7d539760974216e1ec28c13596.png)](https://gyazo.com/0d9bae7d539760974216e1ec28c13596)
[![Image from Gyazo](https://i.gyazo.com/eb0e2ec7f1a1e1292d261de27ab38352.png)](https://gyazo.com/eb0e2ec7f1a1e1292d261de27ab38352)


* 出品ページ
[![Image from Gyazo](https://i.gyazo.com/a1118a1f24c8a5ff11ecc561eeec1431.png)](https://gyazo.com/a1118a1f24c8a5ff11ecc561eeec1431)


* 商品詳細ページ
[![Image from Gyazo](https://i.gyazo.com/8860f085e3f4e5e381f2f21168dd3405.png)](https://gyazo.com/8860f085e3f4e5e381f2f21168dd3405)


* 編集・削除機能、コメント機能、いいね！機能
[![Image from Gyazo](https://i.gyazo.com/cdc10411221eccc84b21108077a742c2.png)](https://gyazo.com/cdc10411221eccc84b21108077a742c2)


* ユーザーマイページ
[![Image from Gyazo](https://i.gyazo.com/4245315fff2fecd4a3a559cb1a69d92a.png)](https://gyazo.com/4245315fff2fecd4a3a559cb1a69d92a)


* 購入機能
[![Image from Gyazo](https://i.gyazo.com/6cc6f7001eb74d6ed3e995dcc0051489.png)](https://gyazo.com/6cc6f7001eb74d6ed3e995dcc0051489)
[![Image from Gyazo](https://i.gyazo.com/59b940ed75d8f194fd2007acf479efa3.png)](https://gyazo.com/59b940ed75d8f194fd2007acf479efa3)


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