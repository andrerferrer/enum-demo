# Create one user
User.create! first_name: 'Jack', last_name: 'Sparrow', address: 'Black Pearl', phone_number: '123456789'
# Create another user
User.create! first_name: 'Elizabeth', last_name: 'Swann', address: 'London', phone_number: '123456789'

# Create one offer
Offer.create! name: 'A trip through the seven seas', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', owner: User.first
Offer.create! name: 'A backwards trip through the seven seas', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', owner: User.second


# Create a booking
Booking.create! start_on: 1.day.from_now, end_on: 1.week.from_now, customer: User.last, offer: Offer.first
Booking.create! start_on: 2.day.from_now, end_on: 2.week.from_now, customer: User.first, offer: Offer.last
