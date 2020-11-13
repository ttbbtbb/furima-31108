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

### Association
- belongs_to :user
- belongs_to :item

## address table
| Column | Type | Options |
| -- | -- | -- |
| order_id | references | null: false, foreign_key: true |
| postal_code | string | null: false |
| address_level1 | string | null: false |
| address_level2 | string | null: false |
| address_line1 | string | null: false |
| address_line2 | string | null: false |
| tel | string | null: false |

### Association
- belongs_to :order
