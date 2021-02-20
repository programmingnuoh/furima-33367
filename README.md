#users table

| column                | type     | options                  |
| --------------------- | -------- | ------------------------ |
| nickname              | string   | null: false              |
| email                 | string   | null: false,unique: true |
| last_name             | string   | null: false              |
| first_name            | string   | null: false              |
| last_name_kana        | string   | null: false              |
| first_name_kana       | string   | null: false              |
| birth_date            | date     | null: false              |

## Associations
--has_many: items
--has_many: item_users

#items table

| column                 | type       | options                       |
| ---------------------- | ---------- | ----------------------------- |
| name                   | string     | null: false                   |
| info                   | text       | null: false                   |
| category_id            | integer    | null: false                   |
| sales_status_id        | integer    | null: false                   |
| shipping_fee_status_id | integer    | null: false                   |
| prefecture_id          | integer    | null: false                   |
| scheduled_delivery_id  | integer    | null: false                   |
| price                  | integer    | null: false                   |
| user                   | references | null: false,foreign_key: true |

## Associations
--belongs_to: user
--has_one: item_users

#deliveries table
| column        | type       | options                       |
| ------------- | ---------- | ----------------------------- |
| post_code     | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| addresses     | string     | null: false                   |
| building      | string     |                               |
| phone_number  | string     | null: false                   |
| item_user     | references | null: false,foreign_key: true |

## Associations
--belongs_to: item_users

#orderitems table
| column | type       | options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_key: true |

## Associations
--has_one: order
--belongs_to: user

