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
- has_many : destinations


### itemsテーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| title       | strings   | null: false                    |
| price       | strings   | null: false                    |
| fee         | strings   | null: false                    |
| description | text      | null: false                    |
| category    | strings   | null: false                    |
| condition   | strings   | null: false                    |
| from        | strings   | null: false                    |
| ship_date   | strings   | null: false                    |
| user_id     | reference | null: false, foreign_key: true |

### Association
- belongs_to : users
- has_one : history
- has_one : destination


### historyテーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| item_id   | reference | null: false, foreign_key: true |
| user_id   | reference | null: false, foreign_key: true |

### Association
- belongs_to : item
- belongs_to : user


##destinationテーブル
| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| post_code    | strings   | null: false                    |
| prefecture   | strings   | null: false                    |
| city         | strings   | null: false                    |
| address_line | strings   | null: false                    |
| building     | strings   | null: false                    |
| phone        | strings   | null: false                    |
| user_id      | reference | null: false, foreign_key: true |

### Association
- has_one : item
- belongs_to : user

