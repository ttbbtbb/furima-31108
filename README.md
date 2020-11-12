# テーブル設計

## users table
| Column | Type | Options |
| -- | -- | -- |
| nickname | string | null: false |
| email | string | null: false, uniq |
| password | string | null: false |
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
| image | binary | null: false |
| name | string | null: false |
| info | text | null: false |
| category | string | null: false |
| sales-status | string | null: false |
| shipping-fee-status | string | null: false |
| prefecture | string | null: false |
| scheduled-delivery | string | null: false |
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
