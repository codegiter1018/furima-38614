# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false,              |
| email              | string              | null: false, unique: true |
| password           | string              | null: false               |


### Association

* has_many :items
* has_many :comments
* has_one :profile

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| title                               | string     | null: false                    |
| image                               | text       | null: false                    |
| price                               | text       | null: false                    |
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


## profile table
| name(kanji)           | text                | null: false               |
| name(katakana)        | text                | null: false               |
| birthday              | text                | null: false               |

### Association

- belongs_to :user


## detail table
| categoly           | text                | null: false               |
| status             | text                | null: false               |


### Association

- belongs_to :item


## purchase table
| user_id             | text                | null: false               |


### Association

- has_one :destination

## destination table
| postcode           | text                | null: false               |
| prefectures        | text                | null: false               |
| municipalities     | text                | null: false               |
| address            | text                | null: false               |
| buildingname       | text                |                           |
| telephonenumber    | text                | null: false               |


### Association

- belongs_to :purchase
