# テーブル設計


## users テーブル

| Column             | Type    | Option                    |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| post_code          | string  | null: false               |
| city               | string  | null: false               |
| address            | string  | null: false               |
| building           | string  |                           |
| phone              | string  | null: false               |
| prefecture_id      | integer | null: false               |

## Association

- has_many :carts

extend ActiveHash::Associations::ActiveRecordExtensions

- belongs_to :prefecture



## products テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| title            | string     | null: false                    |
| explanation      | text       | null: false                    |
| volume           | string     | null: false                    |
| ingredient       | text       | null: false                    |
| made_in_id       | integer    | null: false                    |

## Association

- has_many    :cart_items

extend ActiveHash::Associations::ActiveRecordExtensions

- belongs_to :made_in



## cart テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | foreign_key: true              |

## Association

- belongs_to :user
- has_many   :cart_items



##  cart_items テーブル

| Column             | Type       | Option                         |
| ------------------ | ---------- | ------------------------------ |
| product            | references | null: false, foreign_key: true |
| cart               | references | null: false, foreign_key: true |
| quantity           | integer    | null: false                    |

## Association

- belongs_to  :product
- belongs_to  :cart


      t.datetime   :sold_at,     null: false
      t.string     :order_code,  null: false
      t.index [ :order_code ], unique: true