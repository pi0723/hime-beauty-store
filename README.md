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



t.string  :last_name,          null: false
      t.string  :first_name,         null: false
      t.string  :post_code,          null: false
      t.string  :city,               null: false
      t.string  :address,            null: false
      t.string  :building
      t.string  :phone,              null: false
      t.integer :prefecture_id,      null: false


extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  has_one    :cart

  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '半角数字でハイフン(-)を入れて入力してください' }
    validates :city
    validates :address, format: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }
    validates :phone, format: { with: /\A\d{10,11}\z/, message: '半角数字で入力してください(ハイフンなし)' }
  end

  validates :prefecture_id, numericality: { other_than: 1 }