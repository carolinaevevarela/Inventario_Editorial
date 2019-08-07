class Publisher < ApplicationRecord
  has_many :publisher_presses
  has_many :presses, through: :publisher_presses
  
end
