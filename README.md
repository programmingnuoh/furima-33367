#users table

| column                | type     | options                                           |
| --------------------- | -------- | ------------------------------------------------- |
| nickname              | string   | null: false                                       |
| email                 | string   | null: false                                       |
| password              | string   | null: false,format:{with:/[a-z\d]{6,}/i}          |
| password_confirmation | string   | null: false,format:{with:/[a-z\d]{6,}/i}          |
| last_name             | string   | null: false,format:{with:/\A[ぁ-んァ-ヶ一-龥々]+\z/} |
| first_name            | string   | null: false,format:{with:/\A[ぁ-んァ-ヶ一-龥々]+\z/} |
| last_name_kana        | string   | null: false,format:{with:/\A[ァ-ヶ]+\z/}           |
| first_name_kana       | string   | null: false,format:{with:/\A[ァ-ヶ]+\z/}           |
| birth_date            | datetime | null: false                                       |

## Associations
--has_many: items
--has_many: orders

#items table

| column                | type       | options                                           |
| --------------------- | ---------- | ------------------------------------------------- |
| image                 | image      | null: false                                       |
| name                  | string     | null: false                                       |
| info                  | text       | null: false                                       |
| category              | string     | null: false                                       |
| sales_status          | string     | null: false                                       |
| shipping_fee_status   | string     | null: false                                       |
| prefecture            | string     | null: false                                       |
| scheduled_delivery    | integer    | null: false                                       |
| price                 | integer    | null: false,price >= 300 && price <= 9,999,999    |
| user_id               | references | null: false,foreign_key: true                     |

## Associations
--belongs_to: user
--has_one: order

#orders table
| column       | type       | options                                           |
| ------------ | ---------- | ------------------------------------------------- |
| token_number | integer    | null: false,format:{with:/\d{16}/}                |
| token_data   | datetime   | null: false                                       |
| token_code   | integer    | null: false,format:{with:/\d{3}/}                 |
| post_code    | integer    | null: false,.gsub(/-/''),format:{with:/\d(7)/}    |
| prefecture   | string     | null: false                                       |
| city         | string     | null: false                                       |
| addresses    | string     | null: false                                       |
| building     | string     |                                                   |
| phone_number | integer    | null: false,format:{with:/\d(10,11)/}             |
| user_id      | references | null: false,foreign_key: true                     |
| item_id      | references | null: false,foreign_key: true                     |

## Associations
--belongs_to: user
--belongs_to: item