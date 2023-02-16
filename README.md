# DB 設計

## users table

| Column              | Type                | Options                   |
|---------------------|---------------------|---------------------------|
| nickname            | string              | null: false,              |
| email               | string              | null: false, unique: true |
| encrypted_password  | string              | null: false               |
| sei_kanji           | text                | null: false               |
| mei_kanji           | text                | null: false               |
| sei_katakana        | text                | null: false               |
| mei_katakana        | text                | null: false               |
| birthday            | date                | null: false               |

### Association

* has_many :items
- has_many :orders


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| title                               | string     | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |
| categoly                            | text       | null: false                    |
| status                              | text       | null: false                    |
| delivery                            | text       | null: false                    |
| shipping_area                       | text       | null: false                    |    
| criterion                           | text       | null: false                    |


### Association

- belongs_to :user
- has_many :orders




## orders table
| user             | reference                | null: false               |
| item             | reference                | null: false               |


### Association

- has_one :addresses
- belongs_to :user
- belongs_to :item



## addresses table
| postcode           | string              | null: false               |
| prefecture_id      | integer             | null: false               |
| municipalities     | string              | null: false               |
| address            | string              | null: false               |
| buildingname       | string              |                           |
| telephonenumber    | string              | null: false               |
| order              | reference           | null: false               |

### Association

- belongs_to :orders
