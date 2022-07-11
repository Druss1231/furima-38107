# テーブル設計

### usersテーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| nickname            | string | null: false               |
| firstname           | string | null: false               |
| lastname            | string | null: false               |
| firstname_kana      | string | null: false               |
| lastname_kana       | string | null: false               |
| birthday            | date   | null: false               |

### Association
- has_many : orders
- has_many : items


### itemsテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| price        | integer    | null: false                    |
| fee_id       | integer    | null: false                    |
| description  | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| from_id      | integer    | null: false                    |
| shipdate_id  | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- has_one : order


### ordersテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to : item
- belongs_to : user
- has_one : destination


### destinationsテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| from_id      | integer    | null: false                    |
| city         | string     | null: false                    |
| address_line | string     | null: false                    |
| building     | string     |                                |
| phone        | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association
- belongs_to : order
