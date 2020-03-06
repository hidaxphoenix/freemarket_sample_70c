# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



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
|price|integer|null: false|
|ship_charge|string|null: false|
|ship_area|string|null: false|
|ship_date|string|null: false|
|ship_method|string|null: false|
|user_id|integer|null :false,foreign_key: true|
|bland_id|integer|null :false,foreign_key: true|
|category_id|integer|null :false,foreign_key: true|
|image_id|integer|null: false,foreign_key: true|

### Association
has_one conditions
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


## user_trade

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


##category

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false|
|ancestry|text|null: false|

### Association
has_many items


## brand

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false|

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