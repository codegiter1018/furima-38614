# DB 設計

## users table

| Column              | Type                | Options                   |
|---------------------|---------------------|---------------------------|
| nickname            | string              | null: false               |
| email               | string              | null: false, unique: true |
| encrypted_password  | string              | null: false               |
| sei_kanji           | string              | null: false               |
| mei_kanji           | string              | null: false               |
| sei_katakana        | string              | null: false               |
| mei_katakana        | string              | null: false               |
| birthday            | date                | null: false               |

### Association

* has_many :items
- has_many :orders


## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| user                                | references | null: false, foreign_key: true |
| title                               | string     | null: false                    |
| description                         | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| status_id                           | integer    | null: false                    |
| delivery_id                         | integer    | null: false                    |
| prefecture_id                       | integer    | null: false                    |    
| criterion_id                        | integer    | null: false                    |
| price                               | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order dependent: :destroy




## orders table
| Column           | Type                      | Options                            |
|------------------|---------------------------|------------------------------------|
| user             | references                | null: false, foreign_key: true     |
| item             | references                | null: false, foreign_key: true     |


### Association

- has_one :address
- belongs_to :user
- belongs_to :item



## addresses table
| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| postcode           | string              | null: false                     |
| prefecture_id      | integer             | null: false                     |
| municipalities     | string              | null: false                     |
| address            | string              | null: false                     |
| buildingname       | string              |                                 |
| telephonenumber    | string              | null: false                     |
| order              | references          | null: false, foreign_key: true  |

### Association

- belongs_to :order
