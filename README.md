# テーブル設計

## users table
| Column | Type | Options |
| -- | -- | -- |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| encrypted_password | string | null: false |
| family_name | string | null: false |
| given_name | string | null: false |
| family_name_kana | string | null: false |
| given_name_kana | string | null: false |
| birth_date | date | null: false |

### Association
- has_many :items
- has_many :orders

## items table
| Column | Type | Options |
| -- | -- | -- |
| user_id | references | null: false, foreign_key: true |
| name | string | null: false |
| info | text | null: false |
| category | integer | null: false |
| sales_status | integer | null: false |
| shipping_fee_status | integer | null: false |
| prefecture | integer | null: false |
| scheduled_delivery | integer | null: false |
| price | integer | null: false |

### Association
- belongs_to :user
- has_one :order

## order table
| Column | Type | Options |
| -- | -- | -- |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
| postal-code | string | null: false |
| prefecture | string | null: false |
| city | string | null: false |
| addresses | string | null: false |
| building | string | null: false |
| phone-number | string | null: false |

### Association
- belongs_to :user
- belongs_to :item
