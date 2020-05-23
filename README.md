# DEMO

This is a demo to show-case how can we rename references in a rails app.

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

And we're good to go 🤓