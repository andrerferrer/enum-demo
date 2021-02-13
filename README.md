## Goal

This is a demo to show-case how we can use [`ActiveRecord::Enum`](https://api.rubyonrails.org/v5.2.4.4/classes/ActiveRecord/Enum.html) in a rails app.

[You can also check my other demos](https://github.com/andrerferrer/dedemos/blob/master/README.md#ded%C3%A9mos).

This was created from [this other demo](https://github.com/andrerferrer/rename-references-demo).

## How to do It

Imagine that we want to have bookings and that these bookings have statuses:
`pending`, `processing payment`, `confirmed`, `cancelled`.

That's one situation that the usage of `enum` would make a lot of sense.

### And why do we use `enum`?

We use it when we want to have an easier way to:

1. validate data;
1. query or update the model;
1. store integers instead of strings (costs less storage in the DB)

For that, we use [`ActiveRecord::Enum`](https://api.rubyonrails.org/v5.2.4.4/classes/ActiveRecord/Enum.html).

### How to actually use it?

We need to add the column that we want to use `enum` with (Status in our example):

```ruby
# db/migrate/20210213135345_add_status_to_bookings.rb
class AddStatusToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :status, :integer, default: 0, null: false
  end
end
```

Then, we need to declare the enum in the model:
```ruby
# app/models/booking.rb
class Booking < ApplicationRecord
  # ...

  enum status: { pending: 0, processing_payment: 1, confirmed: 2, cancelled: -1 }
end

```

### Now we can do some magic with it. What can we do?

1. We have some new methods to check the status.

    Instead of
    ```ruby
      booking.status == 'confirmed'
    ```

    We can use
    ```ruby
      booking.confirmed?
    ```

2. We have some new methods to update the status.

    Instead of
    ```ruby
      booking.update status: 'confirmed'
    ```
    We can use
    ```ruby
      booking.confirmed!
    ```

3. We have easier validation

    Instead of
    ```ruby
      class Booking < ApplicationRecord
        validates :status, inclusion: in: %w[ pending processing_payment confirmed cancelled ]
      end
    ```

    We don't need to write anything! It's done already 👌😎
    
4. We have scopes

    We can use
    ```ruby
      Booking.pending # same as Booking.where(status: :pending)
      Booking.processing_payment # same as Booking.where(status: :processing_payment)
      Booking.confirmed # same as Booking.where(status: :confirmed)
      Booking.cancelled # same as Booking.where(status: :cancelled)
    ```

### More Advanced Stuff

#### Make it faster to query your model

If we want to improve the app further, we can also make an index out of the `enum` attribute (because we will be using it for querying a lot).

To do that, we need to add a migration:

```
  rails g migration addIndexToBookings status:index
```

which will generate:

```ruby
class AddIndexToBookings < ActiveRecord::Migration[6.0]
  def change
    add_index :bookings, :status
  end
end
```

#### Add suffixes and preffixes
[TBD](https://naturaily.com/blog/ruby-on-rails-enum#4-use-prefix-or-suffix-option-in-your-enums)


And we're good to go 🤓

### Other sources
https://api.rubyonrails.org/v5.2.4.4/classes/ActiveRecord/Enum.html
https://dev.to/ousmanedev/use-activerecord-enum-for-your-enumerations-p7k
https://naturaily.com/blog/ruby-on-rails-enum
