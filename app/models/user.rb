class User < ApplicationRecord
  has_many :owned_offers, class_name: 'Offer', foreign_key: :owner_id
  has_many :bookings, foreign_key: :customer_id
  has_many :purchased_offers, through: :bookings, source: :offer
end
