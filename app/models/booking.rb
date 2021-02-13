class Booking < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :offer

  enum status: { pending: 0, processing_payment: 1, confirmed: 2, cancelled: -1 }
  
end
