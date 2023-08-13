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

| Column                       | Type     | Options     |
| ---------------------------- | -------- | ----------- |
| nickname                     | string   | null: false |
| first_name	               | string   | null: false |
| last_name	                   | string   | null: false |
| first_name_kana	           | string	  | null: false |
| last_name_kana               | string   |	null: false |
| birth_day	                   | string   | null: false |
| email                        | string   | null: false |
| encrypted_password           | string   | null: false |

## items テーブル

| Column         | Type       | Options               |
| ---------------| ---------- | --------------------- |
| category_id    | references |	null: false, FK: true |
| shipping_id    | references |	null: false. FK: true |
| brand_id       | references |	null: false. FK: true |
| seller_user_id | references |	null: false, FK: true |
| name	         | string     |	null: false           |
| text	         | text	      | null: false           |
| condition      | integer	  | null: false           |
| price	         | integer	  | null: false           |
| trading_status | integer	  | null: false           |
| completed_at   | datetime   |

## orders テーブル

| Column	    | Type	     | Options                        |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

