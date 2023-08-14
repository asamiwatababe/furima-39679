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

# テーブル設計

## users テーブル

| Column                       | Type     | Options                   |
| ---------------------------- | -------- | ------------------------- |
| nickname                     | string   | null: false               |
| first_name	               | string   | null: false               |
| last_name	                   | string   | null: false               |
| first_name_kana	           | string	  | null: false               |
| last_name_kana               | string   |	null: false               |
| birth_day	                   | date     | null: false               |
| email                        | string   | null: false, unique: true | 
| encrypted_password           | string   | null: false               |
### Association
-has_many :items
-has_many :orders
-has_one :deliver_adresses

## items テーブル

| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true | ## user
| description         | text       | null: false                    | ## 商品の説明
| category_id         | integer    | null: false, foreign_key: true | ## カテゴリー
| item_status_id      | integer    | null: false                    | ## 商品の状態
| name	              | string     | null: false                    | ## 商品名
| shipping_charge_id  | integer    | null: false, foreign_key: true | ## 配送料
| prefecture_id       | integer    | null: false                    | ## 発送元の地域
| price	              | integer    | null: false                    | ## 販売価格
| day_to_ship_id      | integer    | null: false                    | ## 発送までの日数 
### Association
-belongs_to :user
-has_one :order


## orders テーブル

| Column	    | Type	     | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |
## Association
-belongs_to :user
-belongs_to :item


## deliver_adressesテーブル

| Column	       | Type	    | Options                        |
| ---------------- | ---------- | ------------------------------ |
| order_id         | references | null: false, unique: true      |
| zip_code         | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| telephone        | string     | null: false                    |
| street           | string     | null: false                    |
| building_name    | string     |                    
### Association
-belongs_to :order


## mistake
## | shipping            | references | null: false, foreign_key: true | ## 配送
## | shipping_charges_id | integer    | null: false, foreign_key: true | ## 配送料
## | region_of_origin_id | integer    | null: false                    | ## 発送元の地域