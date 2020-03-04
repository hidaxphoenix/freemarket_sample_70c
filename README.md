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
|f_first_name|string|null: false|(全角)
|f_last_name|string|null: false|(全角)
|b_year_id|integer|null: false,foreign_key: true|
|b_month_id|integer|null: false,foreign_key: true|
|b_day_id|integer|null: false,foreign_key: true|
|tel|integer|null: false|
|user_trade_id|integer|null :false,foreign_key: true|
|card_id|integer|null: false,foreign_key: true|

### Association
has_one user_addresses
has_one b_years
has_one b_months
has_one b_days
has_many cards
has_one user_trades


## itemsテーブル

|Column|Type|Option|
|-------|-----|-------|
|image|text|null: false, |
|item_name|string|null: false, limit: 40|
|description|text|null: false, limit: 1000|
|condition_id|integer|null: false,foreign_key: true|
|ship_charge_id|integer|null: false|
|ship_area_id|integer|null: false,foreign_key: true|
|ship_date_id|integer|null: false,foreign_key: true|
|ship_method_id|integer|null: false|
|price|integer|null: false|
|user_trade_id|integer|null: false,foreign_key: true|

### Association
has_one ship_charges
has_one ship_areas
has_one ship_dates
has_one ship_methods
has_one conditions
belongs_to category_one
belongs_to brand
has_one user_trades


## user_addressテーブル

|Column|Type|Option|
|-------|-----|-------|
|postcode|string|null: false|
|address_one|string|null: false|
|address_two|string|null: false|
|address_three|string|null: false|
|address_four|string|null: false|
|buy_tell|integer||

### Association 
belongs_to user


## b_year

|Column|Type|Option|
|-------|-----|-------|
|year|integer|null: false|

### Association
belongs_to user


## b_month

|Column|Type|Option|
|-------|-----|-------|
|month|integer|null: false|

### Association
belongs_to user


## b_day

|Column|Type|Option|
|-------|-----|-------|
|day|integer|null: false|

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


##ship_charge

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false|

### Association
belongs_to item 


##ship_area

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false|

### Association
belongs_to item


##ship_date

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false|

### Association
belongs_to item


## ship_method_id

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false|

###  Association
belongs_to item


##condition

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false|

### Association
belongs_to item


##category_one

|Column|Type|Option|
|-------|-----|-------|
|name|string|null:false|
|item_id|integer|null: false,foreign_key: true|

### Association
has_many items
has_many category_twos


##category_two

|Column|Type|Option|
|-------|-----|-------|
|name|string|null:false|
|category_one_id|integer|null: false,foreign_key: true|
### Association
belongs_to category_one
Has_many category_threes


##category_three

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false|
|category_two_id|integer|null: false,foreign_key: true|

### Association
Belongs_to category_twe


## brand

|Column|Type|Option|
|-------|-----|-------|
|name|string|null: false|
|item_id|integer|null :false,foreign_key: true|

### Association
has_many items