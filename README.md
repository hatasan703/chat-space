## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, foreign_key: true, unique: true|

### Association
- has_many :messages
- has_many :group_users
- has_many :groups, through: :group_users


## group_users table

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## groups table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
- has_many :messages
- has_many :group_users
- has_many :users through: :group_users


## messages table

|Column|Type|Options|
|------|----|-------|
|body|text|
|image|string|
|group_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|


### Association
- belongs_to :user
- belongs_to :group



