# DB 設計

## users table

| Column              | Type                | Options                   |
|---------------------|---------------------|---------------------------|
| nickname            | string              | null: false,              |
| email               | string              | null: false, unique: true |
| encrypted_password  | string              | null: false               |
| name(kanji)         | text                | null: false               |
| name(katakana)      | text                | null: false               |
| birthday            | text                | null: false               |

### Association

* has_many :items
* has_many :comments


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| title                               | string     | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
* has_one :detail

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user


## detail table
| categoly           | text                | null: false               |
| status             | text                | null: false               |


### Association

- belongs_to :item


## orders table
| user_id             | text                | null: false               |
| item_id             | text                | null: false               |


### Association

- has_one :addresses

## addresses table
| postcode           | string              | null: false               |
| prefecture_id      | integer             | null: false               |
| municipalities     | string              | null: false               |
| address            | string              | null: false               |
| buildingname       | string              |                           |
| telephonenumber    | string              | null: false               |


### Association

- belongs_to :orders
