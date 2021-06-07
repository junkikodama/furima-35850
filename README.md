# テーブル設計

## users テーブル

| Column          | Type   | Options    |
| --------------- | ------ | ---------- |
| nickname        | string | null false |
| email           | string | null false |
| password        | string | null false |
| last_name       | string | null false |
| first_name      | string | null false |
| last_name_kana  | string | null false |
| first_name_kana | string | null false |
| birthday        | date   | null false |

has_many :items
has_many :purchases

## items テーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| name        | string     | null false        |
| description | text       | null false        |
| category    | string     | null false        |
| status      | string     | null false        |
| charge      | string     | null false        |
| area        | string     | null false        |
| duration    | string     | null false        |
| price       | integer    | null false        |
| user        | references | foreign_key: true |

belongs_to :user
has_one :purchase

## purchases テーブル
| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル
| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postal-code  | integer    | null false        |
| prefecture   | string     | null false        |
| city         | string     | null false        |
| block        | string     | null false        |
| build        | string     | null false        |
| phone-number | integer    | null false        |
| purchase     | references | foreign_key: true |

belongs_to :purchase