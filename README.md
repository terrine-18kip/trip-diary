# テーブル設計

## users テーブル

| Column             | Type    | Options                                       |
| ------------------ | ------- | --------------------------------------------- |
| name               | string  | null: false                                   |
| email              | string  | null: false, unique: true, confirmation: true |
| encrypted_password | string  | null: false, length: { minimum: 6 }           |

### Association

- has_many :trips, through: trip_users
- has_many :comments

## trips テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | -------------------------------|
| title        | string     | null: false                    |
| start_date   | date       |                                |
| end_date     | date       |                                |
| memo         | text       |                                |

### Association

- has_many   :user, through: trip_users
- has_many   :plans
- has_many   :comments

## trip_users テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | -------------------------------|
| user         | references | null: false, foreign_key: true |
| trip         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :trip

## plans テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| daily         | integer    |                                |
| trip          | references | null: false, foreign_key: true |

### Association

- belongs_to :trip
- has_many   :spots

## spots テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| category_id   | integer    | null: false                    |
| start_time    | time       |                                |
| end_time      | time       |                                |
| fee           | integer    |                                |
| link          | string     |                                |
| memo          | text       |                                |
| plan          | references | null: false, foreign_key: true |

### Association

- belongs_to :plan