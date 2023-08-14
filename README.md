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

## items テーブル

| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| image               |            | null: false                    | ## 商品画像
| description         | text       | null: false                    | ## 商品の説明
| category_id         | integer    | null: false                    | ## カテゴリー
| shipping            | references | null: false, foreign_key: true | ## 配送
| shipping_charges_id | integer    | null: false, foreign_key: true | ## 配送料
| region_of_origin_id | integer    | null: false                    | ## 発送元の地域
| item_status_id      | integer    | null: false                    | ## 商品の状態
| name	              | string     | null: false                    | ## 商品名
| price	              | string     | null: false                    | ## 販売価格
| days_to_ship_id     | integer    | null: false                    | ## 発送までの日数 

## orders テーブル

| Column	    | Type	     | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

