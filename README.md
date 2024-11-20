## usersテーブル（ユーザー情報）

|Column            |Type      |Options                      |
|------------------|----------|-----------------------------|
|nickname          |string    |null: false                  |
|email             |string    |null: false, unique: true    |
|encrypted_password|string    |null: false                  |
|first_name        |string    |null: false                  |
|last_name         |string    |null: false                  |
|first_name_kana   |string    |null: false                  |
|last_name_kana    |string    |null: false                  |
|birth_date        |date      |null: false                  |
|-----------------------------------------------------------|

### userテーブルAssociation
has_many :items
has_many :purchases



## itemsテーブル（商品情報）

|Column             |Type      |Options                       |
|-------------------|----------|------------------------------|
|name               |string    |null: false,                  |
|concept            |text      |null: false,                  |
|category_id        |integer   |null: false                   |
|situation_id       |integer   |null: false                   |
|shippingfee_id     |integer   |null: false                   |
|region_id          |integer   |null: false                   |
|arrival_id         |integer   |null: false                   |
|price              |integer   |null: false                   |
|user               |references|null: false, foreign_key: true|
|-------------------------------------------------------------|


### Association
belongs_to :user
has_one :purchase



## purchasesテーブル（購入情報）

|Column         |Type           |Options                       |
|---------------|---------------|------------------------------|
|user           |references     |null: false, foreign_key: true|
|item           |references     |null: false, foreign_key: true|
|--------------------------------------------------------------|



### Association
belongs_to :user
belongs_to :item
has_one    :destination



## destinationsテーブル（送り先情報）

|Column           |Type            |Options                     |
|-----------------|----------------|----------------------------|
|post_code        |string          |null: false                 |
|region_id        |integer         |null: false                 |
|minicipalities   |string          |null: false                 |
|street_address   |string          |null: false                 |
|building_name    |string          |                            |
|telephone_number |string          |null: false                 |
|purchase         |references      |null: false                 |
|---------------------------------------------------------------|



### Association
belongs_to :purchase