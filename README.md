# DEMO

This is a demo to show-case how can we rename references in a rails app.

[You can also check my other demos](https://github.com/andrerferrer/dedemos/blob/master/README.md#ded%C3%A9mos).


## Schema
This is the schema

```

  +--------------+       +-------------+
  |     users    |       |    offers   |
  +--------------+       +-------------+
+-| id           |---+   | id          |-+
| | first_name   |   |   | name        | |
| | last_name    |   |   | description | |
| | address      |   +-->| owner_id    | |
| | phone_number |       +-------------+ |
| +--------------+                       |
|                                        |
|            +-------------+             |
|            |  bookings   |             |
|            +-------------+             |
|            | id          |             |
|            | start_time  |             |
|            | end_time    |             |
+----------->| customer_id |             |
             | offer_id    |<------------+
             +-------------+

```

## What needs to be done?

We need to rename the reference in the migration:
```ruby
  t.references :owner, null: false, foreign_key: { to_table: :users }
```

We need to rename the reference in the model:
```ruby
  belongs_to :owner, class_name: 'User'
```

> If we didn't have `owner_id` in the `offers` table, but `user_id`, we'd have to specify the foreign_key as well
> ```ruby
> belongs_to :owner, class_name: 'User', foreign_key: user_id
> ```


We can rename everything that we want:

```ruby
# app/models/offer.rb
class Offer < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :bookings, dependent: :destroy
  has_many :customers, through: :bookings
end


```

```ruby
# app/models/user.rb
class User < ApplicationRecord
  has_many :owned_offers, class_name: 'Offer', foreign_key: :owner_id
  has_many :bookings, foreign_key: :customer_id
  has_many :purchased_offers, through: :bookings, source: :offer
end
```

And we're good to go 🤓

### Other sources
https://marouenbousnina.com/tutorials/2018-06-11-rename-activerecord-model/
