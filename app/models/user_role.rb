class UserRole < ApplicationRecord
  has_many :users
  belongs_to :bookstore
  belongs_to :publisher
end
