# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| profile  | text   | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
- has_many :posts
- has_many :comments


## posts テーブル

| Column   | Type       | Options                        |
| -------- | ---------  | ------------------------------ |
| text     | text       | null: false                    |
| title    | string     | null: false                    |
| user_id  | references | null: false, foreign_key: true |

### Association

- has_many comments
- belongs_to :user


## commentsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post


## roomsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages


## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user