# テーブル設計

### usersテーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| email               | strings | null: false, unique: true |
| encrypted_password  | strings | null: false               |
| nickname            | strings | null: false               |
| firstname           | strings | null: false               |
| lastname            | strings | null: false               |
| firstname_kana      | strings | null: false               |
| lastname_kana       | strings | null: false               |
| birthday            | date    | null: false               |

### Association
- has_many : histories
- has_many : items


### itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | strings    | null: false                    |
| price        | integer    | null: false                    |
| fee_id       | integer    | null: false                    |
| description  | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| from_id      | integer    | null: false                    |
| ship_date_id | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to : users
- has_one : history


### historiesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to : item
- belongs_to : user


### destinationsテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | strings    | null: false                    |
| prefecture_id| integer    | null: false                    |
| city         | strings    | null: false                    |
| address_line | strings    | null: false                    |
| building     | strings    |                                |
| phone        | strings    | null: false                    |
| user_id      | references | null: false, foreign_key: true |
| item_id      | references | null: false, foreign_key: true |

### Association
- has_one : item
- belongs_to : history

