class Press < ApplicationRecord
  has_many :publisher_presses
  has_many :publishers, through: :publisher_presses
end
